package com.hiq.trade.util;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.codehaus.jackson.map.ObjectMapper;

import com.core.util.DatabaseUtil;
import com.hiq.trade.model.B2CSDetail;
import com.hiq.trade.model.CDNRDetail;
import com.hiq.trade.model.CreditNote;
import com.hiq.trade.model.HSNDetail;

import com.hiq.trade.model.GST;
import com.hiq.trade.model.HSNData;
import com.hiq.trade.model.Invoice;
import com.hiq.trade.model.Item;
import com.hiq.trade.model.ItemDetail;
import com.hiq.trade.model.Party;

public class GSTFilingUtil {
	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	private static SimpleDateFormat formatDisplay = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
	private static SimpleDateFormat formatMMyyyy = new SimpleDateFormat("MMyyyy", Locale.ENGLISH);
	private static String FS = System.getProperty("file.separator");

	public void generateGSTRJSON(String fromDate, String toDate, String companyCode, OutputStream stream)
			throws Exception {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ResultSet rs1 = null;
		PreparedStatement pstmt1 = null;
		try {
			GST gst = new GST();
			boolean b2cs = true;
			conn = DatabaseUtil.getConnection();
			StringBuffer strQuery = new StringBuffer(100);
			strQuery.append("select gstin_no gstin, '" + formatMMyyyy.format(formatDisplay.parse(fromDate))
					+ "' fp,0 gt,0 as cur_gt from company where c_code=" + companyCode);
			pstmt1 = conn.prepareStatement(strQuery.toString());
			pstmt1.clearParameters();
			// pstmt1.setString(1, invoiceNo);
			rs1 = pstmt1.executeQuery();
			if (rs1.next()) {
				gst.gstin = rs1.getString("gstin");
				gst.fp = rs1.getString("fp");
				gst.gt = rs1.getInt("gt");
				gst.cur_gt = rs1.getInt("cur_gt");
			}
			rs1.close();

			strQuery.setLength(0);
			strQuery.append(
					"select distinct l1.gstin_no,l1.ledger_code customer_code from f_invoice f1,ledger_mast l1 where f1.main_ledger_code=l1.ledger_code and bill_date>='"
							+ format.format(formatDisplay.parse(fromDate)) + "' and bill_date<='"
							+ format.format(formatDisplay.parse(toDate)) + "' and c_code=" + companyCode
							+ " and ifnull(status,'N')<>'C' and ifnull(l1.gstin_no,'')<>'' order by f1.ledger_code asc");
			pstmt1 = conn.prepareStatement(strQuery.toString());
			pstmt1.clearParameters();
			// pstmt1.setString(1, invoiceNo);
			rs1 = pstmt1.executeQuery();
			ArrayList<Party> parties = new ArrayList<Party>();
			while (rs1.next()) {
				Party p = new Party();
				p.ctin = rs1.getString("gstin_no");
				p.suppCode = rs1.getInt("customer_code");
				parties.add(p);
			}
			gst.b2b = parties;
			rs1.close();

			for (int i = 0; i < parties.size(); i++) {
				strQuery.setLength(0);
				strQuery.append(
						"select distinct bill_no inum,date_format(bill_date,'%d-%m-%Y') idt,total_amt val,state_code pos,'N' rchrg,'R' inv_typ, f1.invoice_code,1 num,tot-discount txval,5 rt,cgst_amount camt,sgst_amount samt,0 csamt,igst_amount iamt,l1.local_interstate as interstate from f_invoice f1,f_invoice_det f2,ledger_mast l1 where f1.invoice_code=f2.invoice_code and f1.main_ledger_code=l1.ledger_code and l1.ledger_code="
								+ parties.get(i).suppCode + " and bill_date>='"
								+ format.format(formatDisplay.parse(fromDate)) + "' and bill_date<='"
								+ format.format(formatDisplay.parse(toDate)) + "' and c_code = " + companyCode
								+ " and ifnull(status,'N')<>'C' order by f1.invoice_code asc");
				pstmt1 = conn.prepareStatement(strQuery.toString());
				pstmt1.clearParameters();
				// pstmt1.setString(1, invoiceNo);
				rs1 = pstmt1.executeQuery();
				ArrayList<Invoice> invoices = new ArrayList<Invoice>();
				int invCode = 0;
				Invoice inv = null;
				while (rs1.next()) {
					if (invCode != rs1.getInt("invoice_code")) {
						inv = new Invoice();
						inv.inum = rs1.getString("inum");
						inv.idt = rs1.getString("idt");
						inv.val = rs1.getDouble("val");
						inv.pos = rs1.getString("pos");
						inv.rchrg = rs1.getString("rchrg");
						inv.inv_typ = rs1.getString("inv_typ");
						inv.invCode = rs1.getInt("invoice_code");
						invoices.add(inv);
						invCode = rs1.getInt("invoice_code");
					}
					if (inv != null) {
						if (inv.itms == null) {
							inv.itms = new ArrayList<Item>();
						}
						Item itm = new Item();
						itm.num = rs1.getInt("num");
						itm.itm_det = new ItemDetail();
						itm.itm_det.txval = rs1.getDouble("txval");
						itm.itm_det.rt = rs1.getInt("rt");
						if (!"I".equals(rs1.getString("interstate"))) {
							itm.itm_det.camt = rs1.getDouble("camt");
							itm.itm_det.samt = rs1.getDouble("samt");
						}
						itm.itm_det.csamt = rs1.getDouble("csamt");
						if ("I".equals(rs1.getString("interstate"))) {
							itm.itm_det.iamt = rs1.getDouble("iamt");
						}
						inv.itms.add(itm);
					}
				}
				parties.get(i).inv = invoices;
				rs1.close();

			}

			// credit note

			strQuery.setLength(0);
			strQuery.append(
					"select distinct l1.gstin_no,l1.ledger_code customer_code from sales_ret  f1,ledger_mast l1 where f1.main_ledger_code=l1.ledger_code and bill_date>='"
							+ format.format(formatDisplay.parse(fromDate)) + "' and bill_date<='"
							+ format.format(formatDisplay.parse(toDate)) + "' and c_code=" + companyCode
							+ " and ifnull(status,'N')<>'C' and ifnull(l1.gstin_no,'')<>'' order by f1.ledger_code asc");
			pstmt1 = conn.prepareStatement(strQuery.toString());
			pstmt1.clearParameters();
			// pstmt1.setString(1, invoiceNo);
			rs1 = pstmt1.executeQuery();
			ArrayList<CDNRDetail> parties1 = new ArrayList<CDNRDetail>();
			while (rs1.next()) {
				CDNRDetail p1 = new CDNRDetail();
				p1.ctin = rs1.getString("gstin_no");
				p1.suppCode = rs1.getInt("customer_code");
				parties1.add(p1);
				gst.cdnr = parties1;
			}
			rs1.close();

			for (int i = 0; i < parties1.size(); i++) {
				strQuery.setLength(0);
				strQuery.append(
						"select distinct f1.bill_no cnum,date_format(f1.bill_date,'%d-%m-%Y') cdt,f3.bill_no inum,date_format(f3.bill_date,'%d-%m-%Y') idt,f1.total_amt val,state_code pos,'N' rchrg,'R' inv_typ, f1.invoice_code,1 num,f1.tot-f1.discount txval,5 rt,f1.cgst_amount camt,f1.sgst_amount samt,0 csamt,f1.igst_amount iamt,l1.local_interstate as interstate from sales_ret f1,sales_ret_det f2,f_invoice f3,ledger_mast l1 where f1.invoice_code=f2.invoice_code and f1.against_invoice_code=f3.invoice_code and f1.main_ledger_code=l1.ledger_code and l1.ledger_code="
								+ parties1.get(i).suppCode + " and f1.bill_date>='"
								+ format.format(formatDisplay.parse(fromDate)) + "' and f1.bill_date<='"
								+ format.format(formatDisplay.parse(toDate)) + "' and f1.c_code = " + companyCode
								+ " and ifnull(f1.status,'N')<>'C' order by f1.invoice_code asc");
				pstmt1 = conn.prepareStatement(strQuery.toString());
				pstmt1.clearParameters();
				// pstmt1.setString(1, invoiceNo);
				rs1 = pstmt1.executeQuery();
				ArrayList<CreditNote> cinvoices = new ArrayList<CreditNote>();
				int invCode = 0;
				CreditNote inv1 = null;
				while (rs1.next()) {
					if (invCode != rs1.getInt("invoice_code")) {
						inv1 = new CreditNote();
						inv1.ntty = "C";
						inv1.nt_num = rs1.getString("cnum");
						inv1.nt_dt = rs1.getString("cdt");
						inv1.p_gst = "N";
						inv1.inum = rs1.getString("inum");
						inv1.idt = rs1.getString("idt");
						inv1.val = rs1.getDouble("val");
						cinvoices.add(inv1);
						// invCode = rs1.getInt("invoice_code");
					}
					if (inv1 != null) {
						if (inv1.itms == null) {
							inv1.itms = new ArrayList<Item>();
						}
						Item itm1 = new Item();
						itm1.num = rs1.getInt("num");
						itm1.itm_det = new ItemDetail();
						itm1.itm_det.txval = rs1.getDouble("txval");
						itm1.itm_det.rt = rs1.getInt("rt");
						if (!"I".equals(rs1.getString("interstate"))) {
							itm1.itm_det.camt = rs1.getDouble("camt");
							itm1.itm_det.samt = rs1.getDouble("samt");
						}
						itm1.itm_det.csamt = rs1.getDouble("csamt");
						if ("I".equals(rs1.getString("interstate"))) {
							itm1.itm_det.iamt = rs1.getDouble("iamt");
						}
						inv1.itms.add(itm1);
					}
				}
				parties1.get(i).nt = cinvoices;
				rs1.close();

			}

			// credit note ends here

			// http://localhost:9090/tekknow/service/invoice/gstfiling?fromdate=01/01/2020&todate=31/01/2020&companycode=1

			if (b2cs) {
				gst.b2cs = new ArrayList<B2CSDetail>();
				strQuery.setLength(0);
				strQuery.append(
						"select sply_ty,pos,typ,rt,ifnull(sum(txval),0) txval,ifnull(sum(iamt),0) iamt,ifnull(sum(camt),0) camt,ifnull(sum(samt),0) samt,0 csamt from v_b2cs where  bill_date>='"
								+ format.format(formatDisplay.parse(fromDate)) + "' and bill_date<='"
								+ format.format(formatDisplay.parse(toDate)) + "' and c_code = " + companyCode
								+ "   group by sply_ty,pos,typ,rt order by place_of_supply_id ");
				pstmt1 = conn.prepareStatement(strQuery.toString());
				pstmt1.clearParameters(); // pstmt1.setString(1, invoiceNo);
				rs1 = pstmt1.executeQuery();
				while (rs1.next()) {
					B2CSDetail b = new B2CSDetail();
					b.sply_ty = rs1.getString("sply_ty");
					b.pos = rs1.getString("pos");
					b.typ = rs1.getString("typ");
					b.txval = rs1.getDouble("txval");
					b.rt = rs1.getInt("rt");
					b.iamt = rs1.getDouble("iamt");
					b.camt = rs1.getDouble("camt");
					b.samt = rs1.getDouble("samt");
					b.csamt = rs1.getDouble("csamt");
					gst.b2cs.add(b);
				}
				rs1.close();
			}

			// hsn

			gst.hsn = new HSNData();
			strQuery.setLength(0);

			strQuery.append(
					"select  hsn_code as hsn_code,description as descr, unit_name,ifnull(sum(total_qty),0) as pcs,ifnull(sum(total_mtrs),0) as mtrs, ifnull(sum(taxable_value+igst_amount+sgst_amount+cgst_amount+freight+round_off),0)  as total_value,ifnull(sum(taxable_value),0) as taxable_value,ifnull(sum(igst_amount),0) as igst_amount,ifnull(sum(cgst_amount),0) as cgst_amount,ifnull(sum(sgst_amount),0) as sgst_amount from v_sales_hsn_summary  where bill_date>='"
							+ format.format(formatDisplay.parse(fromDate)) + "' and bill_date<='"
							+ format.format(formatDisplay.parse(toDate)) + "' and c_code = " + companyCode
							+ " group by hsn_code,description,unit_name");

			pstmt1 = conn.prepareStatement(strQuery.toString());
			pstmt1.clearParameters();
			// pstmt1.setString(1, invoiceNo);
			ArrayList<HSNDetail> hsndetail = new ArrayList<HSNDetail>();
			gst.hsn.data = hsndetail;
			rs1 = pstmt1.executeQuery();
			int cnt = 0;
			while (rs1.next()) {
				cnt = cnt + 1;

				HSNDetail h = new HSNDetail();

				h.num = cnt;
				h.hsn_sc = rs1.getString("hsn_code");
				h.desc = rs1.getString("descr");
				h.uqc = rs1.getString("unit_name");
				if ("PCS".equals(h.uqc)) {
					h.qty = rs1.getDouble("pcs");
				} else {
					h.qty = rs1.getDouble("mtrs");
				}

				h.val = rs1.getDouble("total_value");
				h.txval = rs1.getDouble("taxable_value");
				h.iamt = rs1.getDouble("igst_amount");
				h.camt = rs1.getDouble("cgst_amount");
				h.samt = rs1.getDouble("sgst_amount");
				h.csamt = 0;

				hsndetail.add(h);
			}
			rs1.close();

			conn.close();
			String fileName = "";
			Date dte = new Date();
			long milliSeconds = dte.getTime();
			fileName = "GSTR_" + gst.gstin;
			String FileName = System.getProperty("catalina.home") + FS + ".." + FS + "GST" + FS + fileName + ".json";
			PrintWriter out = new PrintWriter(new File(FileName));
			ObjectMapper obj = new ObjectMapper();
			obj.writeValue(out, gst);
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
}