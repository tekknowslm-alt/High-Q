package com.hiq.trade.util;

import java.awt.Color;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

public class WriteSalesOrder extends WritePDF {
	private String invoiceNo = "";
	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	private static SimpleDateFormat formatDisplay = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
	boolean printBold = false;

	public void renderTitleForPage() throws Exception {
		Connection cn = null;
		PreparedStatement pt = null;
		ResultSet r = null;
		try {
			ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
			HashMap<String, String> title = new HashMap<String, String>();
			cn = DatabaseUtil.getConnection();

			// pt=cn.prepareStatement("select comp_name companyname,address
			// compaddressone,'' compaddresstwo,'SALEM' compcity,'' compstate,'636 001'
			// comppin,'' compemail,phone compphoneno,c1.gstin_no comptinno,concat('PAN:
			// ',pan_no) compcstno,' ' comppan,' ' cst_date,mobile compcell,x33' areacode
			// from company c1,sales_ret f1 where c1.c_code=f1.c_code and
			// f1.invoice_code="+invoiceNo);

			pt = cn.prepareStatement(
					"select '' companyname,'' compaddressone,'' compaddresstwo,'' compcity,'' compstate,'' comppin,'' compemail,'' compphoneno,'' comptinno,'' compcstno,' ' comppan,' ' cst_date,'' compcell,'' areacode, 'SALES ORDER' as transaction_type from company c1 WHERE c1.c_code=1");
			pt.clearParameters();
			// pt.setString(1, invoiceNo);
			r = pt.executeQuery();
			if (r.next()) {
				float currentYp = getCurrentYPos(); 
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", r.getString("transaction_type"));
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
		        float cyp = getCurrentYPos();
				createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
				// drawImage(0, 30, cyp - 75, 100, 60);
				changeYPosBy(10);
				drawLine(getPageMarginLeft(), getCurrentYPos(), getPageWidth() - getPageMarginRight(),
						getCurrentYPos());
				changeYPosBy(2);
			}
			r.close();
			pt.close();
			r = null;
			pt = null;
		} catch (Exception e) {
			e.printStackTrace();
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
		}
	}

	public void writeSimpleDocument(String invNo, OutputStream stream) throws Exception {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt1 = null;
		try {
			invoiceNo = invNo;
			conn = DatabaseUtil.getConnection();
			StringBuffer strQuery = new StringBuffer(100);

			strQuery.append(
					"select order_no order_no,DATE_FORMAT(order_date,'%d/%m/%Y') order_date,ledger_name,branch branch from sale_order s1, ledger_mast l1 where s1.ledger_code=l1.ledger_code and s1.order_code="
							+ invoiceNo);
			// + invoiceNo);*/ pstmt1.clearParameters();
			pstmt1 = conn.prepareStatement(strQuery.toString());
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				ArrayList<String> imgs = new ArrayList<String>();
				try {
					setUseContext(false);
//					imgs.add("tekknow.jpg");
	//				imgs.add("perumal.jpg");
					// imgs.add("tekknow2.jpg");

					//float currentPageWidth = 141.732f * 2;
					//float currentPageHeight = 68.0315f;
			          initializeDocument(25.0F, 10.0F, 10.0F, 30.0F, true, 0.0F, imgs, 
			                  PDPage.PAGE_SIZE_A4); 
				} catch (Exception eex) {
					eex.printStackTrace();
					imgs.clear();
					imgs.add("/web/images/login_lgo.jpg");
					imgs.add("/web/images/login_lgo2.jpg");
					initializeDocument(25, 10, 10, 30, true, 0, imgs, PDPage.PAGE_SIZE_A4);
				}

				renderTitleForPage();
				ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> title = new HashMap<String, String>();

				float contentHalfWidth = (getPageWidth() / 2) + 25;
				float currentYp = getCurrentYPos();
				float firstY = currentYp;
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "No. :  " + rs1.getString("order_no"));
				title.put("width", "60");	
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				 createTitle(contentHalfWidth + 150.0F, currentYp, titles);
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Date:  " + rs1.getString("order_date"));
				title.put("width", "60");
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				 createTitle(contentHalfWidth + 150.0F, currentYp-20, titles);
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Party    :  " + rs1.getString("ledger_name"));
				title.put("width", "60");	
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				 createTitle(30.0F, currentYp, titles);
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Branch :  " + rs1.getString("branch"));
				title.put("width", "60");
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(30.0F, currentYp-20, titles);
			 	
				float pageWidth = getPageWidth() - getPageMarginLeft() - getPageMarginRight();
				float snoWidth = pageWidth * 5.0F / 100.0F;
				float barcodeWidth = pageWidth * 8.0F / 100.0F;
				float prodcodeWidth = pageWidth * 15.0F / 100.0F;
				float descWidth = pageWidth * 45.0F / 100.0F;
				float qtyWidth = pageWidth * 8.0F / 100.0F;
				float mtrWidth = pageWidth * 10.0F / 100.0F;
				float pendingWidth = pageWidth * 10.0F / 100.0F;
				ArrayList<HashMap<String, String>> c = new ArrayList();
				HashMap<String, String> c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(snoWidth));
				c1.put("caption", "S.No.");
				c1.put("size", "18");
				c1.put("name", "sd_sno");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(barcodeWidth));
				c1.put("caption", "Barcode");
				c1.put("size", "20");
				c1.put("name", "product_code");
				c1.put("align", "l");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(prodcodeWidth));
				c1.put("caption", "Product Code");
				c1.put("size", "20");
				c1.put("name", "prod_code");
				c1.put("align", "l");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(descWidth));
				c1.put("caption", "Item Description");
				c1.put("size", "20");
				c1.put("name", "itemdescription");
				c1.put("align", "l");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(qtyWidth));
				c1.put("caption", "Mtrs");
				c1.put("size", "12");
				c1.put("name", "mtrs");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(mtrWidth));
				c1.put("caption", "Qty");
				c1.put("size", "12");
				c1.put("name", "pcs");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(pendingWidth));
				c1.put("caption", "Pending");
				c1.put("name", "pending");
				c1.put("size", "12");
				c1.put("align", "l");
				c.add(c1);
				HashMap<String, String> v = new HashMap();
				v.put("so_action", "600");
				float cyp = getCurrentYPos();
				float typ = createTableLines(c,
						getPageHeight() - (getPageHeight() - 83 - cyp) - getPageMarginBottom() - getPageMarginTop() - 85.0F,
						getPageWidth() - getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(),
						getCurrentYPos() - 10);

				float cy = createTableHeader(c, 25.0F, getPageWidth() - getPageMarginLeft() - getPageMarginRight(),
						getPageMarginLeft(), cyp - 10, 1, false, 10.0F);
				setCurrentYPos(cy);

				pstmt = conn

						.prepareStatement(
								"select @rowno:=@rowno+1 sd_sno,d.* from (select  s1.product_code product_code,prod_code prod_code,product_name itemdescription,qty pcs,case when mtrs=0 then '' else mtrs end mtrs,'' pending from sale_order_det s1,product_mast p1 where s1.product_code=p1.product_code and s1.order_code="
										+ invoiceNo + " order by sno) d inner join (SELECT @rowno:=0) sno on 1=1");

				rs = pstmt.executeQuery();
				cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - getPageMarginLeft() - getPageMarginRight(),
						getPageMarginLeft(), getCurrentYPos(), 1, false, 12.0F);
				setCurrentYPos(cy);
				rs.close();
				pstmt.close();
				pstmt = null;

				 
		        pstmt = conn
		          .prepareStatement("select '' sd_sno,'' product_code,'' prod_code,'Total ' itemdescription,ifnull(sum(qty),0) as pcs,ifnull(sum(mtrs),0) mtrs,'' pending from sale_order_det f1 where order_code=" + 
		          invoiceNo);
		        pstmt.clearParameters();
		        
		        rs = pstmt.executeQuery();
		        cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - 
		          getPageMarginLeft() - getPageMarginRight(), 
		          getPageMarginLeft(), typ + 17.0F, 1, false, 12.0F);
		        setCurrentYPos(cy - 2.0F);
		        rs.close();
		        pstmt.close();

		        
		     //   drawLine(getPageMarginLeft(), typ + 15.0F, getPageMarginLeft()-5 + snoWidth+barcodeWidth+prodcodeWidth+descWidth+qtyWidth+mtrWidth+pendingWidth, typ + 15.0F);
		              
		        
		        
				closeContent();
			}

			conn.close();
			saveDocument(stream);
			closeDocument();
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
				if (rs1 != null) {
					rs1.close();
				}
				if (pstmt1 != null) {
					pstmt1.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException localSQLException) {
			}
		}
	}

	public void createItalicTitle(float startXPos, float startYPos, ArrayList<HashMap<String, String>> titles)
			throws Exception {
		int s = titles.size();
		for (int i = 0; i < s; i++) {
			HashMap<String, String> m = (HashMap) titles.get(i);
			int fontSize = Integer.parseInt((String) m.get("size"));
			String align = (String) m.get("align");
			String title = (String) m.get("title");
			String ft = (String) m.get("font");
			PDFont font = null;
			font = PDType1Font.TIMES_ITALIC;
			float width = Float.parseFloat((String) m.get("width"));
			float titleWidth = font.getStringWidth(title) / 1000.0F * fontSize;
			float titleHeight = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000.0F * fontSize;
			float x = startXPos + (width - titleWidth) / 2.0F;
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

	public float createTableLines(ArrayList<HashMap<String, String>> columns, float height, float width,
			float startXPos, float startYPos) throws Exception {
		float current = startYPos;
		int s = columns.size();
		float originalPosition = startYPos - height;
		PDFont font = PDType1Font.TIMES_BOLD;

		getContent().drawLine(startXPos, startYPos - height, startXPos + width, startYPos - height);
		float currentX = startXPos;
		float currentY = startYPos;
		for (int i = 0; i < s; i++) {
			HashMap<String, String> column = (HashMap) columns.get(i);
			float margin = 0.0F;
			float w = Float.parseFloat((String) column.get("width"));
			currentY = startYPos;
			if (i != s - 1) {
				getContent().drawLine(currentX + w + margin, startYPos, currentX + w + margin, startYPos - height);
			}
			currentX += w + margin;
		}
		return current - height;
	}

	public float createParagraph(String title, String inText, float width, float startXPos, float startYPos,
			float lineSpace, int fontSize) throws Exception {
		PDFont font = PDType1Font.TIMES_BOLD;
		if (!printBold) {
			font = PDType1Font.TIMES_ROMAN;
		}
		PDFont fontTitle = PDType1Font.TIMES_BOLD;
		int titleFontSize = 10;
		List<String> lines = new ArrayList();
		int lastSpace = -1;
		String text = inText;

		while (text.length() > 0) {
			int spaceIndex = text.indexOf(' ', lastSpace + 1);
			if (spaceIndex < 0) {
				lines.add(text);
				text = "";
			} else {
				String subString = text.substring(0, spaceIndex);
				float size = fontSize * font.getStringWidth(subString) / 1000.0F;
				if (size > width) {
					if (lastSpace < 0)
						lastSpace = spaceIndex;
					subString = text.substring(0, lastSpace);
					lines.add(subString);
					text = text.substring(lastSpace).trim();
					lastSpace = -1;
				} else {
					lastSpace = spaceIndex;
				}
			}
		}

		float current = startYPos;
		if (!"".equals(title)) {
			float titleHeight = fontTitle.getFontDescriptor().getFontBoundingBox().getHeight() / 1000.0F
					* titleFontSize;
			titleHeight += lineSpace;
			getContent().beginText();
			getContent().setFont(fontTitle, titleFontSize);
			getContent().moveTextPositionByAmount(startXPos, startYPos);
			current -= titleHeight;
			if (getPageContentMinHeight() > current) {
				getContent().endText();
				createPageAndChangePos();
				renderTitleForPage();
				getContent().beginText();
				getContent().setFont(fontTitle, titleFontSize);
				getContent().moveTextPositionByAmount(startXPos, getCurrentYPos());
				current = getCurrentYPos();
				current -= titleHeight;
			}
			getContent().drawString(title);
			getContent().moveTextPositionByAmount(startXPos, -titleHeight);
			getContent().endText();
		}
		if (!"".equals(inText)) {
			float leading = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000.0F * fontSize;
			leading += lineSpace;
			getContent().beginText();
			getContent().setFont(font, fontSize);
			getContent().moveTextPositionByAmount(startXPos, current);
			for (String line : lines) {
				current -= leading;
				if (getPageContentMinHeight() > current) {
					getContent().endText();
					createPageAndChangePos();
					renderTitleForPage();
					getContent().beginText();
					getContent().setFont(font, fontSize);
					getContent().moveTextPositionByAmount(startXPos, getCurrentYPos());
					current = getCurrentYPos();
					current -= leading;
				}
				getContent().drawString(line);
				getContent().moveTextPositionByAmount(0.0F, -leading);
			}
			getContent().endText();
		}
		return current;
	}
}