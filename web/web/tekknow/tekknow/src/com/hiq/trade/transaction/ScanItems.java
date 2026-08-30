package com.hiq.trade.transaction;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Map;
import com.core.util.DatabaseUtil;

public class ScanItems {
	private static final String insertMasterQuery = "insert into scanned_items(product_code,product_qty) values(?,?)";
	private static final String selectMasterQuery = "select product_code,prod_code,product_name from product_mast where product_code=?";
	private static final String deleteMasterQuery = "truncate table scanned_items";

	public String addScannedItem(String productCode, String productQty) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		String productName = "";
		String productAlias = "";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(selectMasterQuery);
			pstmt.setString(1, productCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				productName = rs.getString("product_name");
				productAlias = rs.getString("prod_code");
			}
			if ("".equals(productName)) {
				result = "{\"result\":\"Not Found\",\"message\":\"Product Not Found\",\"productname\":\"" + productName
						+ "\",\"productcode\":\"" + productAlias + "\"}";
			} else {
				conn.setAutoCommit(false);
				pstmt = conn.prepareStatement(insertMasterQuery);
				pstmt.setString(1, productCode);
				pstmt.setString(2, productQty);
				pstmt.executeUpdate();
				pstmt.close();
				pstmt = null;
				conn.commit();
				conn.setAutoCommit(true);
				result = "{\"result\":\"Success\",\"message\":\"Scanned Item Saved Successfully\",\"productname\":\""
						+ productName + "\",\"productcode\":\"" + productAlias + "\"}";
			}

		} catch (Exception e) {
			try {
				if (conn != null) {
					conn.rollback();
				}
			} catch (SQLException esql) {
				esql.printStackTrace();
			}
			e.printStackTrace();
			result = "{\"result\":\"Error\",\"message\":\"Error while saving Scanned Item[" + e.getMessage() + "]\"}";
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException esql) {
				esql.printStackTrace();
			}
		}
		return result;
	}

	public static ScanItems getInstance() {
		return new ScanItems();
	}
}