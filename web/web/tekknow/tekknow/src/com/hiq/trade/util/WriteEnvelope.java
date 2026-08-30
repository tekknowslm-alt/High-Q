package com.hiq.trade.util;

import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import com.core.report.WritePDF;
import com.core.util.DatabaseUtil;

public class WriteEnvelope extends WritePDF {
	private String invoiceNo = "";
	private String ls_ledgercode= "";
	private String ls_addresstype= "";
	
	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	private static SimpleDateFormat formatDisplay = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
	private static final DecimalFormat formatNumber = new DecimalFormat("####.00");
	private static final DecimalFormat formatInteger = new DecimalFormat("####");
	private static final SimpleDateFormat formatddMMyyyyHH = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

	public void renderTitleForPage() throws Exception {
		Connection cn = null;
		PreparedStatement pt = null;
		ResultSet r = null;
/*		try {
			ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
			HashMap<String, String> title = new HashMap<String, String>();
			cn = DatabaseUtil.getConnection();
			pt = cn.prepareStatement(
					"select comp_name companyname,address compaddressone,'' compaddresstwo,'SALEM-3' compcity,'' compstate,'636 003' comppin,'' compemail,'' compphoneno,tin_no comptinno,cst_no compcstno,'' comppan,'' cst_date from company c1,f_invoice f1 where c1.c_code=f1.c_code and f1.invoice_code="
							+ invoiceNo);
			pt.clearParameters();
			// pt.setString(1, invoiceNo);
			r = pt.executeQuery();
			if (r.next()) {
				title.put("size", "14");
				title.put("title", r.getString("companyname") + ", " + r.getString("compcity"));
				title.put("width", String.valueOf((getContentWidth() / 3 * 2)));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
				float currentYp = getCurrentYPos();
				createTitle(getPageContentMinWidth() + 25, getCurrentYPos() - 19, titles);
			}
			r.close();
			pt.close();
			r = null;
			pt = null;
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (r != null) {
					r.close();
				}
				if (pt != null) {
					pt.close();
				}
				if (cn != null) {
					cn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}*/
	}

	public void writeSimpleDocument(String ledgercode, String addresstype, OutputStream stream) throws Exception {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt1 = null;
		try {
			ls_ledgercode = ledgercode;
			ls_addresstype=addresstype;
			conn = DatabaseUtil.getConnection();
			StringBuffer strQuery = new StringBuffer(100);
			/*
			 * strQuery.append(
			 * "select 'M/s' cust_title,bill_no bill_no,ledger_name cust_name,addr1 cust_addr1,"
			 * ); strQuery.append(
			 * "addr2 cust_addr2,addr3 cust_addr3,place cust_city,pin_no cust_pin,' ' cust_state,"
			 * ); strQuery.append(
			 * "total_amt sh_bill_amount,total_amt sh_net_amount,0 sh_roundoff,l1.tin_no tinno,bill_date bill_date,'40s' cnts,8320 ends,1865 setno,11180 mtrs,'Bannari Amman' mill,"
			 * ); strQuery.append(
			 * "'NAVEEN AGENCIES' agency,'344' setno1,'AZAD' transport,'3281553' lrno,'20/02/2013' lrdate,'429' freight,'63' stax,'JAUNPUR(UP)' destination,"
			 * ); strQuery.append(
			 * "'PNB , RTGS CODE : PUNB0439500' bankname,'4395005700000052' acno,'ABQPV4678N' panno,'C.P.TEXTILES' comp_name from f_invoice f1,ledger_mast l1,company c1 where f1.ledger_code=l1.ledger_code and f1.c_code=c1.c_code and f1.invoice_code="
			 * + invoiceNo);
			 */
			if ("S".equals(addresstype)) 			
			{ 
				strQuery.append("select 'M/s' cust_title,l1.ledger_name cust_name,l1.s_addr1 cust_addr1,");
				strQuery.append(
						"l1.s_addr2 cust_addr2,l1.s_addr3 cust_addr3,l1.s_place cust_addr4,");
				strQuery.append(
						"ifnull(l1.s_ph_no,'') ph_no from ledger_mast l1  where l1.ledger_code="
								+ ls_ledgercode);
			}
			else
			{
			strQuery.append("select 'M/s' cust_title,l1.ledger_name cust_name,l1.addr1 cust_addr1,");
				strQuery.append(
						"l1.addr2 cust_addr2,l1.addr3 cust_addr3,l1.place cust_addr4,");
				strQuery.append(
						"l1.ph_no ph_no from ledger_mast l1  where l1.ledger_code="
								+ ls_ledgercode);
	
			} 
			pstmt1 = conn.prepareStatement(strQuery.toString());
			pstmt1.clearParameters();
			// pstmt1.setString(1, invoiceNo);
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				ArrayList<String> imgs = new ArrayList<String>();
				PDRectangle rect = new PDRectangle(800, 432);
				try {
					// imgs.add("/web/images/packingslip.png");
					initializeDocument(0, 0, 0, 0, false, 0, imgs, rect);
				} catch (Exception eex) {
					eex.printStackTrace();
					imgs.clear();
					// imgs.add("/web/images/packingslip.png");
					initializeDocument(0, 0, 0, 0, false, 0, imgs, rect);
				}
				// drawImage(0, 0, 0, rect.getWidth(), rect.getHeight());
				renderTitleForPage();
				ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> title = new HashMap<String, String>();
				float currentYp = 0;

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "23");
				title.put("title", "Phone: "+rs1.getString("ph_no"));
				title.put("width", String.valueOf(getContentWidth() / 3));
				title.put("align", "l");
				titles.add(title);
				createTitle(350, 271, titles);
				titles.clear();				
				title = new HashMap<String, String>();
				title.put("size", "25");
				title.put("title", rs1.getString("cust_title") + " " + rs1.getString("cust_name"));
				title.put("width", String.valueOf(getContentWidth() / 3));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);				
				title = new HashMap<String, String>();
				title.put("size", "23");
				title.put("title", rs1.getString("cust_addr1"));
				title.put("width", String.valueOf(getContentWidth() / 3));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "23");
				title.put("title", rs1.getString("cust_addr2"));
				title.put("width", String.valueOf(getContentWidth() / 3));
				title.put("align", "l");
				titles.add(title);title = new HashMap<String, String>();
				title.put("size", "23");
				title.put("title", rs1.getString("cust_addr3"));
				title.put("width", String.valueOf(getContentWidth() / 3));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "23");
				title.put("title", rs1.getString("cust_addr4"));
				title.put("width", String.valueOf(getContentWidth() / 3));
				title.put("align", "l");
				titles.add(title);
				createTitle(155, 241, titles);
				
/*				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("destination"));
				title.put("width", String.valueOf(getContentWidth() / 4));
				title.put("align", "l");
				titles.add(title);
				createTitle(115, 311, titles);
*/
				/*
				 * titles.clear(); title=new HashMap<String,String>(); title.put("size", "12");
				 * title.put("title", "Invoice No: "); title.put("width", "80");
				 * title.put("align", "l"); titles.add(title); title=new
				 * HashMap<String,String>(); title.put("size", "12"); title.put("title", "");
				 * title.put("width", "80"); title.put("align", "l"); titles.add(title);
				 * title=new HashMap<String,String>(); title.put("size", "12");
				 * title.put("title", "Date        : "); title.put("width", "80");
				 * title.put("align", "l"); titles.add(title);
				 * createTitle((getContentWidth()/2)+50,currentYp,titles);
				 */
				;

				closeContent();
				printPageNumbers("");
			}
			conn.close();
			saveDocument(stream);
			closeDocument();
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs1 != null) {
					rs1.close();
				}
				if (pstmt1 != null) {
					pstmt1.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException es) {

			}
		}
	}

	public void createItalicTitle(float startXPos, float startYPos, ArrayList<HashMap<String, String>> titles)
			throws Exception {
		int s = titles.size();
		for (int i = 0; i < s; i++) {
			HashMap<String, String> m = titles.get(i);
			int fontSize = Integer.parseInt(m.get("size"));
			String align = m.get("align");
			String title = m.get("title");
			String ft = m.get("font");
			PDFont font = null;
			font = PDType1Font.TIMES_ITALIC;
			float width = Float.parseFloat(m.get("width"));
			float titleWidth = font.getStringWidth(title) / 1000 * fontSize;
			float titleHeight = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * fontSize;
			float x = startXPos + ((width - titleWidth) / 2);
			if ("r".equals(align)) {
				x = startXPos + width - titleWidth;
			} else if ("l".equals(align)) {
				x = startXPos;
			}
			getContent().beginText();
			getContent().setFont(font, fontSize);
			getContent().moveTextPositionByAmount(x, startYPos - titleHeight);
			getContent().drawString(title);
			getContent().endText();
			startYPos -= titleHeight;
		}
		setCurrentYPos(startYPos);
	}

	public float createTableContent(ArrayList<HashMap<String, String>> columns, ResultSet rows, float headerHeight,
			float rowSpacing, float width, float startXPos, float startYPos, int headerLines, boolean drawLines,
			float fontSize, int borderBottom) throws Exception {
		float current = startYPos;
		int s = columns.size();
		PDFont font = PDType1Font.TIMES_ROMAN;
		// float fontSize=10;
		float currentX = startXPos;
		float currentY = startYPos;
		float firstRow = 15;
		float titleHeight = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * fontSize;
		while (rows.next()) {
			// HashMap<String,String> row=rows.get(j);
			boolean textPresent = true;
			boolean setValue = true;
			boolean setSubValue = true;
			for (int i = 0; i < s; i++) {
				HashMap<String, String> column = columns.get(i);
				column.put("psv", "0");
			}
			while (textPresent) {
				boolean tp = false;
				for (int i = 0; i < s; i++) {
					HashMap<String, String> column = columns.get(i);
					float margin = Float.parseFloat(column.get("margin"));
					float w = Float.parseFloat(column.get("width"));
					String cValue = column.get("value");
					if (setValue) {
						cValue = rows.getString(column.get("name"));
						if (cValue == null) {
							cValue = "";
						}
						if (!cValue.equals("") && column.get("format") != null) {
							if ("date".equals(column.get("format"))) {
								cValue = formatDisplay.format(rows.getDate(column.get("name")));
							} else if ("integer".equals(column.get("format"))) {
								cValue = formatInteger.format(rows.getInt(column.get("name")));
							} else if ("number".equals(column.get("format"))) {
								cValue = formatNumber.format(rows.getInt(column.get("name")));
							} else if ("datetime".equals(column.get("format"))) {
								cValue = formatddMMyyyyHH.format(rows.getDate(column.get("name")));
							}
						}
					}
					String align = column.get("align");
					float titleWidth = font.getStringWidth(cValue) / 1000 * fontSize;
					getContent().beginText();
					getContent().setFont(font, fontSize);
					String pt = cValue;
					if (titleWidth > w - margin) {
						float textWidth = 0;
						int spaceIndex = -1;
						int lastSpaceIndex = -1;
						while (textWidth <= w - margin) {
							lastSpaceIndex = spaceIndex;
							spaceIndex = cValue.indexOf(" ", spaceIndex + 1);
							if (spaceIndex == -1) {
								spaceIndex = cValue.length();
							}
							textWidth = font.getStringWidth(cValue.substring(0, spaceIndex)) / 1000 * fontSize;
						}
						if (lastSpaceIndex == -1) {
							lastSpaceIndex = cValue.length();
						}
						pt = cValue.substring(0, lastSpaceIndex);
						cValue = cValue.substring(lastSpaceIndex).trim();
						column.put("value", cValue);
					} else {
						cValue = "";
						column.put("value", cValue);
					}
					if (!cValue.equals("")) {
						tp = true;
					} else if (cValue.equals("") && "0".equals(column.get("psv"))) {
						// System.out.println("coming in :"+column.get("name"));
						if (column.get("sname") != null) {
							cValue = rows.getString(column.get("sname"));
							column.put("value", cValue);
							if (!cValue.equals("")) {
								tp = true;
							}
						}
						column.put("psv", "1");
					}
					titleWidth = font.getStringWidth(pt) / 1000 * fontSize;
					float x = currentX + (((w - margin - titleWidth) / 2));
					if ("r".equals(align)) {
						x = currentX + w - margin - titleWidth;
					} else if ("l".equals(align)) {
						x = currentX + margin;
					}
					if (getPageContentMinHeight() > (currentY - titleHeight)) {
						getContent().endText();
						if (drawLines) {
							// drawColumnLines(columns,width,startXPos,startYPos,currentY);
						}
						createPageAndChangePos();
						renderTitleForPage();
						currentY = createTableHeader(columns, headerHeight, width, startXPos, getCurrentYPos(),
								headerLines, drawLines, fontSize);
						getContent().beginText();
						getContent().setFont(font, fontSize);
						startYPos = currentY;
					}
					getContent().moveTextPositionByAmount(x, currentY - titleHeight);
					getContent().drawString(pt);
					getContent().endText();
					currentX += w;
				}
				textPresent = tp;
				currentY -= titleHeight;
				currentX = startXPos;
				setValue = false;
			}
			currentY -= rowSpacing;
			if (borderBottom == 1) {
				// content.drawLine(startXPos, currentY, startXPos+width,
				// currentY);
			}
		}
		if (drawLines) {
			// drawColumnLines(columns, width, startXPos,startYPos, currentY);
		}
		return currentY;
	}

}