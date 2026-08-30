package com.hiq.trade.util;

import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;

import com.core.report.WritePDF;
import com.core.util.DatabaseUtil;

public class GenerateSizingControlChart extends WritePDF {

	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	private static SimpleDateFormat formatDisplay = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);

	public void renderTitleForPage() throws Exception {
		ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> title = new HashMap<String, String>();
		if (getDocument().getNumberOfPages() == 1) {
			title.put("size", "14");
			title.put("title", "R.B WOVENS (P) Ltd - Erode");
			title.put("width", String.valueOf(getContentWidth() - 50));
			title.put("align", "c");
			title.put("font", "b");
			titles.add(title);
			title = new HashMap<String, String>();
			title.put("size", "10");
			title.put("title", "Warping & Sizing Control Chart");
			title.put("width", String.valueOf(getContentWidth() - 50));
			title.put("align", "c");
			titles.add(title);
		}
		createTitle(getPageContentMinWidth(), getPageContentMaxHeight(), titles);
		changeYPosBy(5);
	}

	public void writeSimpleDocument(String code, OutputStream stream) throws Exception {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt1 = null;
		ResultSet rsCond = null;
		PreparedStatement pstmtCond = null;
		try {
			conn = DatabaseUtil.getConnection();
			ArrayList<String> imgs = new ArrayList<String>();
			StringBuffer strQuery = new StringBuffer(100);
			strQuery.append("select ledger_name cust_name,");
			strQuery.append(
					"sizing_date tran_date,count_name cnts,avg_set_pickup avg_pickup,beam_width beam_width,w1.set_no set_no,ends ends,s2.no_of_cones noofcones,'' lot_no,");
			strQuery.append(
					" order_no pl_no,mill_name mill_name,s2.cone_weight weight_percone,beam_count beam_count, ");
			strQuery.append(
					" yarn_taken yarn_taken,warp_net_weight warp_net_wt,baby_cones baby_cones,total total,shortage shortage,yarn_received yarn_recd,balance_yarn balance, ");
			strQuery.append(" total_warp_breaks total_warp_breaks,avg_warp_breaks_per_mm avg_warp_breaks ");
			strQuery.append(
					"from sizing s1,warping w1,sizing_set_order s2,count_mast c1,mill_mast m1,ledger_mast l1 where s1.warping_code=w1.warping_code and w1.order_code=s2.order_code and s2.count_code=c1.count_code and s2.mill_code=m1.mill_code and s2.ledger_code=l1.ledger_code");
			float pdfWidth = PDPage.PAGE_SIZE_A4.getHeight();
			float pdfHeight = PDPage.PAGE_SIZE_A4.getWidth();
			pstmt1 = conn.prepareStatement(strQuery.toString());
			pstmt1.clearParameters();
			// pstmt1.setString(1, code);
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				try {
					initializeDocument(15, 15, 15, 30, false, 0, imgs, new PDRectangle(pdfWidth, pdfHeight));
				} catch (Exception eex) {
					eex.printStackTrace();
					initializeDocument(15, 15, 15, 30, false, 0, imgs, new PDRectangle(pdfWidth, pdfHeight));
				}
				renderTitleForPage();
				float pageWidth = getPageWidth() - getPageMarginLeft() - getPageMarginRight();
				ArrayList<HashMap<String, String>> titles = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> title = new HashMap<String, String>();
				float titleWidth = (pageWidth) / 8;
				float title1Start = 20;
				float title2Start = title1Start + (titleWidth * 2);
				float title3Start = title2Start + (titleWidth * 2);
				float title4Start = title3Start + (titleWidth * 2);
				float value1Start = titleWidth + 20;
				float value2Start = value1Start + (titleWidth * 2);
				float value3Start = value2Start + (titleWidth * 2);
				float value4Start = value3Start + (titleWidth * 2);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "10");
				title.put("title", "To: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				float currentYp = getCurrentYPos();
				createTitle(20, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("cust_name"));
				title.put("width", String.valueOf(titleWidth * 7));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value1Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Date: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(title1Start, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Count: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title2Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Average Set Pickup: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title3Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Beam Width: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title4Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("tran_date"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value1Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("cnts"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value2Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("avg_pickup"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value3Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("beam_width"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value4Start, currentYp, titles);

				// second row starts
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Set No: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(title1Start, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Ends: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title2Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "No of Cones Taken: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title3Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Lot: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title4Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("set_no"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value1Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("ends"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value2Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("noofcones"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value3Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("lot_no"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value4Start, currentYp, titles);

				// third row starts
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "PL No: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(title1Start, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Mill Name: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title2Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Wt/Cone: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title3Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Beam Count: ");
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(title4Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("pl_no"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value1Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("mill_name"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value2Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("weight_percone"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value3Start, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("beam_count"));
				title.put("width", String.valueOf(titleWidth));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(value4Start, currentYp, titles);

				changeYPosBy(10);

				// table
				float warpWidth = pageWidth * 40 / 100;
				float sizWidth = pageWidth * 40 / 100;
				float yarnWidth = pageWidth * 20 / 100;
				ArrayList<HashMap<String, String>> c = new ArrayList<HashMap<String, String>>();
				HashMap<String, String> c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(warpWidth));
				c1.put("caption", "Warping Details");
				c1.put("name", "sd_sno");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(sizWidth));
				c1.put("caption", "Sizing Details");
				c1.put("name", "itemdescription");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(yarnWidth));
				c1.put("caption", "Yarn Details");
				c1.put("name", "quantity");
				c1.put("align", "c");
				c.add(c1);
				float cy = createTableHeader(c, 25, getPageWidth() - getPageMarginLeft() - getPageMarginRight(),
						getPageMarginLeft(), getCurrentYPos(), 1, true, 15);
				setCurrentYPos(cy);

				float colWidth = (pageWidth * 40 / 100) / 7;
				float col2Width = (pageWidth * 40 / 100) / 6;
				c.clear();
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "SN");
				c1.put("name", "warp_sno");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "Ends");
				c1.put("name", "warp_ends");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "Beam");
				c1.put("name", "warp_beam");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "Mtrs");
				c1.put("name", "warp_mtrs");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "G.Wt");
				c1.put("name", "warp_gross_wt");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "Tare Wt");
				c1.put("name", "warp_tare_wt");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(colWidth));
				c1.put("caption", "Net Wt");
				c1.put("name", "warp_net_wt");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(col2Width));
				c1.put("caption", "SN");
				c1.put("name", "sizing_sno");
				c1.put("align", "c");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(col2Width));
				c1.put("caption", "Beam No");
				c1.put("name", "sizing_beam");
				c1.put("align", "l");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(col2Width));
				c1.put("caption", "G.Wt");
				c1.put("name", "sizing_gross_wt");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(col2Width));
				c1.put("caption", "Tare Wt");
				c1.put("name", "sizing_tare_wt");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(col2Width));
				c1.put("caption", "Net Wt");
				c1.put("name", "sizing_net_wt");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(col2Width));
				c1.put("caption", "Mtrs");
				c1.put("name", "sizing_mtrs");
				c1.put("align", "r");
				c.add(c1);
				c1 = new HashMap<String, String>();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(pageWidth * 20 / 100));
				c1.put("caption", "");
				c1.put("name", "");
				c1.put("align", "c");
				c.add(c1);
				cy = createTableHeader(c, 25, pageWidth, getPageMarginLeft(), getCurrentYPos(), 1, true, 10);
				setCurrentYPos(cy);
				c.remove(c.size() - 1);
				pstmt = conn.prepareStatement(
						"SELECT w1.sno warp_sno, ifnull( w1.ends, '' ) warp_ends, ifnull( w1.beam_no, '' ) warp_beam, ifnull( w1.mtrs, '' ) warp_mtrs, ifnull( w1.gross_weight, '' ) warp_gross_wt, ifnull( w1.tare_weight, '' ) warp_tare_wt, ifnull( w1.net_weight, '' ) warp_net_wt, ifnull( s1.sno, '' ) sizing_sno, ifnull( s1.beam_no, '' ) sizing_beam, ifnull( s1.gross_weight, '' ) sizing_gross_wt, ifnull( s1.tare_weight, '' ) sizing_tare_wt, ifnull( s1.net_weight, '' ) sizing_net_wt, ifnull( s1.mtrs, '' ) sizing_mtrs FROM warping_rece_det w1 LEFT JOIN sizing_det s1 ON w1.sno = s1.sno LEFT JOIN sizing s2 ON s1.sizing_code = s2.sizing_code AND s2.warping_code =18 INNER JOIN warping_rece w2 ON w1.rece_code = w2.rece_code WHERE w2.warping_code =18");
				pstmt.clearParameters();
				// pstmt.setString(1, invoiceNo);
				rs = pstmt.executeQuery();
				float cy1 = createTableContent(c, rs, 25, 2, pageWidth * 80 / 100, getPageMarginLeft(),
						getCurrentYPos(), 1, true, 12);
				// setCurrentYPos(cy);
				rs.close();
				pstmt.close();
				pstmt = null;

				pstmt = conn.prepareStatement(
						"SELECT '' warp_sno, '' warp_ends, '' warp_beam, ifnull( sum(w1.mtrs), '' ) warp_mtrs, ifnull( sum(w1.gross_weight), '' ) warp_gross_wt, ifnull( sum(w1.tare_weight), '' ) warp_tare_wt, ifnull( sum(w1.net_weight), '' ) warp_net_wt, '' sizing_sno,'' sizing_beam, ifnull( sum(s1.gross_weight), '' ) sizing_gross_wt, ifnull( sum(s1.tare_weight), '' ) sizing_tare_wt, ifnull( sum(s1.net_weight), '' ) sizing_net_wt, ifnull( sum(s1.mtrs), '' ) sizing_mtrs FROM warping_rece_det w1 LEFT JOIN sizing_det s1 ON w1.sno = s1.sno LEFT JOIN sizing s2 ON s1.sizing_code = s2.sizing_code AND s2.warping_code =18 INNER JOIN warping_rece w2 ON w1.rece_code = w2.rece_code WHERE w2.warping_code =18");
				pstmt.clearParameters();

				// pstmt.setString(1, invoiceNo);
				rs = pstmt.executeQuery();
				cy1 = createTableContent(c, rs, 50, 1, pageWidth * 80 / 100, getPageMarginLeft(), 68, 1, true, 14);
				// setCurrentYPos(cy);
				rs.close();
				pstmt.close();
				pstmt = null;

				drawLine((pageWidth * 80 / 100) + getPageMarginLeft(), getCurrentYPos(),
						(pageWidth * 80 / 100) + getPageMarginLeft(), 50);
				drawLine((pageWidth) + getPageMarginLeft(), getCurrentYPos(), (pageWidth) + getPageMarginLeft(), 50);
				drawLine(getPageMarginLeft(), getCurrentYPos(), getPageMarginLeft(), 50);
				drawLine(getPageMarginLeft(), 50, pageWidth + getPageMarginLeft(), 50);
				drawLine(getPageMarginLeft(), 68, (pageWidth * 80 / 100) + getPageMarginLeft(), 68);
				setCurrentYPos(cy);

				// right side values
				float leftWidth = pageWidth * 12 / 100;
				float rightWidth = pageWidth * 5 / 100;
				float startAt = (pageWidth * 80 / 100) + getPageMarginLeft();
				float valAt = (pageWidth * 94 / 100) + getPageMarginLeft();
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Yarn Taken: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("yarn_taken"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Warp Net Wt: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("warp_net_wt"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Baby Cones: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("baby_cones"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Total: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("total"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Shortage: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("shortage"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Yarn Received: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("yarn_recd"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Yarn Taken: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("yarn_taken"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Balance: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos();
				createTitle(startAt, getCurrentYPos(), titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("balance"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);
				setCurrentYPos(getCurrentYPos() - 50);
				drawLine((pageWidth * 80 / 100) + getPageMarginLeft(), getCurrentYPos(),
						(pageWidth) + getPageMarginLeft(), getCurrentYPos());
				drawLine((pageWidth * 92 / 100) + getPageMarginLeft(), getCurrentYPos(),
						(pageWidth * 92 / 100) + getPageMarginLeft(), getCurrentYPos() - 100);
				drawLine((pageWidth * 80 / 100) + getPageMarginLeft(), getCurrentYPos() - 50,
						(pageWidth) + getPageMarginLeft(), getCurrentYPos() - 50);
				drawLine((pageWidth * 80 / 100) + getPageMarginLeft(), getCurrentYPos() - 100,
						(pageWidth) + getPageMarginLeft(), getCurrentYPos() - 100);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Total Warp ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", " Breaks:");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos() - 15;
				createTitle(startAt, getCurrentYPos() - 15, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("total_warp_breaks"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Avg Warp Breaks ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", "Per Million Mtrs: ");
				title.put("width", String.valueOf(leftWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				currentYp = getCurrentYPos() - 35;
				createTitle(startAt, getCurrentYPos() - 35, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", rs1.getString("avg_warp_breaks"));
				title.put("width", String.valueOf(rightWidth));
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(valAt, currentYp, titles);

				/*
				 * float pageWidth=getPageWidth()-getPageMarginLeft()-getPageMarginRight ();
				 * float snoWidth=pageWidth*5/100; float descWidth=pageWidth*25/100; float
				 * qtyWidth=pageWidth*15/100; float unitWidth=pageWidth*15/100; float
				 * rateWidth=pageWidth*20/100; float amtWidth=pageWidth*20/100;
				 * ArrayList<HashMap<String,String>> c=new ArrayList<HashMap<String,String>>();
				 * HashMap<String,String> c1=new HashMap<String,String>(); c1.put("margin","2");
				 * c1.put("width",String.valueOf(snoWidth)); c1.put("caption","SNo");
				 * c1.put("name","sd_sno"); c1.put("align", "l"); c.add(c1); c1=new
				 * HashMap<String,String>(); c1.put("margin","2");
				 * c1.put("width",String.valueOf(descWidth)); c1.put("caption","Description");
				 * c1.put("name","itemdescription"); c1.put("align", "l"); c.add(c1); c1=new
				 * HashMap<String,String>(); c1.put("margin","2");
				 * c1.put("width",String.valueOf(qtyWidth)); c1.put("caption","Quantity");
				 * c1.put("name","quantity"); c1.put("align", "c"); c.add(c1); c1=new
				 * HashMap<String,String>(); c1.put("margin","2");
				 * c1.put("width",String.valueOf(unitWidth)); c1.put("caption","Unit");
				 * c1.put("name","unit"); c1.put("align", "c"); c.add(c1); c1=new
				 * HashMap<String,String>(); c1.put("margin","2");
				 * c1.put("width",String.valueOf(rateWidth)); c1.put("caption","Rate/Unit");
				 * c1.put("name","rate"); c1.put("align", "c"); c.add(c1); c1=new
				 * HashMap<String,String>(); c1.put("margin","2");
				 * c1.put("width",String.valueOf(amtWidth)); c1.put("caption","Amoumt");
				 * c1.put("name","amount"); c1.put("align", "r"); c.add(c1);
				 * HashMap<String,String> v=new HashMap<String,String>();
				 * v.put("so_action","600"); float cy=createTableHeader(c, 25,
				 * getPageWidth()-getPageMarginLeft()-getPageMarginRight(), getPageMarginLeft(),
				 * getCurrentYPos(),1,false,12); setCurrentYPos(cy);
				 * 
				 * 
				 * pstmt=conn.prepareStatement(
				 * "select '1' sd_sno,'Warp Weight' itemdescription,'1348.00' quantity,'Kgs' unit,round(20,2) rate,round(26960,2) amount from dual union select '1' sd_sno,'Warp Weight' itemdescription,'1348.00' quantity,'Kgs' unit,round(20,2) rate,round(26960,2) amount from dual union select '1' sd_sno,'Warp Weight' itemdescription,'1348.00' quantity,'Kgs' unit,round(20,2) rate,round(26960,2) amount from dual"
				 * ); pstmt.clearParameters(); //pstmt.setString(1, invoiceNo);
				 * rs=pstmt.executeQuery(); cy=createTableContent(c, rs, 25,2, getPageWidth
				 * ()-getPageMarginLeft()-getPageMarginRight(),getPageMarginLeft (),
				 * getCurrentYPos(),1,false,12); setCurrentYPos(cy); rs.close(); pstmt.close();
				 * pstmt=null;
				 * 
				 * drawLine(getPageMarginLeft(), 350, getPageMarginLeft()+getContentWidth(),
				 * 350); setCurrentYPos(340); currentYp=getCurrentYPos(); titles.clear();
				 * title=new HashMap<String,String>(); title.put("size", "12");
				 * title.put("title", rs1.getString("sh_bill_amount")); title.put("width",
				 * String.valueOf(getContentWidth()*10/100)); title.put("align", "r");
				 * titles.add(title); title=new HashMap<String,String>(); title.put("size",
				 * "12"); title.put("title", rs1.getString("sh_roundoff")); title.put("width",
				 * String.valueOf(getContentWidth()*10/100)); title.put("align", "r");
				 * titles.add(title); title=new HashMap<String,String>(); title.put("size",
				 * "12"); title.put("title", rs1.getString("sh_net_amount")); title.put("width",
				 * String.valueOf(getContentWidth()*10/100)); title.put("align", "r");
				 * title.put("font", "b"); titles.add(title); createTitle((
				 * getContentWidth()*90/100),getCurrentYPos(),titles);
				 */

				closeContent();
				saveDocument(stream);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs1 != null) {
					rs1.close();
				}
				if (rsCond != null) {
					rsCond.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (pstmt1 != null) {
					pstmt1.close();
				}
				if (pstmtCond != null) {
					pstmtCond.close();
				}
				if (conn != null) {
					conn.close();
				}
				closeDocument();
			} catch (SQLException es) {

			}
		}
	}
}