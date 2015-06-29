package com.sqlweb.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.DMLDAO;
import com.sqlweb.utils.Jdbc;

@Controller
public class DMLController {

	Connection c;
	
	@RequestMapping(value="/dml.html", method=RequestMethod.GET)
	public String test(){
		System.out.println("DML controller");
		return "DML";
	}
	
	@RequestMapping(value="/conview.html", method=RequestMethod.POST)
	public void connectionview(HttpServletRequest req, HttpServletResponse res){
		
		String ip = req.getParameter("ip");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd"); 
		
		System.out.println("ip :"+ip);
		System.out.println("id :"+id);
		System.out.println("pwd :"+pwd);
		
		Jdbc jb = new Jdbc();
		
		try {
			c = jb.ConnectionMake(ip, id, pwd);
			System.out.println("DML Controller : "+jb.tf);
			
			ArrayList m = new ArrayList();
			
			m.add(0, ip);
			m.add(1, id);
			m.add(2, pwd);
			m.add(3, jb.tf);
			
			JSONArray codes = JSONArray.fromObject(m);
			res.getWriter().print(codes);
			System.out.println("서버로 list 전송완료");
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/contable.html", method=RequestMethod.POST)
	public void contable(String ip, String id, String pwd, HttpServletResponse res){
		
		try {
			ArrayList<String> arr = new ArrayList<String>();
			
			System.out.println("contable ip :"+ip);
			System.out.println("contable id :"+id);
			System.out.println("contable pwd :"+pwd);
			
			Jdbc jb = new Jdbc();
			c = jb.ConnectionMake(ip, id, pwd);
			
			DMLDAO dao = new DMLDAO();
			
			arr = dao.gettablelist(c, id);
			
			JSONArray codes = JSONArray.fromObject(arr);
			
			res.getWriter().print(codes);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("서버로 list 전송완료");
		
		
	}
	/*@RequestMapping
	public void Select(){
		
	}
	
	@RequestMapping
	public void Update(){
		
	}
	
	@RequestMapping
	public void Insert(){
		
	}
	
	@RequestMapping
	public void Delete(){
		
	}*/
	
}
