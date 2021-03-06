package com.sqlweb.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.DDLDAO;
import com.sqlweb.dao.DMLDAO;
import com.sqlweb.dto.AccountDTO;
import com.sqlweb.utils.Jdbc;

@Controller
public class DMLController {

   Connection c;
   
   @RequestMapping(value="/dml.html", method=RequestMethod.GET)
   public String test(HttpSession session){
     /* System.out.println("DML controller");
      System.out.println("DML controller session "+session.getAttribute("acdto"));
      AccountDTO acdto = (AccountDTO)session.getAttribute("acdto");
      System.out.println("DML controller session : "+acdto.getId());
      System.out.println("DML controller session : "+acdto.getPwd());
      System.out.println("DML controller session : "+acdto.getIp());
      System.out.println("DML controller session : "+acdto.getUid());
      session.setAttribute("acdto", acdto);*/
      return "DML";
   }
   
   @RequestMapping(value="/conview.html", method=RequestMethod.POST)
   public void connectionview(HttpServletRequest req, HttpServletResponse res){
      HttpSession session = req.getSession();
      String ip = req.getParameter("ip");
      String id = req.getParameter("id");
      String pwd = req.getParameter("pwd"); 
      
      
      session.setAttribute("iptxt", ip);
      session.setAttribute("idtxt", id);
      session.setAttribute("pwdtxt", pwd);
      
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
      System.out.println("contable 서버로 list 전송완료");
      
      
   }
   
   @RequestMapping(value="inputselect.html", method=RequestMethod.POST)
   public void inputselect(String ip, String id, String pwd, HttpServletResponse res,String tablename){
      try {
         //컬럼명 
         ArrayList<String> arr = new ArrayList<String>();

         System.out.println("inputselect ip :"+ip);
         System.out.println("inputselect id :"+id);
         System.out.println("inputselect pwd :"+pwd);
         System.out.println("inputselect tablename :"+tablename);
         
         Jdbc jb = new Jdbc();
         c = jb.ConnectionMake(ip, id, pwd);
         
         DMLDAO dao = new DMLDAO();
         
         arr = dao.columnselect(c, tablename, id);
   
         JSONArray codes = JSONArray.fromObject(arr);
   
         res.getWriter().print(codes);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      System.out.println("inputselect 서버로 list 전송완료");
   }
   
   @RequestMapping(value="selectview.html", method=RequestMethod.POST)
   public void selectview(String list,String tablename,String ip,String id,String pwd,HttpServletResponse res,String wheretext){
      

      res.setCharacterEncoding("utf-8");
      
      List<String> checkList = JSONArray.fromObject(list);
      System.out.println("list : "+checkList.get(0));
      System.out.println("controller wheretext : "+wheretext);
      String str = "";
      for(int i=0; i<checkList.size(); i++){
         str += checkList.get(i)+",";
      }
      System.out.println(str);
      System.out.println(str.substring(0,str.length()-1));
      try {
         ArrayList<String> arr = new ArrayList<String>();
         
         System.out.println("selectview ip :"+ip);
         System.out.println("selectview id :"+id);
         System.out.println("selectview pwd :"+pwd);
         System.out.println("selectview tablename :"+tablename);
         
         Jdbc jb = new Jdbc();
         c = jb.ConnectionMake(ip, id, pwd);
         
         DMLDAO dao = new DMLDAO();
         
         arr = dao.tableview(c, tablename, id, str.substring(0,str.length()-1),wheretext);
         
         JSONArray codes = JSONArray.fromObject(arr);
         
         res.getWriter().print(codes);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      System.out.println("selectview 서버로 list 전송완료");
   }
   

   @RequestMapping(value="inputdataTYPE.html", method=RequestMethod.POST)
   public void inputdatatype(String ip, String id, String pwd, HttpServletResponse res,String tablename){
      try {
 
        //컬럼 타입  
        ArrayList<String> arrcoltype  = new ArrayList<String>();
         
         System.out.println("inputselect ip :"+ip);
         System.out.println("inputselect id :"+id);
         System.out.println("inputselect pwd :"+pwd);
         System.out.println("inputselect tablename :"+tablename);
         
         Jdbc jb = new Jdbc();
         c = jb.ConnectionMake(ip, id, pwd);
         
         DMLDAO dao = new DMLDAO();

         
        arrcoltype = dao.columntype(c, tablename,id);
         
         System.out.println(arrcoltype);
         
  
         JSONArray codetype = JSONArray.fromObject(arrcoltype);
         
         res.getWriter().print(codetype);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      System.out.println("서버로 list 전송완료");
   }
   
   
   
   
   @RequestMapping(value="tableviewinsert.html", method=RequestMethod.POST)
   public void tableview(String tablename,String ip,String id,String pwd, HttpServletResponse res){

 res.setCharacterEncoding("utf-8");
      
    
      String str = "";
      try {
         ArrayList<String> arr = new ArrayList<String>();
         
         System.out.println("selectview ip :"+ip);
         System.out.println("selectview id :"+id);
         System.out.println("selectview pwd :"+pwd);
         System.out.println("selectview tablename :"+tablename);
         
         Jdbc jb = new Jdbc();
         c = jb.ConnectionMake(ip, id, pwd);
         
        DDLDAO dao = new DDLDAO();
         
         arr = dao.tablecolview(c, tablename, id);
         System.out.println(arr.toString());
         
         JSONArray codes = JSONArray.fromObject(arr);
         System.out.println(codes);
         res.getWriter().print(codes);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
   
   
   
   
   
   
   @RequestMapping(value="insertcheck.html", method=RequestMethod.POST)
   public void insertcheck( String list,String tablename,String ip,String id,String pwd,int inserts, HttpServletResponse res , HttpServletRequest req ) throws IOException{
	   
	   
	   List<String>  checkList = JSONArray.fromObject(list);
         
	  
        System.out.println("inserts "+inserts);
     
         System.out.println("list : "+checkList.get(0) + " TEST MASTER ");
         
        

         
         String str = "";
         for(int i=0; i<checkList.size(); i++){
            str += checkList.get(i)+",";
         }
         System.out.println(str);
         System.out.println(str.substring(0,str.length()-1));
       
            ArrayList<String> arr = new ArrayList<String>();
            
            System.out.println("selectview ip :"+ip);
            System.out.println("selectview id :"+id);
            System.out.println("selectview pwd :"+pwd);
            System.out.println("selectview tablename :"+tablename);
            
            Jdbc jb = new Jdbc();
            c = jb.ConnectionMake(ip, id, pwd);
            
  
            DMLDAO dao = new DMLDAO();
            
            
            int result = 0;
   
            result = dao.insertcheck(c, tablename, id, checkList ,inserts);
            String error = dao.getStr();
            
            JSONObject json = new JSONObject();
    		json.put("result", result);
    		json.put("error", error);
    		res.getWriter().print(json);
            
        
         System.out.println("서버로 list 전송완료");
      }
   
   
   
	@RequestMapping(value = "deleteTable.html", method = RequestMethod.POST)
	public void deleteTable(String tablename, String ip, String id, String pwd,
			String coldelete, String deletetxt, HttpServletResponse res, HttpServletRequest req) throws IOException {
		int row = 0;

		DMLDAO dao = new DMLDAO();
		Jdbc jb = new Jdbc();
		c = jb.ConnectionMake(ip, id, pwd);
		
		row = dao.deleteTable(c, tablename, id, coldelete, deletetxt);
		
		String error = dao.getStr();
		
		JSONObject json = new JSONObject();
		json.put("row", row);
		json.put("error", error);
		res.getWriter().print(json);

	}
   
   @RequestMapping(value="updateview.html", method=RequestMethod.POST)
   public void updateview(String ip, String id, String pwd, HttpServletResponse res,String tablename,
         String wheretext,String textupdate,String colupdate){
      try {
            Jdbc jb = new Jdbc();
            c = jb.ConnectionMake(ip, id, pwd);
            
            DMLDAO dao = new DMLDAO();
            
            int result = dao.update(c, tablename, wheretext, textupdate, colupdate);
            
            JSONArray codes = JSONArray.fromObject(result);
            
            res.getWriter().print(codes);
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
   }
   
   
   
    
   /*@RequestMapping
   public void Select(){
      
   }
   
   @RequestMapping
   public void Update(){
      
   }
   
 
   */
   
}
