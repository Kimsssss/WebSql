package com.sqlweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DMLDAO {

   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   
   public ArrayList<String> gettablelist(Connection c,String id){
      
      ArrayList<String> list = new ArrayList<String>();
      this.con = c;
      
      //select * from all_tables where owner='PROJECT';
      
      String selectTableSql = "select * from all_tables where owner='"+id.toUpperCase()+"'";
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
   
   public ArrayList<String> columnselect(Connection c,String tablename,String id){
      
      ArrayList<String> list = new ArrayList<String>();
      this.con = c;
      
      //select * from all_tables where owner='PROJECT';
      
      String columnselectSql = "SELECT COLUMN_NAME FROM ALL_COL_COMMENTS where owner='"+id.toUpperCase()+"' and table_name='"+tablename+"'";
      //String createTableSql = "create table aaa(asd varchar2(20))";
      
      System.out.println("columnselect DAO : "+columnselectSql);
      System.out.println(tablename+" / "+id);
      
      
      try {
         pstmt = con.prepareStatement(columnselectSql);
         rs = pstmt.executeQuery();
         System.out.println("DAO 테이블 컬럼 불러오기");
         while(rs.next()){
             list.add(rs.getString("COLUMN_NAME"));
             System.out.println(rs.getString("COLUMN_NAME"));
             
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
   
public ArrayList<String> tableview(Connection c,String tablename,String id,String list,String wheretext){
      
      ArrayList<String> table = new ArrayList<String>();
      this.con = c;
      String columnselectSql ="";
      String[] colname = {};
      //ArrayList<String> datatype = new ArrayList<String>();
      String datatypeSql ="";
      Map<String, String> datatype = new HashMap<String, String>();
      
      
      colname = list.split(",");
      System.out.println(list);
      System.out.println(wheretext);
      System.out.println(colname);
      System.out.println(colname.length);
      for(int i=0; i<colname.length;i++){
          try {
           System.out.println(colname[i]);
           datatypeSql = "select DATA_TYPE from USER_TAB_COLS where table_name='"+tablename+"' and column_name='"+colname[i]+"'";
           pstmt = con.prepareStatement(datatypeSql);
         rs = pstmt.executeQuery();
         if(rs.next()){
            System.out.println(rs.getString("DATA_TYPE"));
            datatype.put(colname[i], rs.getString("DATA_TYPE"));
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("DAO 데이터 타입 가져오기 오류오류오류");
      }
          System.out.println("DAO 데이터 타입 가져오기");
      }
      for(int i=0; i<colname.length;i++){
         System.out.println("datatype key : "+colname[i]+"datatype value : "+datatype.get(colname[i]));}
      //select * from all_tables where owner='PROJECT';
      
      
      
      
      
      
      if(wheretext.equals("")){
         columnselectSql = "SELECT "+list+" FROM "+tablename;
      }else{
         columnselectSql = "SELECT "+list+" FROM "+tablename+" WHERE "+wheretext;
         /*String a = "";
         String b = "";
         a = columnselectSql.substring(0,columnselectSql.indexOf("WHERE"));
         b = columnselectSql.substring(columnselectSql.indexOf("WHERE"),columnselectSql.length());
         System.out.println("a : "+a);
         System.out.println("b : "+b);
         */
         for(int i=0; i<colname.length;i++){
             Pattern p1 = Pattern.compile("("+colname[i].toUpperCase()+")");
             Pattern p2 = Pattern.compile("("+colname[i].toLowerCase()+")");
             Matcher m1 = p1.matcher(wheretext);
             Matcher m2 = p2.matcher(wheretext);
             System.out.println(datatype.get(colname[i]));
             System.out.println(wheretext);
             System.out.println(p1);
             System.out.println(p2);
             if(!datatype.get(colname[i]).equals("NUMBER")){
                while(m1.find()){
                   System.out.println("시작위치 : "+m1.start()+"  끝나는 위치: "+m1.end());
                }
                while(m2.find()){
                   System.out.println("시작위치 : "+m2.start()+"  끝나는 위치: "+m2.end());
                }
             }
          }
      }
      
      
      
      
      
      //String createTableSql = "create table aaa(asd varchar2(20))";
      int colend = 0;
      System.out.println("columnselect DAO : "+columnselectSql);
      System.out.println(tablename+" / "+id);
      String[] arr = list.split(",");
      for(int i=0; i<arr.length;i++){
         table.add(arr[i]);
         colend += 1;
      }
      System.out.println("colend : "+colend);
      System.out.println(Integer.toString(colend));
      try {
         pstmt = con.prepareStatement(columnselectSql);
         rs = pstmt.executeQuery();
         System.out.println("DAO 테이블 컬럼 불러오기");
         while(rs.next()){
            for(int i=0; i<arr.length;i++){
               table.add(rs.getString(arr[i]));
               System.out.println(rs.getString(arr[i]));
            }
             
          }
         table.add(Integer.toString(colend));
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally{
         try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
         try {con.close();} catch (SQLException e) {e.printStackTrace();}
         try {rs.close();} catch (SQLException e) {e.printStackTrace();}
      }
      
      return table;
      
   }
   


}