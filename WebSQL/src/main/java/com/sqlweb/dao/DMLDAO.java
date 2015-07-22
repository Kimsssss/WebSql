package com.sqlweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.*;

import javax.servlet.http.HttpSession;

import com.sqlweb.dto.AccountDTO;

public class DMLDAO {
   
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   String str;

   public String getStr() {
      return str;
   }

   public void setStr(String str) {
      this.str = str;
   }

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
  /* 컬럼명 */
   public ArrayList<String> columnselect(Connection c,String tablename,String id){
      
      ArrayList<String> list = new ArrayList<String>();
      this.con = c;
      
      //select * from all_tables where owner='PROJECT';
      
      String columnselectSql = "SELECT COLUMN_NAME FROM ALL_COL_COMMENTS where owner='"+id.toUpperCase()+"' and table_name='"+tablename.toUpperCase()+"'";
     
     
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
   public ArrayList<String> columntype(Connection c,String tablename ,String id){
      
      
       ArrayList<String> list = new ArrayList<String>();
        
       this.con = c;

        
        String columnDatatypeSql =  "SELECT data_type FROM all_tab_columns where owner='"+id+"' and table_name='"+tablename+"'";
     
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
           
        }
        
        return list;
        
 
      
   }
   
   public ArrayList<String> tableview(Connection c,String tablename,String id,String list,String wheretext){
         
         ArrayList<String> table = new ArrayList<String>();
         this.con = c;
         String columnselectSql ="";
         String[] colname = {};
         String datatypeSql ="";
         Map<String, String> datatype = new HashMap<String, String>();
         Set<String> keySet;
         String a = "";
        Map<String, String> datavalue = new HashMap<String, String>();
        
        ArrayList<String> collist = new ArrayList<String>();
         this.con = c;
         
         columnselectSql = "SELECT COLUMN_NAME FROM ALL_COL_COMMENTS where owner='"+id.toUpperCase()+
        		 			"' and table_name='"+tablename+"'";
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
              datatypeSql = "select DATA_TYPE from USER_TAB_COLS where table_name='"+tablename.toUpperCase()+"' and column_name='"+collist.get(i)+"'";
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
                label:while(m2.find()){             
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
                      String ab = wheretext.substring(0,wheretext.indexOf(datavalue.get(tempKey)));
                      String cd = wheretext.substring(wheretext.indexOf(datavalue.get(tempKey)),wheretext.indexOf(datavalue.get(tempKey))+datavalue.get(tempKey).length());
                      String ef = wheretext.substring(wheretext.indexOf(datavalue.get(tempKey))+datavalue.get(tempKey).length(),wheretext.length()-1);
                    
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
         int colend = 0;
         String[] arr = list.split(",");
         for(int i=0; i<arr.length;i++){
            table.add(arr[i]);
            colend += 1;
         }
         try {
            pstmt = con.prepareStatement(columnselectSql);
            rs = pstmt.executeQuery();
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
   
   
   
   /********************************** 컬럼 제약 조건  ***********************************/
   public ArrayList<String> tablecolview(Connection c,String tablename,String id){
       ArrayList<String> table = new ArrayList<String>();
        this.con = c;
        /*
         * select 
   tp.data_type, j.Constraint_name, j.conStraint_type, j.Table_name, j.column_name from
   (select column_name, data_type from all_tab_columns where table_name='USERS' and owner='PROJECT')tp,  
   (Select ucc.Constraint_name, uc.conStraint_type, ucc.Table_name,
                 ucc.column_name
              from User_constraints uc, User_cons_columns ucc
              where ucc.Constraint_name = uc.conStraint_name and uc.table_name ='USERS' and uc.owner='PROJECT' )j
              where tp.column_name = j.column_name;
         * */
        
        
        String sql = "SELECT j.column_name, tp.data_type, j.conStraint_type, j.Constraint_name, j.Table_name from " + 
                    "(select column_name, data_type from all_tab_columns where table_name='"+tablename+"' and owner='"+id+"')tp, "+
                    "(Select ucc.Constraint_name, uc.conStraint_type, ucc.Table_name, ucc.column_name " +
                    "from User_constraints uc, User_cons_columns ucc "+
                    "where ucc.Constraint_name = uc.conStraint_name and uc.table_name ='"+tablename+"' and uc.owner='"+id+"' )j "+
                    "where tp.column_name = j.column_name";
        
        
        System.out.println("쿼리문 : " + sql);
        try {
           pstmt = con.prepareStatement(sql);
           rs = pstmt.executeQuery();
           while(rs.next()){
              for(int i=1; i<6;i++){
                 table.add(rs.getString(i));
                 System.out.println(rs.getString(i));
              }
               
            }
           
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
   
   /********************************** 컬럼 제약 조건끝 ***********************************/   
   
   

   /***************************삽입부분****************************************/
   public int insertcheck(Connection c,String tablename,String id,List<String> CheckList ,int inserts){
      
      int insertresult = 0;
      

      this.con=c;
      
      ArrayList<String> columntype = columntype(c, tablename, id);
	  
	  System.out.println("columntype : "+columntype);
	  
	 String insertQuery = "";

      try {
    	 
  //1건의 row insert  	  
if(inserts == 1 ){
	
	
 	insertQuery = "INSERT INTO "+tablename+" VALUES(";
 	
 	for(int i=0 ; i < CheckList.size() ; i++){
 	
 
 		
 		if(columntype.get(i).equals("NUMBER")){
 		insertQuery += CheckList.get(i);	
 		}else{  insertQuery += "'"+CheckList.get(i)+"'"; }
 		
 		
 		  if(i<CheckList.size()-1){
  	    	insertQuery +=", ";
		   }
 	}
 	
 	 insertQuery +=")";
 	
 	 pstmt=con.prepareStatement(insertQuery);
 	 insertresult+= pstmt.executeUpdate();
    
 	
 	  if(insertresult > 0){
          return insertresult;
       }else if(insertresult == 0){
          
          throw new SQLException();
       }     
 	
	
}


//여러건의 insert
else{
    	  
   for(int i=0 ; i < inserts ;i++){
    	  insertQuery = "INSERT INTO "+tablename+" VALUES(";
    	  for(int j=0 ; j < CheckList.size() ; j++){
    		  if(columntype.get(j).equals("NUMBER")){
    			  if(CheckList.get(j).equals("") || CheckList.get(j) == null){
    				  insertQuery += 0;
    				  insertQuery += i;
    			  }else{ insertQuery += 0;
    				  insertQuery += CheckList.get(j)+i; }
    		  }else if(columntype.get(j).equals("VARCHAR2")){
    			  if(CheckList.get(j).equals("") || CheckList.get(j) == null){
    				  insertQuery += "'?"+i+"'";
    			  }else{ insertQuery += "'"+CheckList.get(j)+i+"'"; }
    		  }else if(columntype.get(j).equals("DATE")){
    			  if(CheckList.get(j).equals("") || CheckList.get(j) == null){
    				  insertQuery += "sysdate";
    			  }else{ insertQuery += "'"+CheckList.get(j)+"'"; }
    		   }
    		  
    		  if(j<CheckList.size()-1){
	    	    	insertQuery +=", ";
    		   }
    	
    	  }
    	  insertQuery +=")";

         System.out.println(insertQuery);
         pstmt=con.prepareStatement(insertQuery);

         insertresult+= pstmt.executeUpdate();
        
   } 
   
} 
       
         
         System.out.println("insertresult : "+insertresult);
         
         if(insertresult > 0){
            return insertresult;
         }else if(insertresult == 0){
            
            throw new SQLException();
         }     
         
         
      } catch (SQLException e) {
         str = printStackTraceToString(e);
         System.out.println("에러메세지 : " + str);
         setStr(str);
      } finally {
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
      
      
      return insertresult;
   }
 
/***************************삽입부분 끝****************************************/   
   
   

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
public int deleteTable(Connection c, String tablename, String id, String coldelete,
      String deletetxt) {
	this.con=c;
   String deleteSql="";
    if(deletetxt.equals("")){
       deleteSql = "DELETE FROM "+tablename;
     }else{
        deleteSql = "DELETE FROM "+tablename+" WHERE "+coldelete+"="+deletetxt;
     }
    System.out.println(deleteSql);
   int row = 0;
   try {
      pstmt = con.prepareStatement(deleteSql);
      row = pstmt.executeUpdate();
      System.out.println(row);
      if (row == 0) {
         throw new SQLException();
      }
   } catch (SQLException e) {
      str = printStackTraceToString(e);
      System.out.println("에러메세지 : " + str);
      setStr(str);
   } finally {
      try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
      try {con.close();} catch (SQLException e) { e.printStackTrace();}
   }

   return row;

}

public String printStackTraceToString(Throwable e) {
   StringBuilder sb = new StringBuilder();

   try {
      sb.append(e.toString());
      sb.append("\n");
      StackTraceElement element[] = e.getStackTrace();
      
        /*for (int idx=0; idx<element.length; idx++){ 
           sb.append("\tat ");
        sb.append(element[idx].toString()); 
        sb.append("\n"); 
        }*/
      sb.append("\tat "); 
      sb.append(element[0].toString());
   } catch (Exception ex) {
      return e.toString();
   }

   return sb.toString();
}

/***************************삭제부분END*****************************************/

public int setAccount(Connection c,String uid,String ip,String id,String pwd,HttpSession session){
    
    int result = 0;
    this.con = c;
    String selectAccountSql = "select USER_ID from ACCOUNTDTO where USER_ID='"+uid+"'";
    try {
        pstmt = con.prepareStatement(selectAccountSql);
        rs = pstmt.executeQuery();
        
       if(rs.next()){
    	   String deleteAccountSql = "delete from ACCOUNTDTO where USER_ID='"+uid+"'";
    	   pstmt = con.prepareStatement(deleteAccountSql);
           result = pstmt.executeUpdate();
       }
        
     } catch (SQLException e) {
        e.printStackTrace();
     }
    
    String setAccountSql = "INSERT INTO ACCOUNTDTO VALUES('"+uid+"','"+ip+"','"+id+"','"+pwd+"')";
    try {
       pstmt = con.prepareStatement(setAccountSql);
       result = pstmt.executeUpdate();
       if(result == 1){
    	   AccountDTO acdto = new AccountDTO();
    	   acdto.setId(id);
    	   acdto.setPwd(pwd);
    	   acdto.setIp(ip);
    	   acdto.setUid(uid);
    	   session.setAttribute("acdto", acdto);
       }
      
       
    } catch (SQLException e) {
       e.printStackTrace();
    }finally{
       try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
       try {con.close();} catch (SQLException e) {e.printStackTrace();}
       try {rs.close();} catch (SQLException e) {e.printStackTrace();}
    }
    
    return result;

	}
////////////////////////////////////////////////////////////////////////////////////////////////////
public String sessionAccount(Connection c, String username,HttpSession session) {

	   
	   try {
		   
		   this.con = c;
		   String sessionAccountSql="select * from ACCOUNTDTO where USER_ID='"+username+"'";
		   System.out.println(username);
		   System.out.println(sessionAccountSql);
		   AccountDTO acdto = new AccountDTO();
		   
		   
		   
	      pstmt = con.prepareStatement(sessionAccountSql);
	      rs = pstmt.executeQuery();
	      System.out.println("sessionAccount DAO while 전");
	      
	      if(rs.next()){
	    	  
	    		  acdto.setUid(rs.getString("USER_ID"));
	    		  acdto.setIp(rs.getString("IP"));
	    		  acdto.setId(rs.getString("ID"));
	    		  acdto.setPwd(rs.getString("PWD"));
	    	  
	    		  System.out.println("sessionAccount while : "+rs.getString("USER_ID"));
	    		  System.out.println("sessionAccount while : "+rs.getString("IP"));
	    		  System.out.println("sessionAccount while : "+rs.getString("ID"));
	    		  System.out.println("sessionAccount while : "+rs.getString("PWD"));
	    	  
	    		  session.setAttribute("acdto", acdto);
	    		  return "session 주입 성공";
	      		
	      }
	      session.setAttribute("acdto", acdto);
	 	  System.out.println("rs null acdto : "+acdto);
	 	  
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }finally {
	      try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
	      try {con.close();}catch(SQLException e){e.printStackTrace();}
	      try {rs.close();}catch(SQLException e){e.printStackTrace();}
	   }

 	  
 	  
 	  return "session 주입 실패";
   

	}
}

