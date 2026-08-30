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

public class PostVoucherEntry implements SaveMasterInterface {
	public String executeMaster(Connection conn, String screenCode, String operation, Map<String, Object> saveData) {
		PreparedStatement pstmt = null;
		PreparedStatement updStatement = null;
		PreparedStatement updBillNo = null;
		ResultSet rs = null;
		ResultSet rsDetail = null;
		String result = "Success";
		try {
			StringBuilder strQuery = new StringBuilder(100);

			if (!operation.equals("ADD")) {
				pstmt = conn.prepareStatement("delete from voucher_detail where vh_ref_type=? and vh_ref_code=? ");
				pstmt.setString(1, screenCode);
				pstmt.setString(2, (String) saveData.get("code"));
				pstmt.executeUpdate();
				pstmt.close();
				pstmt = null;
			}
			if (operation.equals("CAN"))
				return result;
			if ("600049".equals(screenCode)) {
				// accounts
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`bill_no` AS `vh_no`,'Sales' AS `v_type`,`h`.`bill_date` AS `vh_date`,'Sales' AS `vh_prefix`,`h`.`bill_no` AS `vh_seq_no`,`h`.`main_ledger_code` AS `vd_ledger_code`,`h`.`total_amt` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,'Sales A/c' AS `ledger_name`,'' AS `branch`,'' AS `narration`,h.invoice_code refcode,"
								+ screenCode
								+ " reftype from (`f_invoice` `h` join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`bill_date` >= cast('2019-04-01' as date))) and h.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");

				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales' AS v_type,`f1`.`bill_date` AS `bill_date`,'Sales' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`a1`.`cgst_ledger_code` AS `cgst_ledger_code`,0 AS `0`,`f1`.`cgst_amount` AS `cgst_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_286`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`f_invoice` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales' AS v_type,`f1`.`bill_date` AS `bill_date`,'Sales' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`a1`.`sgst_ledger_code` AS `sgst_ledger_code`,0 AS `0`,`f1`.`sgst_amount` AS `sgst_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_299`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`f_invoice` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales' AS v_type,`f1`.`bill_date` AS `bill_date`,'Sales' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`a1`.`igst_ledger_code` AS `igst_ledger_code`,0 AS `0`,`f1`.`igst_amount` AS `igst_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_312`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`f_invoice` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales' AS v_type,`f1`.`bill_date` AS `bill_date`,'Sales' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`account_settings`.`sales_ledger_code` AS `SALES_ledger_code`,0 AS `0`,(sum(`f2`.`amount`) - `f1`.`discount`) AS `sum(amount)-discount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_611`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from (((`f_invoice` `f1` join `f_invoice_det` `f2`) join `account_settings`) join `ledger_mast` `l1`) where ((`f1`.`invoice_code` = `f2`.`invoice_code`) and (`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code")
								+ " group by `f1`.`c_code`,`f1`.`bill_no`,`f1`.`bill_date`,`account_settings`.`sales_ledger_code`,`f1`.`discount`,`l1`.`ledger_name` ");
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales' AS v_type,`f1`.`bill_date` AS `bill_date`,'Sales' AS `S`,`f1`.`bill_no` AS `bill_no`,`account_settings`.`freight_outward_ledger_code` AS `freight_outward_ledger_code`,0 AS `0`,`f1`.`courier_charges` AS `courier_charges`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_637`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`f_invoice` `f1` join `account_settings`) join `ledger_mast` `l1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`paid_to_pay` = 'P') and (`f1`.`courier_charges` <> 0) and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`bill_no` AS `bill_no`,'Sales' AS v_type,`p1`.`bill_date` AS `bill_date`,'Sales' AS `SALES`,`p1`.`bill_no` AS `bill_no`,`a1`.`roundoff_ledger_code` AS `roundoff_ledger_code`,(case when (`p1`.`round_off` < 0) then (`p1`.`round_off` * -(1)) else 0 end) AS `case when round_off<0 then round_off*-1 else 0 end`,(case when (`p1`.`round_off` > 0) then `p1`.`round_off` else 0 end) AS `case when round_off>0 then round_off else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_988`,p1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`f_invoice` `p1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`bill_date` >= cast('2019-04-01' as date)) and (`p1`.`round_off` <> 0)) and p1.invoice_code="
								+ saveData.get("code") + ";");

			}
			if ("600005".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`bill_no` AS `vh_no`,'Sales Return' AS `v_type`,`h`.`bill_date` AS `vh_date`,'Sales Return' AS `vh_prefix`,`h`.`bill_no` AS `vh_seq_no`,`h`.`main_ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h`.`total_amt` AS `vd_cramount`,'Y' AS `vh_status`,'Sales A/c' AS `ledger_name`,'' AS `Name_exp_25`,'' AS `Name_exp_26`,h.invoice_code refcode,"
								+ screenCode
								+ " reftype from (`sales_ret` `h` join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`bill_date` >= cast('2019-04-01' as date))) and h.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`f1`.`bill_date` AS `bill_date`,'Sales Return' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`a1`.`cgst_ledger_code` AS `cgst_ledger_code`,`f1`.`cgst_amount` AS `cgst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_325`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`sales_ret` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date)) and (`f1`.`cgst_amount` <> 0)) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`f1`.`bill_date` AS `bill_date`,'Sales Return' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`a1`.`sgst_ledger_code` AS `sgst_ledger_code`,`f1`.`sgst_amount` AS `sgst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_338`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`sales_ret` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date)) and (`f1`.`sgst_amount` <> 0)) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`f1`.`bill_date` AS `bill_date`,'Sales Return' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`a1`.`igst_ledger_code` AS `igst_ledger_code`,`f1`.`igst_amount` AS `igst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_351`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`sales_ret` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date)) and (`f1`.`igst_amount` <> 0)) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`f1`.`bill_date` AS `bill_date`,'Sales Return' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`account_settings`.`sales_ledger_code` AS `SALES_ledger_code`,(sum(`f2`.`amount`) - `f1`.`discount`) AS `sum(amount)-discount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_624`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from (((`sales_ret` `f1` join `sales_ret_det` `f2`) join `account_settings`) join `ledger_mast` `l1`) where ((`f1`.`invoice_code` = `f2`.`invoice_code`) and (`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code")
								+ " group by `f1`.`c_code`,`f1`.`bill_no`,`f1`.`bill_date`,`account_settings`.`sales_ledger_code`,`f1`.`discount`,`l1`.`ledger_name`");
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`f1`.`bill_date` AS `bill_date`,'Sales Return' AS vh_prefix,`f1`.`bill_no` AS `bill_no`,`account_settings`.`freight_inward_ledger_code` AS `freight_inward_ledger_code`,`f1`.`courier_charges` AS `courier_charges`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_650`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`sales_ret` `f1` join `account_settings`) join `ledger_mast` `l1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`courier_charges` <> 0) and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`p1`.`bill_date` AS `bill_date`,'Sales Return' AS vh_prefix,`p1`.`bill_no` AS `bill_no`,`a1`.`roundoff_ledger_code` AS `roundoff_ledger_code`,(case when (`p1`.`round_off` > 0) then `p1`.`round_off` else 0 end) AS `case when round_off>0 then round_off else 0 end`,(case when (`p1`.`round_off` < 0) then (`p1`.`round_off` * -(1)) else 0 end) AS `case when round_off<0 then round_off*-1 else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_962`,p1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`sales_ret` `p1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`bill_date` >= cast('2019-04-01' as date)) and (`p1`.`round_off` <> 0)) and p1.invoice_code="
								+ saveData.get("code"));

			}
			if ("100012".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `o1`.`c_code` AS `c_code`,'' AS `Name_exp_28`,'Op' AS `v_type`,`o1`.`op_date` AS `op_date`,'Op' ,'' AS `Name_exp_32`,`o2`.`ledger_code` AS `ledger_code`,`o2`.`debit` AS `debit`,`o2`.`credit` AS `credit`,'Y' AS `Y`,'OP. BALANCE' AS `OP. BALANCE`,'' AS `Name_exp_38`,'' AS `Name_exp_39`,o1.op_code,"
								+ screenCode
								+ " reftype from ((`op_balance` `o1` join `op_balance_det` `o2`) join `op_date` `o3`) where ((`o1`.`op_code` = `o2`.`op_code`) and (`o1`.`op_date` >= cast('2019-03-31' as date)) and (ifnull(`o1`.`status`,'N') <> 'C')) and o1.op_code="
								+ saveData.get("code"));
			}
			if ("600002".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,'Sales' AS `v_type`,`p2`.`bill_date` AS `bill_date`,'Sales' AS `vh_prefix`,`p2`.`bill_no` AS `bill_no`,(case when (isnull(`l1`.`main_ledger_code`) or (`l1`.`main_ledger_code` = 0)) then `p2`.`ledger_code` else `l1`.`main_ledger_code` end) AS `Name_exp_46`,`p2`.`net_amount` AS `net_amount`,0 AS `0`,'Y' AS `Y`,'Sales A/c' ,'' AS `Name_exp_51`,'' AS `Name_exp_52`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'S') and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_55`,`p2`.`bill_date` AS `bill_date`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) ,`p2`.`bill_no` AS `bill_no`,`p2`.`ledger_code` AS `ledger_code`,`p2`.`net_amount` AS `net_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_64`,'' AS `Name_exp_65`,p1.tran_code,"
								+ screenCode
								+ " reftype from (`purc_sale` `p1` join `purc_sale_det` `p2`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'D') and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,'Purchase' AS `v_type`,`p2`.`bill_date` AS `bill_date`,'Purchase',`p2`.`bill_no` AS `bill_no`,`p2`.`ledger_code` AS `ledger_code`,0 AS `0`,`p2`.`net_amount` AS `net_amount`,'Y' AS `Y`,'Purchase A/c' ,'' AS `Name_exp_77`,'' AS `Name_exp_78`,p1.tran_code,"
								+ screenCode
								+ " reftype from (`purc_sale` `p1` join `purc_sale_det` `p2`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'P') and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,'Others' AS `v_type`,`p2`.`bill_date` AS `bill_date`,'Others' ,`p2`.`bill_no` AS `bill_no`,`p2`.`ledger_code` AS `ledger_code`,0 AS `0`,`p2`.`net_amount` AS `net_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_91`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `ledger_mast` `l1`) where ((`p1`.`exp_ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'O') and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,'Purchase' AS `v_type`,`p2`.`bill_date` AS `bill_date`,'Purchase',`p2`.`bill_no` AS `bill_no`,`a1`.`discount_rece_ledger_code` AS `discount_rece_ledger_code`,0 AS `0`,`p2`.`discount` AS `discount`,'Y' AS `Y`,'Purchase A/c' ,'' AS `Name_exp_103`,'' AS `Name_exp_104`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings` `a1`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`discount` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,'Sales Return' AS `v_type`,`p2`.`bill_date` AS `bill_date`,'Sales Return',`p2`.`bill_no` AS `bill_no`,(case when (isnull(`l1`.`main_ledger_code`) or (`l1`.`main_ledger_code` = 0)) then `p2`.`ledger_code` else `l1`.`main_ledger_code` end) AS `Name_exp_111`,0 AS `0`,`p2`.`net_amount` AS `net_amount`,'Y' AS `Y`,'Sales A/c',`l1`.`branch` AS `branch`,'' AS `Name_exp_117`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'C') and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `v_type`,`p2`.`bill_date` AS `bill_date`,`p1`.`tran_type` AS `tran_type`,`p2`.`bill_no` AS `bill_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,0 AS `0`,`p2`.`cgst_amount` AS `cgst_amount`,'Y' AS `Y`,'Sales A/c'  ,'' AS `Name_exp_363`,'' AS `Name_exp_364`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'S') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`cgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `v_type`,`p2`.`bill_date` AS `bill_date`,`p1`.`tran_type` AS `tran_type`,`p2`.`bill_no` AS `bill_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,0 AS `0`,`p2`.`cgst_amount` AS `cgst_amount`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_376`,'' AS `Name_exp_377`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'D') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`cgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sale Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_380`,`p2`.`bill_date` AS `bill_date`,'Purchase' AS `tran_type`,`p2`.`bill_no` AS `bill_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,`p2`.`cgst_amount` AS `cgst_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_389`,'' AS `Name_exp_390`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'P') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`cgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_393`,`p2`.`bill_date` AS `bill_date`,'Others' AS `tran_type`,`p2`.`bill_no` AS `bill_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,`p2`.`cgst_amount` AS `cgst_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c' ,'' AS `Name_exp_402`,'' AS `Name_exp_403`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'O') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`cgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_406`,`p2`.`bill_date` AS `bill_date`,'Sales Return' AS `tran_type`,`p2`.`bill_no` AS `bill_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,`p2`.`cgst_amount` AS `cgst_amount`,0 AS `0`,'Y' AS `Y`,'Sales A/c' ,'' AS `Name_exp_415`,'' AS `Name_exp_416`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'C') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`gst_per` = 5) and (`p2`.`cgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_419`,`p2`.`bill_date` AS `bill_date`,'Sales' ,`p2`.`bill_no` AS `bill_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,0 AS `0`,`p2`.`sgst_amount` AS `sgst_amount`,'Y' AS `Y`,'Sales A/c' ,'' AS `Name_exp_428`,'' AS `Name_exp_429`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'S') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`sgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_432`,`p2`.`bill_date` AS `bill_date`,'Purchase Return',`p2`.`bill_no` AS `bill_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,0 AS `0`,`p2`.`sgst_amount` AS `sgst_amount`,'Y' AS `Y`,'Purchase A/c' ,'' AS `Name_exp_441`,'' AS `Name_exp_442`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'D') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`sgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_445`,`p2`.`bill_date` AS `bill_date`,'Purchase' ,`p2`.`bill_no` AS `bill_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,`p2`.`sgst_amount` AS `sgst_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_454`,'' AS `Name_exp_455`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'P') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`sgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_458`,`p2`.`bill_date` AS `bill_date`,'Others' ,`p2`.`bill_no` AS `bill_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,`p2`.`sgst_amount` AS `sgst_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c' ,'' AS `Name_exp_467`,'' AS `Name_exp_468`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'O') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`sgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_471`,`p2`.`bill_date` AS `bill_date`,'Sales Return' ,`p2`.`bill_no` AS `bill_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,`p2`.`sgst_amount` AS `sgst_amount`,0 AS `0`,'Y' AS `Y`,'Sales A/c','' AS `Name_exp_480`,'' AS `Name_exp_481`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'C') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`sgst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_484`,`p2`.`bill_date` AS `bill_date`,'Sales' ,`p2`.`bill_no` AS `bill_no`,`account_settings`.`igst_ledger_code` AS `igst_ledger_code`,0 AS `0`,`p2`.`igst_amount` AS `igst_amount`,'Y' AS `Y`,'Sales A/c','' AS `Name_exp_493`,'' AS `Name_exp_494`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'S') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`igst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_497`,`p2`.`bill_date` AS `bill_date`,'Purchase Return',`p2`.`bill_no` AS `bill_no`,`account_settings`.`igst_ledger_code` AS `igst_ledger_code`,0 AS `0`,`p2`.`igst_amount` AS `igst_amount`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_506`,'' AS `Name_exp_507`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'D') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`igst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_510`,`p2`.`bill_date` AS `bill_date`,'Purchase',`p2`.`bill_no` AS `bill_no`,`account_settings`.`igst_ledger_code` AS `igst_ledger_code`,`p2`.`igst_amount` AS `igst_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_519`,'' AS `Name_exp_520`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'P') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`igst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_523`,`p2`.`bill_date` AS `bill_date`,'Sales Return',`p2`.`bill_no` AS `bill_no`,`account_settings`.`igst_ledger_code` AS `igst_ledger_code`,`p2`.`igst_amount` AS `igst_amount`,0 AS `0`,'Y' AS `Y`,'Sales A/c','' AS `Name_exp_532`,'' AS `Name_exp_533`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'C') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`igst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_536`,`p2`.`bill_date` AS `bill_date`,'Others',`p2`.`bill_no` AS `bill_no`,`account_settings`.`igst_ledger_code` AS `igst_ledger_code`,`p2`.`igst_amount` AS `igst_amount`,0 AS `0`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_545`,'' AS `Name_exp_546`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'O') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`igst_amount` <> 0) and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_549`,`p2`.`bill_date` AS `bill_date`,'Sales',`p2`.`bill_no` AS `bill_no`,`account_settings`.`sales_ledger_code` AS `SALES_ledger_code`,0 AS `0`,`p2`.`amount` AS `amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_559`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'S') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`amount` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_562`,`p2`.`bill_date` AS `bill_date`,'Purchase Return' AS `tran_type`,`p2`.`bill_no` AS `bill_no`,`account_settings`.`purc_ledger_code` AS `purc_ledger_code`,0 AS `0`,`p2`.`amount` AS `amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_572`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'D') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`amount` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_575`,`p2`.`bill_date` AS `bill_date`,'Purchase',`p2`.`bill_no` AS `bill_no`,`account_settings`.`purc_ledger_code` AS `purc_ledger_code`,`p2`.`amount` AS `amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_585`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'P') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`amount` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_588`,`p2`.`bill_date` AS `bill_date`,'Sales Return',`p2`.`bill_no` AS `bill_no`,`account_settings`.`sales_ledger_code` AS `sales_ledger_code`,`p2`.`amount` AS `amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_598`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'C') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`amount` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_653`,`p2`.`bill_date` AS `bill_date`,'Purchase',`p2`.`bill_no` AS `bill_no`,`account_settings`.`freight_inward_ledger_code` AS `freight_inward_ledger_code`,`p2`.`freight` AS `freight`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_663`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'P') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`freight` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) AS `Name_exp_666`,`p2`.`bill_date` AS `bill_date`,'Sales',`p2`.`bill_no` AS `bill_no`,`account_settings`.`freight_outward_ledger_code` AS `freight_outward_ledger_code`,0 AS `0`,`p2`.`freight` AS `freight`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_676`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale` `p1` join `purc_sale_det` `p2`) join `account_settings`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'S') and (`p2`.`bill_date` >= cast('2019-04-01' as date)) and (`p2`.`freight` <> 0)) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p2`.`bill_no` AS `bill_no`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end)  ,`p2`.`bill_date` AS `bill_date`,(case `p1`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end) ,`p2`.`bill_no` AS `bill_no`,`p1`.`exp_ledger_code` AS `exp_ledger_code`,ifnull(`p2`.`amount`,0) AS `ifnull(amount,0)`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_871`,p1.tran_code,"
								+ screenCode
								+ " reftype from ((`purc_sale` `p1` join `purc_sale_det` `p2`) join `ledger_mast` `l1`) where ((`p2`.`ledger_code` = `l1`.`ledger_code`) and (`p1`.`tran_code` = `p2`.`tran_code`) and (`p1`.`exp_ledger_code` is not null) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`tran_type` = 'O') and (`p2`.`bill_date` >= cast('2019-04-01' as date))) and p1.tran_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p2`.`c_code` AS `c_code`,`p1`.`bill_no` AS `bill_no`,(case `p2`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end)  ,`p1`.`bill_date` AS `bill_date`,(case `p2`.`tran_type` when 'P' then 'Purchase' when 'S' then 'Sales' when 'C' then 'Sales Return' when 'D' then 'Purchase Return' when 'O' then 'Others' end)  ,`p1`.`bill_no` AS `bill_no`,`a1`.`roundoff_ledger_code` AS `roundoff_ledger_code`,(case when (`p1`.`round_off` > 0) then `p1`.`round_off` else 0 end) AS `case when round_off>0 then round_off else 0 end`,(case when (`p1`.`round_off` < 0) then (`p1`.`round_off` * -(1)) else 0 end) AS `case when round_off<0 then round_off*-1 else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1001`,p1.tran_code,"
								+ screenCode
								+ " reftype from (((`purc_sale_det` `p1` join `purc_sale` `p2`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`p1`.`tran_code` = `p2`.`tran_code`) and (`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p2`.`status`,'N') <> 'C') and (`p1`.`bill_date` >= cast('2019-04-01' as date)) and (`p1`.`round_off` <> 0) and (`p2`.`tran_type` in ('P','O','C'))) and p1.tran_code="
								+ saveData.get("code"));

			}
			if ("600041".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`rece_no` AS `vh_no`,'Receipt' AS `v_type`,`h`.`rece_date` AS `vh_date`,'Receipt' AS `vh_prefix`,`h`.`rece_no` AS `vh_seq_no`,`h`.`party_code` AS `vd_ledger_code`,0 AS `vd_dramount`,(`h`.`amount` - (`h`.`exp_amount` + `h`.`exp2_amount`)) AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,concat(ifnull(`h`.`narration`,''),' Chq.No.',`h`.`cheque_no`) AS `concat(ifnull(narration,''),' Chq.No.',cheque_no)`,h.rece_code,"
								+ screenCode
								+ " reftype from (`rece_mast` `h` join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`rece_date` >= cast('2019-04-01' as date))) and h.rece_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`rece_no` AS `vh_no`,'Receipt' AS `v_type`,`h`.`rece_date` AS `vh_date`,'Receipt' AS `vh_prefix`,`h`.`rece_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,`h`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,concat(ifnull(`h`.`narration`,''),' Chq.No.',`h`.`cheque_no`) AS narration,h.rece_code,"
								+ screenCode
								+ " reftype from (`rece_mast` `h` join `ledger_mast` `l1`) where ((`h`.`party_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`rece_date` >= cast('2019-04-01' as date))) and h.rece_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`rece_no` AS `vh_no`,'Receipt' AS `v_type`,`h`.`rece_date` AS `vh_date`,'Receipt' AS `vh_prefix`,`h`.`rece_no` AS `vh_seq_no`,`h`.`party_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`r1`.`discount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h`.`narration` AS `narration`,h.rece_code,"
								+ screenCode
								+ " reftype from ((`rece_mast` `h` join `rece_det` `r1`) join `ledger_mast` `l1`) where ((`h`.`rece_code` = `r1`.`rece_code`) and (`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`r1`.`discount` <> 0) and (`h`.`rece_date` >= cast('2019-04-01' as date))) and h.rece_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`rece_no` AS `vh_no`,'Receipt' AS `v_type`,`h`.`rece_date` AS `vh_date`,'Receipt' AS `vh_prefix`,`h`.`rece_no` AS `vh_seq_no`,`a1`.`allowance_paid_ledger_code` AS `vd_ledger_code`,`r1`.`discount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h`.`narration` AS `narration`,h.rece_code,"
								+ screenCode
								+ " reftype from (((`rece_mast` `h` join `rece_det` `r1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`h`.`rece_code` = `r1`.`rece_code`) and (`h`.`party_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`r1`.`discount` <> 0) and (`h`.`rece_date` >= cast('2019-04-01' as date))) and h.rece_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`rece_no` AS `rece_no`,'Receipt',`p1`.`rece_date` AS `rece_date`,'Receipt',`p1`.`rece_no` AS `rece_no`,`p1`.`exp_ledger_code` AS `exp_ledger_code`,(case when (`p1`.`exp_amount` < 0) then (`p1`.`exp_amount` * -(1)) else 0 end) AS `case when exp_amount<0 then exp_amount*-1 else 0 end`,(case when (`p1`.`exp_amount` > 0) then `p1`.`exp_amount` else 0 end) AS `case when exp_amount>0 then exp_amount else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1014`,p1.rece_code,"
								+ screenCode
								+ " reftype from (`rece_mast` `p1` join `ledger_mast` `l1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`rece_date` >= cast('2019-04-01' as date)) and (`p1`.`exp_amount` <> 0)) and p1.rece_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`rece_no` AS `rece_no`,'Receipt' ,`p1`.`rece_date` AS `rece_date`,'Receipt', `p1`.`rece_no` AS `rece_no`,`p1`.`exp_ledger_code` AS `exp_ledger_code`,(case when (`p1`.`exp2_amount` < 0) then (`p1`.`exp2_amount` * -(1)) else 0 end) AS `case when exp2_amount<0 then exp2_amount*-1 else 0 end`,(case when (`p1`.`exp2_amount` > 0) then `p1`.`exp2_amount` else 0 end) AS `case when exp2_amount>0 then exp2_amount else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1027`,p1.rece_code,"
								+ screenCode
								+ " reftype from (`rece_mast` `p1` join `ledger_mast` `l1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`rece_date` >= cast('2019-04-01' as date)) and (`p1`.`exp2_amount` <> 0)) and p1.rece_code="
								+ saveData.get("code"));
			}
			if ("600043".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`pay_no` AS `vh_no`,'Payment' AS `v_type`,`h`.`pay_date` AS `vh_date`,'Payment' AS `vh_prefix`,`h`.`pay_no` AS `vh_seq_no`,`h`.`party_code` AS `vd_ledger_code`,(`h`.`amount` - (`h`.`exp_amount` + `h`.`exp2_amount`)) AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,concat(ifnull(`h`.`narration`,''),' Chq.No.',`h`.`cheque_no`) AS narration,h.pay_code,"
								+ screenCode
								+ " reftype from (`pay_mast` `h` join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`pay_date` >= cast('2019-04-01' as date))) and h.pay_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`pay_no` AS `vh_no`,'Payment',`h`.`pay_date` AS `vh_date`,'Payment' AS `vh_prefix`,`h`.`pay_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,concat(ifnull(`h`.`narration`,''),' Chq.No.',`h`.`cheque_no`) AS narration,h.pay_code,"
								+ screenCode
								+ " reftype from (`pay_mast` `h` join `ledger_mast` `l1`) where ((`h`.`party_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`pay_date` >= cast('2019-04-01' as date)))  and h.pay_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`pay_no` AS `vh_no`,'Payment',`h`.`pay_date` AS `vh_date`,'Payment' AS `vh_prefix`,`h`.`pay_no` AS `vh_seq_no`,`h`.`party_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`r1`.`discount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h`.`narration` AS `narration`,h.pay_code,"
								+ screenCode
								+ " reftype from ((`pay_mast` `h` join `pay_det` `r1`) join `ledger_mast` `l1`) where ((`h`.`pay_code` = `r1`.`pay_code`) and (`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`r1`.`discount` <> 0) and (`h`.`pay_date` >= cast('2019-04-01' as date)))  and h.pay_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`pay_no` AS `vh_no`,'Payment',`h`.`pay_date` AS `vh_date`,'Payment' ,`h`.`pay_no` AS `vh_seq_no`,`a1`.`allowance_recd_ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`r1`.`discount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h`.`narration` AS `narration`,h.pay_code,"
								+ screenCode
								+ " reftype from (((`pay_mast` `h` join `pay_det` `r1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`h`.`pay_code` = `r1`.`pay_code`) and (`h`.`party_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`r1`.`discount` <> 0) and (`h`.`pay_date` >= cast('2019-04-01' as date)))  and h.pay_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`pay_no` AS `pay_no`,'Payment' ,`p1`.`pay_date` AS `pay_date`,'Payment' ,`p1`.`pay_no` AS `pay_no`,`p1`.`exp_ledger_code` AS `exp_ledger_code`,(case when (`p1`.`exp_amount` > 0) then `p1`.`exp_amount` else 0 end) AS `case when exp_amount>0 then exp_amount else 0 end`,(case when (`p1`.`exp_amount` < 0) then (`p1`.`exp_amount` * -(1)) else 0 end) AS `case when exp_amount<0 then exp_amount*-1 else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`p1`.`narration` AS `narration`,p1.pay_code,"
								+ screenCode
								+ " reftype from (`pay_mast` `p1` join `ledger_mast` `l1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`pay_date` >= cast('2019-04-01' as date)) and (`p1`.`exp_amount` <> 0))  and p1.pay_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`pay_no` AS `pay_no`,'Payment' ,`p1`.`pay_date` AS `pay_date`,'Payment' ,`p1`.`pay_no` AS `pay_no`,`p1`.`exp_ledger_code` AS `exp_ledger_code`,(case when (`p1`.`exp2_amount` > 0) then `p1`.`exp2_amount` else 0 end) AS `case when exp2_amount>0 then exp2_amount else 0 end`,(case when (`p1`.`exp2_amount` < 0) then (`p1`.`exp2_amount` * -(1)) else 0 end) AS `case when exp2_amount<0 then exp2_amount*-1 else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`p1`.`narration` AS `narration`,p1.pay_code,"
								+ screenCode
								+ " reftype from (`pay_mast` `p1` join `ledger_mast` `l1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`pay_date` >= cast('2019-04-01' as date)) and (`p1`.`exp_amount` <> 0))  and p1.pay_code="
								+ saveData.get("code"));
			}
			if ("600007".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Journal' AS `v_type`,`h`.`jou_date` AS `vh_date`,'Journal' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,`h1`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`journal` `h` join `journal_det` `h1`) join `ledger_mast` `l1`) where ((`h1`.`jou_code` = `h`.`jou_code`) and (`h1`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`tran_type` = 'D') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Journal' AS `v_type`,`h`.`jou_date` AS `vh_date`,'Journal' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h1`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`journal` `h` join `journal_det` `h1`) join `ledger_mast` `l1`) where ((`h1`.`jou_code` = `h`.`jou_code`) and (`h1`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`tran_type` = 'C') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Journal' AS `v_type`,`h`.`jou_date` AS `vh_date`,'Journal' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h1`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h1`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`journal` `h` join `journal_det` `h1`) join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`jou_code` = `h1`.`jou_code`) and (`h`.`tran_type` = 'D') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Journal' AS `v_type`,`h`.`jou_date` AS `vh_date`,'Journal' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h1`.`ledger_code` AS `vd_ledger_code`,`h1`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`journal` `h` join `journal_det` `h1`) join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`jou_code` = `h1`.`jou_code`) and (`h`.`tran_type` = 'C') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
			}
			if ("600047".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`vou_no` AS `vh_no`,'Weaver Payment' AS `v_type`,`h`.`vou_date` AS `vh_date`,'Weaver Payment' AS `vh_prefix`,`h`.`vou_no` AS `vh_seq_no`,`h1`.`ledger_code` AS `vd_ledger_code`,`h1`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'BEING WAGES PAID' AS `BEING WAGES PAID`,h.weaver_payment_code,"
								+ screenCode
								+ " reftype from ((`weaver_payment` `h` join `weaver_payment_det` `h1`) join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`weaver_payment_code` = `h1`.`weaver_payment_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`vou_date` >= cast('2019-04-01' as date))) and h.weaver_payment_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`vou_no` AS `vh_no`,'Weaver Payment' AS `v_type`,`h`.`vou_date` AS `vh_date`,'Weaver Payment' AS `vh_prefix`,`h`.`vou_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h1`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'BEING WAGES PAID' AS `BEING WAGES PAID`,h.weaver_payment_code,"
								+ screenCode
								+ " reftype from ((`weaver_payment` `h` join `weaver_payment_det` `h1`) join `ledger_mast` `l1`) where ((`h1`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`weaver_payment_code` = `h1`.`weaver_payment_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`vou_date` >= cast('2019-04-01' as date))) and h.weaver_payment_code="
								+ saveData.get("code"));
			}
			if ("600046".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`vou_no` AS `vh_no`,'Expenses' AS `v_type`,`h`.`vou_date` AS `vh_date`,'Expenses' AS `vh_prefix`,`h`.`vou_no` AS `vh_seq_no`,`h1`.`ledger_code` AS `vd_ledger_code`,`h1`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.expenses_code,"
								+ screenCode
								+ " reftype from ((`expenses` `h` join `expenses_det` `h1`) join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`expenses_code` = `h1`.`expenses_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`vou_date` >= cast('2019-04-01' as date))) and h.expenses_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`vou_no` AS `vh_no`,'Expenses' AS `v_type`,`h`.`vou_date` AS `vh_date`,'Expenses' AS `vh_prefix`,`h`.`vou_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h1`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.expenses_code,"
								+ screenCode
								+ " reftype from ((`expenses` `h` join `expenses_det` `h1`) join `ledger_mast` `l1`) where ((`h1`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`expenses_code` = `h1`.`expenses_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`vou_date` >= cast('2019-04-01' as date))) and h.expenses_code="
								+ saveData.get("code"));
			}
			if ("600053".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`party_inv_no` AS `party_inv_no`,'Purchase' ,`p1`.`party_inv_date` AS `party_inv_date`,'Purchase' ,`p1`.`party_inv_no` AS `party_inv_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,`p1`.`cgst_amount` AS `cgst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_689`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`party_inv_date` >= cast('2019-04-01' as date)) and (`p1`.`cgst_amount` <> 0) and (`p1`.`transaction_type` = 'I') and (trim(`p1`.`party_inv_no`) <> '')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`party_inv_no` AS `party_inv_no`,'Purchase' ,`p1`.`party_inv_date` AS `party_inv_date`,'Purchase' ,`p1`.`party_inv_no` AS `party_inv_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,`p1`.`sgst_amount` AS `sgst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_702`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`party_inv_date` >= cast('2019-04-01' as date)) and (`p1`.`sgst_amount` <> 0) and (`p1`.`transaction_type` = 'I') and (trim(`p1`.`party_inv_no`) <> '')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`party_inv_no` AS `party_inv_no`,'Purchase' ,`p1`.`party_inv_date` AS `party_inv_date`,'Purchase' ,`p1`.`party_inv_no` AS `party_inv_no`,`account_settings`.`igst_ledger_code` AS `igst_ledger_code`,`p1`.`igst_amount` AS `igst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_715`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`party_inv_date` >= cast('2019-04-01' as date)) and (`p1`.`igst_amount` <> 0) and (`p1`.`transaction_type` = 'I') and (trim(`p1`.`party_inv_no`) <> '')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`party_inv_no` AS `party_inv_no`,'Purchase',`p1`.`party_inv_date` AS `party_inv_date`,'Purchase',`p1`.`party_inv_no` AS `party_inv_no`,`account_settings`.`purc_ledger_code` AS `purc_ledger_code`,(`p1`.`tot` - `p1`.`discount`) AS `tot-discount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_728`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`party_inv_date` >= cast('2019-04-01' as date)) and (`p1`.`tot` <> 0) and (`p1`.`transaction_type` = 'I') and (trim(`p1`.`party_inv_no`) <> '')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`party_inv_no` AS `party_inv_no`,'Purchase',`p1`.`party_inv_date` AS `party_inv_date`,'Purchase',`p1`.`party_inv_no` AS `party_inv_no`,`p1`.`ledger_code` AS `ledger_code`,0 AS `0`,`p1`.`total_amount` AS `total_amount`,'Y' AS `Y`,'Purchase A/c','' AS `Name_exp_740`,'' AS `Name_exp_741`,p1.inv_code,"
								+ screenCode
								+ " reftype from (`purc_inv` `p1` join `account_settings`) where ((ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`party_inv_date` >= cast('2019-04-01' as date)) and (`p1`.`total_amount` <> 0) and (`p1`.`transaction_type` = 'I') and (trim(`p1`.`party_inv_no`) <> '')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`inv_no` AS `inv_no`,'Purchase' ,`p1`.`inv_date` AS `inv_date`,'Purchase',`p1`.`inv_no` AS `inv_no`,`account_settings`.`cgst_ledger_code` AS `cgst_ledger_code`,`p1`.`cgst_amount` AS `cgst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_754`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`inv_date` >= cast('2019-04-01' as date)) and (`p1`.`cgst_amount` <> 0) and (`p1`.`transaction_type` = 'B')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`inv_no` AS `inv_no`,'Purchase',`p1`.`inv_date` AS `inv_date`,'Purchase',`p1`.`inv_no` AS `inv_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,`p1`.`sgst_amount` AS `sgst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_767`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`inv_date` >= cast('2019-04-01' as date)) and (`p1`.`sgst_amount` <> 0) and (`p1`.`transaction_type` = 'B')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`inv_no` AS `inv_no`,'Purchase',`p1`.`inv_date` AS `inv_date`,'Purchase' ,`p1`.`inv_no` AS `inv_no`,`account_settings`.`sgst_ledger_code` AS `sgst_ledger_code`,`p1`.`igst_amount` AS `igst_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_780`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`inv_date` >= cast('2019-04-01' as date)) and (`p1`.`igst_amount` <> 0) and (`p1`.`transaction_type` = 'B')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`inv_no` AS `inv_no`,'Purchase',`p1`.`inv_date` AS `inv_date`,'Purchase',`p1`.`inv_no` AS `inv_no`,`account_settings`.`purc_ledger_code` AS `purc_ledger_code`,(`p1`.`tot` - `p1`.`discount`) AS `tot-discount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_793`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`inv_date` >= cast('2019-04-01' as date)) and (`p1`.`tot` <> 0) and (`p1`.`transaction_type` = 'B')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`inv_no` AS `inv_no`,'Purchase',`p1`.`inv_date` AS `inv_date`,'Purchase',`p1`.`inv_no` AS `inv_no`,`p1`.`ledger_code` AS `ledger_code`,0 AS `0`,`p1`.`total_amount` AS `total_amount`,'Y' AS `Y`,'Purchase' AS `PURCHASE`,'' AS `Name_exp_805`,'' AS `Name_exp_806`,p1.inv_code,"
								+ screenCode
								+ " reftype from (`purc_inv` `p1` join `account_settings`) where ((ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`inv_date` >= cast('2019-04-01' as date)) and (`p1`.`total_amount` <> 0) and (`p1`.`transaction_type` = 'B')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`inv_no` AS `inv_no`,'Purchase',`p1`.`inv_date` AS `inv_date`,'Purchase',`p1`.`inv_no` AS `inv_no`,`a1`.`roundoff_ledger_code` AS `roundoff_ledger_code`,(case when (`p1`.`round_off` > 0) then `p1`.`round_off` else 0 end) AS `case when round_off>0 then round_off else 0 end`,(case when (`p1`.`round_off` < 0) then (`p1`.`round_off` * -(1)) else 0 end) AS `case when round_off<0 then round_off*-1 else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_936`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`inv_date` >= cast('2019-04-01' as date)) and (`p1`.`round_off` <> 0) and (`p1`.`transaction_type` = 'B')) and p1.inv_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`party_inv_no` AS `party_inv_no`,'Purchase',`p1`.`party_inv_date` AS `party_inv_date`,'Purchase',`p1`.`inv_no` AS `inv_no`,`a1`.`roundoff_ledger_code` AS `roundoff_ledger_code`,(case when (`p1`.`round_off` > 0) then `p1`.`round_off` else 0 end) AS `case when round_off>0 then round_off else 0 end`,(case when (`p1`.`round_off` < 0) then (`p1`.`round_off` * -(1)) else 0 end) AS `case when round_off<0 then round_off*-1 else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_949`,p1.inv_code,"
								+ screenCode
								+ " reftype from ((`purc_inv` `p1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`party_inv_date` >= cast('2019-04-01' as date)) and (`p1`.`round_off` <> 0) and (`p1`.`transaction_type` = 'I') and (trim(`p1`.`party_inv_no`) <> '')) and p1.inv_code="
								+ saveData.get("code"));
			}
			if ("600008".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Contra' AS `v_type`,`h`.`jou_date` AS `vh_date`,'S' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,`h1`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`contra` `h` join `contra_det` `h1`) join `ledger_mast` `l1`) where ((`h1`.`jou_code` = `h`.`jou_code`) and (`h1`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`tran_type` = 'D') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Contra' ,`h`.`jou_date` AS `vh_date`,'S' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h1`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`contra` `h` join `contra_det` `h1`) join `ledger_mast` `l1`) where ((`h1`.`jou_code` = `h`.`jou_code`) and (`h1`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`tran_type` = 'C') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Contra' ,`h`.`jou_date` AS `vh_date`,'S' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h1`.`ledger_code` AS `vd_ledger_code`,0 AS `vd_dramount`,`h1`.`amount` AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`contra` `h` join `contra_det` `h1`) join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`jou_code` = `h1`.`jou_code`) and (`h`.`tran_type` = 'D') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`jou_no` AS `vh_no`,'Contra' ,`h`.`jou_date` AS `vh_date`,'S' AS `vh_prefix`,`h`.`jou_no` AS `vh_seq_no`,`h1`.`ledger_code` AS `vd_ledger_code`,`h1`.`amount` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,`h1`.`narration` AS `narration`,h.jou_code,"
								+ screenCode
								+ " reftype from ((`contra` `h` join `contra_det` `h1`) join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (`h`.`jou_code` = `h1`.`jou_code`) and (`h`.`tran_type` = 'C') and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`jou_date` >= cast('2019-04-01' as date))) and h.jou_code="
								+ saveData.get("code"));
			}
			if ("600010".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `h`.`c_code` AS `branchcode`,`h`.`bill_no` AS `vh_no`,'Purchase Return' ,`h`.`bill_date` AS `vh_date`,'Purchase Return' AS `vh_prefix`,`h`.`bill_no` AS `vh_seq_no`,`h`.`ledger_code` AS `vd_ledger_code`,`h`.`total_amt` AS `vd_dramount`,0 AS `vd_cramount`,'Y' AS `vh_status`,'Purchase Return' AS `ledger_name`,'' AS `branch`,'' AS `narration`,h.invoice_code refcode,"
								+ screenCode
								+ " reftype from (`purc_ret` `h` join `ledger_mast` `l1`) where ((`h`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`h`.`status`,'N') <> 'C') and (`h`.`bill_date` >= cast('2019-04-01' as date))) and h.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Purchase Return' ,`f1`.`bill_date` AS `bill_date`,'Purchase Return' AS `SALES`,`f1`.`bill_no` AS `bill_no`,`a1`.`cgst_ledger_code` AS `cgst_ledger_code`,0 AS `0`,`f1`.`cgst_amount` AS `cgst_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_286`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`purc_ret` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Purchase Return' ,`f1`.`bill_date` AS `bill_date`,'Purchase Return' AS `SALES`,`f1`.`bill_no` AS `bill_no`,`a1`.`sgst_ledger_code` AS `sgst_ledger_code`,0 AS `0`,`f1`.`sgst_amount` AS `sgst_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_299`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`purc_ret` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Purchase Return' ,`f1`.`bill_date` AS `bill_date`,'Purchase Return' AS `SALES`,`f1`.`bill_no` AS `bill_no`,`a1`.`igst_ledger_code` AS `igst_ledger_code`,0 AS `0`,`f1`.`igst_amount` AS `igst_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_312`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`purc_ret` `f1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Purchase Return' ,`f1`.`bill_date` AS `bill_date`,'Purchase Return' AS `S`,`f1`.`bill_no` AS `bill_no`,`account_settings`.`sales_ledger_code` AS `SALES_ledger_code`,0 AS `0`,(sum(`f2`.`amount`) - `f1`.`discount`) AS `sum(amount)-discount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_611`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from (((`purc_ret` `f1` join `purc_ret_det` `f2`) join `account_settings`) join `ledger_mast` `l1`) where ((`f1`.`invoice_code` = `f2`.`invoice_code`) and (`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code")
								+ " group by `f1`.`c_code`,`f1`.`bill_no`,`f1`.`bill_date`,`account_settings`.`sales_ledger_code`,`f1`.`discount`,`l1`.`ledger_name` ");
				strQuery.append(" union all ");
				strQuery.append(
						"select `f1`.`c_code` AS `c_code`,`f1`.`bill_no` AS `bill_no`,'Purchase Return' ,`f1`.`bill_date` AS `bill_date`,'Purchase Return' AS `S`,`f1`.`bill_no` AS `bill_no`,`account_settings`.`freight_outward_ledger_code` AS `freight_outward_ledger_code`,0 AS `0`,`f1`.`courier_charges` AS `courier_charges`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_637`,f1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`purc_ret` `f1` join `account_settings`) join `ledger_mast` `l1`) where ((`f1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`f1`.`status`,'N') <> 'C') and (`f1`.`paid_to_pay` = 'P') and (`f1`.`courier_charges` <> 0) and (`f1`.`bill_date` >= cast('2019-04-01' as date))) and f1.invoice_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `p1`.`c_code` AS `c_code`,`p1`.`bill_no` AS `bill_no`,'Purchase Return' ,`p1`.`bill_date` AS `bill_date`,'Purchase Return' AS `SALES`,`p1`.`bill_no` AS `bill_no`,`a1`.`roundoff_ledger_code` AS `roundoff_ledger_code`,(case when (`p1`.`round_off` < 0) then (`p1`.`round_off` * -(1)) else 0 end) AS `case when round_off<0 then round_off*-1 else 0 end`,(case when (`p1`.`round_off` > 0) then `p1`.`round_off` else 0 end) AS `case when round_off>0 then round_off else 0 end`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_988`,p1.invoice_code refcode,"
								+ screenCode
								+ " reftype from ((`purc_ret` `p1` join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`p1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`p1`.`status`,'N') <> 'C') and (`p1`.`bill_date` >= cast('2019-04-01' as date)) and (`p1`.`round_off` <> 0)) and p1.invoice_code="
								+ saveData.get("code"));
			}
			if ("600052".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `a1`.`c_code` AS `c_code`,`a1`.`advance_no` AS `advance_no`,'Advance' AS `Advance`,`a1`.`advance_date` AS `advance_date`,'Advance' AS `Advance`,`a1`.`advance_no` AS `advance_no`,`a1`.`ledger_code` AS `ledger_code`,`a1`.`amount` AS `amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1066`,a1.advance_code,"
								+ screenCode
								+ " reftype from (`advance` `a1` join `ledger_mast` `l1`) where ((`a1`.`party_ledger_code` = `l1`.`ledger_code`) and (ifnull(`a1`.`status`,'N') <> 'C') and (`a1`.`advance_date` >= cast('2019-04-01' as date)) and (`a1`.`amount` <> 0) and (`a1`.`advance_type` = 'R')) and a1.advance_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `a1`.`c_code` AS `c_code`,`a1`.`advance_no` AS `advance_no`,'Advance' AS `Advance`,`a1`.`advance_date` AS `advance_date`,'Advance' AS `Advance`,`a1`.`advance_no` AS `advance_no`,`a1`.`party_ledger_code` AS `party_ledger_code`,0 AS `0`,`a1`.`amount` AS `amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1079`,a1.advance_code,"
								+ screenCode
								+ " reftype from (`advance` `a1` join `ledger_mast` `l1`) where ((`a1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`a1`.`status`,'N') <> 'C') and (`a1`.`advance_date` >= cast('2019-04-01' as date)) and (`a1`.`amount` <> 0) and (`a1`.`advance_type` = 'R')) and a1.advance_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `a1`.`c_code` AS `c_code`,`a1`.`advance_no` AS `advance_no`,'Advance' AS `Advance`,`a1`.`advance_date` AS `advance_date`,'Advance' AS `Advance`,`a1`.`advance_no` AS `advance_no`,`a1`.`ledger_code` AS `ledger_code`,0 AS `0`,`a1`.`amount` AS `amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1092`,a1.advance_code,"
								+ screenCode
								+ " reftype from (`advance` `a1` join `ledger_mast` `l1`) where ((`a1`.`party_ledger_code` = `l1`.`ledger_code`) and (ifnull(`a1`.`status`,'N') <> 'C') and (`a1`.`advance_date` >= cast('2019-04-01' as date)) and (`a1`.`amount` <> 0) and (`a1`.`advance_type` = 'I')) and a1.advance_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `a1`.`c_code` AS `c_code`,`a1`.`advance_no` AS `advance_no`,'Advance' AS `Advance`,`a1`.`advance_date` AS `advance_date`,'Advance' AS `Advance`,`a1`.`advance_no` AS `advance_no`,`a1`.`party_ledger_code` AS `party_ledger_code`,`a1`.`amount` AS `amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1105`,a1.advance_code,"
								+ screenCode
								+ " reftype from (`advance` `a1` join `ledger_mast` `l1`) where ((`a1`.`ledger_code` = `l1`.`ledger_code`) and (ifnull(`a1`.`status`,'N') <> 'C') and (`a1`.`advance_date` >= cast('2019-04-01' as date)) and (`a1`.`amount` <> 0) and (`a1`.`advance_type` = 'I')) and a1.advance_code="
								+ saveData.get("code"));
			}
			if ("600055".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `r1`.`c_code` AS `c_code`,`r1`.`mapping_no` AS `mapping_no`,'Receipt' AS `R`,`r1`.`mapping_date` AS `mapping_date`,'Receipt' AS `R`,`r1`.`mapping_no` AS `mapping_no`,`r1`.`exp_ledger_code` AS `exp_ledger_code`,`r1`.`exp_amount` AS `exp_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1118`,r1.mapping_code,"
								+ screenCode
								+ " reftype from (`advance_mapping` `r1` join `ledger_mast` `l1`) where ((`r1`.`ledger_code` = `l1`.`ledger_code`) and (`r1`.`exp_amount` <> 0) and (ifnull(`r1`.`status`,'N') <> 'C') and (`r1`.`advance_type` = 'R')) and r1.mapping_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `r1`.`c_code` AS `c_code`,`r1`.`mapping_no` AS `mapping_no`,'Receipt' AS `R`,`r1`.`mapping_date` AS `mapping_date`,'Receipt' AS `R`,`r1`.`mapping_no` AS `mapping_no`,`r1`.`exp_ledger_code` AS `exp_ledger_code`,0 AS `0`,`r1`.`exp_amount` AS `exp_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1131`,r1.mapping_code,"
								+ screenCode
								+ " reftype from (`advance_mapping` `r1` join `ledger_mast` `l1`) where ((`r1`.`ledger_code` = `l1`.`ledger_code`) and (`r1`.`exp_amount` <> 0) and (ifnull(`r1`.`status`,'N') <> 'C') and (`r1`.`advance_type` = 'I')) and r1.mapping_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `r1`.`c_code` AS `c_code`,`r1`.`mapping_no` AS `mapping_no`,'Receipt' AS `R`,`r1`.`mapping_date` AS `mapping_date`,'Receipt' AS `R`,`r1`.`mapping_no` AS `mapping_no`,`r1`.`exp2_ledger_code` AS `exp2_ledger_code`,`r1`.`exp2_amount` AS `exp2_amount`,0 AS `0`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1144`,r1.mapping_code,"
								+ screenCode
								+ " reftype from (`advance_mapping` `r1` join `ledger_mast` `l1`) where ((`r1`.`ledger_code` = `l1`.`ledger_code`) and (`r1`.`exp2_amount` <> 0) and (ifnull(`r1`.`status`,'N') <> 'C') and (`r1`.`advance_type` = 'R')) and r1.mapping_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `r1`.`c_code` AS `c_code`,`r1`.`mapping_no` AS `mapping_no`,'Receipt' AS `R`,`r1`.`mapping_date` AS `mapping_date`,'Receipt' AS `R`,`r1`.`mapping_no` AS `mapping_no`,`r1`.`exp2_ledger_code` AS `exp2_ledger_code`,0 AS `0`,`r1`.`exp2_amount` AS `exp2_amount`,'Y' AS `Y`,`l1`.`ledger_name` AS `ledger_name`,`l1`.`branch` AS `branch`,'' AS `Name_exp_1157`,r1.mapping_code,"
								+ screenCode
								+ " reftype from (`advance_mapping` `r1` join `ledger_mast` `l1`) where ((`r1`.`ledger_code` = `l1`.`ledger_code`) and (`r1`.`exp2_amount` <> 0) and (ifnull(`r1`.`status`,'N') <> 'C') and (`r1`.`advance_type` = 'I')) and r1.mapping_code="
								+ saveData.get("code"));
			}
			if ("600056".equals(screenCode)) {
				strQuery.append(
						"insert into voucher_detail(branchcode,vh_no,v_type,vh_date,vh_prefix,vh_seq_no,vd_ledger_code,vd_dramount,vd_cramount,vh_status,ledger_name,branch,narration,vh_ref_code,vh_ref_type)");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Salary' ,`s1`.`pay_date` AS `pay_date`,'Salary' ,`s1`.`pay_no` AS `pay_no`,`a1`.`salary_ledger_code` AS `salary_ledger_code`,`s2`.`salary` AS `salary`,0 AS `0`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`s1`.`ledger_code` = `l1`.`ledger_code`) and (`s2`.`salary` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'W.Beta' ,`s1`.`pay_date` AS `pay_date`,'W.Beta' ,`s1`.`pay_no` AS `pay_no`,`a1`.`beta_ledger_code` AS `beta_ledger_code`,`s2`.`beta` AS `beta`,0 AS `0`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`s1`.`ledger_code` = `l1`.`ledger_code`) and (`s2`.`beta` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,Incentive AS `INCENTIVE`,`s1`.`pay_date` AS `pay_date`,Incentive ,`s1`.`pay_no` AS `pay_no`,`a1`.`incentive_ledger_code` AS `incentive_ledger_code`,`s2`.`incentive` AS `incentive`,0 AS `0`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`s1`.`ledger_code` = `l1`.`ledger_code`) and (`s2`.`incentive` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Bonus' ,`s1`.`pay_date` AS `pay_date`,'Bonus' ,`s1`.`pay_no` AS `pay_no`,`a1`.`bonus_ledger_code` AS `bonus_ledger_code`,`s2`.`bonus` AS `bonus`,0 AS `0`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`s1`.`ledger_code` = `l1`.`ledger_code`) and (`s2`.`bonus` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Adv.Paid',`s1`.`pay_date` AS `pay_date`,'Adv.Paid' ,`s1`.`pay_no` AS `pay_no`,`a1`.`advance_ledger_code` AS `advance_ledger_code`,`s2`.`advance` AS `advance`,0 AS `0`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`s1`.`ledger_code` = `l1`.`ledger_code`) and (`s2`.`advance` > 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Adv.Paid',`s1`.`pay_date` AS `pay_date`,'ADV.DED' ,`s1`.`pay_no` AS `pay_no`,`a1`.`advance_ledger_code` AS `advance_ledger_code`,0 AS `0`,(`s2`.`advance` * -(1)) AS `s2.advance*-1`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`s1`.`ledger_code` = `l1`.`ledger_code`) and (`s2`.`advance` < 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Salary' AS `Salary`,`s1`.`pay_date` AS `pay_date`,'Salary' ,`s1`.`pay_no` AS `pay_no`,`s1`.`ledger_code` AS `ledger_code`,0 AS `0`,`s2`.`salary` AS `salary`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`a1`.`salary_ledger_code` = `l1`.`ledger_code`) and (`s2`.`salary` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'W.Beta' ,`s1`.`pay_date` AS `pay_date`,'W.Beta' ,`s1`.`pay_no` AS `pay_no`,`s1`.`ledger_code` AS `ledger_code`,0 AS `0`,`s2`.`beta` AS `beta`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`a1`.`beta_ledger_code` = `l1`.`ledger_code`) and (`s2`.`beta` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Incentive' ,`s1`.`pay_date` AS `pay_date`,Incentive ,`s1`.`pay_no` AS `pay_no`,`s1`.`ledger_code` AS `ledger_code`,0 AS `0`,`s2`.`incentive` AS `incentive`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`a1`.`incentive_ledger_code` = `l1`.`ledger_code`) and (`s2`.`incentive` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Bonus' ,`s1`.`pay_date` AS `pay_date`,'Bonus' ,`s1`.`pay_no` AS `pay_no`,`s1`.`ledger_code` AS `ledger_code`,0 AS `0`,`s2`.`bonus` AS `bonus`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`a1`.`bonus_ledger_code` = `l1`.`ledger_code`) and (`s2`.`bonus` <> 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Adv.Paid' ,`s1`.`pay_date` AS `pay_date`,'Adv.Paid' ,`s1`.`pay_no` AS `pay_no`,`s1`.`ledger_code` AS `ledger_code`,0 AS `0`,`s2`.`advance` AS `advance`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`a1`.`advance_ledger_code` = `l1`.`ledger_code`) and (`s2`.`advance` > 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
				strQuery.append(" union all ");
				strQuery.append(
						"select `s1`.`c_code` AS `c_code`,`s1`.`pay_no` AS `pay_no`,'Adv.Paid' ,`s1`.`pay_date` AS `pay_date`,'Adv.Paid' ,`s1`.`pay_no` AS `pay_no`,`s1`.`ledger_code` AS `ledger_code`,(`s2`.`advance` * -(1)) AS `s2.advance*-1`,0 AS `0`,'Y' AS `Y`,concat(`l1`.`ledger_name`,', ( ',`e1`.`emp_name`,' )') AS `concat(ledger_name,', ( ' , emp_name ,' )')`,`l1`.`branch` AS `branch`,`s1`.`notes` AS `notes`,s1.salary_code,"
								+ screenCode
								+ " reftype  from ((((`salary` `s1` join `salary_det` `s2`) join `emp_det` `e1`) join `ledger_mast` `l1`) join `account_settings` `a1`) where ((`s1`.`salary_code` = `s2`.`salary_code`) and (`s2`.`emp_det_code` = `e1`.`emp_det_code`) and (`a1`.`advance_ledger_code` = `l1`.`ledger_code`) and (`s2`.`advance` < 0) and (ifnull(`s1`.`status`,'N') <> 'C')) and s1.salary_code="
								+ saveData.get("code"));
			}
			System.out.println(strQuery.toString());
			pstmt = conn.prepareStatement(strQuery.toString());
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = null;
		} catch (Exception e) {
			result = "Error in voucher  posting " + e.getMessage();
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