package com.hiq.trade.transaction;

import java.io.OutputStream;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;

import com.core.mail.PushMail;
import com.core.ui.SaveMasterInterface;
import com.core.ui.SaveMasters;
import com.core.util.AjaxResponseUtil;
import com.core.util.CurrentTenantUtil;
import com.core.util.DatabaseUtil;

public class PostStockLedger implements SaveMasterInterface{
	public String executeMaster(Connection conn,String screenCode, String operation, Map<String, Object> saveData) {
		PreparedStatement pstmt = null;
		PreparedStatement updStatement = null;
		PreparedStatement updBillNo = null;
		ResultSet rs = null;
		ResultSet rsDetail = null;
		String result = "Success";
		try {
			StringBuilder strQuery = new StringBuilder(100);

			if (!operation.equals("ADD")) {
				pstmt = conn.prepareStatement("delete from stock_ledger where vh_ref_type=? and vh_ref_code=? ");
				pstmt.setString(1, screenCode);
				pstmt.setString(2, (String) saveData.get("code"));
				pstmt.executeUpdate();
				pstmt.close();
				pstmt = null;
			}
			if (operation.equals("CAN"))
				return result;
			if ("600049".equals(screenCode)) {
				strQuery.append("insert into stock_ledger(sno,dt,inward_no,product_code,party,inward_qty,inward_mtrs,outward_qty,outward_mtrs,sold_qty,sold_mtrs,purc_rate,sales_rate,disc_rate,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select 3,bill_date,bill_no,design_code,concat(ledger_name,' ',branch),0,0,0,0,pcs,mtrs, 0,rate,round(rate-(rate* disc_per/100),2),'600049', f1.invoice_code from ");
				strQuery.append(
						"f_invoice_det f1,f_invoice f2,ledger_mast l1 where f1.invoice_code=f2.invoice_code and f2.ledger_code=l1.ledger_code and f2.reduce_stock='Y'  and ");
				strQuery.append(
						"ifnull(status,'N')<>'C' and f1.dc_code=0 and "+ " f1.invoice_code="+ saveData.get("code") + ";");
				
			}
			if ("600050".equals(screenCode)) {				
				strQuery.append("insert into stock_ledger(sno,dt,inward_no,product_code,party,inward_qty,inward_mtrs,outward_qty,outward_mtrs,sold_qty,sold_mtrs,purc_rate,sales_rate,disc_rate,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select 1 as sno,inward_date as dt,inward_no,product_code,'' as party,qty as inward_qty,mtrs as inward_mtrs,0 as outward_qty,0 as outward_mtrs,0 as sold_qty,");
				strQuery.append(
						"0 as sold_mtrs,rate as purc_rate,0 as sales_rate,0 as disc_rate,'600050', i1.inward_code from inward_det i1,inward i2 where i1.inward_code=i2.inward_code and ifnull(status,'N')<>'C' and i1.inward_code="+ saveData.get("code") + ";");
					
			}
			if ("600051".equals(screenCode)) {
				strQuery.append("insert into stock_ledger(sno,dt,inward_no,product_code,party,inward_qty,inward_mtrs,outward_qty,outward_mtrs,sold_qty,sold_mtrs,purc_rate,sales_rate,disc_rate,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select 2,outward_date,outward_no,o1.product_code,'',0,0,qty,mtrs,0,0,p1.purc_rate,0,0,'600051',o1.outward_code from outward_det o1,outward o2,product_mast p1 where ");
				strQuery.append(
						"o1.product_code=p1.product_code and  o1.outward_code=o2.outward_code and ifnull(status,'N')<>'C' and o1.outward_code="+ saveData.get("code") + ";");
			}
			
			if ("600011".equals(screenCode)) {
				strQuery.append("insert into stock_ledger(sno,dt,inward_no,product_code,party,inward_qty,inward_mtrs,outward_qty,outward_mtrs,sold_qty,sold_mtrs,purc_rate,sales_rate,disc_rate,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select 4,bill_date,bill_no,product_code1,concat(ledger_name,' ',branch),0,0,0,0,pcs,mtrs, 0,rate,round(rate-(rate* disc_per/100),2),'600011',f1.invoice_code from dc_det ");
				strQuery.append(
						"f1,dc f2,ledger_mast l1 where f1.invoice_code=f2.invoice_code and f2.ledger_code=l1.ledger_code and f2.reduce_stock='Y'  and ifnull(status,'N')<>'C'  and f1.invoice_code="+ saveData.get("code") + ";");
				
			
			}
			
			System.out.println(strQuery.toString());
			pstmt = conn.prepareStatement(strQuery.toString());
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = null;
		} catch (Exception e) {
			result = "Error in Stock posting " + e.getMessage();
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (updStatement != null) {
					updStatement.close();
				}
				if (updBillNo != null) {
					updBillNo.close();
				}
				if (rs != null) {
					rs.close();
				}
				if (rsDetail != null) {
					rsDetail.close();
				}
			} catch (SQLException esql) {
				esql.printStackTrace();
			}
		}
		return result;
	}
}