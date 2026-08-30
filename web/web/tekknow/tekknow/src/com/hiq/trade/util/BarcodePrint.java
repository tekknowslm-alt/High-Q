package com.hiq.trade.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.print.Book;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
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
import java.util.TreeMap;
import java.util.UUID;

import javax.print.PrintService;

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
import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPrintPage;

public class BarcodePrint {
	DecimalFormat formatDecimal = new DecimalFormat();
	SimpleDateFormat formatDate = new SimpleDateFormat("MM/dd/yyyy");
	Document document = null;
	PdfWriter writer = null;
	float currentPageMarginLeft = 0;
	float currentPageMarginRight = 0;
	float currentPageMarginTop = 5;
	float currentPageMarginBottom = 10;
	float currentPageWidth = 288f;
	float currentPageHeight = 65.52f;
	float currentPageSpreadStartAt = 0;
	float currentPageSpreadStartX = 0;
	float currentPageSpreadEndAt = 0;
	float currentActualPageSpreadStartAt = 0;
	float currentActualPageSpreadEndAt = 0;

	int mDPI = 72;

	public String PDFGen(String productcode, String stickers, OutputStream fs) throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String guid = "";
		try {
			document = new Document(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
			if (fs == null) {
				guid = UUID.randomUUID().toString();
				fs = new FileOutputStream("c:\\tmpprint\\" + guid + ".pdf");
			} // MemoryStream ms = new MemoryStream();
			writer = PdfWriter.getInstance(document, fs);

			document.open();
			document.setMargins(currentPageMarginLeft, currentPageMarginRight, currentPageMarginTop,
					currentPageMarginBottom);
			document.setPageSize(new com.itextpdf.text.Rectangle(currentPageWidth, currentPageHeight));
			PdfContentByte cb = writer.getDirectContent();
			Font fnt = new Font(BaseFont.createFont(), 8, Font.NORMAL, BaseColor.BLACK);
			System.out.println("Started ...");
			conn = DatabaseUtil.getConnection();
			StringBuffer strQuery = new StringBuffer(100);
			strQuery.append(
					"select lpad(product_code,4,'0') productcode,prod_code aliasname from product_mast where product_code=?");
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
					int status = 0;
					float startPosX = 0;
					float startTextX = 0;
					System.out.println(currentStickerPos % 3);
					if (currentStickerPos % 3 == 1) {
						startPosX = 26;
						startTextX = 0;
					} else if (currentStickerPos % 3 == 2) {
						startPosX = 122;
						startTextX = 97;
					} else if (currentStickerPos % 3 == 0) {
						startPosX = 218;
						startTextX = 193;
					}
					code128 = new Barcode128();
					code128.setFont(fnt.getBaseFont());
					code128.setCode(rs.getString("productcode"));
					code128.setCodeType(Barcode128.CODE128);
					code128.setBarHeight(30);
					code128Image = code128.createImageWithBarcode(cb, null, null);
					code128Image.setAbsolutePosition(startPosX, 10);
					ct = new ColumnText(cb);
					cb.addImage(code128Image);
					cb.beginText();
					paragraph = new Paragraph();
					paragraph.setFont(fnt);
					paragraph.setLeading(0f, 1.2f);
					paragraph.setAlignment(Element.ALIGN_CENTER);
					paragraph.add(rs.getString("aliasname"));
					// System.out.println(content+" "+startX+" "+
					// endY+" "+endX+" "+startY);
					ct.setSimpleColumn(new Rectangle(startTextX, 25.2f, startTextX + 95, 60.52f));
					ct.addElement(paragraph);
					status = ct.go();
					cb.endText();
					if (currentStickerPos % 3 == 0) {
						document.newPage();
					}
					currentStickerPos++;
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

	public void printPDF(String filePath, PrintService printerService, String jobName)
			throws IOException, PrinterException {

		FileInputStream fileInputStream = new FileInputStream(filePath);
		byte[] pdfContent = new byte[fileInputStream.available()];
		fileInputStream.read(pdfContent, 0, fileInputStream.available());
		ByteBuffer buffer = ByteBuffer.wrap(pdfContent);
		final PDFFile pdfFile = new PDFFile(buffer);
		PDFPrintPage pages = new PDFPrintPage(pdfFile);
		PrinterJob printJob = PrinterJob.getPrinterJob();
		PageFormat pageFormat = PrinterJob.getPrinterJob().defaultPage();
		printJob.setJobName(jobName);
		Book book = new Book();
		book.append(pages, pageFormat, pdfFile.getNumPages());
		printJob.setPageable(book);
		Paper paper = new Paper();
		paper.setSize(currentPageWidth, currentPageHeight);
		paper.setImageableArea(0, 0, currentPageWidth, currentPageHeight);
		System.out.println(paper.getWidth() + " " + paper.getHeight());
		pageFormat.setPaper(paper);
		/*
		 * PrintService[] printServices = PrinterJob.lookupPrintServices(); for (int
		 * count = 0; count < printServices.length; ++count) { if
		 * (printerName.equalsIgnoreCase(printServices[count].getName())) {
		 * printJob.setPrintService(printServices[count]); break; } }
		 */
		printJob.setPrintService(printerService);
		printJob.print();
	}

	public static void main(String[] args) throws Exception, DocumentException {
		new BarcodePrint().PDFGen("0", "0", null);
	}
}
