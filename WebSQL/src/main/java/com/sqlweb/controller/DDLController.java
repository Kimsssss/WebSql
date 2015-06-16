package com.sqlweb.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DDLController {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;


	//웹사이트를 이용한는 유저들이 아이피와 아이디, 비밀번호를 입력하면 그 db에 연결
	private Connection ConnectionMake(String ipAdress, String id, String pwd){
		Connection c;
		try {
			c = new UserDBConection().OracleMakeConnection(ipAdress, id, pwd);
			return c;
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		
		return null;
	}
	
	
	@RequestMapping(value="/create.htm")
	public String CreateTable(HttpServletRequest request){
		String ip = request.getParameter("ipadress");
		String id = request.getParameter("dbid");
		String pwd = request.getParameter("pwd");
		String tableName = request.getParameter("tablename");
		String col1 = request.getParameter("col1");
		String col2 = request.getParameter("col2");
		String col1_data = request.getParameter("col1_data");
		String col2_data = request.getParameter("col2_data");
		
		/*동적으로 바꾸면
		List<String> col = new ArrayList<String>();
		List<String> coldata = new ArrayList<String>();
		  for(int i=1;i<=히든태그에넣어진col의 갯수값;i++){
				col.add=request.getParameter("col"+i);
				coldata.add=request.getParameter("coldata"+i);
			}
		 */
		

		con = ConnectionMake(ip,id,pwd);
		
		String createTableSql = "create table "+tableName+"("+col1+" "+col1_data+")";
		//String createTableSql = "create table aaa(asd varchar2(20))";
		System.out.println(createTableSql);
		
		try {
			pstmt= con.prepareStatement(createTableSql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return "ck";
	} 
	/*
	@RequestMapping(value="")
	public void DropTable(){
		
		
	}
	
	@RequestMapping(value="")
	public void CreateSequence(){
		
		 
	}*/
}
