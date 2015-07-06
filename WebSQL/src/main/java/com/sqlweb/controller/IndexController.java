
package com.sqlweb.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlweb.dao.DMLDAO;
import com.sqlweb.dto.AccountDTO;
import com.sqlweb.utils.Jdbc;



@Controller
public class IndexController {
   
   Connection c;
   
   @RequestMapping("index.html")
   public String index(HttpSession session)
   {
      System.out.println("index controller");
         System.out.println("index controller session "+session.getAttribute("acdto"));
         if(session.getAttribute("acdto")!=null){
            AccountDTO acdto = (AccountDTO)session.getAttribute("acdto");
            System.out.println("index controller session : "+acdto.getId());
            System.out.println("index controller session : "+acdto.getPwd());
            System.out.println("index controller session : "+acdto.getIp());
            System.out.println("index controller session : "+acdto.getUid());
            session.setAttribute("acdto", acdto);
         }
         
      return "home.index";
      
   }
   
   @RequestMapping("main.html")
   public String index2()
   {
      return "home2.index2";
      
   }
   
   @RequestMapping("account.html")
   public String account()
   {
      return "account";
      
   }
   
   @RequestMapping("DDLintro.html")
   public String ddlintro()
   {
      return "home.DDLintro";            
   }
   
   @RequestMapping("accountcon.html")
   public void accountConnection(AccountDTO ac,HttpServletResponse res,HttpSession session)
   {
      
      res.setCharacterEncoding("UTF-8");
      
      String ip = ac.getIp();
      String id = ac.getId();
      String uid = ac.getUid();
      String pwd = ac.getPwd();
      
      
      
      System.out.println(ac.getUid());
      System.out.println(ac.getId());
      System.out.println(ac.getIp());
      System.out.println(ac.getPwd());
      /*HttpServletRequest req, HttpServletResponse res
      String uid = req.getParameter("uiduid");
      String ip = req.getParameter("ipip");
      String id = req.getParameter("idid");
      String pwd = req.getParameter("pwdpwd");
      
      System.out.println(uid);
      System.out.println(ip);
      System.out.println(id);
      System.out.println(pwd);*/
      
      try {
            int result = 0;
            
            System.out.println("accountConnection ip :"+ip);
            System.out.println("accountConnection id :"+id);
            System.out.println("accountConnection pwd :"+pwd);
            System.out.println("accountConnection uid :"+uid);
            
            Jdbc jb = new Jdbc();
            c = jb.ConnectionMake("192.168.7.74", "PROJECT", "1004");
            
            Connection AccountC = jb.ConnectionMake(ip, id, pwd);
            if(AccountC == null){
               String[] errormsg = {"[연결이 실패했습니다.]"};
               System.out.println(errormsg);
               JSONArray codes = JSONArray.fromObject(errormsg);
               
               res.getWriter().print(codes);
               return;
            }
            DMLDAO dao = new DMLDAO();
            
            
            
            result = dao.setAccount(c, uid, ip, id, pwd,session);
            System.out.println("result : "+result);
           
            JSONArray codes = JSONArray.fromObject(result);
            
            res.getWriter().print(codes);
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         System.out.println("contable 서버로 list 전송완료");
      
      
      return;
      
   }
   
   @RequestMapping(value="sessionun.html")
   public String sessionusername(String username,String password,HttpSession session){
      System.out.println("sessionusername --sessionun : "+username);
      System.out.println("sessionusername --password : "+password);
      
      Jdbc jb = new Jdbc();
      Connection c = jb.ConnectionMake("192.168.7.74", "PROJECT", "1004");
      
      DMLDAO dao = new DMLDAO();
      String message = dao.sessionAccount(c, username, session);
      
      System.out.println("sessionusername message : "+message);
      
      return message;
      
   }
}