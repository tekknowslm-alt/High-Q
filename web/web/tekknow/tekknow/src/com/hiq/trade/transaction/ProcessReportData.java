package com.hiq.trade.transaction;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.DriverManager;
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
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.core.mail.PushMail;
import com.core.report.ReportProcessInterface;
import com.core.ui.SaveMasterInterface;
import com.core.ui.SaveMasters;
import com.core.util.AjaxResponseUtil;
import com.core.util.CurrentTenantUtil;
import com.core.util.DatabaseUtil;
import com.itextpdf.text.DocumentException;

public class ProcessReportData implements ReportProcessInterface {
	public String processReportData(Connection conn, String reportId, Map<String, String> reportParameters) {
		PreparedStatement pstmt = null;
		PreparedStatement updStatement = null;
		PreparedStatement updBillNo = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsDetail = null;
		String result = "Success";
		System.out.println("Reportid:---" + reportId);
		try {
			if ("900027".equals(reportId)) {
				String fromdate = reportParameters.get("fromdate");
				String todate = reportParameters.get("todate");
				String c_code = reportParameters.get("companycode");
				String reptype = reportParameters.get("reptype");
				stmt = conn.createStatement();
				stmt.execute(
						"create temporary table if not exists profitandlossfinal(exgroupname varchar(100) default '',exledgername varchar(100) default '',examount varchar(20) default '',exord int,exrowtype int,exgroup int default 0,ingroupname varchar(100) default '',inledgername varchar(100) default '',inamount varchar(20) default '',inord int,inrowtype int,ingroup int default 0,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists profitandlossexp(groupname varchar(100),ledgername varchar(100),amount numeric(18,2),ord int,rowtype int,isgroup int,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists profitandlossinc(groupname varchar(100),ledgername varchar(100),amount numeric(18,2),ord int,rowtype int,isgroup int,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists profitandloss(groupname varchar(100),ledgername varchar(100),amount numeric(18,2),ord int,rowtype int)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists profitandlossgroup(groupname varchar(100),ledgername varchar(100),amount numeric(18,2),ord int,rowtype int)Engine=InnoDB");
				stmt.execute("truncate table profitandlossfinal");
				stmt.execute("truncate table profitandlossexp");
				stmt.execute("truncate table profitandlossinc");
				stmt.execute("truncate table profitandloss");
				stmt.execute("truncate table profitandlossgroup");
				stmt.close();
				stmt = null;
				stmt = conn.createStatement();
				StringBuilder qry = new StringBuilder(100);
				qry.append("insert into profitandloss(ord,ledgername,amount,groupname,rowtype) ");
				qry.append("SELECT 6  as ord, ledger_mast.ledger_name,");
				qry.append(" ifnull(sum(vd_dramount)-sum(vd_cramount),0) as cl_bal,");
				qry.append(" group_name, 1 ");
				qry.append(" FROM ledger_mast, view_vouchers, group_mast");
				qry.append(" WHERE (group_mast.group_code = ledger_mast.group_code) and");
				qry.append(" (ledger_mast.ledger_code= view_vouchers.vd_ledger_code) and ");
				qry.append(" (group_mast.acc_type in ('DE','DI')  )  and date(vh_date)>=date('");
				qry.append(fromdate);
				qry.append("') and date(vh_date)<=date('");
				qry.append(todate);
				qry.append("') and branchcode=" + c_code
						+ " group by ledger_name,group_name  having ifnull(sum(vd_dramount)-sum(vd_cramount),0) >0 ");
				qry.append(" union all ");
				qry.append(
						" select 2, 'Opening Stock',  ifnull(op_stock_value,0),'Stock in Hand',1  from cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
								+ c_code
								+ " and c1.from_date=(select max(c3.from_date) from cl_stock_det c3,cl_stock c4,fin_date where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.from_date between fin_date.from_date and fin_date.to_date)");
				System.out.println(qry);
				stmt.executeUpdate(qry.toString());

				qry.setLength(0);
				qry.append("insert into profitandloss(ord,ledgername,amount,groupname,rowtype) ");
				qry.append("SELECT 6  as ord, ledger_mast.ledger_name,");
				qry.append(" ifnull(sum(vd_dramount)-sum(vd_cramount),0) as cl_bal,");
				qry.append(" group_name, 2 ");
				qry.append(" FROM ledger_mast, view_vouchers, group_mast");
				qry.append(" WHERE (group_mast.group_code = ledger_mast.group_code) and");
				qry.append(" (ledger_mast.ledger_code= view_vouchers.vd_ledger_code) and ");
				qry.append(" (group_mast.acc_type in ('DE','DI')  )  and vh_date>=date('");
				qry.append(fromdate);
				qry.append("') and date(vh_date)<=date('");
				qry.append(todate);
				qry.append("') and branchcode=" + c_code
						+ " group by ledger_name,group_name  having ifnull(sum(vd_dramount)-sum(vd_cramount),0) <0 ");
				qry.append(" union all ");
				qry.append(
						" select 7, 'Closing Stock',  case when ifnull(cl_stock_value,0)>0 then ifnull(cl_stock_value,0)*-1 else ifnull(op_stock_value,0)*-1 end ,'Stock in Hand',2  from cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
								+ c_code
								+ " and c1.from_date=(select max(c3.from_date) from cl_stock_det c3,cl_stock c4,fin_date where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.from_date between fin_date.from_date and fin_date.to_date)");

				stmt.executeUpdate(qry.toString());

				qry.setLength(0);
				qry.append("insert into profitandloss(ord,ledgername,amount,groupname,rowtype) ");
				qry.append("SELECT 6  as ord, ledger_mast.ledger_name,");
				qry.append(" ifnull(sum(vd_dramount)-sum(vd_cramount),0) as cl_bal,");
				qry.append(" group_name, 3 ");
				qry.append(" FROM ledger_mast, view_vouchers, group_mast");
				qry.append(" WHERE (group_mast.group_code = ledger_mast.group_code) and");
				qry.append(" (ledger_mast.ledger_code= view_vouchers.vd_ledger_code) and ");
				qry.append(" (group_mast.acc_type in ('IE','II')  )  and date(vh_date)>=date('");
				qry.append(fromdate);
				qry.append("') and date(vh_date)<=date('");
				qry.append(todate);
				qry.append("') and branchcode=" + c_code
						+ " group by ledger_name,group_name  having ifnull(sum(vd_dramount)-sum(vd_cramount),0) >0 ");
				stmt.executeUpdate(qry.toString());

				qry.setLength(0);
				qry.append("insert into profitandloss(ord,ledgername,amount,groupname,rowtype) ");
				qry.append("SELECT 6  as ord, ledger_mast.ledger_name,");
				qry.append(" ifnull(sum(vd_dramount)-sum(vd_cramount),0) as cl_bal,");
				qry.append(" group_name, 4 ");
				qry.append(" FROM ledger_mast, view_vouchers, group_mast");
				qry.append(" WHERE (group_mast.group_code = ledger_mast.group_code) and");
				qry.append(" (ledger_mast.ledger_code= view_vouchers.vd_ledger_code) and ");
				qry.append(" (group_mast.acc_type in ('IE','II')  )  and date(vh_date)>=date('");
				qry.append(fromdate);
				qry.append("') and date(vh_date)<=date('");
				qry.append(todate);
				qry.append("') and branchcode=" + c_code
						+ " group by ledger_name,group_name  having ifnull(sum(vd_dramount)-sum(vd_cramount),0) <0 ");
				stmt.executeUpdate(qry.toString());

				qry.setLength(0);
				qry.append("insert into profitandlossgroup(groupname,ord,ledgername,amount,rowtype) ");
				qry.append(
						"select groupname,ord,groupname,round(sum(amount),2),rowtype from profitandloss group by ord,groupname,rowtype ");
				stmt.executeUpdate(qry.toString());

				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append(
						"select sum(case when rowtype in (1,2) then round(amount,2) else 0 end) GrossProfitLoss from profitandlossgroup");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				double grossProfitLoss = 0.00;
				if (rs.next()) {
					grossProfitLoss = rs.getDouble("GrossProfitLoss");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("insert into profitandloss(groupname,ord,ledgername,amount,rowtype) ");
				if (grossProfitLoss <= 0) {
					qry.append("values('Gross Profit',999,'Gross Profit',round(?*(-1),2),1)");
				} else {
					qry.append("values('Gross Loss',999,'Gross Loss',round(?*(-1),2),2)");
				}

				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, grossProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append("insert into profitandlossgroup(groupname,ord,ledgername,amount,rowtype) ");
				qry.append(
						"select 'Gross Total',1000,'Gross Total',round(sum(amount),2),rowtype from profitandloss where rowtype in (1,2) group by rowtype  ");
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append(
						"select sum(case when rowtype in (3,4) then round(amount,2) else 0 end)+? NetProfitLoss from profitandlossgroup ");
				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, grossProfitLoss);
				rs = updStatement.executeQuery();
				double netProfitLoss = 0.00;
				if (rs.next()) {
					netProfitLoss = rs.getDouble("NetProfitLoss");
				}
				rs.close();
				updStatement.close();
				updStatement = null;

				qry.setLength(0);
				qry.append("insert into profitandloss(groupname,ord,ledgername,amount,rowtype) ");
				if (netProfitLoss <= 0) {
					qry.append("values('Net Profit',999,'Net Profit',round(?*(-1),2),3)");
				} else {
					qry.append("values('Net Loss',999,'Net Loss',round(?*(-1),2),4)");
				}
				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, netProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append("insert into profitandlossgroup(groupname,ord,ledgername,amount,rowtype) ");
				qry.append(
						"select 'Net Total',1000,'Net Total',round(sum(amount),2),rowtype from profitandloss where rowtype in (3,4) group by rowtype  ");
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append("insert into profitandlossexp(groupname,ord,ledgername,amount,rowtype,isgroup) ");
				if ("S".equals(reptype)) {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2) amount,rowtype,1 grp from profitandlossgroup where rowtype=1 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc, ledgername asc");
				} else {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2) amount,rowtype,1 grp from profitandlossgroup where rowtype=1 and ord not in (999,1000) union all select groupname,ord,ledgername,round(abs(amount),2),rowtype,0 grp from profitandloss where rowtype=1 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc, ledgername asc");
				}
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append("insert into profitandlossinc(groupname,ord,ledgername,amount,rowtype,isgroup) ");
				if ("S".equals(reptype)) {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2) amount,rowtype,1 grp from profitandlossgroup where rowtype=2 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc, ledgername asc");
				} else {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2) amount,rowtype,1 grp from profitandlossgroup where rowtype=2 and ord not in (999,1000) union all select groupname,ord,ledgername,round(abs(amount),2),rowtype,0 grp from profitandloss where rowtype=2 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc, ledgername asc");
				}
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("select count('x') cnt from profitandlossexp ");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				int pc = 0;
				if (rs.next()) {
					pc = rs.getInt("cnt");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("select count('x') cnt from profitandlossinc ");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				int ic = 0;
				if (rs.next()) {
					ic = rs.getInt("cnt");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append(
						"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup,ingroupname,inledgername,inamount,inord,inrowtype,ingroup)");
				if (pc > ic) {
					qry.append(
							"select e.groupname,e.ledgername,round(e.amount,2),e.ord,e.rowtype,e.isgroup,ifnull(i.groupname,''),ifnull(i.ledgername,''),ifnull(round(i.amount,2),''),ifnull(i.ord,1001),ifnull(i.rowtype,2),ifnull(i.isgroup,0) ");
					qry.append(" from profitandlossexp e left join profitandlossinc i on e.sno=i.sno ");
				} else {
					qry.append(
							"select ifnull(e.groupname,''),ifnull(e.ledgername,''),ifnull(round(e.amount,2),''),ifnull(e.ord,1001),ifnull(e.rowtype,1),ifnull(e.isgroup,0),i.groupname,i.ledgername,round(i.amount,2),i.ord,i.rowtype,i.isgroup ");
					qry.append(" from profitandlossinc i left join profitandlossexp e on e.sno=i.sno ");
				}
				stmt = conn.createStatement();
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				if (grossProfitLoss <= 0) {
					qry.append(
							"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup) ");
					qry.append("values('Gross Profit','Gross Profit',round(?*(-1),2),999,1,3)");
				} else {
					qry.append(
							"insert into profitandlossfinal(ingroupname,inledgername,inamount,inord,inrowtype,ingroup) ");
					qry.append("values('Gross Loss','Gross Loss',round(?*(-1),2),999,2,3)");
				}
				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, grossProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				qry.setLength(0);
				qry.append(
						"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup,ingroupname,inledgername,inamount,inord,inrowtype,ingroup)");
				qry.append(
						"select '','',abs(sum(case when rowtype=1 then round(e.amount,2) else 0 end)) amount,1000 ord,1 rowtype,2,'','',abs(sum(case when rowtype=2 then round(e.amount,2) else 0 end)) amount,1000 ord,1 rowtype,2 ");
				qry.append(" from profitandlossgroup e where e.rowtype in (1,2) and e.ord=1000 ");
				stmt = conn.createStatement();
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				if (grossProfitLoss >= 0) {
					qry.append(
							"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup) ");
					qry.append("values('Gross Profit','Gross Profit',round(?*(-1),2),999,1,3)");
				} else {
					qry.append(
							"insert into profitandlossfinal(ingroupname,inledgername,inamount,inord,inrowtype,ingroup) ");
					qry.append("values('Gross Profit','Gross Profit',round(?*(-1),2),999,2,3)");
				}
				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, grossProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				// Indirect
				stmt = conn.createStatement();
				stmt.execute("truncate table profitandlossexp");
				stmt.execute("truncate table profitandlossinc");
				qry.setLength(0);
				qry.append("insert into profitandlossexp(groupname,ord,ledgername,amount,rowtype,isgroup) ");
				if ("S".equals(reptype)) {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2),rowtype,1 grp from profitandlossgroup where rowtype=3 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				} else {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2),rowtype,1 grp from profitandlossgroup where rowtype=3 and ord not in (999,1000) union all select groupname,ord,ledgername,round(abs(amount),2),rowtype,0 grp from profitandloss where rowtype=3 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				}
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append("insert into profitandlossinc(groupname,ord,ledgername,amount,rowtype,isgroup) ");
				if ("S".equals(reptype)) {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2),rowtype,1 grp from profitandlossgroup where rowtype=4 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				} else {
					qry.append(
							"select groupname,ord,ledgername,round(abs(amount),2),rowtype,1 grp from profitandlossgroup where rowtype=4 and ord not in (999,1000) union all select groupname,ord,ledgername,round(abs(amount),2),rowtype,0 grp from profitandloss where rowtype=4 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				}
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("select count('x') cnt from profitandlossexp ");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				pc = 0;
				if (rs.next()) {
					pc = rs.getInt("cnt");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("select count('x') cnt from profitandlossinc ");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				ic = 0;
				if (rs.next()) {
					ic = rs.getInt("cnt");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append(
						"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup,ingroupname,inledgername,inamount,inord,inrowtype,ingroup)");
				if (pc > ic) {
					qry.append(
							"select e.groupname,e.ledgername,e.amount,e.ord,e.rowtype,e.isgroup,ifnull(i.groupname,''),ifnull(i.ledgername,''),ifnull(round(i.amount,2),''),ifnull(i.ord,1001),ifnull(i.rowtype,2),ifnull(i.isgroup,0) ");
					qry.append(" from profitandlossexp e left join profitandlossinc i on e.sno=i.sno ");
				} else {
					qry.append(
							"select ifnull(e.groupname,''),ifnull(e.ledgername,''),ifnull(round(e.amount,2),''),ifnull(e.ord,1001),ifnull(e.rowtype,1),ifnull(e.isgroup,0),i.groupname,i.ledgername,round(i.amount,2),i.ord,i.rowtype,i.isgroup ");
					qry.append(" from profitandlossinc i left join profitandlossexp e on e.sno=i.sno ");
				}
				stmt = conn.createStatement();
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				if (netProfitLoss <= 0) {
					qry.append(
							"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup) ");
					qry.append("values('Net Profit','Net Profit',round(abs(?*(-1)),2),999,1,3)");
				} else {
					qry.append(
							"insert into profitandlossfinal(ingroupname,inledgername,inamount,inord,inrowtype,ingroup) ");
					qry.append("values('Net Loss','Net Loss',round(abs(?*(-1)),2),999,2,3)");
				}
				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, netProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				qry.setLength(0);
				qry.append(
						"insert into profitandlossfinal(exgroupname,exledgername,examount,exord,exrowtype,exgroup,ingroupname,inledgername,inamount,inord,inrowtype,ingroup)");
				qry.append(
						"select '','',abs(sum(case when rowtype=3 then round(e.amount,2) else 0 end)+?) amount,1000 ord,1 rowtype,2,'','',abs(sum(case when rowtype=4 then round(e.amount,2) else 0 end)+?) amount,1000 ord,1 rowtype,2 ");
				qry.append(" from profitandlossgroup e where e.rowtype in (3,4) and e.ord=1000 ");
				PreparedStatement pstmttotal = conn.prepareStatement(qry.toString());
				if (grossProfitLoss >= 0) {
					pstmttotal.setDouble(1, grossProfitLoss);
					pstmttotal.setDouble(2, 0);
				} else {
					pstmttotal.setDouble(1, 0);
					pstmttotal.setDouble(2, grossProfitLoss);
				}
				pstmttotal.executeUpdate();
				stmt.close();
				stmt = null;

				/*
				 * stmt=conn.createStatement(); rs=stmt.executeQuery(
				 * "select * from profitandlossfinal order by sno"); while(rs.next()){
				 * System.out.println(rs.getString("exgroupname" )+" "+rs.getString
				 * ("exledgername")+" "+rs.getString("examount" )+" "+rs.getString
				 * ("ingroupname")+" "+rs.getString("inledgername"
				 * )+" "+rs.getString("inamount")+" "+rs.getString("ingroup")); }
				 */
			} else if ("900028".equals(reportId)) {
				String todate = reportParameters.get("todate");
				String c_code = reportParameters.get("companycode");
				String reptype = reportParameters.get("reptype");

				stmt = conn.createStatement();
				stmt.execute(
						"create temporary table if not exists balancesheetfinal(lgroupname varchar(100) default '',lledgername varchar(100) default '',lbranch varchar(80) default '',lamount varchar(20) default '',ldrcr varchar(2) default '',lord int,lrowtype int,lgroup int default 0,agroupname varchar(100) default '',aledgername varchar(100) default '',abranch varchar(80) default '',aamount varchar(20) default '',adrcr varchar(2) default '',aord int,arowtype int,agroup int default 0,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists balancesheetliab(groupname varchar(100),ledgername varchar(100),branch varchar(80),amount numeric(18,2),drcr varchar(2),ord int,rowtype int,isgroup int,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists balancesheetasset(groupname varchar(100),ledgername varchar(100),branch varchar(80),amount numeric(18,2),drcr varchar(2),ord int,rowtype int,isgroup int,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists balancesheet(groupname varchar(100),ledgername varchar(100),branch varchar(80),amount numeric(18,2),drcr varchar(2),ord int,rowtype int)Engine=InnoDB");
				stmt.execute(
						"create temporary table if not exists balancesheetgroup(groupname varchar(100),ledgername varchar(100),amount numeric(18,2),ord int,rowtype int)Engine=InnoDB");

				stmt.execute("truncate table balancesheetfinal");
				stmt.execute("truncate table balancesheetliab");
				stmt.execute("truncate table balancesheetasset");
				stmt.execute("truncate table balancesheet");
				stmt.execute("truncate table balancesheetgroup");

				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				StringBuilder qry = new StringBuilder(100);
				qry.append("insert into balancesheet(ord,ledgername,branch,amount,drcr,groupname,rowtype) ");
				qry.append(
						"SELECT 1 as ord,ledger_mast.ledger_name,ifnull(ledger_mast.branch,''), ifnull(sum(vd_dramount)-sum(vd_cramount),0) as cl_bal,case when ifnull(sum(vd_dramount)-sum(vd_cramount),0)>0 then 'Dr' when  ifnull(sum(vd_dramount)-sum(vd_cramount),0)=0 then '' else 'Cr' end, group_name, 1 ");
				qry.append("FROM ledger_mast,group_mast,view_vouchers as t1  WHERE ( group_mast.group_code =");
				qry.append(" ledger_mast.group_code) and ledger_mast.ledger_code = t1.vd_ledger_code and ");
				qry.append(" group_mast.acc_type in('L') and date(vh_date)<=date('");
				qry.append(todate);
				qry.append("') and branchcode=" + c_code
						+ " group by ledger_mast.ledger_name,ledger_mast.branch, group_name ");
				qry.append(" having ( ifnull(sum(vd_dramount)-sum(vd_cramount),0) <> 0) ");
				stmt.executeUpdate(qry.toString());

				qry.setLength(0);
				qry.append("insert into balancesheet(ord,ledgername,branch,amount,drcr,groupname,rowtype) ");
				qry.append(
						"SELECT 1 as ord,ledger_mast.ledger_name,ifnull(ledger_mast.branch,''), ifnull(sum(vd_dramount)-sum(vd_cramount),0) as cl_bal,case when ifnull(sum(vd_dramount)-sum(vd_cramount),0)>0 then 'Dr' when  ifnull(sum(vd_dramount)-sum(vd_cramount),0)=0 then '' else 'Cr' end, group_name, 2 ");
				qry.append("FROM ledger_mast,group_mast,view_vouchers as t1  WHERE ( group_mast.group_code =");
				qry.append(" ledger_mast.group_code) and ledger_mast.ledger_code = t1.vd_ledger_code and ");
				qry.append(" group_mast.acc_type in('A') and date(vh_date)<=date('");

				qry.append(todate);
				qry.append("') and branchcode=" + c_code
						+ " group by ledger_mast.ledger_name, ledger_mast.branch,group_name ");
				qry.append(" having ( ifnull(sum(vd_dramount)-sum(vd_cramount),0) <> 0) ");
				qry.append(" union all ");

				/*
				 * qry.append(
				 * " select 'OPENING STOCK', 'OP. STK',0, 'OPENING STOCK' , ifnull(op_stock_value,0),0 from cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
				 * +c_code+
				 * " and c1.from_date=(select max(from_date) from cl_stock_det c3,cl_stock c4 where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.to_date<=date('"
				 * ); qry.append(todate + "'))") ;
				 */
				qry.append(
						" select 3, 'Closing Stock', 'STOCK VALUE',case when  ifnull(op_stock_value,0)>0 then  ifnull(op_stock_value,0) else  ifnull(cl_stock_value,0) end,'','Stock in Hand',2 from  cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
								+ c_code
								+ " and c1.to_date=(select max(to_date) from cl_stock_det c3,cl_stock c4 where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.to_date<=date('");
				qry.append(todate + "'))");
				stmt.executeUpdate(qry.toString());

				qry.setLength(0);
				qry.append("insert into balancesheetgroup(groupname,ord,ledgername,amount,rowtype) ");
				qry.append(
						"select groupname,ord,groupname,sum(amount),rowtype from balancesheet group by ord,groupname,rowtype  ");
				stmt.executeUpdate(qry.toString());

				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append(
						"select ifnull(sum(case when rowtype=2 then amount else 0 end ),0)+sum(case when rowtype=1 then amount else 0 end ) as profit from balancesheet");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				double netProfitLoss = 0;
				if (rs.next()) {
					netProfitLoss = rs.getDouble("Profit") * -1;
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("insert into balancesheet(groupname,ord,ledgername,amount,rowtype) ");
				if (netProfitLoss <= 0) {
					qry.append("values('Net Profit',999,'Gross Profit',round(?*(1),2),1)");
				} else {
					qry.append("values('Net Loss',999,'Gross Loss',round(?*(1),2),2)");
				}

				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, netProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append("insert into balancesheetgroup(groupname,ord,ledgername,amount,rowtype) ");
				qry.append(
						"select '',1000,'',sum(amount),rowtype from balancesheet where rowtype in (1,2) group by rowtype  ");
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append(
						"insert into balancesheetliab(groupname,ord,ledgername,branch,amount,drcr,rowtype,isgroup) ");
				if ("S".equals(reptype)) {
					qry.append(
							"select groupname,ord,ledgername,'',abs(amount) amount,case when amount<0 then 'Cr' else 'Dr' end ,rowtype,1 grp from balancesheetgroup where rowtype=1 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				} else {
					qry.append(
							"select groupname,ord,ledgername,'',abs(amount) amount,case when amount<0 then 'Cr' else 'Dr' end,rowtype,1 grp from balancesheetgroup where rowtype=1 and ord not in (999,1000) union all select groupname,ord,ledgername,ifnull(branch,''),abs(amount),drcr,rowtype,0 grp from balancesheet where rowtype=1 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				}
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				qry.setLength(0);
				qry.append(
						"insert into balancesheetasset(groupname,ord,ledgername,branch,amount,drcr,rowtype,isgroup) ");
				if ("S".equals(reptype)) {
					qry.append(
							"select groupname,ord,ledgername,'',abs(amount),case when amount<0 then 'Cr' else 'Dr' end,rowtype,1 grp from balancesheetgroup where rowtype=2 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");

				} else {
					qry.append(
							"select groupname,ord,ledgername,'',abs(amount),case when amount<0 then 'Cr' else 'Dr' end,rowtype,1 grp from balancesheetgroup where rowtype=2 and ord not in (999,1000) union all select groupname,ord,ledgername,ifnull(branch,''),abs(amount),drcr,rowtype,0 grp from balancesheet where rowtype=2 and ord not in (999,1000) order by rowtype,ord,groupname,grp desc,ledgername asc");
				}
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("select count('x') cnt from balancesheetliab ");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				int pc = 0;
				if (rs.next()) {
					pc = rs.getInt("cnt");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append("select count('x') cnt from balancesheetasset");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(qry.toString());
				int ic = 0;
				if (rs.next()) {
					ic = rs.getInt("cnt");
				}
				stmt.close();
				stmt = null;

				qry.setLength(0);
				qry.append(
						"insert into balancesheetfinal(lgroupname,lledgername,lbranch,lamount,ldrcr,lord,lrowtype,lgroup,agroupname,aledgername,abranch,aamount,adrcr,aord,arowtype,agroup)");
				if (pc > ic) {
					qry.append(
							"select e.groupname,e.ledgername,e.branch,e.amount,e.drcr,e.ord,e.rowtype,e.isgroup,ifnull(i.groupname,''),ifnull(i.ledgername,''),ifnull(i.branch,''),ifnull(i.amount,''),ifnull(i.drcr,''),ifnull(i.ord,1001),ifnull(i.rowtype,2),ifnull(i.isgroup,0) ");
					qry.append(" from balancesheetliab e left join balancesheetasset i on e.sno=i.sno ");
				} else {
					qry.append(
							"select ifnull(e.groupname,''),ifnull(e.ledgername,''),ifnull(e.branch,''),ifnull(e.amount,''),ifnull(e.drcr,''),ifnull(e.ord,1001),ifnull(e.rowtype,1),ifnull(e.isgroup,0),i.groupname,i.ledgername,i.branch,i.amount,i.drcr,i.ord,i.rowtype,i.isgroup ");
					qry.append(" from balancesheetasset i left join balancesheetliab e on e.sno=i.sno ");
				}
				stmt = conn.createStatement();
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				qry.setLength(0);
				if (netProfitLoss <= 0) {
					qry.append("insert into balancesheetfinal(lgroupname,lledgername,lamount,lord,lrowtype,lgroup) ");
					qry.append("values('Net Profit','Net Profit',round(abs(?*(-1)),2),999,1,1)");
				} else {
					qry.append("insert into balancesheetfinal(agroupname,aledgername,aamount,aord,arowtype,agroup) ");
					qry.append("values('Net Loss','Net Loss',round(abs(?*(-1)),2),999,2,1)");
				}
				updStatement = conn.prepareStatement(qry.toString());
				updStatement.setDouble(1, netProfitLoss);
				updStatement.executeUpdate();
				updStatement.close();
				updStatement = null;

				qry.setLength(0);
				qry.append(
						"insert into balancesheetfinal(lgroupname,lledgername,lamount,lord,lrowtype,lgroup,agroupname,aledgername,aamount,aord,arowtype,agroup)");
				qry.append(
						"select '','',abs(sum(case when rowtype=1 then e.amount else 0 end)) amount,1000 ord,1 rowtype,3,'','',abs(sum(case when rowtype=2 then e.amount else 0 end)) amount,1000 ord,1 rowtype,3 ");
				qry.append(" from balancesheetgroup e where e.rowtype in (1,2) and e.ord=1000 ");
				stmt = conn.createStatement();
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				/*
				 * stmt=conn.createStatement(); rs=stmt.executeQuery(
				 * "select * from balancesheetfinal order by sno"); while(rs.next()){
				 * System.out.println(rs.getString("lgroupname" )+" "+rs.getString
				 * ("lledgername")+" "+rs.getString("lamount")+ " "+rs.getString("agroupname"
				 * )+" "+rs.getString("aledgername") +" "+rs.getString("aamount")); }
				 */
			} else if ("900026".equals(reportId)) {
				String todate = reportParameters.get("todate");
				String c_code = reportParameters.get("companycode");
				String reptype = reportParameters.get("reptype");

				System.out.println("CompanyCode:---" + c_code);
				stmt = conn.createStatement();

				stmt.execute(
						"create temporary table if not exists trialbalancefinal(groupname varchar(100) default '',ledgercode int default 0,ledgername varchar(100) default '',branchname varchar(50) default '',debit numeric(18,2) default 0,credit numeric(18,2) default 0,isgroup int default 0,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute("truncate table trialbalancefinal");
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				StringBuilder qry = new StringBuilder(100);

				if ("D".equals(reptype)) {
					qry.append(
							"insert into trialbalancefinal(ledgername,branchname,ledgercode,groupname,debit,credit) ");
					qry.append(
							" select a.ledger_name,  a.branch  as branch, ledger_code,group_name, case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end as dr_bal, ");
					qry.append(" case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) ");
					qry.append(
							" else 0 end as cr_bal from view_vouchers l, ledger_mast a, group_mast s where l.vd_ledger_code = a.ledger_code and ");
					qry.append(" s.group_code= a.group_code and acc_type in('A','L') and date(vh_date) <=date('");
					qry.append(todate);
					qry.append("') and branchcode=" + c_code + " group by ledger_code,a.ledger_name, group_name , ");
					qry.append(
							" a.branch  having (case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(
							" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end <> 0 or case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) else 0 end <> 0)");
					qry.append(" union all ");
					qry.append(
							" select a.ledger_name,  a.branch  as branch, ledger_code,group_name, case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end as dr_bal, ");
					qry.append(" case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) ");
					qry.append(
							" else 0 end as cr_bal from view_vouchers l, ledger_mast a, group_mast s,fin_date f where l.vd_ledger_code = a.ledger_code and ");
					qry.append(
							" s.group_code= a.group_code and acc_type not in('A','L') and vh_date>=f.from_date and date(vh_date) <=date('");
					qry.append(todate);
					qry.append("') and branchcode=" + c_code + " group by ledger_code,a.ledger_name, group_name , ");
					qry.append(
							" a.branch  having (case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(
							" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end <> 0 or case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) else 0 end <> 0)");
					qry.append(" union all ");

					qry.append(
							" select 'Opening Stock', 'OP. STK',0, 'Opening Stock' , ifnull(op_stock_value,0),0 from cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
									+ c_code
									+ " and c1.from_date=(select max(c3.from_date) from cl_stock_det c3,cl_stock c4,fin_date where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.from_date between fin_date.from_date and fin_date.to_date)");
					stmt.executeUpdate(qry.toString());
					stmt.close();
					stmt = null;
				}

				else {

					qry.append(
							"insert into trialbalancefinal(ledgername,branchname,ledgercode,groupname,debit,credit) ");
					qry.append(
							" select group_name,  ''as branch, 0 ledger_code,group_name, case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end as dr_bal, ");
					qry.append(" case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) ");
					qry.append(
							" else 0 end as cr_bal from view_vouchers l, ledger_mast a, group_mast s where l.vd_ledger_code = a.ledger_code and ");
					qry.append(" s.group_code= a.group_code  and acc_type in('L','A') and date(vh_date) <=date('");
					qry.append(todate);
					qry.append("') and branchcode=" + c_code + " group by group_name ");
					qry.append(" having (case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(
							" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end <> 0 or case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) else 0 end <> 0)");
					qry.append(" union all ");
					qry.append(
							" select group_name,  ''as branch, 0 ledger_code,group_name, case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end as dr_bal, ");
					qry.append(" case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) ");
					qry.append(
							" else 0 end as cr_bal from view_vouchers l, ledger_mast a, group_mast s,fin_date f where l.vd_ledger_code = a.ledger_code and ");
					qry.append(
							" s.group_code= a.group_code  and acc_type not in('L','A') and vh_date>=f.from_date and date(vh_date) <=date('");
					qry.append(todate);
					qry.append("') and branchcode=" + c_code + " group by group_name ");
					qry.append(" having (case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then ");
					qry.append(
							" ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end <> 0 or case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then ");
					qry.append(" abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) else 0 end <> 0)");

					qry.append(" union all ");
					qry.append(
							" select 'Opening Stock', 'OP. STK',0, 'Opening Stock' , ifnull(op_stock_value,0),0 from cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
									+ c_code
									+ " and c1.from_date=(select max(c3.from_date) from cl_stock_det c3,cl_stock c4,fin_date where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.from_date between fin_date.from_date and fin_date.to_date)");
					stmt.executeUpdate(qry.toString());
					stmt.close();
					stmt = null;

				}

				/*
				 * stmt=conn.createStatement(); rs=stmt.executeQuery(
				 * "select * from trialbalancefinal order by groupname,ledgername" );
				 * while(rs.next()){ System.out.println(rs.getString("groupname"
				 * )+" "+rs.getString( "ledgername")+" "+rs.getString("debit")+" "
				 * +rs.getString("credit")); }
				 */
			} else if ("900049".equals(reportId)) {
				String todate = reportParameters.get("todate");
				String c_code = reportParameters.get("companycode");
				String reptype = reportParameters.get("reptype");

				System.out.println("CompanyCode:---" + c_code);
				stmt = conn.createStatement();
				
				
				stmt.execute(
						"create temporary table if not exists outstanding_rece(ledger_name varchar(100) default '',ledgercode int default 0,bill_no varchar(20) default '',bill_date varchar(20) default '',amount numeric(18,2) default 0,days int default 0,isgroup int default 0,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute("truncate table outstanding_rece");
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				StringBuilder qry = new StringBuilder(100);

				if ("D".equals(reptype)) {
					qry.append(
							"insert into outstanding_rece(ledger_name,ledgercode,bill_no,bill_date,amount,days,isgroup)select concat(ledger_name,', ',branch),v1.ledger_code,bill_no,DATE_FORMAT(bill_date,'%d/%m/%Y') ,ifnull(sum(total_amt-paid_amount-discount),0),datediff(curdate(),bill_date) ,0 from v_receivable v1,ledger_mast l1 where v1.ledger_code=l1.ledger_code and date(bill_date) <=date('");
					qry.append(todate);
					qry.append("') and c_code=" + c_code
							+ " group by ledger_name,v1.ledger_code,bill_no,bill_date having ifnull(sum(total_amt-paid_amount-discount),0)<>0 order by datediff(curdate(),bill_date) desc");

/*					qry.append(" union all ");

					qry.append(
							"select concat(ledger_name,', ',branch),v1.ledger_code,0,'',ifnull(sum(total_amt-paid_amount-discount),0),0,1 from v_receivable v1, ledger_mast l1 where v1.ledger_code=l1.ledger_code  and date(bill_date) <=date('");
					qry.append(todate);
					qry.append("') and c_code=" + c_code
							+ " group by ledger_name,v1.ledger_code having ifnull(sum(total_amt-paid_amount-discount),0)<>0");*/

				} else {
					qry.append(
							"insert into outstanding_rece(ledger_name,ledgercode,bill_no,bill_date,amount,days,isgroup) ");

					qry.append(
							"select concat(ledger_name,', ',branch),v1.ledger_code,0,'',ifnull(sum(total_amt-paid_amount-discount),0),0,1 from v_receivable v1, ledger_mast l1 where v1.ledger_code=l1.ledger_code  and date(bill_date) <=date('");
					qry.append(todate);
					qry.append("') and c_code=" + c_code
							+ " group by ledger_name,v1.ledger_code having ifnull(sum(total_amt-paid_amount-discount),0)<>0");
				}

				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;
			} else if ("800021".equals(reportId)) {
				String fromdate = reportParameters.get("fromdate");
				String todate = reportParameters.get("todate");

				String c_code = reportParameters.get("companycode");

				System.out.println("Hai! Hai!!");
				stmt = conn.createStatement();

				stmt.execute(
						"create temporary table if not exists gstr3bfinal(groupname varchar(400) default '',detail varchar(800) default '',col1 varchar(100) default '',col2 varchar(100) default '', col3 varchar(100) default '', col4 varchar(100) default'', col5 varchar(100) default '', isgroup int default 0,sno int auto_increment primary key)Engine=InnoDB");
				stmt.execute("truncate table gstr3bfinal");
				stmt.close();
				stmt = null;

				stmt = conn.createStatement();
				StringBuilder qry = new StringBuilder(500);
				qry.append("insert into gstr3bfinal(groupname,detail,col1,col2,col3,col4,col5,isgroup) ");
				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','Nature of Supplies','Total Taxable Value ','Integrated Tax','Central Tax','State/UT Tax','Cess',0 from account_settings  union all ");
				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','1','2','3','4','5','6',0 from account_settings  union all ");
				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','(a) Outward taxable supplies (other than zero rated, nil rated and exempted',"
								+ "(select ifnull(sum(taxable_amt),0) from f_invoice_det f1,f_invoice f2 where f1.invoice_code=f2.invoice_code and f2.bill_date>=date('"
								+ fromdate + "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')-(select ifnull(sum(taxable_amt),0) from sales_ret_det f1,sales_ret f2 where f1.invoice_code=f2.invoice_code and f2.bill_date>=date('"
								+ fromdate + "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append("(select ifnull(sum(igst_amount),0) from f_invoice f2 where  f2.bill_date>=date('" + fromdate
						+ "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
						+ " and ifnull(status,'N')<>'C')-(select ifnull(sum(igst_amount),0) from sales_ret f2 where f2.bill_date>=date('"
						+ fromdate + "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
						+ " and ifnull(status,'N')<>'C'),");
				qry.append("(select ifnull(sum(cgst_amount),0) from f_invoice f2 where  f2.bill_date>=date('" + fromdate
						+ "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
						+ " and ifnull(status,'N')<>'C')-(select ifnull(sum(cgst_amount),0) from sales_ret f2 where f2.bill_date>=date('"
						+ fromdate + "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
						+ " and ifnull(status,'N')<>'C'),");
				qry.append("(select ifnull(sum(sgst_amount),0) from f_invoice f2 where  f2.bill_date>=date('" + fromdate
						+ "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
						+ " and ifnull(status,'N')<>'C')-(select ifnull(sum(sgst_amount),0) from sales_ret f2 where f2.bill_date>=date('"
						+ fromdate + "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
						+ " and ifnull(status,'N')<>'C'),");
				qry.append("'',0 from account_settings  union all ");

				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','(b) Outward taxable supplies (zero rated)','','','','','',0 from account_settings  union all ");
				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','(c) Other Outward supplies (Nil rated, exempted)','','','','','',0 from account_settings  union all ");
				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','(d) Inward supplies (liable to reverse charge) ','','','','','',0 from account_settings  union all ");
				qry.append(
						"select '3.1 Details of Outward Supplies and inward supplies liable to reverse charge','(e) Non-GST outward supplies ','','','','','',0 from account_settings  union all ");

				qry.append(
						"select '3.2 Of the supplies shown in 3.1 (a)  above, details of inter-State supplies made to unregistered persons, composition taxable persons and UIN holders','','','','','','', 0 from account_settings union all  ");
				qry.append(
						"select '3.2 Of the supplies shown in 3.1 (a)  above, details of inter-State supplies made to unregistered persons, composition taxable persons and UIN holders','','Place of Supply (State/UT)','Total Taxable Value','Amount of Integrated Tax','','', 0 from account_settings union all  ");
				qry.append(
						"select '3.2 Of the supplies shown in 3.1 (a)  above, details of inter-State supplies made to unregistered persons, composition taxable persons and UIN holders','1','2','3','4','','', 0 from account_settings union all ");
				qry.append(
						"select '3.2 Of the supplies shown in 3.1 (a)  above, details of inter-State supplies made to unregistered persons, composition taxable persons and UIN holders','Supplies made to Unregistered Person',p1.place_of_supply,"
								+ " ifnull(sum(taxable_amt),0),round(ifnull(sum(taxable_amt),0)*igst_per/100,2),'','', 0 from f_invoice_det f1,f_invoice f2,ledger_mast l1,place_of_supply_mast p1 where f1.invoice_code=f2.invoice_code and f2.ledger_code=l1.ledger_code and l1.place_of_supply_code=p1.place_of_supply_code and trim(l1.gstin_no)='' and f2.bill_date>=date('"
								+ fromdate + "') and date(f2.bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and l1.local_interstate<>'L' group by place_of_supply,igst_per union all ");

				qry.append("select '4. Eligible ITC','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','Details','Integrated Tax','Central Tax','State/UT Tax','Cess','', 0 from account_settings union all ");
				qry.append("select '4. Eligible ITC','1','2','3','4','5','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','(A)ITC Available (whether in full or part) ','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (1) Import of goods','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (2) Import of service','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (3) Inward supplies liable to reverse charge (other than 1 & 2 above)','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (4) Inward supplies from ISD','','','','','', 0 from account_settings union all ");

				qry.append(
						"select '4. Eligible ITC','.	 (5) All other ITC',(select ifnull(sum(igst_amount),0) from purc_sale_det p1,purc_sale p2 where p1.tran_code=p2.tran_code and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')  + (select ifnull(sum(igst_amount),0) from purc_inv p1 where p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')+ (select ifnull(sum(igst_amount),0) from purc_inv p1 where p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append(
						"(select ifnull(sum(cgst_amount),0) from purc_sale_det p1,purc_sale p2 where p1.tran_code=p2.tran_code and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')  + (select ifnull(sum(cgst_amount),0) from purc_inv p1 where p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')+ (select ifnull(sum(cgst_amount),0) from purc_inv p1 where p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append(
						"(select ifnull(sum(sgst_amount),0) from purc_sale_det p1,purc_sale p2 where p1.tran_code=p2.tran_code and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')  + (select ifnull(sum(sgst_amount),0) from purc_inv p1 where p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')+ (select ifnull(sum(sgst_amount),0) from purc_inv p1 where p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append("'','', 0 from account_settings union all ");

				qry.append(
						"select '4. Eligible ITC','(B) ITC Reversed','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (1) As per rules 42 & 43 of CGST Rules','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (2) Others','','','','','', 0 from account_settings union all ");

				qry.append(
						"select '4. Eligible ITC','(C) Net ITC Available (A) – (B)',(select ifnull(sum(igst_amount),0) from purc_sale_det p1,purc_sale p2 where p1.tran_code=p2.tran_code and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')  + (select ifnull(sum(igst_amount),0) from purc_inv p1 where p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')+ (select ifnull(sum(igst_amount),0) from purc_inv p1 where p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append(
						"(select ifnull(sum(cgst_amount),0) from purc_sale_det p1,purc_sale p2 where p1.tran_code=p2.tran_code and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')  + (select ifnull(sum(cgst_amount),0) from purc_inv p1 where p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')+ (select ifnull(sum(cgst_amount),0) from purc_inv p1 where p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append(
						"(select ifnull(sum(sgst_amount),0) from purc_sale_det p1,purc_sale p2 where p1.tran_code=p2.tran_code and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')  + (select ifnull(sum(sgst_amount),0) from purc_inv p1 where p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C')+ (select ifnull(sum(sgst_amount),0) from purc_inv p1 where p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C') ,");
				qry.append("'','', 0 from account_settings union all ");

				// qry.append("select '4. Eligible ITC','(C) Net ITC Available (A) –
				// (B)','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','(D) Ineligible ITC','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (1) As per section 17(5)','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '4. Eligible ITC','.	 (2) Others','','','','','', 0 from account_settings union all  ");

				qry.append(
						"select '5. Values of exempt, nil-rated and non-GST inward supplies','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5. Values of exempt, nil-rated and non-GST inward supplies','Nature of supplies','Inter-State Supplies','Intra-State Supplies','','','', 0 from account_settings union all ");
				qry.append(
						"select '5. Values of exempt, nil-rated and non-GST inward supplies','     1','      2','      3','','','', 0 from account_settings union all ");
				qry.append(
						"select '5. Values of exempt, nil-rated and non-GST inward supplies','From a supplier under composition scheme, Exempt and Nil rated supply',(select ifnull(sum(amount),0) from purc_sale_det p1,purc_sale p2,ledger_mast l1 where p1.tran_code=p2.tran_code and p1.ledger_code=l1.ledger_code and l1.local_interstate='I' and tran_type='P' and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and (gst_per=0)) + (select ifnull(sum(tot),0) from purc_inv p1,ledger_mast l1 where p1.ledger_code=l1.ledger_code and l1.local_interstate='I' and p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and (cgst_per=0 and sgst_per=0 and igst_per=0))+ (select ifnull(sum(tot),0) from purc_inv p1,ledger_mast l1 where p1.ledger_code=l1.ledger_code and l1.local_interstate='I' and  p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and (cgst_per=0 and sgst_per=0 and igst_per=0)) ,");
				qry.append(
						"(select ifnull(sum(amount),0) from purc_sale_det p1,purc_sale p2,ledger_mast l1 where p1.tran_code=p2.tran_code and p1.ledger_code=l1.ledger_code and l1.local_interstate='L'  and  tran_type='P' and date(bill_date)>=date('"
								+ fromdate + "') and date(bill_date)<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and (gst_per=0)) + (select ifnull(sum(tot),0) from purc_inv p1,ledger_mast l1 where p1.ledger_code=l1.ledger_code and l1.local_interstate='L' and p1.transaction_type='B' and inv_date>=date('"
								+ fromdate + "') and inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and (cgst_per=0 and sgst_per=0 and igst_per=0))+ (select ifnull(sum(tot),0) from purc_inv p1,ledger_mast l1 where p1.ledger_code=l1.ledger_code and l1.local_interstate='L' and  p1.transaction_type='I' and party_inv_date>=date('"
								+ fromdate + "') and party_inv_date<=date('" + todate + "') and c_code=" + c_code
								+ " and ifnull(status,'N')<>'C' and (cgst_per=0 and sgst_per=0 and igst_per=0)),'','','', 0 from account_settings union all ");
				qry.append(
						"select '5. Values of exempt, nil-rated and non-GST inward supplies','Non GST Supply','','','','','', 0 from account_settings union all ");

				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','Description','Integrated Tax','Central Tax','State/UT Tax','Cess','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','1','2','3','4','5','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','Interest','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','Late Fees','','','','','', 0 from account_settings union all ");

				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','Verification (by Authorised signatory)','','','','','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','I hereby solemnly affirm and declare that the information given herein above is true and correct to the best of my knowledge and belief and nothing has been concealed there from.','','','','','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','Instructions:','','','','','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','1) Value of Taxable Supplies = Value of invoices + value of Debit Notes – value of credit notes + value of advances received for which invoices have not been issued in the same month – value of advances adjusted against invoices','','','','','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','2) Details of advances as well as adjustment of same against invoices to be adjusted and not shown separately','','','','','', 0 from account_settings union all ");
				qry.append("select '5.1 Payment of tax','','','','','','', 0 from account_settings union all ");
				qry.append(
						"select '5.1 Payment of tax','3) Amendment in any details to be adjusted and not shown separately.','','','','','', 0 from account_settings");

				// qry.append(todate);
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				// qry.append("insert into gstr3bfinal(groupname,isgroup) ");
				// qry.append("select '3.1 Details of Outward Supplies and inward supplies
				// liable to reverse charge',1 from account_settings union all ");
				// qry.append("select 'detail ',1 from account_settings union all ");
				// qry.append("select '4. Eligible ITC ',1 from account_settings union all ");
				// qry.append("select '5. Values of exempt, nil-rated and non-GST inward
				// supplies',1 from account_settings");

				// qry.append(todate);
				stmt.executeUpdate(qry.toString());
				stmt.close();
				stmt = null;

				/*
				 * qry.append(
				 * "insert into trialbalancefinal(ledgername,branchname,ledgercode,groupname,debit,credit) "
				 * ); qry.append(
				 * " select a.ledger_name,  a.branch  as branch, ledger_code,group_name, case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then "
				 * ); qry.append(
				 * " ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end as dr_bal, "
				 * ); qry.append(
				 * " case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then "
				 * ); qry.append(
				 * " abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) " );
				 * qry.append(
				 * " else 0 end as cr_bal from view_vouchers l, ledger_mast a, group_mast s where l.vd_ledger_code = a.ledger_code and "
				 * ); qry.append( " s.group_code= a.group_code  and date(vh_date) <=date('");
				 * qry.append(todate); qry.append("') and branchcode=" + c_code +
				 * " group by ledger_code,a.ledger_name, group_name , "); qry.append(
				 * " a.branch  having (case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) > 0 then "
				 * ); qry.append(
				 * " ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) else 0 end <> 0 or case when ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0) < 0 then "
				 * ); qry.append(
				 * " abs(ifnull(sum(vd_dramount),0) - ifnull(sum(vd_cramount),0)) else 0 end <> 0)"
				 * ); qry.append(" union all "); qry.append(
				 * " select 'OPENING STOCK', 'OP. STK',0, 'OPENING STOCK' , ifnull(op_stock_value,0),0 from cl_stock_det c1,cl_stock c2 where c1.stock_code=c2.stock_code and c2.c_code="
				 * + c_code +
				 * " and c1.from_date=(select max(from_date) from cl_stock_det c3,cl_stock c4 where c3.stock_code=c4.stock_code and c4.c_code=c2.c_code and c3.to_date<=date('"
				 * ); qry.append(todate + "'))"); stmt.executeUpdate(qry.toString());
				 * stmt.close(); stmt = null;
				 */
				/*
				 * stmt=conn.createStatement(); rs=stmt.executeQuery(
				 * "select * from trialbalancefinal order by groupname,ledgername" );
				 * while(rs.next()){ System.out.println(rs.getString("groupname"
				 * )+" "+rs.getString( "ledgername")+" "+rs.getString("debit")+" "
				 * +rs.getString("credit")); }
				 */

			}

		} catch (Exception e) {
			result = "Error in process report data " + e.getMessage();
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
				if (stmt != null) {
					stmt.close();
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

	public static void main(String[] args) throws Exception, DocumentException {
		try {
			Connection con = DatabaseUtil
					.getConnectionFromUrl("jdbc:mysql://localhost:3306/tekknow?user=root&password=");
			HashMap<String, String> reportParameters = new HashMap<String, String>();
			reportParameters.put("fromdate", "2018-04-01");
			reportParameters.put("todate", "2018-12-31");
			(new ProcessReportData()).processReportData(con, "900023", reportParameters);

			System.out.println("***********************************************************");
			(new ProcessReportData()).processReportData(con, "2", reportParameters);

			System.out.println("***********************************************************");
			(new ProcessReportData()).processReportData(con, "3", reportParameters);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}