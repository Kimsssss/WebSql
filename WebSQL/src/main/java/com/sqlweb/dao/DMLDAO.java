package com.sqlweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DMLDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ArrayList<String> gettablelist(Connection c,String id){
		
		ArrayList<String> list = new ArrayList<String>();
		this.con = c;
		
		//select * from all_tables where owner='PROJECT';
		
		String selectTableSql = "select * from all_tables where owner='"+id+"'";
		//String createTableSql = "create table aaa(asd varchar2(20))";
		System.out.println("contable DAO : "+selectTableSql);
		
		
		
		try {
			pstmt = con.prepareStatement(selectTableSql);
			rs = pstmt.executeQuery();
			System.out.println("DAO 테이블 이름 불러오기");
			while(rs.next()){
				 list.add(rs.getString("TABLE_NAME"));
				 System.out.println(rs.getString("TABLE_NAME"));
				 
			 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {con.close();} catch (SQLException e) {e.printStackTrace();}
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return list;
		
	}
}
