package com.sqlweb.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DDLController {

   static Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   static String ip;
   static String id;
   static String pwd;

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
   
   //여러 테이블 생성
   @RequestMapping(value="/creates.htm")
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
      
      return "ddl.ck";
   }
   
   
   //테이블 단일 생성
   @RequestMapping(value="/create.htm")
   public String CreateTables(HttpServletRequest request) throws SQLException{
      
      String[] colName = request.getParameterValues("colName");
      String[] colDataType = request.getParameterValues("coldatatype");
      String tableName = request.getParameter("tablename");
      
      
      System.out.println(Arrays.toString(colName));
      System.out.println(Arrays.toString(colDataType));
      System.out.println(tableName);
      
      if(con.isClosed()){
         con = ConnectionMake(ip, id, pwd);
      }
      
      
   
      String createTableSql = "create table "+tableName+"(";
      for(int i=0;i<colName.length;i++){
         createTableSql += colName[i]+" "+colDataType[i];
         if(i<colName.length-1){
            createTableSql +=", ";
         }
      }
      createTableSql +=")";

      System.out.println(createTableSql);
      
      
      try {
         pstmt= con.prepareStatement(createTableSql);
         pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         //return null;
      }finally{
         try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
         try {con.close();} catch (SQLException e) {e.printStackTrace();}
      }
      
      
      
      return "ddl.DDL";
   } 
   
   //DDL.jsp화면 호출
   @RequestMapping(value="/DDL.html", method=RequestMethod.GET)
   public String test(){
      System.out.println("DDL controller");
      return "ddl.DDL";
   }
   
   //Connection연결
   @RequestMapping(value="/conn.html", method=RequestMethod.GET)
   public String Conn(HttpServletRequest request) throws SQLException{
      ip = request.getParameter("DBip");
      id = request.getParameter("DBid");
      pwd = request.getParameter("DBpwd");
      
      System.out.println(ip+id+pwd);
      
      con = ConnectionMake(ip,id,pwd);
      
      if(con.isClosed()==false){
         return "ddl.ConnectionOpen";
      }else{
         return "ddl.ConnectionClosed";
      }
      
   }
   
   /*
   @RequestMapping(value="")
   public void DropTable(){
      
      
   }
   
   @RequestMapping(value="")
   public void CreateSequence(){
      
       
   }*/
}