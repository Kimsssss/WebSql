package com.sqlweb.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DDLController {


	/*@RequestMapping(value="")
	public void CreateTable(){

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
	
	
	@RequestMapping(value="")
	public void CreateTable(HttpServletRequest request){
		//request.getParameter(arg0)
		//Connection con = ConnectionMake();
		
	}
	
	@RequestMapping(value="")
	public void DropTable(){
		
		
	}
	
	@RequestMapping(value="")
	public void CreateSequence(){
		
		 
	}*/
}
