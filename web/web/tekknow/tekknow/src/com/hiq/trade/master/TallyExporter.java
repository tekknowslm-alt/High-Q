package com.hiq.trade.master;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;

import org.xml.sax.helpers.AttributesImpl;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;

import com.core.util.AjaxResponseUtil;
import com.core.util.DatabaseUtil;

public class TallyExporter{
	
	Hashtable<String, String> hash = new Hashtable();
	long result = 0;
	String tallyVersion="9.0";
	SimpleDateFormat formatDay=new SimpleDateFormat("dd");
	SimpleDateFormat formatMonth=new SimpleDateFormat("MM");
	SimpleDateFormat formatYear=new SimpleDateFormat("yyyy");
	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);
	SimpleDateFormat formatParse=new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
	SimpleDateFormat formatdt=new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
	SimpleDateFormat formatdt1=new SimpleDateFormat("yyyyMMdd",Locale.ENGLISH);
	SimpleDateFormat formatter=new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
	private static String FS=System.getProperty("file.separator");	
	
	public String generateData(Map<String,Object> l){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		String companyName="";
		
		try{
			String FileName="";
			Date dte=new Date();
		    long milliSeconds = dte.getTime();
		    String type=(String)l.get("type");
		    String fileName = "";
		    if(type!=null && type.equals("1")){
		    	fileName ="Ledger_"+Long.toString(milliSeconds);
		    }else{
		    	fileName ="Voucher_"+Long.toString(milliSeconds);
		    }
			FileName=System.getProperty("catalina.home") + FS + ".."+ FS +"tally"+FS+fileName+".xml";
			PrintWriter out = new PrintWriter(new File(FileName));
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			
			pstmt=conn.prepareStatement("select comp_name from company where c_code=?");
			pstmt.setString(1, (String)l.get("ccode"));
			rs=pstmt.executeQuery();
			if(rs.next()){
				companyName=rs.getString("comp_name");
			}
			rs.close();
			pstmt.close();
			if(type!=null && type.equals("1")){
				GenerateMasterXml(companyName, out,tallyVersion,(String)l.get("guid"),(String)l.get("ccode"));
				updateGUID(l);
			}else{
				GenerateVoucherXml(companyName, out,tallyVersion,l);
				updateGUID(l);
			}
			out.close();
			conn.commit();
			result="{\"result\":\"Success\",\"message\":\"XML Generated Successfully\"}";
		}catch(Exception e){
			try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			e.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while adding BinMaster ["+e.getMessage()+"]\"}";
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}				
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return result;
	}
	
	public void createHeader(TransformerHandler hd, String companyName) throws Exception {


        hd.startElement("", "", "ENVELOPE", null);
        hd.startElement("", "", "HEADER", null);
        hd.startElement("", "", "TALLYREQUEST", null);
        hd.characters("Import Data".toCharArray(), 0, "Import Data".length()); //TODO find better way to have element data
        hd.endElement("", "", "TALLYREQUEST");
        hd.endElement("", "", "HEADER");

        hd.startElement("", "", "BODY", null);
        hd.startElement("", "", "IMPORTDATA", null);
        hd.startElement("", "", "REQUESTDESC", null);
        hd.startElement("", "", "REPORTNAME", null);
        hd.characters("All Masters".toCharArray(), 0, "All Masters".length());
        hd.endElement("", "", "REPORTNAME");


        hd.startElement("", "", "STATICVARIABLES", null);
        hd.startElement("", "", "SVCURRENTCOMPANY", null);
        hd.characters(companyName.toCharArray(), 0, companyName.length());
        hd.endElement("", "", "SVCURRENTCOMPANY");
        hd.endElement("", "", "STATICVARIABLES");

        hd.endElement("", "", "REQUESTDESC");

        hd.startElement("", "", "REQUESTDATA", null);


    }

    public void createFooter(TransformerHandler hd) throws Exception {

        hd.endElement("", "", "REQUESTDATA");
        hd.endElement("", "", "IMPORTDATA");
        hd.endElement("", "", "BODY");
        hd.endElement("", "", "ENVELOPE");

    }
    public void GenerateMasterXml(String companyName, PrintWriter out, String version,String guid,String ccode) throws Exception {
        Connection conn=DatabaseUtil.getConnection();
        String gCompany="1";
        StreamResult streamResult = new StreamResult(out);
        SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();
        // SAX2.0 ContentHandler.
        TransformerHandler hd = tf.newTransformerHandler();
        Transformer serializer = hd.getTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
//		serializer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM,"users.dtd");
        serializer.setOutputProperty(OutputKeys.INDENT, "yes");
        hd.setResult(streamResult);
        hd.startDocument();
        //AttributesImpl atts = new AttributesImpl();

        /*hash.put("PRIMARY", "PRIMARY");
        hash.put("CAPITAL ACCOUNT", "Capital Account");
        hash.put("RESERVES AND SURPLUS", "Reserves & Surplus");
        hash.put("PROFIT AND LOSS", "Profit & Loss A/c");
        hash.put("LOANS(LIABILITY)", "Loans (Liability)");
        hash.put("BRANCH AND DIVISIONS", "Branch / Divisions");
        hash.put("BANK ACCOUNT", "Bank Accounts");
        hash.put("STOCK IN HAND", "Stock-in-hand");
        hash.put("SUNDRY DEBTORS", "Sundry Debtors");
        hash.put("CUSTOMERS", "Sundry Debtors");
        hash.put("OTHER CUSTOMERS", "Sundry Debtors");
        hash.put("LOAN AND ADVANCES", "Loans & Advances (Asset)");
        hash.put("LOANS(ASSETS)", "Loans & Advances (Asset)");
        hash.put("SALES", "Sales Accounts");
        hash.put("PURCHASES", "Purchase Accounts");
        hash.put("PURCHASE", "Purchase Accounts");
        hash.put("SUNDRY CREDITORS", "Sundry Creditors");
        hash.put("SUPPLIERS", "Sundry Creditors");
        hash.put("OTHER SUPPLIERS", "Sundry Creditors");
        hash.put("UNSECURED LOANS", "Unsecured Loans");
        hash.put("DUTIES AND TAXES", "Duties & Taxes");
        hash.put("SECURED LOANS", "Secured Loans");
        hash.put("DEPOSITS", "Deposits (Asset)");
        hash.put("CASH ACCOUNT", "Cash-in-hand");
        hash.put("BANK OCC ACCOUNT", "Bank OD A/c");
        hash.put("BANK/CASH CREDIT", "Bank OD A/c");
        hash.put("CURRENT LIABILITIES AND PROVISION", "Current Liabilities");
        hash.put("LIABILITIES", "Current Liabilities");
        hash.put("MISCELANEOUS EXPENDITURE", "Indirect Expenses");
        hash.put("OTHER EXPENSES", "Indirect Expenses");
        hash.put("FIXED ASSETS", "Fixed Assets");
        hash.put("CURRENT ASSETS", "Current Assets");
        hash.put("ASSETS", "Current Assets");
        hash.put("PROVISIONS", "Provisions");
	*/
        hash.put("18", "Direct Expenses");
        hash.put("19", "Direct Incomes");
        hash.put("20", "Direct Expenses");
        hash.put("21", "Sundry Creditors");
        hash.put("22", "Sundry Debtors");
        hash.put("27", "Current Assets");
        hash.put("28", "Current Assets");
        createHeader(hd, companyName);
        
        createGroupMasterContent(hd,  version);
        createLedgerMasterContent(hd,  version,guid,ccode);
        createFooter(hd);

        hd.endDocument();

    }
    public void createLedgerMasterContent(TransformerHandler hd, String version,String guid,String ccode) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        
        try {
        	conn=DatabaseUtil.getConnection();
        	//ledger master
        	pstmt=conn.prepareStatement("select concat(ledger_mast.ledger_name,ifnull(concat(', ',ledger_mast.branch),''))   LEDGERNAME,ledger_code LEDGERCODE,ifnull(credit_days,30)  CREDITDAYS,case when acc_type in('A','L') then (select ifnull(sum(vd_cramount-vd_dramount),0)  from view_vouchers v1 where v1.vh_date<from_date and v1.new_ledger_name=concat(ledger_mast.ledger_name,ifnull(concat(', ',ledger_mast.branch),'')) and v1.branchcode=td_companycode) else 0 end  OPENINGBALANCE,group_name GROUPNAME from ledger_mast  inner join group_mast  on ledger_mast.group_code=group_mast.group_code left join tallyexport_details on td_guid=?  and td_companycode=?, fin_date order by ledger_name");        	
        	pstmt.setString(1, guid);
        	pstmt.setString(2,ccode);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				GenerateLedgerMaster(hd, rs, version);
                result++;
            }
			rs.close();
			pstmt.close();
        	
            rs = null;
            
            System.out.println("Ledger Master record XML Successfully completed");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
            	rs.getStatement().close();
                rs.close();
            }
            if(conn!=null){
            	conn.close();
            }
        }

    }
    public void createGroupMasterContent(TransformerHandler hd, String version) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        
        try {
        	conn=DatabaseUtil.getConnection();
        	//group master
        	pstmt=conn.prepareStatement("select group_name ag_name,group_code ag_code from group_mast order by group_name");
			rs=pstmt.executeQuery();
			while (rs.next()) {
                GenerateGroupMaster(hd, rs, version);
                result++;
            }
			rs.close();
			pstmt.close();
        	
            rs = null;
            System.out.println("Group Master record XML Successfully completed");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
        }

    }
    public void GenerateGroupMaster(TransformerHandler hd, ResultSet rs, String version) throws Exception {
        AttributesImpl atts = new AttributesImpl();
        atts.clear();
        atts.addAttribute("", "", "xmlns:UDF", "CDATA", "TallyUDF");

        //START
        hd.startElement("", "", "TALLYMESSAGE", atts);
        atts.clear();

        atts.addAttribute("", "", "NAME", "CDATA", rs.getString("ag_name"));
        atts.addAttribute("", "", "RESERVEDNAME", "CDATA", rs.getString("ag_name"));
        hd.startElement("", "", "GROUP", atts);
        atts.clear();

        //START
        if (version.equals("9.0")) {
            hd.startElement("", "", "LANGUAGENAME.LIST", atts);
        }
        hd.startElement("", "", "NAME.LIST", atts);
        hd.startElement("", "", "NAME", atts);
        hd.characters(rs.getString("ag_name").toCharArray(), 0, rs.getString("ag_name").length());
        hd.endElement("", "", "NAME");
        hd.endElement("", "", "NAME.LIST");
        if (version.equals("9.0")) {
            hd.startElement("", "", "LANGUAGEID", atts);
            hd.characters("1033".toCharArray(), 0, "1033".length());
            hd.endElement("", "", "LANGUAGEID");
            hd.endElement("", "", "LANGUAGENAME.LIST");
        }
        atts.clear();


        //START
        hd.startElement("", "", "PARENT", atts);
        if (hash.get(rs.getString("ag_code"))!=null) {
        	String parent=hash.get(rs.getString("ag_code"));
            hd.characters(parent.toCharArray(), 0, parent.length());
        }        
        hd.endElement("", "", "PARENT");
        atts.clear();


        
        hd.startElement("", "", "ISDEEMEDPOSITIVE", atts);

        hd.characters("Yes".toCharArray(), 0, "Yes".length());

        hd.endElement("", "", "ISDEEMEDPOSITIVE");
        atts.clear();

        //START
        hd.startElement("", "", "ISSUBLEDGER", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISSUBLEDGER");
        atts.clear();

        //START
        hd.startElement("", "", "ISADDABLE", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISADDABLE");
        atts.clear();

        //START
        hd.startElement("", "", "ISREVENUE", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISREVENUE");
        atts.clear();

       
        hd.startElement("", "", "AFFECTSGROSSPROFIT", atts);

        hd.characters("Yes".toCharArray(), 0, "Yes".length());
 
        hd.endElement("", "", "AFFECTSGROSSPROFIT");
        atts.clear();

        

        hd.startElement("", "", "TRACKNEGATIVEBALANCES", atts);

        hd.characters("Yes".toCharArray(), 0, "Yes".length());

        hd.endElement("", "", "TRACKNEGATIVEBALANCES");
        atts.clear();

        //START
        hd.startElement("", "", "ISBILLWISEON", atts);

        hd.characters("No".toCharArray(), 0, "No".length());

        hd.endElement("", "", "ISBILLWISEON");
        atts.clear();

        hd.startElement("", "", "ISCOSTCENTRESON", atts);

        hd.characters("No".toCharArray(), 0, "No".length());

        hd.endElement("", "", "ISCOSTCENTRESON");
        atts.clear();

        hd.startElement("", "", "AFFECTSSTOCK", atts);

        hd.characters("No".toCharArray(), 0, "No".length());

        hd.endElement("", "", "AFFECTSSTOCK");
        atts.clear();

        //START
        hd.startElement("", "", "ISCONDENSED", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISCONDENSED");
        atts.clear();

        //START
        hd.startElement("", "", "ISADDABLE", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISADDABLE");
        atts.clear();

        //START
        hd.startElement("", "", "SORTPOSITION", atts);
        hd.characters(rs.getString("ag_code").toCharArray(), 0, rs.getString("ag_code").length());
        hd.endElement("", "", "SORTPOSITION");
        atts.clear();

        hd.endElement("", "", "GROUP");
        hd.endElement("", "", "TALLYMESSAGE");
        //System.out.println(" End Group Name :"+rs.getString("GROUPNAME"));
    }
    public void GenerateLedgerMaster(TransformerHandler hd, ResultSet rs, String version) throws Exception {

        AttributesImpl atts = new AttributesImpl();
        //System.out.println(" Ledger Name :"+rs.getString("LEDGERNAME"));
        String parent = "";

        atts.clear();
        atts.addAttribute("", "", "xmlns:UDF", "CDATA", "TallyUDF");

        //START
        hd.startElement("", "", "TALLYMESSAGE", atts);
        atts.clear();

        atts.addAttribute("", "", "NAME", "CDATA", rs.getString("LEDGERNAME"));
        atts.addAttribute("", "", "RESERVEDNAME", "CDATA", rs.getString("LEDGERNAME"));
        hd.startElement("", "", "LEDGER", atts);
        atts.clear();

        //START
        if (version.equals("9.0")) {
            hd.startElement("", "", "LANGUAGENAME.LIST", atts);
        }
        hd.startElement("", "", "NAME.LIST", atts);
        hd.startElement("", "", "NAME", atts);
        hd.characters(rs.getString("LEDGERNAME").toCharArray(), 0, rs.getString("LEDGERNAME").length());
        hd.endElement("", "", "NAME");
        hd.endElement("", "", "NAME.LIST");
        if (version.equals("9.0")) {
            hd.startElement("", "", "LANGUAGEID", atts);
            hd.characters("1033".toCharArray(), 0, "1033".length());
            hd.endElement("", "", "LANGUAGEID");
            hd.endElement("", "", "LANGUAGENAME.LIST");
        }
        atts.clear();

        //START
        if (!version.equals("9.0")) {
            hd.startElement("", "", "ADDITIONALNAME", atts);
            hd.characters(rs.getString("LEDGERNAME").toCharArray(), 0, rs.getString("LEDGERNAME").length());
            hd.endElement("", "", "ADDITIONALNAME");
        }

        if (version.equals("9.0")) {
            hd.startElement("", "", "ALLOWINMOBILE", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "ALLOWINMOBILE");
        }

        //START
        hd.startElement("", "", "ISINTERESTON", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISINTERESTON");
        atts.clear();

        //START
        hd.startElement("", "", "PARENT", atts);
        hd.characters(rs.getString("GROUPNAME").toCharArray(), 0, rs.getString("GROUPNAME").length());
        hd.endElement("", "", "PARENT");
        atts.clear();

        //START
        hd.startElement("", "", "CURRENCYNAME", atts);
        hd.characters("Rs.".toCharArray(), 0, "Rs.".length());
        hd.endElement("", "", "CURRENCYNAME");
        atts.clear();

        //START
        if (!version.equals("9.0")) {
            hd.startElement("", "", "ISBILLWISEON", atts);


                hd.characters("No".toCharArray(), 0, "No".length());

            hd.endElement("", "", "ISBILLWISEON");
            atts.clear();

            

            hd.startElement("", "", "ISCOSTCENTRESON", atts);
            
            hd.characters("No".toCharArray(), 0, "No".length());
            
            hd.endElement("", "", "ISCOSTCENTRESON");
            atts.clear();

            
            hd.startElement("", "", "AFFECTSSTOCK", atts);

            
            hd.characters("No".toCharArray(), 0, "No".length());
            

            hd.endElement("", "", "AFFECTSSTOCK");
            atts.clear();
        }
        //START
        hd.startElement("", "", "ISCONDENSED", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISCONDENSED");
        atts.clear();

        //START
        hd.startElement("", "", "SORTPOSITION", atts);
        hd.characters(rs.getString("LEDGERCODE").toCharArray(), 0, rs.getString("LEDGERCODE").length());
        hd.endElement("", "", "SORTPOSITION");
        atts.clear();

        //START
        hd.startElement("", "", "INTERESTONBILLWISE", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "INTERESTONBILLWISE");
        atts.clear();

        //START
        hd.startElement("", "", "OVERRIDEINTEREST", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "OVERRIDEINTEREST");
        atts.clear();

        //START
        hd.startElement("", "", "OVERRIDEADVINTEREST", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "OVERRIDEADVINTEREST");
        atts.clear();

        hd.startElement("", "", "FORPAYROLL", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "FORPAYROLL");
        atts.clear();

        hd.startElement("", "", "ISTDSAPPLICABLE", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISTDSAPPLICABLE");
        atts.clear();

        hd.startElement("", "", "USEFORVAT", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "USEFORVAT");
        atts.clear();

        hd.startElement("", "", "IGNORETDSEXEMPT", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "IGNORETDSEXEMPT");
        atts.clear();

        hd.startElement("", "", "SHOWINPAYSLIP", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "SHOWINPAYSLIP");
        atts.clear();

        if (version.equals("9.0")) {
            hd.startElement("", "", "ISFBTAPPLICABLE", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "ISFBTAPPLICABLE");
            atts.clear();

            hd.startElement("", "", "ISGSTAPPLICABLE", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "ISGSTAPPLICABLE");
            atts.clear();

            hd.startElement("", "", "USEFORGRATUITY", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "USEFORGRATUITY");
            atts.clear();

            hd.startElement("", "", "AUDITED", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "AUDITED");
            atts.clear();

        }

        hd.startElement("", "", "FORSERVICETAX", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "FORSERVICETAX");
        atts.clear();

        hd.startElement("", "", "ISINPUTCREDIT", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISINPUTCREDIT");
        atts.clear();

        hd.startElement("", "", "ISEXEMPTED", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "ISEXEMPTED");
        atts.clear();

        hd.startElement("", "", "TDSDEDUCTEEISSPECIALRATE", atts);
        hd.characters("No".toCharArray(), 0, "No".length());
        hd.endElement("", "", "TDSDEDUCTEEISSPECIALRATE");
        atts.clear();

        if (version.equals("7.2")) {
            hd.startElement("", "", "PAYTYPE", atts);
            hd.endElement("", "", "PAYTYPE");
            atts.clear();

            hd.startElement("", "", "ASSLABRATE", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "ASSLABRATE");
            atts.clear();

            hd.startElement("", "", "TAXTYPE", atts);
            hd.endElement("", "", "TAXTYPE");

            hd.startElement("", "", "TDSDEDUCTEEISCACERTIFIED", atts);
            hd.characters("No".toCharArray(), 0, "No".length());
            hd.endElement("", "", "TDSDEDUCTEEISCACERTIFIED");
            atts.clear();

        }
        if (version.equals("9.0")) {
            hd.startElement("", "", "GSTTYPE", atts);
            hd.endElement("", "", "GSTTYPE");

            hd.startElement("", "", "TRADERLEDNATUREOFPURCHASE", atts);
            hd.endElement("", "", "TRADERLEDNATUREOFPURCHASE");

            hd.startElement("", "", "LEDGERFBTCATEGORY", atts);
            hd.endElement("", "", "LEDGERFBTCATEGORY");
        }
        if (version.equals("7.2") || version.equals("9.0")) {
            hd.startElement("", "", "TDSDEDUCTEETYPE", atts);
            hd.endElement("", "", "TDSDEDUCTEETYPE");


            hd.startElement("", "", "TAXCLASSIFICATIONNAME", atts);
            hd.endElement("", "", "TAXCLASSIFICATIONNAME");

            hd.startElement("", "", "TDSRATENAME", atts);
            hd.endElement("", "", "TDSRATENAME");


            hd.startElement("", "", "SERVICECATEGORY", atts);
            hd.endElement("", "", "SERVICECATEGORY");

        }

        //START
        hd.startElement("", "", "BILLCREDITPERIOD", atts);
//		hd.characters("10 Days".toCharArray(),0,"10 Days".length());
        hd.characters(rs.getString("CREDITDAYS").toCharArray(), 0, rs.getString("CREDITDAYS").length());
        hd.endElement("", "", "BILLCREDITPERIOD");
        atts.clear();

        hd.startElement("", "", "OPENINGBALANCE", atts);
//		double opbalance=rs.getDouble("OPEBAL");
        String opbal = rs.getString("OPENINGBALANCE");
              System.out.println("opbalance============================"+rs.getString("LEDGERNAME")+" :"+opbal);
//                String opbal=Double.toString(opbalance);
//		System.out.println("opbal==========================="+opbal);
        hd.characters(opbal.toCharArray(), 0, opbal.length());
        hd.endElement("", "", "OPENINGBALANCE");
        atts.clear();

        hd.endElement("", "", "LEDGER");
        hd.endElement("", "", "TALLYMESSAGE");

    }
    public void GenerateVoucherXml(String companyName, PrintWriter out, String version,Map<String,Object> l) throws Exception {
        Connection conn=DatabaseUtil.getConnection();
        String gCompany="1";
        StreamResult streamResult = new StreamResult(out);
        SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();
        // SAX2.0 ContentHandler.
        TransformerHandler hd = tf.newTransformerHandler();
        Transformer serializer = hd.getTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
//		serializer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM,"users.dtd");
        serializer.setOutputProperty(OutputKeys.INDENT, "yes");
        hd.setResult(streamResult);
        hd.startDocument();
        //AttributesImpl atts = new AttributesImpl();
        hash.put("SALES","1");
        hash.put("SALES RETURN","2");
        hash.put("OP", "3");
        hash.put("PURCHASE", "4");
        hash.put("OTHERS", "5");
        //hash.put("SALESRETURN", "6");
        hash.put("RECEIPTS", "7");
        hash.put("PAYMENT", "8");
        hash.put("JOURNAL", "9");
        hash.put("WEAVER PAYMENT", "10");
        hash.put("EXPENSES", "11");
        hash.put("S", "12");
        hash.put("CONTRA", "13");
        hash.put("SALESRET", "14");
        hash.put("RECEIPT", "15");
        hash.put("ADVANCE", "16");
        hash.put("SALARY", "17");
        hash.put("W.BETA", "18");
        hash.put("INCENTIVE", "19");
        hash.put("BONUS", "20");
        hash.put("ADV.PAID", "21");
        createHeader(hd, companyName);
        createVoucherContent(hd,  version,l);
        createFooter(hd);

        hd.endDocument();

    }
    public void createVoucherContent(TransformerHandler hd, String version,Map<String,Object> l) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        String cCode=(String)l.get("ccode");
        
        try {
        	conn=DatabaseUtil.getConnection();
        	//voucher header (voucherdt,vno etc)
        	pstmt=conn.prepareStatement("select distinct '"+(String)l.get("guid")+"' guid ,v_type vouchertype, h.vh_date voucherdt,h.vh_no voucherno,'' partyledger,ifnull(h.narration,'') narration,'' ALTERID,h.branchcode,h.vh_ref_code,h.vh_ref_type from view_vouchers h  where h.branchcode=? and (h.vh_date>=STR_TO_DATE(?,'%d/%m/%Y')  and h.vh_date<=STR_TO_DATE(?,'%d/%m/%Y') )");
        	pstmt.setString(1, (String)l.get("ccode"));
        	pstmt.setString(2, (String)l.get("fromdate"));
        	pstmt.setString(3,  (String)l.get("todate"));
        	//System.out.println("======"+(String)l.get("fromdate"));
			rs=pstmt.executeQuery();
			while (rs.next()) {
				//System.out.println("======"+rs.getString("voucherno"));
				GenerateVoucherXmlContent(hd, rs, version);
                result++;
            }
			rs.close();
			pstmt.close();
        	
            rs = null;
            
            System.out.println("Voucher record XML Successfully completed");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
            	rs.getStatement().close();
                rs.close();
            }
            if(conn!=null){
            	conn.close();
            }
        }

    }
    public void GenerateVoucherXmlContent(TransformerHandler hd, ResultSet rs, String version) throws Exception {
    	
    	AttributesImpl atts = new AttributesImpl();
    	
    	atts.clear();
        atts.addAttribute("", "", "xmlns:UDF", "CDATA", "TallyUDF");
		String voucher_guid=rs.getString("guid")+"-"+Long.toHexString(Long.parseLong(rs.getString("vh_ref_type")))+"-"+Long.toHexString(rs.getLong("vh_ref_code"));

        //START
        hd.startElement("", "", "TALLYMESSAGE", atts);
        atts.clear();
        atts.addAttribute("", "", "REMOTEID", "CDATA", voucher_guid);
        atts.addAttribute("", "", "VCHTYPE", "CDATA", rs.getString("vouchertype"));
        atts.addAttribute("", "", "Action", "CDATA", "Create");
        hd.startElement("", "", "VOUCHER", atts);
        atts.clear();

        hd.startElement("", "", "ISOPTIONAL", atts);
        hd.characters("No".toCharArray(), 0, 2);
        hd.endElement("", "", "ISOPTIONAL");
        
        hd.startElement("", "", "USEFORGAINLOSS", atts);
        hd.characters("No".toCharArray(), 0, 2);
        hd.endElement("", "", "USEFORGAINLOSS");
        
        hd.startElement("", "", "USEFORCOMPOUND", atts);
        hd.characters("No".toCharArray(), 0, 2);
        hd.endElement("", "", "USEFORCOMPOUND");
        
        hd.startElement("", "", "VOUCHERTYPENAME", atts);
        hd.characters(rs.getString("vouchertype").toCharArray(), 0, rs.getString("vouchertype").length()); //vouchertype
        hd.endElement("", "", "VOUCHERTYPENAME");
        
        String vdate=formatYear.format(rs.getDate("voucherdt"))+formatMonth.format(rs.getDate("voucherdt"))+formatDay.format(rs.getDate("voucherdt"));
        
        hd.startElement("", "", "DATE", atts);
        hd.characters(vdate.toCharArray(), 0, vdate.length()); 
        hd.endElement("", "", "DATE");
        
        hd.startElement("", "", "EFFECTIVEDATE", atts);
        hd.characters(vdate.toCharArray(), 0, vdate.length());  
        hd.endElement("", "", "EFFECTIVEDATE");
        
        hd.startElement("", "", "ISCANCELLED", atts);
        hd.characters("Cancel".toCharArray(), 0, 6); 
        hd.endElement("", "", "ISCANCELLED");
        
        hd.startElement("", "", "USETRACKINGNUMBER", atts);
        hd.characters("No".toCharArray(), 0, 2); 
        hd.endElement("", "", "USETRACKINGNUMBER");
        
        hd.startElement("", "", "ISPOSTDATED", atts);
        hd.characters("No".toCharArray(), 0, 2); 
        hd.endElement("", "", "ISPOSTDATED");
        
        hd.startElement("", "", "ISINVOICE", atts);
        hd.characters("No".toCharArray(), 0, 2); 
        hd.endElement("", "", "ISINVOICE");
        
        hd.startElement("", "", "DIFFACTUALQTY", atts);
        hd.characters("No".toCharArray(), 0, 2); 
        hd.endElement("", "", "DIFFACTUALQTY");
        
        hd.startElement("", "", "VOUCHERNUMBER", atts);
        hd.characters(rs.getString("voucherno").toCharArray(), 0, rs.getString("voucherno").length()); 
        hd.endElement("", "", "VOUCHERNUMBER");
        
        hd.startElement("", "", "REFERENCE", atts);
        hd.characters("".toCharArray(), 0, 0); //billno
        hd.endElement("", "", "REFERENCE");
        
        hd.startElement("", "", "PARTYLEDGERNAME", atts);
        hd.characters(rs.getString("partyledger").toCharArray(), 0, rs.getString("partyledger").length()); //partyledgername
        hd.endElement("", "", "PARTYLEDGERNAME");

        hd.startElement("", "", "COSTCENTRENAME", atts);
        hd.characters("".toCharArray(), 0, 0); //partyledgername
        hd.endElement("", "", "COSTCENTRENAME");

        hd.startElement("", "", "NARRATION", atts);
        hd.characters(rs.getString("narration").toCharArray(), 0, rs.getString("narration").length()); 
        hd.endElement("", "", "NARRATION");		

		if(version.equals("7.2") || version.equals("9.0")){
			hd.startElement("", "", "ASPAYSLIP", atts);
	        hd.characters("No".toCharArray(), 0, 2); //partyledgername
	        hd.endElement("", "", "ASPAYSLIP");
		}
		//String clrDate=formatdt1.format(formatdt.parse(formatter.format(rs.getDate("voucherdt"))));
		hd.startElement("", "", "GUID", atts);
        hd.characters(voucher_guid.toCharArray(), 0, voucher_guid.length()); 
        hd.endElement("", "", "GUID");		
        
        hd.startElement("", "", "ALTERID", atts);
        hd.characters(rs.getString("ALTERID").toCharArray(), 0, rs.getString("ALTERID").length()); 
        hd.endElement("", "", "ALTERID");				

        if(version.equals("ERP 9")){
        	
        	hd.startElement("", "", "CSTFORMISSUETYPE", atts);
            hd.characters("".toCharArray(), 0, 0); 
            hd.endElement("", "", "CSTFORMISSUETYPE");
            hd.startElement("", "", "CSTFORMRECVTYPE", atts);
            hd.characters("".toCharArray(), 0, 0); 
            hd.endElement("", "", "CSTFORMRECVTYPE");
            hd.startElement("", "", "FBTPAYMENTTYPE", atts);
            hd.characters("Default".toCharArray(), 0, 7);  
            hd.endElement("", "", "FBTPAYMENTTYPE");
            hd.startElement("", "", "VCHGSTCLASS", atts);
            hd.characters("".toCharArray(), 0, 0);  
            hd.endElement("", "", "VCHGSTCLASS");
            hd.startElement("", "", "ENTEREDBY", atts);
            hd.characters("".toCharArray(), 0, 0); 
            hd.endElement("", "", "ENTEREDBY");
            hd.startElement("", "", "USEFORGODOWNTRANSFER", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "USEFORGODOWNTRANSFER");
            
            hd.startElement("", "", "AUDITED", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "AUDITED");
            hd.startElement("", "", "FORJOBCOSTING", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "FORJOBCOSTING");
            hd.startElement("", "", "EXCISEOPENING", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "EXCISEOPENING");
            hd.startElement("", "", "USEFORINTEREST", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "USEFORINTEREST");

            hd.startElement("", "", "USEFORFINALPRODUCTION", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "USEFORFINALPRODUCTION");
            hd.startElement("", "", "HASCASHFLOW", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "HASCASHFLOW");
            hd.startElement("", "", "MFGJOURNAL", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "MFGJOURNAL");
            hd.startElement("", "", "HASDISCOUNTS", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "HASDISCOUNTS");
            

            hd.startElement("", "", "ISCOSTCENTRE", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "ISCOSTCENTRE");
            hd.startElement("", "", "ISDELETED", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "ISDELETED");
            hd.startElement("", "", "ASORIGINAL", atts);
            hd.characters("No".toCharArray(), 0, 2);  
            hd.endElement("", "", "ASORIGINAL");

    				
    	}

		if(version.equals("7.2")){
	        hd.startElement("", "", "UDF:HARYANAVAT.LIST", atts);
	        hd.startElement("", "", "HARYANAVAT", atts);
	        hd.startElement("", "", "DESC", atts);
	        hd.characters("No".toCharArray(), 0, 2);
	        hd.startElement("", "", "DESC", atts);
	        hd.endElement("", "", "HARYANAVAT");
	        hd.endElement("", "", "UDF:HARYANAVAT.LIST");
	        
	        atts.clear();
		}
		Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rsv = null;
        try{
        	conn=DatabaseUtil.getConnection();
        	//voucher detail (debit/credit amount)

        	pstmt=conn.prepareStatement("select v.new_ledger_name ledgername,v.vd_dramount,v.vd_cramount,case when l.group_code=21 or l.group_code=22 then 'Yes' else 'No' end ispartyledger from view_vouchers v inner join ledger_mast l on v.vd_ledger_code=l.ledger_code where v.branchcode=? and v.vh_no=? and v.v_type=? and vh_date=? order by vh_seq_no");
			pstmt.setString(1, rs.getString("branchcode"));
			pstmt.setString(2, rs.getString("voucherno"));
			pstmt.setString(3, rs.getString("vouchertype"));
			pstmt.setString(4, rs.getString("voucherdt"));
			rsv=pstmt.executeQuery();
			while (rsv.next()) {
				hd.startElement("", "", "ALLLEDGERENTRIES.LIST", atts);
				
				
				
				hd.startElement("", "", "REMOVEZEROENTRIES", atts);
	            hd.characters("No".toCharArray(), 0, 2);  
	            hd.endElement("", "", "REMOVEZEROENTRIES");
				
				hd.startElement("", "", "ISDEEMEDPOSITIVE", atts);
				String isdeempos="No";
				String amt="0";
				if(rsv.getDouble("vd_dramount")>0){
					isdeempos="Yes";
					amt="-"+rsv.getString("vd_dramount");
				}else{
					amt=rsv.getString("vd_cramount");
				}
	            hd.characters(isdeempos.toCharArray(), 0, isdeempos.length());  
	            hd.endElement("", "", "ISDEEMEDPOSITIVE");
				
	            hd.startElement("", "", "LEDGERFROMITEM", atts);
	            hd.characters("No".toCharArray(), 0, 2);  
	            hd.endElement("", "", "LEDGERFROMITEM");
				
	            hd.startElement("", "", "ROUNDLIMIT", atts);
	            hd.characters("0".toCharArray(), 0, 1);  
	            hd.endElement("", "", "ROUNDLIMIT");
	            
				
	
				if(version.equals("9.0")){
					 hd.startElement("", "", "GSTCLASS", atts);
		             hd.characters("".toCharArray(), 0, 0);  
		             hd.endElement("", "", "GSTCLASS");
				}
				
				hd.startElement("", "", "LEDGERNAME", atts);
	            hd.characters(rsv.getString("ledgername").toCharArray(), 0, rsv.getString("ledgername").length());  
	            hd.endElement("", "", "LEDGERNAME");
	             
	            hd.startElement("", "", "AMOUNT", atts);
	            
	            hd.characters(amt.toCharArray(), 0, amt.length());  
	            hd.endElement("", "", "AMOUNT");
				
	
	            hd.startElement("", "", "ISPARTYLEDGER", atts);
	            hd.characters(rsv.getString("ispartyledger").toCharArray(), 0, rsv.getString("ispartyledger").length());  
	            hd.endElement("", "", "ISPARTYLEDGER");
	             
				
	
				
	            hd.endElement("", "", "ALLLEDGERENTRIES.LIST");
	        }
    			
    			hd.endElement("", "", "VOUCHER");
    	        hd.endElement("", "", "TALLYMESSAGE");
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
        	try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}	
				if(rsv!=null){
					rsv.close();
				}	
			}catch(SQLException esql){
				esql.printStackTrace();
			}
        }
    }
    public String updateGUID(Map<String,Object> l){
    	String result="{\"result\":\"Success\"}";
    	Connection conn = null;
        PreparedStatement pstmt=null;
        PreparedStatement pstmt1=null;
        ResultSet rs = null;
        
        try {
        	conn=DatabaseUtil.getConnection();
        	conn.setAutoCommit(false);
        	String cCode=(String)l.get("ccode");
        	pstmt=conn.prepareStatement("select count('x') cnt from tallyexport_details where td_companycode="+cCode);
			rs=pstmt.executeQuery();
			if (rs.next() && rs.getInt("cnt")>0) {
                pstmt1=conn.prepareStatement("update tallyexport_details set td_guid='"+(String)l.get("guid")+"',td_masterupdatedt=now() where td_companycode="+cCode);
                pstmt1.executeUpdate();
            }else{
            	pstmt1=conn.prepareStatement("insert into tallyexport_details (td_guid,td_masterupdatedt,td_companycode) values('"+(String)l.get("guid")+"',now(),"+cCode+")");
                pstmt1.executeUpdate();
            }
			rs.close();
			pstmt.close();
        	
            rs = null;
            conn.commit();
            System.out.println("Group Master record XML Successfully completed");

        } catch (Exception ex) {
        	try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			ex.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while GenerateXML\"}";
        } finally {
        	try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}	
				if(pstmt1!=null){
					pstmt1.close();
				}	
			}catch(SQLException esql){
				esql.printStackTrace();
			}
        }
        return result;
    }
    public String getGUID(String code){
		StringWriter l=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		try{
			conn=DatabaseUtil.getConnection();
			l=new StringWriter();
			JsonFactory factory=new JsonFactory();
			JsonGenerator generator=factory.createJsonGenerator(l);
			generator.writeStartObject();
			pstmt=conn.prepareStatement("select td_guid from tallyexport_details where td_companycode="+code);
			//pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			if(rs.next()){
				AjaxResponseUtil.writeField(generator, "guid", rs.getString("td_guid"), null);
			}
			generator.writeEndObject();
			generator.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return l.toString();
	}
	public static TallyExporter getInstance(){		
		 return new TallyExporter();
	}
}