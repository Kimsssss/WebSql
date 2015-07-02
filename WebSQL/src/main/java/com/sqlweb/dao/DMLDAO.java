package com.sqlweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
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
      Set<String> keySet;
      String a = "";
	  String b = "";
	  Map<String, String> datavalue = new HashMap<String, String>();
	  
	  ArrayList<String> collist = new ArrayList<String>();
      this.con = c;
      
      //select * from all_tables where owner='PROJECT';
      
      columnselectSql = "SELECT COLUMN_NAME FROM ALL_COL_COMMENTS where owner='"+id.toUpperCase()+"' and table_name='"+tablename+"'";
      //String createTableSql = "create table aaa(asd varchar2(20))";
      
      System.out.println("columnselect DAO : "+columnselectSql);
      System.out.println(tablename+" / "+id);
      
      
      try {
         pstmt = con.prepareStatement(columnselectSql);
         rs = pstmt.executeQuery();
         System.out.println("DAO 테이블 컬럼 불러오기");
         while(rs.next()){
        	 collist.add(rs.getString("COLUMN_NAME"));
             System.out.println(rs.getString("COLUMN_NAME"));
             
          }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
	  
      colname = list.split(",");
      System.out.println(list);
      System.out.println(wheretext);
      System.out.println(colname);
      System.out.println(colname.length);
      for(int i=0; i<collist.size();i++){
          try {
        	System.out.println("collist.get(i) :  "+collist.get(i));
        	datatypeSql = "select DATA_TYPE from USER_TAB_COLS where table_name='"+tablename+"' and column_name='"+collist.get(i)+"'";
        	pstmt = con.prepareStatement(datatypeSql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				System.out.println(rs.getString("DATA_TYPE"));
				datatype.put(collist.get(i), rs.getString("DATA_TYPE"));
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
    	  wheretext += "  ";
    	  /*String a = "";
    	  String b = "";
    	  a = columnselectSql.substring(0,columnselectSql.indexOf("WHERE"));
    	  b = columnselectSql.substring(columnselectSql.indexOf("WHERE"),columnselectSql.length());
    	  System.out.println("a : "+a);
    	  System.out.println("b : "+b);
    	  */
    	  
    	  for(int i=0; i<collist.size();i++){
        	  Pattern p1 = Pattern.compile("("+collist.get(i).toUpperCase()+")");
        	  Pattern p2 = Pattern.compile("("+collist.get(i).toLowerCase()+")");
        	  Matcher m1 = p1.matcher(wheretext);
        	  Matcher m2 = p2.matcher(wheretext);
        	  System.out.println(datatype.get(collist.get(i)));
        	  System.out.println(wheretext);
        	  System.out.println(p1);
        	  System.out.println(p2);
        	  System.out.println(wheretext.length());
        	  label:while(m2.find()){
        		  System.out.println(wheretext);
        		  System.out.println(m2.start());
        		  System.out.println(m2.end());
        		  System.out.println("소문자소문자소문자소문자소문자소문자");
        		  
        		  System.out.println(collist.get(i)+" if 문 안의 컬럼");       		  
            		  for(int z=m2.end(); z<wheretext.length();z++){
            			  if(wheretext.charAt(z)==' '){
            				  
            			  }else{
            				  if(wheretext.charAt(z)=='='){
            					  for(int q=z+1; q<wheretext.length(); q++){
            						  if(!(wheretext.charAt(q)==' ')){
            							  if(q != wheretext.length()-1){
            								  if(!(wheretext.charAt(q+1)==' ')){
            									  a += wheretext.charAt(q);
            								  }else{
            									  a += wheretext.charAt(q);
            									  System.out.println("aaa :::: "+a);
            				            		  if(!datavalue.containsKey(collist.get(i))){
            				            			  if(a != ""){
            				            			 datavalue.put(collist.get(i), a);
            				            			 }
            				            			 a="";
            				            			 break label;}else{
            				            				 break label;
            				            			 }
            									 }
            							  }
            							  
            						  }
            					  }
            				  }
            			  
            		  
            		  }
    				  	
        		  }
        		  
        	  }
        	  label2:while(m1.find()){
        		  System.out.println(wheretext);
        		  System.out.println(m1.start());
        		  System.out.println(m1.end());
        		  System.out.println("대문자대문자대문자대문자대문자");
        		  
        		  System.out.println(collist.get(i)+" if 문 안의 컬럼");       		  
            		  for(int z=m1.end(); z<wheretext.length();z++){
            			  if(wheretext.charAt(z)==' '){
            				  
            			  }else{
            				  if(wheretext.charAt(z)=='='){
            					  for(int q=z+1; q<wheretext.length(); q++){
            						  if(!(wheretext.charAt(q)==' ')){
            							  if(q != wheretext.length()-1){
            								  if(!(wheretext.charAt(q+1)==' ')){
            									  a += wheretext.charAt(q);
            								  }else{
            									  a += wheretext.charAt(q);
            									  System.out.println("aaa :::: "+a);
            				            		  if(!datavalue.containsKey(collist.get(i))){
            				            			  if(a != ""){
            				            			 datavalue.put(collist.get(i), a);
            				            			 }
            				            			 a="";
            				            			 break label2;}else{
            				            				 break label2;
            				            			 }
            									 }
            							  }
            							  
            						  }
            					  }
            				  }
            			  
            		  
            		  }
    				  	
        		  }
        		  
        	  }
        	 
          }
    	  keySet = datavalue.keySet();
    	  
    	  for(String tempKey:keySet){
    		 if(datatype.get(tempKey).equals("NUMBER")){
    			 System.out.println("NUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBERNUMBER");
    			 System.out.println("datavalue key : "+tempKey +"  datavalue value : "+datavalue.get(tempKey)); 
    	  	    	System.out.println("datavalue value : "+wheretext.indexOf(datavalue.get(tempKey)));
    	  	    	System.out.println("datavalue value : "+wheretext.lastIndexOf(datavalue.get(tempKey)));
    	  	    	System.out.println(wheretext);
    	  	    	
    	  	    	String ab = wheretext.substring(0,wheretext.indexOf(datavalue.get(tempKey)));
    	  	    	System.out.println("ab : "+ab);
    	  	    	String cd = wheretext.substring(wheretext.indexOf(datavalue.get(tempKey)),wheretext.indexOf(datavalue.get(tempKey))+datavalue.get(tempKey).length());
    	  	    	System.out.println("cd : "+cd);
    	  	    	String ef = wheretext.substring(wheretext.indexOf(datavalue.get(tempKey))+datavalue.get(tempKey).length(),wheretext.length()-1);
    	  	    	System.out.println("ef : "+ef);
    	  	    	
    	  	    	if(!ef.equals("")){
    	  	    		wheretext = ab;
    	  	    		wheretext += cd;
    	  	    		wheretext += ef;
    	  	    	}else{
    	  	    		wheretext = ab;
    	  	    		wheretext += cd;
    	  	    	}
    		 }
    		 else{
    		System.out.println(datatype.get(tempKey));
  	    	System.out.println("datavalue key : "+tempKey +"  datavalue value : "+datavalue.get(tempKey)); 
  	    	System.out.println("datavalue value : "+wheretext.indexOf(datavalue.get(tempKey)));
  	    	System.out.println("datavalue value : "+wheretext.lastIndexOf(datavalue.get(tempKey)));
  	    	System.out.println(wheretext);
  	    	
  	    	String ab = wheretext.substring(0,wheretext.indexOf(datavalue.get(tempKey)));
  	    	System.out.println("ab : "+ab);
  	    	String cd = wheretext.substring(wheretext.indexOf(datavalue.get(tempKey)),wheretext.indexOf(datavalue.get(tempKey))+datavalue.get(tempKey).length());
  	    	System.out.println("cd : "+cd);
  	    	String ef = wheretext.substring(wheretext.indexOf(datavalue.get(tempKey))+datavalue.get(tempKey).length(),wheretext.length()-1);
  	    	System.out.println("ef : "+ef);
  	    	
  	    	if(!ef.equals("")){
  	    		wheretext = ab;
  	    		wheretext += "'"+cd+"'";
  	    		wheretext += ef;
  	    	}else{
  	    		wheretext = ab;
  	    		wheretext += "'"+cd+"'";
  	    	}
  	    	
    	}
    		 
        
    	  }
    	  
    	  columnselectSql = "SELECT "+list+" FROM "+tablename+" WHERE "+wheretext;
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

}