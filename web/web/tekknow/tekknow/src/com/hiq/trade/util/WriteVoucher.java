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

public class WriteVoucher extends WritePDF {
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
					"select comp_name companyname,address compaddressone,'' compaddresstwo,'SALEM' compcity,'' compstate,'636 001' comppin,'' compemail,phone compphoneno,c1.gstin_no comptinno,concat('PAN: ','12312313') compcstno,' ' comppan,' ' cst_date,mobile compcell,'33' areacode, 'EXPENSES VOUCHER' as transaction_type from company c1,expenses f1 where c1.c_code=f1.c_code and f1.expenses_code="
							+ invoiceNo);
			pt.clearParameters();
			// pt.setString(1, invoiceNo);
			r = pt.executeQuery();
			if (r.next()) {
				float currentYp = getCurrentYPos();
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "GSTIN       : " + r.getString("comptinno"));
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "State Code : " + r.getString("areacode"));
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);

				/*
				 * title=new HashMap<String,String>(); title.put("size", "8");
				 * title.put("title", "DL.No  :  "+r.getString("license1")+" "+r.
				 * getString("license2")); title.put("width",
				 * String.valueOf(getContentWidth()-50)); title.put("align", "l");
				 * titles.add(title);
				 */
				createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
				float currentY1 = getCurrentYPos();

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "Phone  :");
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "Mobile :");
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "silkdhoties@gmail.com");
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);

				createTitle(getPageContentMaxWidth() - 100, currentYp, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", r.getString("compphoneno"));
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", r.getString("compcell"));
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(getPageContentMaxWidth() - 60.0F, currentYp, titles);
				titles.clear();

				/*
				 * title=new HashMap<String,String>(); title.put("size", "10");
				 * title.put("title", "Invoice Time     :"+); title.put("width",
				 * String.valueOf(getContentWidth()-50)); title.put("align", "l");
				 * titles.add(title);
				 */
				createTitle(getPageContentMaxWidth() - 60, currentYp, titles);
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "");
				title.put("width", String.valueOf(getContentWidth() - 50));
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				/*
				 * title=new HashMap<String,String>(); title.put("size", "10");
				 * title.put("title", "Invoice Time     :"+); title.put("width",
				 * String.valueOf(getContentWidth()-50)); title.put("align", "l");
				 * titles.add(title);
				 */
				createTitle(getPageContentMaxWidth() - 100, currentYp - 25, titles);

				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "8");
				title.put("title", "Sri Krishna");
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
				createTitle(getPageContentMinWidth(), currentYp, titles);
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title", r.getString("transaction_type"));
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
				// float yp=getCurrentYPos();
				createTitle(getPageContentMinWidth(), currentYp - 10, titles);
				// setCurrentYPos(yp);

				// getContent().setNonStrokingColor(Color.BLUE);
				titles.clear();
				title.put("size", "25");
				title.put("title", r.getString("companyname"));
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				title.put("color", "#322f2323");

				titles.add(title);
				float cyp = getCurrentYPos();
				createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
				// getContent().setNonStrokingColor(Color.BLACK);
				titles.clear();
				title = new HashMap<String, String>();
				title.put("size", "14");
				title.put("title", "WHOLESALE HANDLOOM CLOTH MERCHANTS");
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "11");
				title.put("title", r.getString("compaddressone") + ", " + r.getString("compaddresstwo"));
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
				title = new HashMap<String, String>();
				title.put("size", "11");
				title.put("title", r.getString("compcity") + " - " + r.getString("comppin"));
				title.put("width", String.valueOf(getContentWidth()));
				title.put("align", "c");
				title.put("font", "b");
				titles.add(title);
				createTitle(getPageContentMinWidth(), getCurrentYPos(), titles);
				// drawImage(0, 30, cyp - 75, 100, 60);
				drawImage(0, getPageWidth() - getPageMarginRight() - 100, cyp - 57, 90, 35);
				drawImage(1, getPageWidth() - getPageMarginRight() - 550, cyp - 70, 80, 55);
				changeYPosBy(10);
				drawLine(getPageMarginLeft(), getCurrentYPos() , getPageWidth() - getPageMarginRight(),
						getCurrentYPos() );
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
					"select vou_no vou_no,DATE_FORMAT(vou_date,'%d/%m/%Y') vou_date,ledger_name, e1.amount as wordnetamt, format(e1.amount,2,'en_IN') as netamt1, case when e1.ledger_code=1 then 'CASH' else 'BANK' end as mode from expenses e1, ledger_mast l1 where e1.ledger_code=l1.ledger_code and e1.expenses_code="
							+ invoiceNo);
			// + invoiceNo);*/ pstmt1.clearParameters();
			pstmt1 = conn.prepareStatement(strQuery.toString());
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				ArrayList<String> imgs = new ArrayList<String>();
				try {
					setUseContext(false);
					imgs.add("tekknow.jpg");
					imgs.add("perumal.jpg");
					// imgs.add("tekknow2.jpg");

					float currentPageWidth = 141.732f * 2;
					float currentPageHeight = 68.0315f;
					PDRectangle r = new PDRectangle(PDPage.PAGE_SIZE_A5.getHeight(), PDPage.PAGE_SIZE_A5.getWidth());
					initializeDocument(25, 10, 10, 30, true, 0, imgs, r);
				} catch (Exception eex) {
					eex.printStackTrace();
					imgs.clear();
					imgs.add("/web/images/login_lgo.jpg");
					imgs.add("/web/images/login_lgo2.jpg");
					initializeDocument(25, 10, 10, 30, true, 0, imgs, PDPage.PAGE_SIZE_A5);
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
				title.put("title", "No. :  " + rs1.getString("vou_no")
						+ "                                                                                                                          Date:  "
						+ rs1.getString("vou_date"));
				title.put("width", "60");
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(50, getCurrentYPos() , titles);
				titles.clear();

				/*
				 * createTitle(contentHalfWidth + 10, currentYp - 50, titles); titles.clear();
				 * title = new HashMap<String, String>(); title.put("size", "10");
				 * title.put("title", "Date: " + rs1.getString("og_inv_date"));
				 * title.put("width", "20"); title.put("align", "r"); titles.add(title); title =
				 * new HashMap<String, String>(); title.put("size", "10"); title.put("title",
				 * "Date: " + rs1.getString("party_ref_date"));
				 * 
				 * title.put("width", "20"); title.put("align", "r"); titles.add(title);
				 * 
				 * createTitle(contentHalfWidth + 240, currentYp, titles);
				 * 
				 * titles.clear();
				 * 
				 * title = new HashMap<String, String>(); title.put("size", "10");
				 * title.put("title", ""); title.put("width", String.valueOf(getContentWidth() /
				 * 2 - 75)); title.put("align", "l"); titles.add(title);
				 * 
				 * title = new HashMap<String, String>();
				 * 
				 * createTitle(90, currentYp, titles);
				 * 
				 * titles.clear();
				 * 
				 * changeYPosBy(15);
				 * 
				 * changeYPosBy(15);
				 * 
				 * currentYp = getCurrentYPos() + 10; titles.clear(); title = new
				 * HashMap<String, String>(); title.put("size", "9"); title.put("title",
				 * "Supplier Details"); title.put("width", String.valueOf(getContentWidth() /
				 * 2)); title.put("align", "c"); titles.add(title); createTitle(10,
				 * getCurrentYPos() + 40, titles); titles.clear(); title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title", ""); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "c");
				 * titles.add(title); createTitle(contentHalfWidth + 10, currentYp, titles);
				 * 
				 * drawLine(getPageMarginLeft(), getCurrentYPos() + 20, ((getPageWidth() / 2) +
				 * 33) - getPageMarginRight(), getCurrentYPos() + 20); changeYPosBy(5);
				 * currentYp = getCurrentYPos(); titles.clear(); title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title",
				 * rs1.getString("cust_title") + " " + rs1.getString("cust_name"));
				 * title.put("width", String.valueOf(getContentWidth() / 2)); title.put("align",
				 * "l"); title.put("font", "b"); titles.add(title); if
				 * (rs1.getString("cust_addr1") != null &&
				 * !"".equals(rs1.getString("cust_addr1").trim())) { title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title",
				 * rs1.getString("cust_addr1")); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * titles.add(title); } if (rs1.getString("cust_addr2") != null &&
				 * !"".equals(rs1.getString("cust_addr2").trim())) { title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title",
				 * rs1.getString("cust_addr2")); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * titles.add(title); } if (rs1.getString("cust_addr3") != null &&
				 * !"".equals(rs1.getString("cust_addr3").trim())) { title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title",
				 * rs1.getString("cust_addr3")); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * titles.add(title); } StringBuffer custState = new StringBuffer(100); //
				 * custState.append(rs1.getString("cust_state")); if
				 * (!"".equals(rs1.getString("cust_state"))) { custState.append(",");
				 * custState.append(rs1.getString("cust_state")); } if
				 * (!"".equals(rs1.getString("cust_pin"))) { custState.append(" - ");
				 * custState.append(rs1.getString("cust_pin")); } title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title",
				 * rs1.getString("cust_city") + "" + custState.toString()); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * titles.add(title); createTitle(30, currentYp + 20, titles);
				 * 
				 * titles.clear(); title = new HashMap<String, String>(); title.put("size",
				 * "8"); title.put("title", rs1.getString("tinno")); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * title.put("font", "b"); titles.add(title); float gyp = getCurrentYPos();
				 * createTitle(30, gyp, titles);
				 * 
				 * titles.clear(); title = new HashMap<String, String>(); title.put("size",
				 * "8"); title.put("title", rs1.getString("lstatecode")); title.put("width",
				 * String.valueOf(getContentWidth() / 4)); title.put("align", "r");
				 * title.put("font", "b"); titles.add(title); createTitle(contentHalfWidth / 2 +
				 * 10, gyp, titles);
				 * 
				 * float addrLineY = getCurrentYPos();
				 * 
				 * titles.clear(); title = new HashMap<String, String>(); title.put("size",
				 * "8"); title.put("title", ""); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * title.put("font", "b"); titles.add(title); if (rs1.getString("scust_addr1")
				 * != null && !"".equals(rs1.getString("scust_addr1").trim())) { title = new
				 * HashMap<String, String>(); title.put("size", "8"); title.put("title", "");
				 * title.put("width", String.valueOf(getContentWidth() / 2)); title.put("align",
				 * "l"); titles.add(title); }
				 * 
				 * if (rs1.getString("scust_addr2") != null &&
				 * !"".equals(rs1.getString("scust_addr2").trim())) { title = new
				 * HashMap<String, String>(); title.put("size", "8"); title.put("title", "");
				 * title.put("width", String.valueOf(getContentWidth() / 2)); title.put("align",
				 * "l"); titles.add(title); } if (rs1.getString("scust_addr3") != null &&
				 * !"".equals(rs1.getString("scust_addr3").trim())) { title = new
				 * HashMap<String, String>(); title.put("size", "8"); title.put("title", "");
				 * title.put("width", String.valueOf(getContentWidth() / 2)); title.put("align",
				 * "l"); titles.add(title); } if (rs1.getString("scust_city") != null &&
				 * !"".equals(rs1.getString("scust_city").trim())) { title = new HashMap<String,
				 * String>(); title.put("size", "8"); title.put("title", ""); title.put("width",
				 * String.valueOf(getContentWidth() / 2)); title.put("align", "l");
				 * titles.add(title); } createTitle((contentHalfWidth) + 10, currentYp, titles);
				 * 
				 * titles.clear();
				 * 
				 * title = new HashMap<String, String>(); title.put("size", "8");
				 * title.put("title", " "); title.put("width", String.valueOf(getContentWidth()
				 * / 4)); title.put("align", "r"); title.put("font", "b"); titles.add(title);
				 * createTitle(contentHalfWidth / 2 + 270, gyp, titles);
				 * 
				 * if (addrLineY < getCurrentYPos()) { setCurrentYPos(addrLineY); }
				 * drawLine(getPageMarginLeft(), getCurrentYPos() - 5, getPageWidth() -
				 * getPageMarginRight(), getCurrentYPos() - 5);
				 * 
				 * drawLine(contentHalfWidth - 2, firstY + 2, contentHalfWidth - 2,
				 * getCurrentYPos() - 5); changeYPosBy(5);
				 * 
				 * // vendor name ends
				 */
				// System.out.println(getPageWidth()-getPageMarginLeft()-getPageMarginRight());
				float pageWidth = getPageWidth() - getPageMarginLeft() - getPageMarginRight();
				float snoWidth = pageWidth * 5.0F / 100.0F;
				float descWidth = pageWidth * 75.0F / 100.0F;
				float hsnWidth = pageWidth * 8.0F / 100.0F;
				float mtrWidth = pageWidth * 7.0F / 100.0F;
				float qtyWidth = pageWidth * 6.0F / 100.0F;
				float rateWidth = pageWidth * 10.0F / 100.0F;
				float amtWidth = pageWidth * 20.0F / 100.0F;
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
				c1.put("width", String.valueOf(descWidth));
				c1.put("caption", "Particulars");
				c1.put("size", "20");
				c1.put("name", "itemdescription");
				c1.put("align", "l");
				c.add(c1);
				c1 = new HashMap();
				c1.put("margin", "2");
				c1.put("width", String.valueOf(amtWidth));
				c1.put("caption", "Amount");
				c1.put("size", "12");
				c1.put("name", "amount");
				c1.put("align", "r");
				c.add(c1);
				HashMap<String, String> v = new HashMap();
				v.put("so_action", "600");
				float cyp = getCurrentYPos();
				float typ = createTableLines(c,
						getPageHeight() - (getPageHeight() - cyp) - getPageMarginBottom() - getPageMarginTop() - 85.0F,
						getPageWidth() - getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(),
						getCurrentYPos() - 10);

				float cy = createTableHeader(c, 25.0F, getPageWidth() - getPageMarginLeft() - getPageMarginRight(),
						getPageMarginLeft(), cyp - 10, 1, false, 10.0F);
				setCurrentYPos(cy);

				pstmt = conn

						.prepareStatement(
								"select @rowno:=@rowno+1 sd_sno,d.* from (select  ledger_name itemdescription,format(round(amount,2),2,'en_IN') amount from expenses_det e1,ledger_mast l1 where e1.ledger_code=l1.ledger_code and e1.expenses_code="
										+ invoiceNo + ") d inner join (SELECT @rowno:=0) sno on 1=1");

				rs = pstmt.executeQuery();
				cy = createTableContent(c, rs, 25.0F, 2.0F, getPageWidth() - getPageMarginLeft() - getPageMarginRight(),
						getPageMarginLeft(), getCurrentYPos() , 1, false, 12.0F);
				setCurrentYPos(cy);
				rs.close();
				pstmt.close();
				pstmt = null;

				java.math.BigDecimal amt = java.math.BigDecimal.valueOf(rs1.getDouble("wordnetamt"));				
				String amountInWords = "Rupees " + NumberToWord.convertNumberToWords(amt) + " Only.";
				printBold = true;
				createParagraph("", amountInWords, 175.0F, 30.0F, 98.0F, 0.0F, 11);

				title = new HashMap<String, String>();
				title.put("size", "14");
				title.put("title","Total Rs. " + rs1.getString("netamt1"));
				title.put("width", "60");
				title.put("align", "r");
				title.put("font", "b");
				titles.add(title);
				createTitle(520, 110, titles);
				titles.clear();

				title = new HashMap<String, String>();
				title.put("size", "12");
				title.put("title",
						"Mode: " +   rs1.getString("mode") + "                                              Receiver's Signature                                         Authorised Signatory");
				title.put("width", "60");
				title.put("align", "l");
				title.put("font", "b");
				titles.add(title);
				createTitle(30, 50, titles);
				titles.clear();

				// printBold = false;
				/*
				 * pstmt = null; pstmt = conn.prepareStatement(
				 * "select '' sd_sno,'E. & O.E.                                                             Total ' itemdescription,'' descr,'' hsncode,ifnull(sum(qty),0) quantity,'' unit,'' rate,format(ifnull(sum(amount),0),2,'en_IN') amount,ifnull(sum(qty),0) as pcs,ifnull(sum(mtrs),0) mtrs from purc_inv_det f1 where inv_code="
				 * + invoiceNo); pstmt.clearParameters();
				 * 
				 * rs = pstmt.executeQuery(); cy = createTableContent(c, rs, 25.0F, 2.0F,
				 * getPageWidth() - getPageMarginLeft() - getPageMarginRight(),
				 * getPageMarginLeft(), typ + 17.0F, 1, false, 8.7F); setCurrentYPos(cy - 2.0F);
				 * rs.close(); pstmt.close();
				 * 
				 * 
				 * drawLine(getPageMarginLeft(), typ + 15.0F, getPageMarginLeft() + snoWidth +
				 * descWidth + hsnWidth + mtrWidth + rateWidth + amtWidth + qtyWidth, typ +
				 * 15.0F);
				 * 
				 * ArrayList<HashMap<String, String>> c2 = new ArrayList(); c1 = new HashMap();
				 * c1.put("margin", "2"); c1.put("width", String.valueOf(snoWidth + descWidth +
				 * hsnWidth + mtrWidth + qtyWidth + rateWidth)); c1.put("caption", "");
				 * c1.put("name", "itemdescription"); c1.put("align", "r"); c1.put("font", "b");
				 * 
				 * c2.add(c1); c1 = new HashMap(); c1.put("margin", "2"); c1.put("width",
				 * String.valueOf(amtWidth)); c1.put("caption", ""); c1.put("name", "amount");
				 * c1.put("align", "r"); c1.put("font", "b");
				 * 
				 * c2.add(c1);
				 * 
				 * drawLine(getPageMarginLeft() + snoWidth + descWidth, typ, getPageMarginLeft()
				 * + snoWidth + descWidth + hsnWidth + mtrWidth + rateWidth + amtWidth +
				 * qtyWidth, typ);
				 * 
				 * printBold = true; createParagraph("", "Notes: " + rs1.getString("note"),
				 * 250.0F, 30.0F, cy - 12.0F, 0.0F, 8); printBold = false;
				 * 
				 * printBold = true; createParagraph("", "DC Details:- " +
				 * rs1.getString("dc_detail"), 250.0F, 30.0F, cy - 30.0F, 0.0F, 8); printBold =
				 * false;
				 * 
				 * if (rs1.getDouble("discount_per") > 0.0D) {
				 * 
				 * pstmt = conn.prepareStatement(
				 * "select '' sd_sno,concat(disc_text,' @ ',disc_per,'%') itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(discount,2,'en_IN') amount,'' pcs,'' mtrs from purc_inv f1 where f1.inv_code="
				 * + invoiceNo);
				 * 
				 * pstmt.clearParameters(); rs = pstmt.executeQuery();
				 * 
				 * cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() -
				 * getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(), cy, 1,
				 * false, 12.0F); rs.close(); pstmt.close();
				 * 
				 * pstmt = null; rs = null; }
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "10");
				 * title.put("title", "Taxable Value "); title.put("width",
				 * String.valueOf(mtrWidth + rateWidth + qtyWidth)); title.put("align", "r");
				 * title.put("font", "b"); titles.add(title); createTitle(getPageWidth() -
				 * getPageMarginRight() - (amtWidth + mtrWidth + rateWidth + qtyWidth), typ -
				 * 15.0F, titles);
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "10");
				 * title.put("title", rs1.getString("gross_amt")); title.put("width",
				 * String.valueOf(amtWidth - 2.0F)); title.put("align", "r"); title.put("font",
				 * "b"); titles.add(title); createTitle(getPageWidth() - getPageMarginRight() -
				 * amtWidth, typ - 15.0F, titles); cy = getCurrentYPos();
				 * 
				 * drawLine(getPageMarginLeft(), typ - 15.0F, getPageWidth() -
				 * getPageMarginRight(), typ - 15.0F); float initialY = 200.0F; float lineY =
				 * getCurrentYPos(); float bankLineY = typ - 15.0F;
				 * 
				 * if (rs1.getDouble("igst_per") > 0.0D) {
				 * 
				 * pstmt = conn.prepareStatement(
				 * "select '' sd_sno,concat('IGST @ ',igst_per,'%')itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(igst_amount ,2,'en_IN') amount,'' pcs,'' mtrs from purc_inv where inv_code="
				 * + invoiceNo);
				 * 
				 * pstmt.clearParameters(); rs = pstmt.executeQuery();
				 * 
				 * cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() -
				 * getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(), cy, 1,
				 * false, 10.0F); setCurrentYPos(cy); rs.close(); pstmt.close();
				 * 
				 * pstmt = null; rs = null; initialY = cy; }
				 * 
				 * if (rs1.getDouble("cgst_per") > 0.0D) {
				 * 
				 * pstmt = conn.prepareStatement(
				 * "select '' sd_sno,concat('CGST @ ',cgst_per,'%') itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(cgst_amount,2,'en_IN') amount,'' pcs,'' mtrs from purc_inv where inv_code="
				 * + invoiceNo); pstmt.clearParameters(); rs = pstmt.executeQuery();
				 * 
				 * cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() -
				 * getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(),
				 * getCurrentYPos(), 1, false, 10.0F); setCurrentYPos(cy); rs.close();
				 * pstmt.close();
				 * 
				 * pstmt = null; rs = null; initialY = cy; }
				 * 
				 * if (rs1.getDouble("sgst_per") > 0.0D) {
				 * 
				 * pstmt = conn.prepareStatement(
				 * "select '' sd_sno,concat('SGST @ ',sgst_per,'%') itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,format(sgst_amount,2,'en_IN') amount,'' pcs,'' mtrs from purc_inv where inv_code="
				 * + invoiceNo);
				 * 
				 * pstmt.clearParameters(); rs = pstmt.executeQuery();
				 * 
				 * cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() -
				 * getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(),
				 * getCurrentYPos(), 1, false, 10.0F); setCurrentYPos(cy); rs.close();
				 * pstmt.close();
				 * 
				 * pstmt = null; rs = null; initialY = cy; } if
				 * ((rs1.getDouble("courier_charges") > 0.0D)) { pstmt = conn.prepareStatement(
				 * "select '' sd_sno,'Freight' itemdescription,''descr,'' hsncode,'' quantity,'' unit,'' rate,'"
				 * + rs1.getString("courier_charges") + "' amount,'' pcs,'' mtrs from ddual ");
				 * pstmt.clearParameters(); rs = pstmt.executeQuery();
				 * 
				 * cy = createTableContent(c2, rs, 25.0F, 2.0F, getPageWidth() -
				 * getPageMarginLeft() - getPageMarginRight(), getPageMarginLeft(), cy, 1,
				 * false, 10.0F); rs.close(); pstmt.close();
				 * 
				 * pstmt = null; rs = null; } drawLine(getPageMarginLeft(), 90.0F,
				 * getPageWidth() - getPageMarginRight(), 90.0F); float nyp = getCurrentYPos();
				 * titles.clear(); title = new HashMap(); title.put("size", "10");
				 * title.put("title", ""); title.put("width", String.valueOf(getContentWidth() /
				 * 2.0F)); title.put("align", "l"); titles.add(title); createTitle(30.0F,
				 * bankLineY, titles);
				 * 
				 * titles.clear();
				 * 
				 * title = new HashMap(); title.put("size", "10"); title.put("title", "");
				 * title.put("width", String.valueOf(getContentWidth() / 2.0F - 100.0F));
				 * title.put("align", "l"); titles.add(title); title = new HashMap();
				 * title.put("size", "10"); title.put("title", ""); title.put("width",
				 * String.valueOf(getContentWidth() / 2.0F - 100.0F)); title.put("align", "l");
				 * titles.add(title); createTitle(30.0F, getCurrentYPos(), titles); nyp =
				 * getCurrentYPos();
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "10");
				 * title.put("title", "Net Amount:"); title.put("width", String.valueOf(snoWidth
				 * + descWidth + hsnWidth + mtrWidth + qtyWidth + rateWidth));
				 * title.put("align", "r"); title.put("font", "b"); titles.add(title);
				 * 
				 * cy = nyp; createTitle(getPageMarginLeft(), 90.0F, titles); titles.clear();
				 * title = new HashMap(); title.put("size", "10"); title.put("title",
				 * rs1.getString("sh_net_amount")); title.put("width", String.valueOf(amtWidth -
				 * 2.0F)); title.put("align", "r"); title.put("font", "b"); titles.add(title);
				 * createTitle(getPageWidth() - getPageMarginRight() - amtWidth, 90.0F, titles);
				 * 
				 * drawLine(getPageMarginLeft() + snoWidth + descWidth + hsnWidth + mtrWidth +
				 * qtyWidth + rateWidth, typ, getPageMarginLeft() + snoWidth + descWidth +
				 * hsnWidth + mtrWidth + qtyWidth + rateWidth, 90.0F);
				 * 
				 * drawLine(getPageMarginLeft() + snoWidth + descWidth + hsnWidth, typ,
				 * getPageMarginLeft() + snoWidth + descWidth + hsnWidth, 90.0F);
				 * 
				 * java.math.BigDecimal amt =
				 * java.math.BigDecimal.valueOf(rs1.getDouble("wordnetamt")); String
				 * amountInWords = "Rupees " + NumberToWord.convertNumberToWords(amt) +
				 * " Only."; printBold = true; // createParagraph("", amountInWords, 175.0F,
				 * 30.0F, 78.0F, 0.0F, 8); createParagraph("", amountInWords, 125.0F, 30.0F,
				 * 78.0F, 0.0F, 8); printBold = false;
				 * 
				 * title = new HashMap(); title.put("size", "8"); title.put("title", " ");
				 * title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
				 * title.put("align", "r"); titles.add(title); title = new HashMap();
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "8");
				 * title.put("title", "For " + rs1.getString("comp_name")); title.put("width",
				 * String.valueOf(getContentWidth() / 3.0F - 50.0F)); title.put("align", "l");
				 * title.put("font", "b"); titles.add(title); title = new HashMap();
				 * title.put("size", "8"); title.put("title", " "); title.put("width",
				 * String.valueOf(getContentWidth() / 3.0F - 50.0F)); title.put("align", "r");
				 * titles.add(title); title = new HashMap(); title.put("size", "8");
				 * title.put("title", " "); title.put("width", String.valueOf(getContentWidth()
				 * / 3.0F - 50.0F)); title.put("align", "r"); titles.add(title); title = new
				 * HashMap(); title.put("size", "8"); title.put("title", " ");
				 * title.put("width", String.valueOf(getContentWidth() / 3.0F - 50.0F));
				 * 
				 * title.put("align", "r"); titles.add(title); title.put("size", "8");
				 * title.put("title", " "); title.put("width", String.valueOf(getContentWidth()
				 * / 3.0F - 50.0F)); title.put("align", "r"); titles.add(title); title = new
				 * HashMap(); title.put("size", "9"); title.put("title",
				 * "   Authorized Signatory"); title.put("width",
				 * String.valueOf(getContentWidth() / 3.0F - 50.0F)); title.put("align", "c");
				 * title.put("font", "b"); titles.add(title); createTitle(getContentWidth() /
				 * 3.0F + 55.0F, 88.0F, titles);
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "8");
				 * title.put("title", ""); title.put("width", String.valueOf(descWidth));
				 * title.put("align", "l"); title.put("font", "b"); titles.add(title); cy =
				 * getCurrentYPos(); createTitle(getPageMarginLeft() + snoWidth, 45.0F, titles);
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "8");
				 * title.put("title", ""); title.put("width", String.valueOf(getContentWidth() /
				 * 2.0F)); title.put("align", "c"); title.put("font", "b"); titles.add(title);
				 * createTitle(getPageMarginLeft(), 30.0F, titles);
				 * 
				 * titles.clear(); title = new HashMap(); title.put("size", "8");
				 * title.put("title", "Subject to Salem Jurisdiction."); title.put("width",
				 * String.valueOf(getContentWidth() / 2.0F)); title.put("align", "c");
				 * title.put("font", "b"); titles.add(title);
				 * createTitle(getPageContentMinWidth() + 100, 30.0F, titles);
				 */
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