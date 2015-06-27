package com.sqlweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLRecoverableException;


public class Jdbc {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public boolean tf;

	public Connection OracleMakeConnection(String ipAdress, String id, String pwd){
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("oracle 드라이버 로드");
			Connection c = DriverManager.getConnection("jdbc:oracle:thin:@"+ipAdress+":1521:XE",id,pwd);
			if(!c.isClosed()){
				System.out.println("접속 : "+c.isClosed());
				tf = true;
				return c;
			}else{
				System.out.println("접속 : "+c.isClosed());
				tf = false;
				return null;
			}
			
		}catch(SQLRecoverableException e){
			System.out.println("error: SQLRecoverableException");
			tf = false;
			e.printStackTrace();
			return null;

		}catch (ClassNotFoundException e) {
			System.out.println("error: ClassNotFoundException");
			tf = false;
			e.printStackTrace();
			return null;
		}catch(SQLException e){
			System.out.println("error: SQLException");
			tf = false;
			e.printStackTrace();
			return null;
		}
		
	}
	

	//웹사이트를 이용한는 유저들이 아이피와 아이디, 비밀번호를 입력하면 그 db에 연결
	public Connection ConnectionMake(String ipAdress, String id, String pwd){
		
		Connection c;
		c = OracleMakeConnection(ipAdress, id, pwd);
		return c;
	}
}
