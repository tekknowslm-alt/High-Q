package com.hiq.trade.master;

import java.io.OutputStream;
import java.io.StringWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;

import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;

import com.core.util.AjaxResponseUtil;
import com.core.util.DatabaseUtil;

public class UserManager{
	private static final String insertQuery="INSERT INTO employee_master(em_code,em_name,em_address1,em_address2,em_city,em_email,em_mobile,em_phone,em_user_name,em_type,em_status,tsid)VALUES(?,?,?,?,?,?,?,?,?,?,?,0)"; 
	private static final String modifyQuery="UPDATE employee_master set em_name=?,em_address1=?,em_address2=?,em_city=?,em_email=?,em_mobile=?,em_phone=?,em_type=?,em_status=?,tsid=0 where em_code=?";
	private static final String insertUsers="insert into users(user_name,user_pass,role_id,user_type,tsid) values(?,?,?,?,0)";
	private static final String updateUsers="update users set role_id=?,user_pass=?,tsid=0 where user_name=? ";
	private static final String select="SELECT a.em_code,a.em_name,a.em_address1,a.em_address2,a.em_city,a.em_email,a.em_mobile,a.em_phone,a.em_user_name,a.em_type,a.em_status,u.user_name,u.user_pass,u.role_id,r.role_name,bm.branchname,ud.udb_branchcode FROM employee_master a inner join users u on a.em_user_name=u.user_name inner join role_master r on u.role_id=r.role_id inner join user_default_branch ud on a.em_user_name=ud.udb_userid inner join branch_master bm on bm.branchcode=ud.udb_branchcode where a.em_code=?";
	private static final String updateEmployeeKey="update tran_seq_no set seq_no=seq_no+1 where tran_id=100";
	private static final String selectEmployeeKey="select seq_no from tran_seq_no where tran_id=100";
	private static final String insertDefaultBranch="insert into user_default_branch(udb_userid,udb_branchcode) values(?,?)";
	private static final String updateDefaultBranch="update user_default_branch set udb_branchcode=? where udb_userid=? ";
	private static final String insertUserBranches="insert into user_branch_map(ubm_userid,ubm_branchcode,ubm_location) values(?,?,?)";
	private static final String deleteUserBranches="delete from user_branch_map where ubm_userid=? ";
	private static final String updateUserPassword="update users set user_pass=?,tsid=getcurrenttsid(now()) where user_name=? ";
	private static final String selectUserBranch="select b.branchcode,b.branchname,ifnull(a.ubm_branchcode,0) selected,ifnull(lm.lm_code,dl.lm_code) locationcode,ifnull(lm.lm_name,dl.lm_name) locationname from branch_master b inner join location_master dl on dl.branchcode=b.branchcode and dl.lm_default=1 left join user_branch_map a on b.branchcode=a.ubm_branchcode and a.ubm_userid=? left join location_master lm on lm.branchcode=a.ubm_branchcode and lm.lm_code=a.ubm_location ";
	private static final String insertRoleMaster="insert into role_master(role_name,parent_role) values(?,?) ";
	private static final String updateRoleMaster="update role_master set role_name=?,parent_role=? where role_id=? ";
	private static final String selectRoleMaster="select a.role_name,a.role_id,b.role_name parentname,b.role_id parentid from role_master a inner join role_master b on a.parent_role=b.role_id where a.role_id=? ";
	private static final String selectRoleMenus="select a.menu_id,a.menu_name,a.menu_caption,a.parent_id,ifnull(c.menu_id,0) selected from role_menu_map b  inner join role_master cm on b.role_id=cm.parent_role and cm.role_id=? inner join menu_master a on a.menu_id=b.menu_id left join role_menu_map c on c.role_id=cm.role_id and a.menu_id=c.menu_id where a.parent_id!=-1 order by a.parent_id asc,a.menu_id asc";
	private static final String selectParentRoleMenus="select a.menu_id,a.menu_name,a.menu_caption,a.parent_id,0 selected from role_menu_map b  inner join menu_master a on a.menu_id=b.menu_id where b.role_id=? and a.parent_id!=-1 order by a.parent_id asc,a.menu_id asc";
	private static final String selectParentRoleOperations="select a.so_menu_id,a.so_id,a.so_name,a.so_caption,a.so_report_column, 0 selected,m.menu_report_id from role_operation_map b  inner join screen_operations a on a.so_menu_id=b.rom_menu_id and a.so_id=b.rom_so_id inner join menu_master m on a.so_menu_id=m.menu_id where b.rom_role_id=? order by a.so_menu_id asc,a.so_order asc";
	private static final String selectRoleOperations="select a.so_menu_id,a.so_id,a.so_name,a.so_caption,a.so_report_column, ifnull(c.rom_menu_id,0) selected,m.menu_report_id from role_operation_map b  inner join role_master cm on b.rom_role_id=cm.parent_role and cm.role_id=? inner join screen_operations a on a.so_menu_id=b.rom_menu_id and a.so_id=b.rom_so_id inner join menu_master m on a.so_menu_id=m.menu_id left join role_operation_map c on c.rom_menu_id=b.rom_menu_id and c.rom_so_id=b.rom_so_id and cm.role_id=c.rom_role_id order by a.so_menu_id asc,a.so_order asc ";
	private static final String insertRoleMenus="insert into role_menu_map(role_id,menu_id) values(?,?)";
	private static final String deleteRoleMenus="delete from role_menu_map where role_id=?";
	private static final String deleteEmployeeProcess="delete from employee_process_map where epm_emp_code=?";
	private static final String insertEmployeeProcess="insert into employee_process_map(epm_process_id,epm_emp_code,epm_status) values(?,?,?)";
	private static final String selectEmployeeProcessMap="select a.srp_code,a.srp_status_caption,b.pg_name,ifnull(e.epm_process_id,0) selected  from service_routing_process a inner join product_group b on a.srp_pg_code=b.pg_code left join employee_process_map e on a.srp_code=e.epm_process_id and e.epm_emp_code=? ";
	private static final String insertRoleOperations="insert into role_operation_map(rom_role_id,rom_menu_id,rom_so_id) values(?,?,?)";
	private static final String deleteRoleOperations="delete from role_operation_map where rom_role_id=?";
	private static final String insertRoleColumns="insert into role_column_map(rcm_role_id,rcm_menu_id,rcm_report_id,rcm_column_name) values(?,?,?,?)";
	private static final String deleteRoleColumns="delete from role_column_map where rcm_role_id=?";
	private static final String selectParentRoleColumns="select b.rcm_menu_id,b.rcm_report_id,b.rcm_column_name,r.column_title,0 selected from role_column_map b inner join report_dtl r on b.rcm_report_id=r.report_id and b.rcm_column_name=r.column_name where b.rcm_role_id=? and r.is_operation=0 and b.rcm_menu_id!=0 order by r.column_order asc";
	private static final String selectRoleColumns="select b.rcm_menu_id,b.rcm_report_id,b.rcm_column_name,r.column_title,ifnull(c.rcm_report_id,0) selected from role_column_map b inner join menu_master menu on menu.menu_id=b.rcm_menu_id inner join report_dtl r on b.rcm_report_id=r.report_id and b.rcm_column_name=r.column_name inner join role_master cm on b.rcm_role_id=cm.parent_role and cm.role_id=? left join role_column_map c on c.rcm_menu_id=b.rcm_menu_id and c.rcm_report_id=b.rcm_report_id and cm.role_id=c.rcm_role_id and b.rcm_column_name=c.rcm_column_name where r.is_operation=0 and b.rcm_menu_id!=0 order by r.column_order asc ";
	private static final String insertRoleReportColumns="insert into role_column_map(rcm_role_id,rcm_menu_id,rcm_report_id,rcm_column_name) select m.role_id ,0, d.report_id,column_name from report_dtl d inner join multi_menu_report_map b on d.report_id=b.report_id inner join role_menu_map m on b.menu_id=m.menu_id where m.role_id=?";
	private static final String checkUserCode="select * from employee_master where ifnull(em_code,0)=?";
	public String addEmployee(Map<String,Object> l){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		String code="0";
		try{
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(updateEmployeeKey);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt=conn.prepareStatement(selectEmployeeKey);
			rs=pstmt.executeQuery();
			if(rs.next()){
				code=rs.getString("seq_no");				
			}
			rs.close();
			pstmt=conn.prepareStatement(insertQuery);
			pstmt.clearParameters();
			//em_code,em_name,em_address1,em_address2,em_city,em_email,em_mobile,em_phone,em_user_name,em_type,em_status
			pstmt.setString(1, code);
			pstmt.setString(2, (String)l.get("empname"));
			pstmt.setString(3, (String)l.get("address1"));
			pstmt.setString(4, (String)l.get("address2"));
			pstmt.setString(5, (String)l.get("city"));
			pstmt.setString(6, (String)l.get("email"));
			pstmt.setString(7, (String)l.get("mobile"));
			pstmt.setString(8, (String)l.get("phone"));
			pstmt.setString(9, (String)l.get("username"));
			pstmt.setString(10, (String)l.get("usertype"));
			pstmt.setString(11, (String)l.get("status"));
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt=conn.prepareStatement(insertUsers);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("username"));
			pstmt.setString(2, (String)l.get("password"));
			pstmt.setString(3, (String)l.get("role"));
			pstmt.setString(4, (String)l.get("usertype"));
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt=conn.prepareStatement(insertDefaultBranch);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("username"));
			pstmt.setString(2, (String)l.get("defbranch"));
			pstmt.executeUpdate();
			pstmt.close();
			
			Map branchData=(Map)l.get("branch_data");
			ArrayList detailData=(ArrayList)branchData.get("v");

			int s=detailData.size();
			pstmt=conn.prepareStatement(insertUserBranches);
			for(int i=0;i<s;i++){
				ArrayList detail=(ArrayList)detailData.get(i);
				if("true".equals(detail.get(2))){
					pstmt.clearParameters();
					pstmt.setString(1, (String)l.get("username"));
					pstmt.setString(2, (String)detail.get(1));					
					pstmt.setString(3, (String)detail.get(3));
					pstmt.addBatch();
				}
			}
			pstmt.executeBatch();
			pstmt.close();
			
//			Map processData=(Map)l.get("processes_data");
//			ArrayList processDetailData=(ArrayList)processData.get("v");
//
//			s=processDetailData.size();
//			pstmt=conn.prepareStatement(insertEmployeeProcess);
//			for(int i=0;i<s;i++){
//				ArrayList detail=(ArrayList)processDetailData.get(i);
//				if("true".equals(detail.get(3))){
//					pstmt.clearParameters();
//					pstmt.setString(1, (String)detail.get(2));
//					pstmt.setString(2, code);
//					pstmt.setString(3, "Active");
//					pstmt.addBatch();
//				}
//			}
//			pstmt.executeBatch();
//			pstmt.close();
			
			conn.commit();
			result="{\"result\":\"Success\",\"message\":\"Employee Added Successfully\",\"code\":\""+code+"\"}";
		}catch(Exception e){
			try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			e.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while adding employee ["+e.getMessage()+"]\"}";
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}				
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return result;
	}
	
	public String modifyEmployee(Map<String,Object> l){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		try{
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(modifyQuery);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("empname"));
			pstmt.setString(2, (String)l.get("address1"));
			pstmt.setString(3, (String)l.get("address2"));
			pstmt.setString(4, (String)l.get("city"));
			pstmt.setString(5, (String)l.get("email"));
			pstmt.setString(6, (String)l.get("mobile"));
			pstmt.setString(7, (String)l.get("phone"));
			pstmt.setString(8, (String)l.get("usertype"));
			pstmt.setString(9, (String)l.get("status"));
			pstmt.setString(10, (String)l.get("code"));
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(updateUsers);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("role"));
			pstmt.setString(2, (String)l.get("password"));
			pstmt.setString(3, (String)l.get("username"));
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(updateDefaultBranch);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("defbranch"));
			pstmt.setString(2, (String)l.get("username"));
			pstmt.executeUpdate();
			pstmt.close();

			pstmt=conn.prepareStatement(deleteUserBranches);
			pstmt.setString(1, (String)l.get("username"));
			pstmt.executeUpdate();
			pstmt.close();
			
			Map branchData=(Map)l.get("branch_data");
			ArrayList detailData=(ArrayList)branchData.get("v");

			int s=detailData.size();
			pstmt=conn.prepareStatement(insertUserBranches);
			for(int i=0;i<s;i++){
				ArrayList detail=(ArrayList)detailData.get(i);
				if("true".equals(detail.get(2))){
					pstmt.clearParameters();
					pstmt.setString(1, (String)l.get("username"));
					pstmt.setString(2, (String)detail.get(1));					
					pstmt.setString(3, (String)detail.get(3));
					pstmt.addBatch();
				}
			}
			pstmt.executeBatch();
			pstmt.close();

//			pstmt=conn.prepareStatement(deleteEmployeeProcess);
//			pstmt.setString(1, (String)l.get("code"));
//			pstmt.executeUpdate();
//			pstmt.close();

//			Map processData=(Map)l.get("processes_data");
//			ArrayList processDetailData=(ArrayList)processData.get("v");
//
//			s=processDetailData.size();
//			pstmt=conn.prepareStatement(insertEmployeeProcess);
//			for(int i=0;i<s;i++){
//				ArrayList detail=(ArrayList)processDetailData.get(i);
//				if("true".equals(detail.get(3))){
//					pstmt.clearParameters();
//					pstmt.setString(1, (String)detail.get(2));
//					pstmt.setString(2, (String)l.get("code"));
//					pstmt.setString(3, "Active");
//					pstmt.addBatch();
//				}
//			}
//			pstmt.executeBatch();
//			pstmt.close();

			conn.commit();
			result="{\"result\":\"Success\",\"message\":\"Employee Modified Successfully\",\"code\":\""+(String)l.get("code")+"\"}";
		}catch(Exception e){
			try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			e.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while modifying employee ["+e.getMessage()+"]\"}";
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}				
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return result;
	}
	public String getEmployee(String code){
		StringWriter l=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		String userName="";
		try{
			conn=DatabaseUtil.getConnection();
			l=new StringWriter();
			JsonFactory factory=new JsonFactory();
			JsonGenerator generator=factory.createJsonGenerator(l);
			generator.writeStartObject();
			pstmt=conn.prepareStatement(select);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			if(rs.next()){
				AjaxResponseUtil.writeField(generator, "code", rs.getString("em_code"), null);
				AjaxResponseUtil.writeField(generator, "empname", rs.getString("em_name"), null);
				AjaxResponseUtil.writeField(generator, "address1", rs.getString("em_address1"), null);
				AjaxResponseUtil.writeField(generator, "address2", rs.getString("em_address2"), null);
				AjaxResponseUtil.writeField(generator, "city", rs.getString("em_city"), null);
				AjaxResponseUtil.writeField(generator, "email", rs.getString("em_email"), null);
				AjaxResponseUtil.writeField(generator, "mobile", rs.getString("em_mobile"), null);
				AjaxResponseUtil.writeField(generator, "phone", rs.getString("em_phone"), null);
				AjaxResponseUtil.writeField(generator, "username", rs.getString("em_user_name"), null);
				AjaxResponseUtil.writeField(generator, "status", rs.getString("em_status"), null);
				AjaxResponseUtil.writeField(generator, "usertype", rs.getString("em_type"), null);
				AjaxResponseUtil.writeField(generator, "password", rs.getString("user_pass"), null);
				AjaxResponseUtil.writeField(generator, "role", rs.getString("role_name"),rs.getString("role_id"));
				AjaxResponseUtil.writeField(generator, "defbranch", rs.getString("branchname"), rs.getString("udb_branchcode"));
				userName=rs.getString("em_user_name");
			}
			rs.close();
			pstmt.close();
			
			pstmt=conn.prepareStatement(selectUserBranch);			
			pstmt.setString(1, userName);
			rs=pstmt.executeQuery();
			generator.writeFieldName("branch_data");			
			generator.writeStartArray();
			int i=0;
			while(rs.next()){
				generator.writeStartArray();
				AjaxResponseUtil.writeField(generator, String.valueOf(++i),null);
				AjaxResponseUtil.writeField(generator, rs.getString("branchname"),rs.getString("branchcode"));
				if(rs.getInt("selected")!=0){
					AjaxResponseUtil.writeField(generator, String.valueOf(1),null);
				}else{
					AjaxResponseUtil.writeField(generator, String.valueOf(0),null);
				}
				AjaxResponseUtil.writeField(generator, rs.getString("locationname"),rs.getString("locationcode"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();			
			generator.writeEndArray();
			
//			pstmt=conn.prepareStatement(selectEmployeeProcessMap);			
//			pstmt.setString(1, code);
//			rs=pstmt.executeQuery();
//			generator.writeFieldName("processes_data");			
//			generator.writeStartArray();
//			i=0;
//			while(rs.next()){
//				generator.writeStartArray();
//				AjaxResponseUtil.writeField(generator, String.valueOf(++i),null);
//				AjaxResponseUtil.writeField(generator, rs.getString("pg_name"),null);
//				AjaxResponseUtil.writeField(generator, rs.getString("srp_status_caption"),rs.getString("srp_code"));
//				if(rs.getInt("selected")!=0){
//					AjaxResponseUtil.writeField(generator, String.valueOf(1),null);
//				}else{
//					AjaxResponseUtil.writeField(generator, String.valueOf(0),null);
//				}
//				generator.writeEndArray();
//			}
//			generator.writeEndArray();
			
			generator.writeEndObject();
			generator.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return l.toString();
	}
	public String addRole(Map<String,Object> l){
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pColumns=null;
		ResultSet rs=null;
		String result="";
		String code="0";
		try{
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(insertRoleMaster,PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("rolename"));
			pstmt.setString(2, (String)l.get("parentrole"));
			pstmt.executeUpdate();
			
			rs=pstmt.getGeneratedKeys();
			if(rs.next()){
				code=rs.getString(1);
			}
			rs.close();
			
			pstmt=conn.prepareStatement(insertRoleMenus);
			ArrayList menus=(ArrayList)l.get("menus");
			int s=menus.size();
			for(int i=0;i<s;i++){
				pstmt.clearParameters();
				pstmt.setString(1, code);
				pstmt.setString(2, (String)menus.get(i));
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			pstmt.close();
			
			pstmt=conn.prepareStatement(insertRoleOperations);
			pColumns=conn.prepareStatement(insertRoleColumns);
			ArrayList operations=(ArrayList)l.get("operations");
			s=operations.size();
			for(int i=0;i<s;i++){
				Map operation=(Map)operations.get(i);
				pstmt.clearParameters();
				pstmt.setString(1, code);
				pstmt.setString(2, (String)operation.get("menu_id"));
				pstmt.setString(3, (String)operation.get("so_id"));
				pstmt.addBatch();
				if(!"0".equals((String)operation.get("report_id")) && !"".equals((String)operation.get("report_column"))){
					pColumns.clearParameters();
					pColumns.setString(1, code);
					pColumns.setString(2, (String)operation.get("menu_id"));
					pColumns.setString(3, (String)operation.get("report_id"));
					pColumns.setString(4, (String)operation.get("report_column"));
					pColumns.addBatch();
				}
			}
			pstmt.executeBatch();
			pstmt.close();
			
			ArrayList columns=(ArrayList)l.get("columns");
			s=columns.size();
			for(int i=0;i<s;i++){
				Map column=(Map)columns.get(i);
				if(!"0".equals((String)column.get("report_id"))){
					pColumns.clearParameters();
					pColumns.setString(1, code);
					pColumns.setString(2, (String)column.get("menu_id"));
					pColumns.setString(3, (String)column.get("report_id"));
					pColumns.setString(4, (String)column.get("report_column"));
					pColumns.addBatch();
				}
			}
			pColumns.executeBatch();
			pColumns.close();
			
			pstmt=conn.prepareStatement(insertRoleReportColumns);
			pstmt.clearParameters();
			pstmt.setString(1, code);
			pstmt.executeUpdate();
			pstmt.close();

			conn.commit();
			result="{\"result\":\"Success\",\"message\":\"Role Added Successfully\",\"code\":\""+code+"\"}";
		}catch(Exception e){
			try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			e.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while adding role ["+e.getMessage()+"]\"}";
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(rs!=null){
					rs.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(pColumns!=null){
					pColumns.close();					
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return result;
	}
	
	public String modifyRole(Map<String,Object> l){
		Connection conn=null;
		PreparedStatement pstmt=null;
		PreparedStatement pColumns=null;
		ResultSet rs=null;
		String result="";
		try{
			conn=DatabaseUtil.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(updateRoleMaster);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("rolename"));
			pstmt.setString(2, (String)l.get("parentrole"));
			pstmt.setString(3, (String)l.get("code"));
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt=conn.prepareStatement(deleteRoleMenus);
			pstmt.setString(1, (String)l.get("code"));
			pstmt.executeUpdate();
			pstmt.close();

			pstmt=conn.prepareStatement(deleteRoleOperations);
			pstmt.setString(1, (String)l.get("code"));
			pstmt.executeUpdate();
			pstmt.close();

			pstmt=conn.prepareStatement(deleteRoleColumns);
			pstmt.setString(1, (String)l.get("code"));
			pstmt.executeUpdate();
			pstmt.close();

			pstmt=conn.prepareStatement(insertRoleMenus);
			ArrayList menus=(ArrayList)l.get("menus");
			int s=menus.size();
			for(int i=0;i<s;i++){
				pstmt.clearParameters();
				pstmt.setString(1, (String)l.get("code"));
				pstmt.setString(2, (String)menus.get(i));
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			pstmt.close();

			pstmt=conn.prepareStatement(insertRoleOperations);
			pColumns=conn.prepareStatement(insertRoleColumns);
			ArrayList operations=(ArrayList)l.get("operations");
			s=operations.size();
			for(int i=0;i<s;i++){
				Map operation=(Map)operations.get(i);
				pstmt.clearParameters();
				pstmt.setString(1, (String)l.get("code"));
				pstmt.setString(2, (String)operation.get("menu_id"));
				pstmt.setString(3, (String)operation.get("so_id"));
				pstmt.addBatch();
				if(!"0".equals((String)operation.get("report_id")) && !"".equals((String)operation.get("report_column"))){
					pColumns.clearParameters();
					pColumns.setString(1, (String)l.get("code"));
					pColumns.setString(2, (String)operation.get("menu_id"));
					pColumns.setString(3, (String)operation.get("report_id"));
					pColumns.setString(4, (String)operation.get("report_column"));
					pColumns.addBatch();
				}
			}
			pstmt.executeBatch();
			pstmt.close();
			
			ArrayList columns=(ArrayList)l.get("columns");
			s=columns.size();
			for(int i=0;i<s;i++){
				Map column=(Map)columns.get(i);
				if(!"0".equals((String)column.get("report_id"))){
					pColumns.clearParameters();
					pColumns.setString(1, (String)l.get("code"));
					pColumns.setString(2, (String)column.get("menu_id"));
					pColumns.setString(3, (String)column.get("report_id"));
					pColumns.setString(4, (String)column.get("report_column"));
					pColumns.addBatch();
				}
			}
			pColumns.executeBatch();
			pColumns.close();
			
			pstmt=conn.prepareStatement(insertRoleReportColumns);
			pstmt.clearParameters();
			pstmt.setString(1, (String)l.get("roleId"));
			pstmt.executeUpdate();
			pstmt.close();

			conn.commit();
			result="{\"result\":\"Success\",\"message\":\"Role Modified Successfully\",\"code\":\""+(String)l.get("code")+"\"}";
		}catch(Exception e){
			try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			e.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while modifying role ["+e.getMessage()+"]\"}";
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(pColumns!=null){
					pColumns.close();					
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return result;
	}
	public String getRole(String code){
		StringWriter l=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		try{
			conn=DatabaseUtil.getConnection();
			l=new StringWriter();
			JsonFactory factory=new JsonFactory();
			JsonGenerator generator=factory.createJsonGenerator(l);
			generator.writeStartObject();
			pstmt=conn.prepareStatement(selectRoleMaster);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			if(rs.next()){
				AjaxResponseUtil.writeField(generator, "code", rs.getString("role_id"), null);
				AjaxResponseUtil.writeField(generator, "rolename", rs.getString("role_name"), null);
				AjaxResponseUtil.writeField(generator, "parentrole", rs.getString("parentname"), rs.getString("parentid"));
			}
			rs.close();
			pstmt.close();
			generator.writeFieldName("menus");
			generator.writeStartArray();
			pstmt=conn.prepareStatement(selectRoleMenus);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			while(rs.next()){
				generator.writeStartArray();
				generator.writeString(rs.getString("menu_id"));
				generator.writeString(rs.getString("menu_name"));
				generator.writeString(rs.getString("menu_caption"));
				generator.writeString(rs.getString("parent_id"));
				generator.writeString(rs.getString("selected"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();
			generator.writeEndArray();
			generator.writeFieldName("operations");
			generator.writeStartArray();
			pstmt=conn.prepareStatement(selectRoleOperations);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			while(rs.next()){
				generator.writeStartArray();
				generator.writeString(rs.getString("so_menu_id"));
				generator.writeString(rs.getString("so_id"));
				generator.writeString(rs.getString("so_caption"));
				generator.writeString(rs.getString("so_report_column"));
				generator.writeString(rs.getString("selected"));
				generator.writeString(rs.getString("menu_report_id"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();
			generator.writeEndArray();
			generator.writeFieldName("columns");
			generator.writeStartArray();
			pstmt=conn.prepareStatement(selectRoleColumns);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			while(rs.next()){
				generator.writeStartArray();
				generator.writeString(rs.getString("rcm_menu_id"));
				generator.writeString(rs.getString("rcm_report_id"));
				generator.writeString(rs.getString("rcm_column_name"));
				generator.writeString(rs.getString("column_title"));
				generator.writeString(rs.getString("selected"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();
			generator.writeEndArray();
			generator.writeEndObject();			
			generator.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return l.toString();
	}
	public String getParentRoleMenus(String code){
		StringWriter l=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Connection conn=null;
		try{
			conn=DatabaseUtil.getConnection();
			l=new StringWriter();
			JsonFactory factory=new JsonFactory();
			JsonGenerator generator=factory.createJsonGenerator(l);
			generator.writeStartObject();
			generator.writeFieldName("menus");
			generator.writeStartArray();
			pstmt=conn.prepareStatement(selectParentRoleMenus);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			while(rs.next()){
				generator.writeStartArray();
				generator.writeString(rs.getString("menu_id"));
				generator.writeString(rs.getString("menu_name"));
				generator.writeString(rs.getString("menu_caption"));
				generator.writeString(rs.getString("parent_id"));
				generator.writeString(rs.getString("selected"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();
			generator.writeEndArray();
			//a.so_menu_id,a.so_id,a.so_name,a.so_caption,a.so_report_column, 0 selected
			generator.writeFieldName("operations");
			generator.writeStartArray();
			pstmt=conn.prepareStatement(selectParentRoleOperations);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			while(rs.next()){
				generator.writeStartArray();
				generator.writeString(rs.getString("so_menu_id"));
				generator.writeString(rs.getString("so_id"));
				generator.writeString(rs.getString("so_caption"));
				generator.writeString(rs.getString("so_report_column"));
				generator.writeString(rs.getString("selected"));
				generator.writeString(rs.getString("menu_report_id"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();
			generator.writeEndArray();
			generator.writeFieldName("columns");
			generator.writeStartArray();
			pstmt=conn.prepareStatement(selectParentRoleColumns);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			while(rs.next()){
				generator.writeStartArray();
				generator.writeString(rs.getString("rcm_menu_id"));
				generator.writeString(rs.getString("rcm_report_id"));
				generator.writeString(rs.getString("rcm_column_name"));
				generator.writeString(rs.getString("column_title"));
				generator.writeString(rs.getString("selected"));
				generator.writeEndArray();
			}
			rs.close();
			pstmt.close();
			generator.writeEndArray();
			generator.writeEndObject();			
			generator.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return l.toString();
	}
	public String checkUser(String userCode){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		try{
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(checkUserCode);
			pstmt.clearParameters();
			pstmt.setString(1, userCode);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result="{\"result\":\"Success\",\"message\":\"Logged in successfully\",\"code\":\""+userCode+"\"}";
			}else{
				result="{\"result\":\"Failed\",\"message\":\"UserCode is not correct/available\",\"code\":\"0\"}";
			}
		}catch(Exception e){
			try{
				if(conn!=null){
					conn.rollback();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
			e.printStackTrace();
			result="{\"result\":\"Error\",\"message\":\"Error while validating user code ["+e.getMessage()+"]\"}";
		}finally{
			try{
				if(conn!=null){
					conn.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(rs!=null){
					rs.close();
				}
			}catch(SQLException esql){
				esql.printStackTrace();
			}
		}
		return result;
	}
	public static UserManager getInstance(){		
		 return new UserManager();
	}
}