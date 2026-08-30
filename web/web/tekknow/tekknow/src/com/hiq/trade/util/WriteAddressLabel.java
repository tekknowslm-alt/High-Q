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

public class WriteAddressLabel extends WritePDF {
	private String invoiceNo = "";
	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	private static SimpleDateFormat formatDisplay = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);

	public void renderTitleForPage() throws Exception {
		Connection cn = null;
		PreparedStatement pt = null;
		ResultSet r = null;
		try {
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
					"select 'M/s' cust_title,concat('INVOICE NO.:',bill_no) bill_no,s_ledger_name cust_name,s_addr1 cust_addr1,");
			strQuery.append(
					"s_addr2 cust_addr2,s_addr3 cust_addr3,s_place cust_city,'' cust_pin,ph_no cust_phone, '' cust_state,");
			strQuery.append("concat('GSTIN: ',l1.s_gstin_no) tinno,");
			strQuery.append(
					"comp_name companyname,'No.18/132, VASAGASALAI STREET,' compaddressone,'PONNAMMAPET,' compaddresstwo,'SALEM - 636 001.' compaddressthree,");
			strQuery.append("'' compcity,'' compstate,'' comppin,'' compemail,mobile compphoneno,");
			strQuery.append(
					"concat('GSTIN:',c1.gstin_no) comptinno,concat('Ordered By:',ordered_by) orderedby from company c1,f_invoice f1,ledger_mast l1 where f1.ledger_code=l1.ledger_code and c1.c_code=f1.c_code and f1.invoice_code="
							+ invoiceNo);
			// strQuery.append("from f_invoice f1,ledger_mast l1,company c1 where
			// c1.comp_code=f1.comp_code and f1.ledger_code=l1.ledger_code and
			// invoice_code="
			// + invoiceNo);
			// + invoiceNo);*/ pstmt1.clearParameters();
			pstmt1 = conn.prepareStatement(strQuery.toString());
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				ArrayList<String> imgs = new ArrayList<String>();
				PDRectangle rect = new PDRectangle(PDPage.PAGE_SIZE_A4.getWidth(), PDPage.PAGE_SIZE_A4.getHeight() / 2);
				try {
					initializeDocument(10, 10, 10, 10, true, 0, imgs, rect);
				} catch (Exception eex) {
					eex.printStackTrace();
					imgs.clear();
					initializeDocument(10, 10, 10, 10, true, 0, imgs, rect);
				}

				// renderTitleForPage();
				ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> title = new HashMap<String, String>();

				float contentHalfWidth = (getPageWidth() / 2) + 25;
				float currentYp = getCurrentYPos();
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", "TO: ");
				title.put("width", String.valueOf(getPageWidth() - 50));
				title.put("align", "l");
				titles.add(title);
				createTitle(60, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("tinno"));
				title.put("width", String.valueOf(getPageWidth() / 2));
				title.put("align", "l");
				titles.add(title);
				createTitle(getPageWidth() / 2, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("cust_name"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("cust_addr1"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("cust_addr2"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("cust_addr3"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("cust_city"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", "Ph: " + rs1.getString("cust_phone"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);

				createTitle(90, getCurrentYPos(), titles);

				setCurrentYPos(getCurrentYPos() - 20);
				getContent().drawLine(60, getCurrentYPos(), getPageWidth() - 60, getCurrentYPos());
				setCurrentYPos(getCurrentYPos() - 10);
				currentYp = getCurrentYPos();
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", "FROM: ");
				title.put("width", String.valueOf(getPageWidth() - 50));
				title.put("align", "l");
				titles.add(title);
				createTitle(60, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("comptinno"));
				title.put("width", String.valueOf(getPageWidth() / 2));
				title.put("align", "l");
				titles.add(title);
				createTitle(getPageWidth() / 2, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("companyname"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("compaddressone"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("compaddresstwo"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", rs1.getString("compaddressthree"));
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "22");
				title.put("title", "Mobile: " + rs1.getString("compphoneno") + ",   Ph: 0427-2295513");
				title.put("width", String.valueOf(getPageWidth() - 70));
				title.put("align", "l");
				titles.add(title);
				createTitle(90, getCurrentYPos(), titles);
				setCurrentYPos(getCurrentYPos() - 20);
				getContent().drawLine(60, getCurrentYPos(), getPageWidth() - 60, getCurrentYPos());

				currentYp = getCurrentYPos();
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "16");
				title.put("title", rs1.getString("bill_no"));
				title.put("width", String.valueOf(getPageWidth() - 50));
				title.put("align", "l");
				titles.add(title);
				createTitle(60, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "16");
				title.put("title", rs1.getString("orderedby"));
				title.put("width", String.valueOf(getPageWidth() / 2 - 60));
				title.put("align", "r");
				titles.add(title);
				createTitle(getPageWidth() / 2, currentYp, titles);

				closeContent();
				// printPageNumbers("");
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

	public float createTableLines(ArrayList<HashMap<String, String>> columns, float height, float width,
			float startXPos, float startYPos) throws Exception {
		float current = startYPos;
		int s = columns.size();
		float originalPosition = startYPos - height;
		PDFont font = PDType1Font.TIMES_BOLD;
		// float fontSize=10;
		// getContent().drawLine(startXPos, startYPos, startXPos+width,
		// startYPos);
		// getContent().drawLine(startXPos, startYPos, startXPos,
		// startYPos-height);
		// getContent().drawLine(startXPos+width, startYPos-height,
		// startXPos+width, startYPos);
		getContent().drawLine(startXPos, startYPos - height, startXPos + width, startYPos - height);
		float currentX = startXPos;
		float currentY = startYPos;
		for (int i = 0; i < s; i++) {
			HashMap<String, String> column = columns.get(i);
			float margin = 0;
			float w = Float.parseFloat(column.get("width"));
			currentY = startYPos;
			if (i != s - 1) {
				getContent().drawLine(currentX + w + margin, startYPos, currentX + w + margin, startYPos - height);
			}
			currentX += (w + margin);
		}
		return current - height;
	}

	public float createParagraph(String title, String inText, float width, float startXPos, float startYPos,
			float lineSpace, int fontSize) throws Exception {
		PDFont font = PDType1Font.TIMES_BOLD;
		PDFont fontTitle = PDType1Font.TIMES_BOLD;
		int titleFontSize = 10;
		List<String> lines = new ArrayList<String>();
		int lastSpace = -1;
		String text = inText;

		while (text.length() > 0) {
			int spaceIndex = text.indexOf(' ', lastSpace + 1);
			if (spaceIndex < 0) {
				lines.add(text);
				text = "";
			} else {
				String subString = text.substring(0, spaceIndex);
				float size = fontSize * font.getStringWidth(subString) / 1000;
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
			float titleHeight = fontTitle.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * titleFontSize;
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
			float leading = font.getFontDescriptor().getFontBoundingBox().getHeight() / 1000 * fontSize;
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
				getContent().moveTextPositionByAmount(0, -leading);
			}
			getContent().endText();
		}
		return current;
	}
}