package com.sqlweb.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.DDLDAO;
import com.sqlweb.utils.Jdbc;

@Controller
public class DDLController {

	Connection c;
	
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
      String[] colCons = request.getParameterValues("colcons");
      String[] hidden_tablename = request.getParameterValues("hidden_tablename");
      String[] hidden_colname = request.getParameterValues("hidden_colname");
      
      String tableName = request.getParameter("tablename");
      
      boolean isPK = false;
      boolean isFK = false;
      boolean isNN = false;
      
      System.out.println(tableName);
      
      if(con.isClosed()){
         con = ConnectionMake(ip, id, pwd);
      }
      
      
      //테이블 생성
      String createTableSql = "create table "+tableName+"(";
      for(int i=0;i<colName.length;i++){
         createTableSql += colName[i]+" "+colDataType[i];
         if(i<colName.length-1){
            createTableSql +=", ";
         }
      }
      createTableSql +=")";

      System.out.println(createTableSql);
      
      //alter table sql문 만들기
      String alterTableSql = "alter table " + tableName +" add constraint " + tableName +"_";
      String alterTableSql_PK="";
     String alterTableSql_FK="";
     String alterTableSql_NN="";
      for(int i=0;i<colName.length;i++){
         isPK=false;
         isFK=false;
         isNN=false;
         String[] colConsArray = colCons[i].split(",");
         alterTableSql += colName[i]+"_";
         alterTableSql_PK = alterTableSql;
         alterTableSql_FK = alterTableSql;
         alterTableSql_NN="alter table " + tableName +" MODIFY ";
         for(int j=0;j<colConsArray.length;j++){
            //alter table 테이블명 modify 컬럼명 not null
            if(colConsArray[j].equals("PRIMARY KEY")){
               alterTableSql_PK+="PK PRIMARY KEY("+colName[i]+")";
               isPK=true;
            }else if(colConsArray[j].equals("FOREIGN KEY")){
               alterTableSql_FK+="FK FOREIGN KEY("+colName[i]+") REFERENCES "+hidden_tablename[i]+"("+hidden_colname[i]+")";
               isFK=true;
            }else if(colConsArray[j].equals("NOT NULL")){
               alterTableSql_NN+=colName[i]+" NOT NULL";
               isNN=true;
            }
         }
         
       }
      System.out.println(alterTableSql_PK);
      System.out.println(alterTableSql_FK);
      System.out.println(alterTableSql_NN);
      try {
         pstmt= con.prepareStatement(createTableSql);
         pstmt.executeUpdate();
         if(isPK){
            pstmt = con.prepareStatement(alterTableSql_PK);
             pstmt.executeUpdate();
         }
         if(isFK){
            pstmt = con.prepareStatement(alterTableSql_FK);
             pstmt.executeUpdate();
         }
         if(isNN){
            pstmt = con.prepareStatement(alterTableSql_NN);
             pstmt.executeUpdate();
         }
         
         
         
      } catch (SQLException e) {
         //FK추가시 테이블이 없을때 942 테이블은 있는데 컬럼이 없을때 904  테이블 컬럼 다있는데 데이터 타입이 다를때 2267에러
         //테이블 생성시 이름 겹침 955에러 컬럼 이름 겹침 957 존재하지 않는 데이터 타입 902
         System.out.println(e.getErrorCode());
         if(e.getErrorCode()==955){
            return "ddl.Errer955";
         }else if(e.getErrorCode()==957){
            return "ddl.Errer957";
         }else if(e.getErrorCode()==902){
            return "ddl.Errer902";
         }else if(e.getErrorCode()==942){
            return "ddl.Errer942";
         }else if(e.getErrorCode()==904){
            return "ddl.Errer904";
         }else if(e.getErrorCode()==2267){
            return "ddl.Errer2267";
         }
         
         
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
   
   
   
   // Alter add
   @RequestMapping(value = "alterAdd.html", method = RequestMethod.POST)
   public void deleteTable(String tablename, String ip, String id, String pwd,
         String addtxt, HttpServletResponse res) throws IOException {
      int row = 0;

      DDLDAO dao = new DDLDAO();
      Jdbc jb = new Jdbc();
      c = jb.ConnectionMake(ip, id, pwd);
      
      row = dao.alterAdd(c, tablename, id, addtxt);
      String error = dao.getStr();
      
      JSONObject json = new JSONObject();
      json.put("row", row);
      json.put("error", error);
      res.getWriter().print(json);

   }
   
   // Alter add
   @RequestMapping(value = "alterModify.html", method = RequestMethod.POST)
   public void alterModify(String tablename, String ip, String id, String pwd,
         String modifytxt, HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");
      boolean row= false;
      String error = "";
      DDLDAO dao = new DDLDAO();
      Jdbc jb = new Jdbc();
      c = jb.ConnectionMake(ip, id, pwd);
      
      row = dao.alterModify(c, tablename, id, modifytxt);
      
      JSONObject json = new JSONObject();
      json.put("row", row);
      json.put("error", error);
      res.getWriter().print(json);
   }
   
   // DataType 받아오는 ->  modify 후 비동기로 표 나타남
   @RequestMapping(value="datatype.html", method=RequestMethod.POST)
   public void inputselect(String ip, String id, String pwd, HttpServletResponse res,String tablename){
      try { 
         ArrayList<String> arr = new ArrayList<String>();
         
         Jdbc jb = new Jdbc();
         c = jb.ConnectionMake(ip, id, pwd);
         
         DDLDAO dao = new DDLDAO();
         
         arr = dao.datatype(c, tablename, id);
   
         JSONArray codes = JSONArray.fromObject(arr);
   
         res.getWriter().print(codes);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
  // dropTable
   
   @RequestMapping(value = "dropTable.html", method = RequestMethod.POST)
   public void dropTable(String tablename, String ip, String id, String pwd, HttpServletResponse res) throws IOException {
      int row = 0;

      DDLDAO dao = new DDLDAO();
      Jdbc jb = new Jdbc();
      c = jb.ConnectionMake(ip, id, pwd);
      
      row = dao.dropTable(c, tablename, id);
      res.getWriter().print(row);

   }
   
   
   @RequestMapping(value = "tableview.html")
   public String tableimport() {
      return "import";
   }
   
   @RequestMapping(value="tableview.html", method=RequestMethod.POST)
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
   

}