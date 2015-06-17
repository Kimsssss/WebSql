package com.sqlweb.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//포워드 엔지니어링위한 jdbc
public class UserDBConection {
	
	public static Connection OracleMakeConnection(String ipAdress, String id, String pwd) throws ClassNotFoundException,SQLException {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection c = DriverManager.getConnection("jdbc:oracle:thin:@"+ipAdress+":1521:XE",id,pwd);
		return c;
	}

}
