package com.sqlweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
  /* 컬럼명 */
   public ArrayList<String> columnselect(Connection c,String tablename,String id){
      
      ArrayList<String> list = new ArrayList<String>();
      this.con = c;
      
      //select * from all_tables where owner='PROJECT';
      
      String columnselectSql = "SELECT COLUMN_NAME FROM ALL_COL_COMMENTS where owner='"+id+"' and table_name='"+tablename+"'";
     
     
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
   
   
   /*데이터 타입*/
   public ArrayList<String> columntype(Connection c,String tablename){
      
      
       ArrayList<String> list = new ArrayList<String>();
        
       this.con = c;

        
        String columnDatatypeSql = "SELECT DATA_TYPE FROM all_tab_columns where table_name='"+tablename+"'";
     
        System.out.println("columnDatatypeSql DAO : "+columnDatatypeSql);
        System.out.println(tablename);
        
        
        try {
           pstmt = con.prepareStatement(columnDatatypeSql);
           rs = pstmt.executeQuery();
           System.out.println("DAO 테이블 컬럼타입 불러오기");
           while(rs.next()){
               list.add(rs.getString("DATA_TYPE"));
               System.out.println(rs.getString("DATA_TYPE"));
               
            }
           
        } catch (SQLException e) {
          
           e.printStackTrace();
           System.out.println("SQL ERROR");
           
        }finally{
           try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
           try {con.close();} catch (SQLException e) {e.printStackTrace();}
           try {rs.close();} catch (SQLException e) {e.printStackTrace();}
        }
        
        return list;
        
     
      
   }
   
public ArrayList<String> tableview(Connection c,String tablename,String id,String list){
      
      ArrayList<String> table = new ArrayList<String>();
      this.con = c;
      
      //select * from all_tables where owner='PROJECT';
      
      String columnselectSql = "SELECT "+list+" FROM "+tablename;
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





/*데이터 삽입(insert)*/   
public int insertcheck(Connection c,String tablename,String id,String list){
   
   int insertresult = 0;
   this.con=c;

   try {

      String insertQuery="INSERT INTO "+tablename+" VALUES(" +list+ ")";
      
      
      System.out.println(insertQuery);
      pstmt=con.prepareStatement(insertQuery);
      
      insertresult = pstmt.executeUpdate();
      
      
      
      System.out.println(insertresult);
      
      if(insertresult > 0){
         return insertresult;
      }
      
      
      
   } catch (SQLException e) {
      
      e.printStackTrace();
      System.out.println("SQL ERROR");
      return insertresult;
      
   }
   
   
   return insertresult;
}

/***************************수정부분****************************************/

public int update(Connection c,String tablename,String wheretext,String textupdate,String colupdate){

    int insertresult = 0;
    this.con=c;

    try {
       String updateQuery= "";
    if(wheretext.equals("")){
         updateQuery = "UPDATE "+tablename+" SET "+colupdate+"="+textupdate;
     }else{
        updateQuery = "UPDATE "+tablename+" SET "+colupdate+"="+textupdate+" WHERE "+wheretext;
     }
      
       

       System.out.println(updateQuery);
       pstmt=con.prepareStatement(updateQuery);
       
       insertresult = pstmt.executeUpdate();

       System.out.println(insertresult);
       
       if(insertresult > 0){
          return insertresult;
       }
       
       
       
    } catch (SQLException e) {
       
       e.printStackTrace();
       System.out.println("SQL ERROR");
       return insertresult;
       
    }
    
    
    
 return insertresult;
}


/***************************수정부분 end****************************************/


/***************************삭제부분****************************************/
public int deleteTable(Connection c, String tablename, String id, String deletetxt) {

    this.con = c;
    String deleteSql = "DELETE FROM " + tablename + " where " + deletetxt;
    System.out.println("deletetxt : " + deletetxt);
    if(deletetxt.equals("")){
       deleteSql = "DELETE FROM " + tablename;
    }
    int row = 0;
    try {
       pstmt = con.prepareStatement(deleteSql);
       row = pstmt.executeUpdate();
    } 
    catch (SQLException e) {
       e.printStackTrace();
    } 
    finally {
       try {
          pstmt.close();
       } catch (SQLException e) {
          e.printStackTrace();
       }
       try {
          con.close();
       } catch (SQLException e) {
          e.printStackTrace();
       }
    }

    return row;

 }

/***************************삭제부분END*****************************************/




}