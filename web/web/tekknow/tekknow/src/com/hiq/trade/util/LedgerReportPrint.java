package com.hiq.trade.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.UUID;

import javax.ws.rs.core.MultivaluedMap;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.core.report.ExportReport;
import com.core.util.DatabaseUtil;
import com.itextpdf.awt.PdfGraphics2D;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.Barcode39;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfDiv;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPRow;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
/*import com.itextpdf.tool.xml.ElementList;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.ElementHandlerPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;*/

    public class LedgerReportPrint
    {
    	DecimalFormat formatDecimal=new DecimalFormat();
    	SimpleDateFormat formatDate=new SimpleDateFormat("MM/dd/yyyy");
        Document document = null;
        PdfWriter writer = null;
        float currentY=0;
        float currentPageMarginLeft=30;
        float currentPageMarginRight=30;
        float currentPageMarginTop=30;
        float currentPageMarginBottom=30;
        float currentPageWidth=595f;
        float currentPageHeight=842f;
        float currentPageSpreadStartAt=842;
        float currentPageSpreadStartX=30;
        float currentPageSpreadEndAt=30;
        float currentActualPageSpreadStartAt=842-30;
        float currentActualPageSpreadEndAt=30;
        String headerQuery="";
    	private static final DecimalFormat formatNumber=new DecimalFormat("####.00");
    	private static final SimpleDateFormat formatddMMyyyy=new SimpleDateFormat("dd/MM/yyyy");
    	private static final SimpleDateFormat formatyyyyMMdd=new SimpleDateFormat("yyyy-MM-dd");

        int mDPI = 72;
        private static String FS=System.getProperty("file.separator");
        BaseFont f_book = null;
        double creditTotal=0;
        double debitTotal=0;
        double pageTotalDebit=0;
        double pageTotalCredit=0;
        double openingBalanceDebit=0;
        double openingBalanceCredit=0;
        String ledgerName="";
        String fromDate="";
        String toDate="";
        String branch="";
        public String PDFGen(MultivaluedMap<String, String> parameters,OutputStream fs) throws Exception
        {
    		Connection conn = null;
    		ResultSet rs = null;
    		PreparedStatement pstmt = null;
    		PreparedStatement hdr=null;
    		Statement stmt=null;
			String guid="";
//	    	String headerQuery="";
	    	String reportTitle="";
	    	String groupColumn="";
	    	int groupSum=0;
	    	int pageBalance=0;
	    	String queryParams="";
	    	String paramTypes="";
	    	boolean footer=false;
			ArrayList<HashMap<String,String>> columns=new ArrayList<HashMap<String,String>>(); 
			HashMap<String,String> searchFields=new HashMap<String,String>(); 
            try
            {
    			conn = DatabaseUtil.getConnection();
            	String fontPath=System.getProperty("catalina.home") + FS + ".."+ FS +"tekknow"+FS+"web"+FS+"fonts"+FS;
            	f_book=BaseFont.createFont(fontPath+"FuturaStd-Book.otf", BaseFont.CP1250, BaseFont.EMBEDDED);

            	String reportId=parameters.getFirst("id");
            	ledgerName=parameters.getFirst("ledgername");
            	branch=parameters.getFirst("branch");
            	fromDate=parameters.getFirst("fromdate");
            	toDate=parameters.getFirst("todate");
            	hdr=conn.prepareStatement(ExportReport.reportHeader);
            	hdr.setString(1, reportId);
            	rs=hdr.executeQuery();
            	if(rs.next()){
            		headerQuery=rs.getString("header_query");
            		reportTitle=rs.getString("report_title");
            		queryParams=rs.getString("parameters");
            		paramTypes=rs.getString("param_types");
                	groupColumn=rs.getString("column_group");;
                	groupSum=rs.getInt("group_sum");;
                	pageBalance=rs.getInt("page_balance");
            		if("1".equals(rs.getString("footer_columns"))){
            			footer=true;
            		}
            	}
            	rs.close();
            	hdr.close();
            	String reportQuery=ExportReport.getReportData(conn,parameters,fs,true,columns,searchFields);
            	String []queryParam=queryParams.split(",");
            	String []paramType=paramTypes.split(",");
    			int ps=queryParam.length;
    			for(int p=0;p<ps;p++){
    				String f=queryParam[p];
    				String t=paramType[p];
    				String v=parameters.getFirst(queryParam[p]);
    				if("date".equals(t)){
    					Date d=formatddMMyyyy.parse(v);
    					v=formatyyyyMMdd.format(d);
    				}
    				headerQuery=headerQuery.replaceAll("\\$\\("+f+"\\)", v);
    			}
            	StringBuilder grpBalanceQry=new StringBuilder(100);
            	if(!"".equals(groupColumn) && groupSum>0){
            		grpBalanceQry.append("select ");
            		grpBalanceQry.append(groupColumn);
            		for(int i=0;i<columns.size();i++){
            			if("1".equals(columns.get(i).get("COLUMN_SUM"))){
            				grpBalanceQry.append(" ,sum(");
            				grpBalanceQry.append(columns.get(i).get("COLUMN_NAME"));
            				grpBalanceQry.append(") ");
            				grpBalanceQry.append(columns.get(i).get("COLUMN_NAME"));
            			}
            		}
            		grpBalanceQry.append(",count('x') grpcount from (");
            		grpBalanceQry.append(reportQuery);
            		grpBalanceQry.append(" ) a group by ");
            		grpBalanceQry.append(groupColumn);
            	}
            	HashMap<String,HashMap<String,String>> groupData=new HashMap<String,HashMap<String,String>>(); 
            	if(!"".equals(groupColumn) && groupSum>0){
            		stmt=conn.createStatement();
            		rs = stmt.executeQuery(grpBalanceQry.toString());
    	        	while(rs.next()){
    	        		HashMap<String,String> hm=new HashMap<String,String>();
    	        		hm.put("groupname",rs.getString(groupColumn));
    	        		hm.put("groupcount",rs.getString("grpcount"));
    		        	for(int i=0;i<columns.size();i++){
    		        		HashMap<String,String> c=columns.get(i);
    		        		if("1".equals(c.get("COLUMN_SUM"))){
    		        			hm.put(c.get("COLUMN_NAME"), rs.getString(c.get("COLUMN_NAME")));
    		        		}
    		        	}
    		        	groupData.put(rs.getString(groupColumn), hm);
    	        	}
    	        	rs.close();
    	        	stmt.close();
            	}
            	List<HashMap<String,String>> reportData=new ArrayList<HashMap<String,String>>(); 
        		stmt=conn.createStatement();
        		rs = stmt.executeQuery(reportQuery);
	        	while(rs.next()){
	        		HashMap<String,String> hm=new HashMap<String,String>();
		        	for(int i=0;i<columns.size();i++){
		        		HashMap<String,String> c=columns.get(i);
		        		hm.put(c.get("COLUMN_NAME"), rs.getString(c.get("COLUMN_NAME")));
		        	}
		        	reportData.add(hm);
	        	}
	        	rs.close();
	        	stmt.close();
            	HashMap<String,String> groupFilters=new HashMap<String,String>(); 
	        	hdr=conn.prepareStatement(ExportReport.reportGroupFilters);
	        	hdr.setString(1, reportId);
	        	rs=hdr.executeQuery();
	        	while(rs.next()){
	        		groupFilters.put(rs.getString("group_filter"),rs.getString("group_format_columns"));
	        	}
	        	hdr.close();
	        	rs.close();
	        	
	        	HashMap<String,String> sumData=new HashMap<String,String>();
	        	if(footer){
	        		StringBuilder sd=new StringBuilder(200);
	            	int fromIndex=reportQuery.toLowerCase().indexOf(" from");
	            	String fromQuery=reportQuery.substring(fromIndex);
	        		int groupbyIndex=fromQuery.lastIndexOf("group by ");
	        		String sumQuery=fromQuery;
	        		if(groupbyIndex!=-1){
	        			sumQuery=fromQuery.substring(0, groupbyIndex);
	        		}
	        		sd.append("select ");
	        		String comma="";
		        	for(int i=0;i<columns.size();i++){
		        		HashMap<String,String> c=columns.get(i);
		        		if("1".equals(c.get("COLUMN_SUM"))){
		        			sd.append(comma);
		        			sd.append("sum(");
		        			sd.append(c.get("SUM_COLUMN_FIELD"));
		        			sd.append(") ");
		        			sd.append(c.get("COLUMN_NAME"));
		        			comma=",";
		        		}	        		
		        	}
		        	sd.append(" ");
		        	sd.append(sumQuery);
//		        	System.out.println(sumQuery);
		        	stmt=conn.createStatement();
		        	rs = stmt.executeQuery(sd.toString());
		        	if(rs.next()){
		        		for(int i=0;i<columns.size();i++){
		        			HashMap<String,String> c=columns.get(i);
		        			if("1".equals(c.get("COLUMN_SUM"))){
		        				sumData.put(c.get("COLUMN_NAME"), rs.getString(c.get("COLUMN_NAME")));
		        			}
		        		}
		        	}
		        	rs.close();
		        	stmt.close();
	        	}

                document = new Document(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
                if(fs==null){
                	guid=UUID.randomUUID().toString();
                	fs = new FileOutputStream("c:\\test\\" +guid +".pdf");
                }
                //MemoryStream ms = new MemoryStream();
                writer = PdfWriter.getInstance(document, fs);
                
                document.open();
                document.setMargins(currentPageMarginLeft, currentPageMarginRight, currentPageMarginTop, currentPageMarginBottom);
                document.setPageSize(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
                PdfContentByte cb = writer.getDirectContent();
                Font fnt = new Font(BaseFont.createFont(), 8, Font.NORMAL, BaseColor.BLACK);
            	System.out.println("Started ...");
            	writeHeader();
            	writeTable(columns,reportData,groupColumn,groupSum,groupData,groupFilters,sumData);    	
                document.close();
                writer.close();
                fs.close();
                System.out.println("Finished ...");
                if(!"".equals(guid)){
                	return guid;
                }
                return "OK";
	        } catch (Exception e) {
	        	e.printStackTrace();
	        	throw e;
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException es) {
	
				}
			}
        }
        private float pxTopt(float value)
        {
            return value / mDPI * 72;
        }
        private float[] toFloatArray(ArrayList<Float> list){
        	float[] f=new float[list.size()];
        	for(int i=0;i<list.size();i++){
        		f[i]=list.get(i).floatValue();
        	}
        	return f;
        }
        private float getTotalWidth(ArrayList<Float> list){
        	float f=0f;
        	for(int i=0;i<list.size();i++){
        		f=f+list.get(i).floatValue();
        	}
        	return f;
        }
        public void writeHeader() throws Exception{
        	Connection conn=DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(headerQuery);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
	        	ResultSetMetaData md=rs.getMetaData();
	        	int cc=md.getColumnCount();
	        	for(int i=1;i<=cc;i++){
	        		if(rs.getString(i)!=null){
    	        		if(i==1){
    	        			writeTextArea(rs.getString(i), 15, 30,currentActualPageSpreadStartAt , 30, currentPageWidth-currentPageMarginLeft-currentPageMarginRight, Font.BOLD,1);
    	        		}else{
    	        			writeTextArea(rs.getString(i), 12, 30,currentY, 25, currentPageWidth-currentPageMarginLeft-currentPageMarginRight, Font.BOLD,1);
    	        		}
	        		}
	        	}
			}
			float cy=currentY;
			writeTextArea("Ledger :"+ledgerName+" Branch: "+branch, 10, 30,currentY, 25, currentPageWidth-currentPageMarginLeft-currentPageMarginRight, Font.BOLD,0);
			writeTextArea("From :"+fromDate+" To: "+toDate, 10, 400,cy, 25, currentPageWidth-currentPageMarginLeft-currentPageMarginRight, Font.BOLD,0);
			pstmt.close();
			rs.close();
			conn.close();
			pstmt=null;
        }
        private void writePageTotalAndBalance(PdfPTable ptbl,ArrayList<HashMap<String,String>> columns,String grpColumn,int grpSum) throws Exception
        {
        	try{
            PdfContentByte cb = writer.getDirectContent();
            //Write Header
            float startY = currentY;
            float startX = currentPageSpreadStartX;
            float endY = startY - currentPageSpreadEndAt;
            float endX = startX + (currentPageWidth-currentPageMarginLeft-currentPageMarginRight);
//            System.out.println("Tp:"+table.Top +" "+table.TableID);
            boolean ovp=false;
            ArrayList<Float> widths = new ArrayList<Float>();
            //DataField grpDataField=null;
            String grpFieldValue="";
            float totalWidth = 0;
            float fntSize = 8;
            int noOfColumns=0;
            int hcolspan=0;
            int fcolspan=0;
            int grpColSpan=0;
            Color color = Color.decode("#000000");
            Font fnt = new Font(f_book, fntSize, Font.NORMAL, BaseColor.BLACK);
            
            //calculate dynamic widths
            int s2 = 0;
            for (int i = 0; i < columns.size(); i++)
            {
                if (Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH")) > 0f)
                {   
                	widths.add(Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH")));
                	totalWidth += Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH"));
                    noOfColumns++;
                    if(grpSum==2 && Integer.parseInt(columns.get(i).get("COLUMN_SUM"))==1){
                    	grpColSpan++;
                    }else{
                    	grpColSpan++;
                    }
                }
            }
//            System.out.println(widths.size());
            fntSize = 8f;
            fnt = new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
            color = Color.decode("#000000");
            fnt.setColor(new BaseColor(color.getRGB()));
            PdfPCell cell =null;
    		for (int j = 0; j < columns.size(); j++)
            {
                if (Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f && Integer.parseInt(columns.get(j).get("COLUMN_SUM"))==1)
                {
                	String val="0";
                	if("debit".equals(columns.get(j).get("COLUMN_NAME"))){
                		val=formatNumber.format(pageTotalDebit);
                	}else if("credit".equals(columns.get(j).get("COLUMN_NAME"))){
                		val=formatNumber.format(pageTotalCredit);
                	}else if("ledgername".equals(columns.get(j).get("COLUMN_NAME"))){
                		val="Total";
                	}else{
                		val="";
                	}
                    cell = new PdfPCell(new Phrase(val, fnt));
                    cell.setColspan(1);
                    if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
                    	cell.setHorizontalAlignment(0);
                    }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
                    	cell.setHorizontalAlignment(2);
                    }else{
                    	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
                    }       	
                    cell.setMinimumHeight(20f);
                    cell.setBorderWidth(1f);
                    cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
                    ptbl.addCell(cell);                		
                }else if(Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f){
                	String val="";
                	if("ledgername".equals(columns.get(j).get("COLUMN_NAME"))){
                		val="Total";
                	}
                    cell = new PdfPCell(new Phrase(val, fnt));
                    cell.setColspan(1);
                    cell.setHorizontalAlignment(0);
                	cell.setMinimumHeight(20f);
                	cell.setBorder(0);
                    cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
                    ptbl.addCell(cell);                		
                }
            }
    		double pageBalance=0;
    		openingBalanceCredit=0;
    		openingBalanceDebit=0;
    		if(pageTotalDebit-pageTotalCredit>0){
    			openingBalanceDebit=pageTotalDebit-pageTotalCredit;
    		}else{
    			openingBalanceCredit=pageTotalCredit-pageTotalDebit;
    		}
            fntSize = 12f;
            fnt = new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
            color = Color.decode("#000000");
            fnt.setColor(new BaseColor(color.getRGB()));
    		for (int j = 0; j < columns.size(); j++)
            {
                if (Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f && Integer.parseInt(columns.get(j).get("COLUMN_SUM"))==1)
                {
                	String val="0";
                	if("debit".equals(columns.get(j).get("COLUMN_NAME"))){
                		if(openingBalanceDebit>0){
                			val=formatNumber.format(openingBalanceDebit)+" Dr ";
                		}else if(openingBalanceCredit>0){
                			val=formatNumber.format(openingBalanceCredit)+" Cr ";
                		} 
                	}else if("credit".equals(columns.get(j).get("COLUMN_NAME"))){
                		continue;
                	}else if("ledgername".equals(columns.get(j).get("COLUMN_NAME"))){
                		val="Closing Balance";
                	}else{
                		val="";
                	}
                    cell = new PdfPCell(new Phrase(val, fnt));
                    cell.setColspan(2);
                    if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
                    	cell.setHorizontalAlignment(0);
                    }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
                    	cell.setHorizontalAlignment(2);
                    }else{
                    	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
                    }       	
                    cell.setMinimumHeight(20f);
                    //cell.setBorderWidth(1f);
                    cell.setBorder(0);
                    cell.setBackgroundColor(new BaseColor(Color.decode("#eeeeee").getRGB()));
                    ptbl.addCell(cell);                		
                }else if(Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f){
                	String val="";
                	if("ledgername".equals(columns.get(j).get("COLUMN_NAME"))){
                		val="Closing Balance";
                	}
                    cell = new PdfPCell(new Phrase(val, fnt));
                    cell.setColspan(1);
                    cell.setHorizontalAlignment(0);
                	cell.setMinimumHeight(20f);
                	cell.setBorder(0);
                    cell.setBackgroundColor(new BaseColor(Color.decode("#eeeeee").getRGB()));
                    ptbl.addCell(cell);                		
                }
            }
            pageTotalCredit=openingBalanceCredit;
            pageTotalDebit=openingBalanceDebit;
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        }
        public void createNewPage(boolean isOverflow) throws Exception{
        	PdfContentByte cb = writer.getDirectContent();
            document.setPageSize(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
            document.setMargins(currentPageMarginLeft, currentPageMarginRight, currentPageMarginTop, currentPageMarginBottom);
            
            document.newPage();
            currentY=currentPageSpreadStartAt;
            writeHeader();
        }
        public static void main(String[] args) throws Exception, DocumentException {
        	//new GroupReportPrint().PDFGen("0","0",null);
        }
        public void writeTextArea(String content,float fntSize,float x,float y,float height,float width,int fontType,int align) throws Exception{
            float startY = y;
            float startX = x;
            float endY = startY-height;
            float endX = startX + width;
            PdfContentByte cb = writer.getDirectContent();
            cb.beginText();
            content = content.replace("<br/>", "");
            content = content.replace("<br>", "");                    
            Font fnt = new Font(f_book, fntSize, fontType, BaseColor.BLACK);
            Paragraph paragraph = new Paragraph();
            paragraph.setFont(fnt);
            paragraph.setLeading(0f, 1.2f);
            paragraph.add(content);
            paragraph.setAlignment(align);
            //System.out.println(content+" "+startX+" "+ endY+" "+endX+" "+startY);
            ColumnText ct = new ColumnText(cb);
            Rectangle rect = new Rectangle(startX, endY, endX, startY);
            ct.setAlignment(align);
            ct.setSimpleColumn(rect);
            ct.addElement(paragraph);
            int status=ct.go();
            cb.endText();
            currentY=ct.getYLine();
        }        
        private void writeTable(ArrayList<HashMap<String,String>> columns,List<HashMap<String,String>> data,String grpColumn,int grpSum,HashMap<String,HashMap<String,String>> groupData,HashMap<String,String> groupFilters,HashMap<String,String> sumData) throws Exception{
        	writeTable(columns,data,null,null,false,grpColumn,grpSum,groupData,groupFilters,sumData);
        }
        private void writeTable(ArrayList<HashMap<String,String>> columns,List<HashMap<String,String>> data,List<HashMap<String,String>> passedData,ArrayList<String> grpPassedFieldValues,boolean inext,String grpColumn,int grpSum,HashMap<String,HashMap<String,String>> groupData,HashMap<String,String> groupFilters,HashMap<String,String> sumData) throws Exception
        {
        	try{
            PdfContentByte cb = writer.getDirectContent();
            //Write Header
            float startY = currentY-5;
            float startX = currentPageSpreadStartX;
            float endY = startY - currentPageSpreadEndAt+60;
            float endX = startX + (currentPageWidth-currentPageMarginLeft-currentPageMarginRight);
//            System.out.println("Tp:"+table.Top +" "+table.TableID);
            List<HashMap<String,String>> aData = data;
            boolean ovp=false;
            if(passedData!=null){
//                System.out.println("Tp:"+table.Top +" "+table.TableID+" "+passedData.size());
            	aData=passedData;
            	ovp=true;
            }
            ArrayList<Float> widths = new ArrayList<Float>();
            //DataField grpDataField=null;
            String grpFieldValue="";
            float totalWidth = 0;
            float fntSize = 8;
            int noOfColumns=0;
            int hcolspan=0;
            int fcolspan=0;
            int grpColSpan=0;
            float checkHeight=currentY-currentPageSpreadEndAt-120;
            Color color = Color.decode("#000000");
            Font fnt = new Font(f_book, fntSize, Font.NORMAL, BaseColor.BLACK);
            
            //calculate dynamic widths
            int s2 = 0;
            int nofheaders = 0;
            for (int i = 0; i < columns.size(); i++)
            {
                if (Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH")) > 0f)
                {   
                	widths.add(Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH")));
                	totalWidth += Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH"));
                    noOfColumns++;
                    if(grpSum==2 && Integer.parseInt(columns.get(i).get("COLUMN_SUM"))==1){
                    	grpColSpan++;
                    }else{
                    	grpColSpan++;
                    }
                }
            }
//            System.out.println(widths.size());
            PdfPTable ptbl = new PdfPTable(widths.size());

            for (int i = 0; i < columns.size(); i++)
            {
                if (Float.parseFloat(columns.get(i).get("EXPORT_COLUMN_WIDTH")) > 0f)
                {
                    //continue;

                    fntSize = 8f;
                    fnt = new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
                    color = Color.decode("#000000");
                    fnt.setColor(new BaseColor(color.getRGB()));

                    PdfPCell cell=null;
                    cell = new PdfPCell(new Phrase(columns.get(i).get("COLUMN_TITLE"), fnt));
                    if(Integer.parseInt(columns.get(i).get("CAPTION_SPAN"))>0){
                    	cell.setColspan(Integer.parseInt(columns.get(i).get("CAPTION_SPAN")));
                    	cell.setHorizontalAlignment(1);
                    }else{
                    	cell.setColspan(1);
                    }
                    if(Integer.parseInt(columns.get(i).get("CAPTION_SPAN"))<=1){
	                    if("left".equals(columns.get(i).get("COLUMN_ALIGN"))){
	                    	cell.setHorizontalAlignment(0);
	                    }else if("right".equals(columns.get(i).get("COLUMN_ALIGN"))){
	                    	cell.setHorizontalAlignment(2);
	                    }else{
	                    	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
	                    }
                    }
                    cell.setBorderWidth(1f);
                    cell.setMinimumHeight(20f);
                    cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
                    ptbl.addCell(cell);
                    i=i+(Integer.parseInt(columns.get(i).get("CAPTION_SPAN"))-1);
                }
            }
            int headRows=1+((hcolspan+fcolspan)/noOfColumns);
            int footRows=((fcolspan)/noOfColumns);
            //String groupFieldValue="";
            int lastRowIndex=-1;
            int lastNonOverflowCount=headRows;
            int totalGroupRows=0;
            int lastNonOverflowIndex=-1;
            int rowGroupingCount = 0;
            int rowGroupingGroupRowsCount = 0;

            String groupingField="";
            String groupingFieldValue="";
            ptbl.setTotalWidth(totalWidth);
            ptbl.setLockedWidth(true);
            ptbl.setWidths(toFloatArray(widths));
            boolean tblNewPage=false;
//            System.out.println(" Page Split :"+table.PageSplitConditionField+" "+table.PageSplitConditionValue+" "+totalWidth);
            int capspan=0;
            boolean leftBorder=true;
            if(openingBalanceCredit>0 || openingBalanceDebit>0){
            for (int j = 0; j < columns.size(); j++)
            {
            	if (Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f)
                {
                    //continue;
            		capspan=capspan+Integer.parseInt(columns.get(j).get("CAPTION_SPAN"));
                    Font boldFont=new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
                    color = Color.decode("#000000");
                    boldFont.setColor(new BaseColor(color.getRGB()));
                	PdfPCell cell = null;
                    if("debit".equals(columns.get(j).get("COLUMN_NAME"))){
                		cell=new PdfPCell(new Phrase(formatNumber.format(openingBalanceDebit), boldFont));
                	}else if("credit".equals(columns.get(j).get("COLUMN_NAME"))){
                		cell=new PdfPCell(new Phrase(formatNumber.format(openingBalanceCredit), boldFont));                	
                	}else if("ledgername".equals(columns.get(j).get("COLUMN_NAME"))){
                		cell=new PdfPCell(new Phrase("Opening Balance", boldFont));
                	}else{
                		cell=new PdfPCell(new Phrase("", boldFont));
                	}
                    cell.setColspan(1);
                    if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
                    	cell.setHorizontalAlignment(0);
                    }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
                    	cell.setHorizontalAlignment(2);
                    }else{
                    	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
                    }       	
                    cell.setBorderWidth(0f);
                    if(leftBorder){
                    	cell.setBorderWidthLeft(1f);
                    	leftBorder=false;
                    }
                    if(j==capspan-1){
                    	cell.setBorderWidthRight(1f);
                    }
                    cell.setMinimumHeight(20f);
//                    cell.setBackgroundColor(new BaseColor(Color.decode("#b2aeae").getRGB()));
                    ptbl.addCell(cell);                		
                }
            }
            }
            double lastRowCredit=0;
            double lastRowDebit=0;
            for (int i = 0; i < aData.size(); i++)
            {
            	boolean doGroup=true;
                boolean isAltColor = false;
                if (i % 2 == 0)
                {
                    isAltColor = true;
                }
            	
//                System.out.println(" Page Split :"+aData.get(i).get("FundName"));
                if(!"".equals(grpColumn)){
                	if("".equals(grpFieldValue) || !grpFieldValue.equals(aData.get(i).get(grpColumn))){
                        PdfPCell cell=null;
                        fntSize = 8f;
                        fnt = new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
                        color = Color.decode("#000000");
                        fnt.setColor(new BaseColor(color.getRGB()));
                        if(!"".equals(grpFieldValue) && grpSum==1){
                        	leftBorder=true;
	                		for (int j = 0; j < columns.size(); j++)
	                        {
	                            if (grpSum==1 && Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f && Integer.parseInt(columns.get(j).get("COLUMN_SUM"))==1)
	                            {
	                                //continue;
	
	                                cell = new PdfPCell(new Phrase(groupData.get(grpFieldValue).get(columns.get(j).get("COLUMN_NAME")), fnt));
	                                cell.setColspan(1);
	                                if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
	                                	cell.setHorizontalAlignment(0);
	                                }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
	                                	cell.setHorizontalAlignment(2);
	                                }else{
	                                	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
	                                }       	
	                                cell.setMinimumHeight(20f);
	                                cell.setBorderWidth(2f);
	                                cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
	                                ptbl.addCell(cell);                		
	                            }else if(Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f){
	                                cell = new PdfPCell(new Phrase("", fnt));
	                                cell.setColspan(1);
	                                cell.setHorizontalAlignment(0);
	                            	cell.setMinimumHeight(20f);
	                            	cell.setBorderWidth(0f);
	                            	if(leftBorder){
	                            		cell.setBorderWidthLeft(1f);
	                            		leftBorder=false;
	                            	}
	                                cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
	                                ptbl.addCell(cell);                		
	                            }
	                        }
                        }
                        cell = new PdfPCell(new Phrase(new Phrase(aData.get(i).get(grpColumn), fnt)));
                        cell.setColspan(grpColSpan);
                        cell.setHorizontalAlignment(0);
                    	cell.setMinimumHeight(20f);
                        cell.setBackgroundColor(new BaseColor(Color.decode("#eeeeee").getRGB()));
                        ptbl.addCell(cell);
                        if(grpSum==2){
	                		for (int j = 0; j < columns.size(); j++)
	                        {
	                            if ( Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f && Integer.parseInt(columns.get(j).get("COLUMN_SUM"))==1)
	                            {
	                                //continue;
	
	                                cell = new PdfPCell(new Phrase(groupData.get(aData.get(i).get(grpColumn)).get(columns.get(j).get("COLUMN_NAME")), fnt));
	                                cell.setColspan(1);
	                                if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
	                                	cell.setHorizontalAlignment(0);
	                                }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
	                                	cell.setHorizontalAlignment(2);
	                                }else{
	                                	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
	                                }       	
	                                cell.setMinimumHeight(20f);
	                                cell.setBorderWidth(2f);                                
	                                cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
	                                ptbl.addCell(cell);                		
	                            }
	                        }
                        }
	                    /*cell = new PdfPCell(new Phrase(aData.get(i).get(grpColumn), fnt));
	                    cell.setColspan(noOfColumns);
	                    cell.setHorizontalAlignment(0); //0=Left, 1=Centre, 2=Right
	                    cell.setBackgroundColor(new BaseColor(Color.decode("#eeeeee").getRGB()));
	                    cell.setFixedHeight(20f);
	                    //cell.setBorder(0);
	                    //cell.setPadding(pxTopt(8));
	                    ptbl.addCell(cell);*/
	                    grpFieldValue=aData.get(i).get(grpColumn);
	                    totalGroupRows++;
	                    rowGroupingGroupRowsCount++;
	                    boolean of2 = isTableOverflows(cb, ptbl, startX, startY, checkHeight, totalWidth,null,footRows);
	                    if(!of2){
	                        lastNonOverflowCount++;                        	
	                    }
                	}
                }
                fntSize = 8f;
                fnt = new Font(f_book, fntSize, Font.NORMAL, BaseColor.BLACK);
                color = Color.decode("#000000");
                fnt.setColor(new BaseColor(color.getRGB()));

                Font boldFont=new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
                color = Color.decode("#000000");
                boldFont.setColor(new BaseColor(color.getRGB()));
                
                Font totFont=new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
                color = Color.decode("#000000");
                totFont.setColor(new BaseColor(color.getRGB()));

                leftBorder=true;
            	HashMap<String,String> colColors=new HashMap<String,String>();
            	if(groupFilters!=null && groupFilters.size()>0){
            		for(String gf:groupFilters.keySet()){
            			if(aData.get(i).get(gf)!=null && !"0".equals(aData.get(i).get(gf))){
        					String cft=groupFilters.get(gf);
        					String []cfts=cft.split(",");
        					for(int g=0;g<cfts.length;g++){
        						if("1".equals(aData.get(i).get(gf))){
        							colColors.put(cfts[g], "grow");
        						}else if("2".equals(aData.get(i).get(gf))){
        							colColors.put(cfts[g], "srow");
        						}else{
        							colColors.put(cfts[g], "totrow");
        						}
        					}
        				}
            		}
            		
            	}
                capspan=0;
                for (int j = 0; j < columns.size(); j++)
                {
                	if (Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f)
                    {
                        //continue;
                		capspan=capspan+Integer.parseInt(columns.get(j).get("CAPTION_SPAN"));
                		Font fnt1=fnt;
                		if("grow".equals(colColors.get(columns.get(j).get("COLUMN_NAME")))){
                			fnt1=boldFont;
                		}
                		if("srow".equals(colColors.get(columns.get(j).get("COLUMN_NAME")))){
                			fnt1=boldFont;
                		}
                		if("totrow".equals(colColors.get(columns.get(j).get("COLUMN_NAME")))){
                			fnt1=totFont;
                		}
                    	PdfPCell cell = new PdfPCell(new Phrase(aData.get(i).get(columns.get(j).get("COLUMN_NAME")), fnt1));
                        cell.setColspan(1);
                        if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
                        	cell.setHorizontalAlignment(0);
                        }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
                        	cell.setHorizontalAlignment(2);
                        }else{
                        	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
                        }       	
                        cell.setBorderWidth(0f);
                        if(leftBorder){
                        	cell.setBorderWidthLeft(1f);
                        	leftBorder=false;
                        }
                        if(j==capspan-1){
                        	cell.setBorderWidthRight(1f);
                        }
                        cell.setMinimumHeight(20f);
                        if("srow".equals(colColors.get(columns.get(j).get("COLUMN_NAME")))){
                        	cell.setBackgroundColor(new BaseColor(Color.decode("#b2aeae").getRGB()));
                        }else if("totrow".equals(colColors.get(columns.get(j).get("COLUMN_NAME")))){
                        	cell.setBackgroundColor(new BaseColor(Color.decode("#eeeeee").getRGB()));
                        }else{
                        	cell.setBackgroundColor(new BaseColor(Color.decode("#ffffff").getRGB()));
                        }
                        if("debit".equals(columns.get(j).get("COLUMN_NAME"))){
                    		pageTotalDebit+=Double.parseDouble(aData.get(i).get(columns.get(j).get("COLUMN_NAME")));
                    		debitTotal+=Double.parseDouble(aData.get(i).get(columns.get(j).get("COLUMN_NAME")));
                    		lastRowDebit=Double.parseDouble(aData.get(i).get(columns.get(j).get("COLUMN_NAME")));
                    	}else if("credit".equals(columns.get(j).get("COLUMN_NAME"))){
                    		pageTotalCredit+=Double.parseDouble(aData.get(i).get(columns.get(j).get("COLUMN_NAME")));
                    		creditTotal+=Double.parseDouble(aData.get(i).get(columns.get(j).get("COLUMN_NAME")));
                    		lastRowCredit=Double.parseDouble(aData.get(i).get(columns.get(j).get("COLUMN_NAME")));
                    	}
                        ptbl.addCell(cell);                		
                    }
                }
                	boolean of = isTableOverflows(cb, ptbl, startX, startY, checkHeight, totalWidth,null,footRows);
                    if (!of) {
                        lastRowIndex=i;
                    } else{
                    	pageTotalCredit-=lastRowCredit;
                    	pageTotalDebit-=lastRowDebit;
                    	creditTotal-=lastRowCredit;
                    	debitTotal-=lastRowDebit;
                    	ptbl.deleteLastRow();
                		int trows=ptbl.getRows().size();
                		PdfPCell[] pcells=ptbl.getRow(trows-1).getCells();
                		for(int k=0;k<pcells.length;k++){
                			if(pcells[k]!=null){
                				pcells[k].setBorderWidthBottom(1f);
                			}
                		}
                        writePageTotalAndBalance(ptbl,columns, grpColumn, grpSum);
                		boolean inxt=writePDFTable(true, widths, totalWidth, ptbl, startX, startY, cb,headRows,footRows,null);
                        writeTable(columns,null,(List<HashMap<String,String>>)aData.subList(lastRowIndex+1,aData.size()),null,inext,grpColumn,grpSum,groupData,groupFilters,sumData);
                        return;
                        //ptbl.deleteBodyRows();
                        //create new page
                    }
                //}
            }
    		int trows=ptbl.getRows().size();
    		PdfPCell[] pcells=ptbl.getRow(trows-1).getCells();
    		for(int k=0;k<pcells.length;k++){
    			if(pcells[k]!=null){
    				pcells[k].setBorderWidthBottom(1f);
    			}
    		}
            if(!"".equals(grpFieldValue) && grpSum==1){
            	leftBorder=true;
            	PdfPCell cell =null;
        		for (int j = 0; j < columns.size(); j++)
                {
                    if (grpSum==1 && Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f && Integer.parseInt(columns.get(j).get("COLUMN_SUM"))==1)
                    {
                        //continue;

                        cell = new PdfPCell(new Phrase(groupData.get(grpFieldValue).get(columns.get(j).get("COLUMN_NAME")), fnt));
                        cell.setColspan(1);
                        if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
                        	cell.setHorizontalAlignment(0);
                        }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
                        	cell.setHorizontalAlignment(2);
                        }else{
                        	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
                        }       	
                        cell.setMinimumHeight(20f);
                        cell.setBorderWidth(2f);
                        cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
                        ptbl.addCell(cell);                		
                    }else if(Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f){
                        cell = new PdfPCell(new Phrase("", fnt));
                        cell.setColspan(1);
                        cell.setHorizontalAlignment(0);
                    	cell.setMinimumHeight(20f);
                    	cell.setBorderWidth(0f);
                    	if(leftBorder){
                    		cell.setBorderWidthLeft(1f);
                    		leftBorder=false;
                    	}
                        cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
                        ptbl.addCell(cell);                		
                    }
                }
            }
            if(sumData.size()>0){
	            fntSize = 8f;
	            fnt = new Font(f_book, fntSize, Font.BOLD, BaseColor.BLACK);
	            color = Color.decode("#000000");
	            fnt.setColor(new BaseColor(color.getRGB()));
	            PdfPCell cell =null;
	            if(!"".equals(grpFieldValue)){
	        		for (int j = 0; j < columns.size(); j++)
	                {
	                    if (Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f && Integer.parseInt(columns.get(j).get("COLUMN_SUM"))==1)
	                    {
	                        //continue;
	
	                        cell = new PdfPCell(new Phrase(sumData.get(columns.get(j).get("COLUMN_NAME")), fnt));
	                        cell.setColspan(1);
	                        if("left".equals(columns.get(j).get("COLUMN_ALIGN"))){
	                        	cell.setHorizontalAlignment(0);
	                        }else if("right".equals(columns.get(j).get("COLUMN_ALIGN"))){
	                        	cell.setHorizontalAlignment(2);
	                        }else{
	                        	cell.setHorizontalAlignment(1); //0=Left, 1=Centre, 2=Right
	                        }       	
	                        cell.setMinimumHeight(20f);
	                        cell.setBorderWidth(2f);
	                        cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
	                        ptbl.addCell(cell);                		
	                    }else if(Float.parseFloat(columns.get(j).get("EXPORT_COLUMN_WIDTH")) > 0f){
	                        cell = new PdfPCell(new Phrase("", fnt));
	                        cell.setColspan(1);
	                        cell.setHorizontalAlignment(0);
	                    	cell.setMinimumHeight(20f);
	                        cell.setBackgroundColor(new BaseColor(Color.decode("#FFFFFF").getRGB()));
	                        ptbl.addCell(cell);                		
	                    }
	                }
	            }
            }
            writePageTotalAndBalance(ptbl,columns, grpColumn, grpSum);
            writePDFTable(false, widths, totalWidth, ptbl, startX, startY, cb,headRows,footRows,null);
        	}catch(Exception e){
        		e.printStackTrace();
        	}
        }
        private boolean writePDFTable(boolean createNewPg,ArrayList<Float> widths,float totalWidth,PdfPTable ptbl,float startX,float startY,PdfContentByte cb,int headerRows,int footerRows,ArrayList<PdfPCell> footers) throws Exception{
        	boolean isNext=false;
        	if(footers!=null){
	        	for(int i=0;i<footers.size();i++){
	  			  ptbl.addCell(footers.get(i));
	  		  	}
        	}
        	if(createNewPg && ptbl!=null && ptbl.getRows()!=null &&  ptbl.getRows().size()==headerRows){
        		ptbl.deleteBodyRows();
        	}
        	float[] ww=toFloatArray(widths);
            ptbl.setTotalWidth(totalWidth);
            ptbl.setLockedWidth(true);
            ptbl.setWidths(ww);
            ptbl.setHorizontalAlignment(0);
            ptbl.completeRow();
            ptbl.writeSelectedRows(0, -1, startX, startY, cb);
            if(!isNext && createNewPg){
            	createNewPage(true);
            }else{
            	currentY=startY-ptbl.getTotalHeight();
            }
            return isNext;
        }
        public boolean isTableOverflows(PdfContentByte content,PdfPTable table,float left,float top,float tableHeight,float tableWidth,ArrayList<PdfPCell> footers,int footRows)throws Exception{
  		  boolean result=false;
  		  if(footers!=null){
      		  for(int i=0;i<footers.size();i++){
      			  table.addCell(footers.get(i));
      		  }
  		  }
  		  ColumnText ct = new ColumnText(content);
  		// respect current Document.PageSize    
//  		  System.out.println(left+" "+ (top-tableHeight)+" "+(left+tableWidth)+" "+top);
  		  ct.setSimpleColumn(left, (top-tableHeight),(left+tableWidth), top);
  		  ct.addElement(table);
  		// **simulate** adding the PdfPTable to calculate total height
  		  int status=ct.go(true);
  		  
  		  if(ColumnText.hasMoreText(status)){
  			  result=true;
  		  }
  		  for(int i=0;i<footRows;i++){
  			  table.deleteLastRow();
  		  }
  		 return result;
        }
    }
