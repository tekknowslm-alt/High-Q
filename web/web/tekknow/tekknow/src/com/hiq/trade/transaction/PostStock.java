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

public class PostStock implements SaveMasterInterface{
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
				pstmt = conn.prepareStatement("delete from stock where vh_ref_type=? and vh_ref_code=? ");
				pstmt.setString(1, screenCode);
				pstmt.setString(2, (String) saveData.get("code"));
				pstmt.executeUpdate();
				pstmt.close();
				pstmt = null;
			}
			if (operation.equals("CAN"))
				return result;
			if ("600049".equals(screenCode)) {
				strQuery.append("insert into stock(dt,product_code,qty,mtrs,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select bill_date as dt, design_code as product_code, pcs * -1 as qty,mtrs * -1 as mtrs,'600049' vh_ref_type,f1.invoice_code vh_ref_code from f_invoice f1,f_invoice_det f2 where f1.invoice_code=f2.invoice_code and  f2.dc_code=0 and f1.reduce_stock='Y' and ifnull(status,'N')<>'C' and f1.invoice_code="
								+ saveData.get("code") + ";");
			}
			if ("600050".equals(screenCode)) {				
				strQuery.append("insert into stock(dt,product_code,qty,mtrs,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select inward_date as dt, product_code as product_code, qty as qty,mtrs as mtrs,'600050' vh_ref_type,f1.inward_code vh_ref_code from inward f1,inward_det f2 where f1.inward_code=f2.inward_code  and ifnull(status,'N')<>'C' and f1.inward_code="
								+ saveData.get("code") + ";");
			}
			if ("600051".equals(screenCode)) {
				strQuery.append("insert into stock(dt,product_code,qty,mtrs,vh_ref_type,vh_ref_code)");
				strQuery.append(
						"select outward_date as dt, product_code as product_code, qty * -1 as qty,mtrs * -1 as mtrs,'600051' vh_ref_type,f1.outward_code vh_ref_code from outward f1,outward_det f2 where f1.outward_code=f2.outward_code  and ifnull(status,'N')<>'C' and f1.outward_code="
								+ saveData.get("code") + ";");
			}
			if ("600011".equals(screenCode)) {
				strQuery.append("insert into stock(dt,product_code,qty,mtrs,vh_ref_type,vh_ref_code)");
				strQuery.append(						
						"select bill_date as dt, product_code1 as product_code, pcs * -1 as qty,mtrs * -1 as mtrs,'600011' vh_ref_type,f1.invoice_code vh_ref_code from dc f1,dc_det f2 where f1.invoice_code=f2.invoice_code  and ifnull(status,'N')<>'C' and f1.invoice_code="
								+ saveData.get("code") + ";");
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