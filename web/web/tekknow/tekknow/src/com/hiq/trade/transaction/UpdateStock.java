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

public class UpdateStock implements SaveMasterInterface{
	public String executeMaster(Connection conn,String screenCode, String operation, Map<String, Object> saveData) {
		PreparedStatement pstmt = null;
		PreparedStatement updStatement = null;
		PreparedStatement updBillNo = null;
		ResultSet rs = null;
		ResultSet rsDetail = null;
		String result = "Success";
		try {
			StringBuilder strQuery = new StringBuilder(100);

			if (operation.equals("CAN"))
				return result;
			if ("600049".equals(screenCode)) {
				strQuery.append("update product_mast,f_invoice_det f2 set stock_pcs=(select ifnull(sum(qty),0) from v_stock v1 where v1.product_code=product_mast.product_code),stock_mtrs=(select ifnull(sum(mtrs),0) from v_stock v1 where v1.product_code=product_mast.product_code) where  product_mast.product_code=f2.design_code and f2.invoice_code="+saveData.get("code") +";") ;
			}
			if ("600050".equals(screenCode)) {
				strQuery.append("update product_mast,inward_det f2 set stock_pcs=(select ifnull(sum(qty),0) from v_stock v1 where v1.product_code=product_mast.product_code),stock_mtrs=(select ifnull(sum(mtrs),0) from v_stock v1 where v1.product_code=product_mast.product_code) where product_mast.product_code=f2.product_code and f2.inward_code="+saveData.get("code") +";") ;				
			}
			if ("600051".equals(screenCode)) {
				strQuery.append("update product_mast,outward_det f2 set stock_pcs=(select ifnull(sum(qty),0) from v_stock v1 where v1.product_code=product_mast.product_code), stock_mtrs=(select ifnull(sum(mtrs),0) from v_stock v1 where v1.product_code=product_mast.product_code) where product_mast.product_code=f2.product_code and f2.outward_code="+saveData.get("code") +";") ;				
			}
			if ("600011".equals(screenCode)) {
				strQuery.append("update product_mast,dc_det f2 set stock_pcs=(select ifnull(sum(qty),0) from v_stock v1 where v1.product_code=product_mast.product_code),stock_mtrs=(select ifnull(sum(mtrs),0) from v_stock v1 where v1.product_code=product_mast.product_code)  where product_mast.product_code=f2.product_code1 and f2.invoice_code="+saveData.get("code") +";") ;
			}
			System.out.println(strQuery.toString());
			pstmt = conn.prepareStatement(strQuery.toString());
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = null;
		} catch (Exception e) {
			result = "Error in Stock Updating " + e.getMessage();
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