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
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.UUID;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

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

public class BarcodePrint510 {
	DecimalFormat formatDecimal = new DecimalFormat();
	SimpleDateFormat formatDate = new SimpleDateFormat("MM/dd/yyyy");
	Document document = null;
	PdfWriter writer = null;
	float currentPageMarginLeft = 0;
	float currentPageMarginRight = 0;
	float currentPageMarginTop = 0;
	float currentPageMarginBottom = 0;
	float currentPageWidth = 283.465f;
	float currentPageHeight = 141.5197f;
	float currentPageSpreadStartAt = 0;
	float currentPageSpreadStartX = 0;
	float currentPageSpreadEndAt = 0;
	float currentActualPageSpreadStartAt = 0;
	float currentActualPageSpreadEndAt = 0;
	BaseFont f_book = null;
	int mDPI = 72;
	private static String FS = System.getProperty("file.separator");

	public String PDFGen(String productcode, String stickers, OutputStream fs) throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String guid = "";
		try {
			String fontPath = System.getProperty("catalina.home") + FS + ".." + FS + "tekknow" + FS + "fonts";
			f_book = BaseFont.createFont(fontPath + "/Arial-BoldMT.ttf", BaseFont.CP1250, BaseFont.EMBEDDED);
			document = new Document(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
			if (fs == null) {
				guid = UUID.randomUUID().toString();
				fs = new FileOutputStream("c:\\test\\" + guid + ".pdf");
			}
			// MemoryStream ms = new MemoryStream();
			writer = PdfWriter.getInstance(document, fs);

			document.open();
			document.setMargins(currentPageMarginLeft, currentPageMarginRight, currentPageMarginTop,
					currentPageMarginBottom);
			document.setPageSize(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
			PdfContentByte cb = writer.getDirectContent();
			Font fnt = new Font(f_book, 22, Font.BOLD, BaseColor.BLACK);
			Font fnt1 = new Font(f_book, 15, Font.BOLD, BaseColor.BLACK);
			System.out.println("Started ...");
			ArrayList<Float> widths = new ArrayList<Float>();
			widths.add(60f);
			PdfPTable tbl = new PdfPTable(widths.size());
			conn = DatabaseUtil.getConnection();
			StringBuffer strQuery = new StringBuffer(100);
			strQuery.append(
					"select 2nd_line,3rd_line,4th_line,prod_code productcode,'0120' prod_code,alias_name aliasname from product_mast where product_code=?");
			pstmt = conn.prepareStatement(strQuery.toString());
			pstmt.clearParameters();
			pstmt.setString(1, productcode);
			int currentStickerPos = 1;
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int qty = Integer.parseInt(stickers);
				for (int i = 0; i < qty; i++) {
					Barcode128 code128 = null;
					ColumnText ct = null;
					Image code128Image = null;
					Paragraph paragraph = null;
					float startPosX = 205;
					float startTextX = 43;
					code128 = new Barcode128();
					// code128.setFont(fnt.getBaseFont());
					code128.setFont(null);
					code128.setCode(rs.getString("productcode"));
					code128.setCodeType(Barcode128.CODE128);
					code128.setBarHeight(35);
					code128.setX(1f);
					code128.setSize(10);
					code128Image = code128.createImageWithBarcode(cb, null, null);
					code128Image.setAlignment(Element.ALIGN_CENTER);
					// code128Image.setAbsolutePosition(startPosX, 2);
					// code128Image.setRotation(90);
					ct = new ColumnText(cb);
					// cb.addImage(code128Image);
					tbl.deleteBodyRows();
					PdfPCell cell = new PdfPCell(code128Image);
					cell.setFixedHeight(125f);
					cell.setHorizontalAlignment(1);
					cell.setVerticalAlignment(Element.ALIGN_CENTER);
					cell.setBorderWidth(0f);
					cell.setRotation(90);
					tbl.addCell(cell);
					/*
					 * cell = new PdfPCell(new Phrase(rs.getString("productcode"), fnt1));
					 * cell.setBorderWidth(0f); cell.setFixedHeight(125f);
					 * cell.setHorizontalAlignment(1); cell.setVerticalAlignment(Element.ALIGN_TOP);
					 * cell.setRotation(90); tbl.addCell(cell);
					 */
					float[] ww = toFloatArray(widths);
					tbl.setTotalWidth(125f);
					tbl.setLockedWidth(true);
					tbl.setWidths(ww);
					tbl.setHorizontalAlignment(0);
					tbl.completeRow();
					tbl.writeSelectedRows(0, -1, startPosX + 20, 135, cb);
					tbl.deleteBodyRows();

					cell = new PdfPCell(new Phrase(rs.getString("productcode"), fnt1));
					cell.setBorderWidth(0f);
					cell.setFixedHeight(125f);
					cell.setHorizontalAlignment(1);
					cell.setVerticalAlignment(Element.ALIGN_TOP);
					cell.setRotation(90);
					tbl.addCell(cell);

					ww = toFloatArray(widths);
					tbl.setTotalWidth(125f);
					tbl.setLockedWidth(true);
					tbl.setWidths(ww);
					tbl.setHorizontalAlignment(0);
					tbl.completeRow();
					tbl.writeSelectedRows(0, -1, startPosX, 135, cb);

					tbl.deleteBodyRows();

					cell = new PdfPCell(new Phrase(rs.getString("prod_code"), fnt1));
					cell.setBorderWidth(0f);
					cell.setFixedHeight(125f);
					cell.setHorizontalAlignment(1);
					cell.setVerticalAlignment(Element.ALIGN_TOP);
					cell.setRotation(90);
					tbl.addCell(cell);

					ww = toFloatArray(widths);
					tbl.setTotalWidth(125f);
					tbl.setLockedWidth(true);
					tbl.setWidths(ww);
					tbl.setHorizontalAlignment(0);
					tbl.completeRow();
					tbl.writeSelectedRows(0, -1, startPosX + 52, 135, cb);

					// cb.beginText();
					paragraph = new Paragraph();
					paragraph.setFont(fnt);
					paragraph.setLeading(0f, 1.2f);
					paragraph.setAlignment(Element.ALIGN_CENTER);
					paragraph.add(rs.getString("2nd_line"));
					// System.out.println(content+" "+startX+" "+ endY+" "+endX+" "+startY);
					ct.setSimpleColumn(new Rectangle(startTextX, 100f, startTextX + 167, 130f));
					ct.addElement(paragraph);
					int status = ct.go();

					paragraph = new Paragraph();
					paragraph.setFont(fnt);
					paragraph.setLeading(0f, 1.2f);
					paragraph.setAlignment(Element.ALIGN_CENTER);
					paragraph.add(rs.getString("3rd_line"));
					// System.out.println(content+" "+startX+" "+ endY+" "+endX+" "+startY);
					ct.setSimpleColumn(new Rectangle(startTextX, 65f, startTextX + 167, 95f));
					ct.addElement(paragraph);
					status = ct.go();

					paragraph = new Paragraph();
					paragraph.setFont(fnt);
					paragraph.setLeading(0f, 1.2f);
					paragraph.setAlignment(Element.ALIGN_CENTER);
					paragraph.add(rs.getString("4th_line"));
					// System.out.println(content+" "+startX+" "+ endY+" "+endX+" "+startY);
					ct.setSimpleColumn(new Rectangle(startTextX, 25f, startTextX + 167, 55f));
					ct.addElement(paragraph);
					status = ct.go();

					// cb.endText();
					document.newPage();
				}
			}
			document.close();
			writer.close();
			fs.close();
			System.out.println("Finished ...");
			if (!"".equals(guid)) {
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

	private float pxTopt(float value) {
		return value / mDPI * 72;
	}

	private float[] toFloatArray(ArrayList<Float> list) {
		float[] f = new float[list.size()];
		for (int i = 0; i < list.size(); i++) {
			f[i] = list.get(i).floatValue();
		}
		return f;
	}

	private float getTotalWidth(ArrayList<Float> list) {
		float f = 0f;
		for (int i = 0; i < list.size(); i++) {
			f = f + list.get(i).floatValue();
		}
		return f;
	}

	public void createNewPage(boolean isOverflow) throws Exception {
		PdfContentByte cb = writer.getDirectContent();
		document.setPageSize(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
		document.setMargins(currentPageMarginLeft, currentPageMarginRight, currentPageMarginTop,
				currentPageMarginBottom);

		document.newPage();
	}

	public static void main(String[] args) throws Exception, DocumentException {
		new BarcodePrint510().PDFGen("0", "0", null);
	}
}
