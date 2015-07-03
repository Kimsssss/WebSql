package com.sqlweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DDLDAO {
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

    public int alterAdd(Connection c, String tablename, String id, String addtxt) {

         this.con = c;
         int row = 0;
         String addSql="ALTER TABLE " + tablename + " ADD(" + addtxt + ")";
         
         System.out.println(addSql);
         
         try {
            pstmt = con.prepareStatement(addSql);
            row = pstmt.executeUpdate();
            if (row < 1) {
               throw new SQLException();
            }
         } catch (SQLException e) {
            str = printStackTraceToString(e);
            System.out.println("에러메세지 : " + str);
            setStr(str);
            //e.printStackTrace();
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

         return row;

      }
    
    
    public boolean alterModify(Connection c, String tablename, String id, String modifytxt) {

         this.con = c;
         boolean row = false;
         String modifySql="ALTER TABLE " + tablename + " MODIFY(" + modifytxt + ")";
         System.out.println(modifySql);
         try {
            pstmt = con.prepareStatement(modifySql);
            //row = pstmt.executeUpdate();
            pstmt.execute();
            System.out.println(pstmt.execute());
         } catch (SQLException e) {
            /*str = printStackTraceToString(e);
            System.out.println("에러메세지 : " + str);
            setStr(str);*/
            e.printStackTrace();
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

         return row;

      }
    public ArrayList<String> datatype(Connection c,String tablename,String id){
         
         ArrayList<String> list = new ArrayList<String>();
         this.con = c;
         String datatypeSql = " select column_name, data_type from ALL_tab_columns where OWNER='"+id+"' and table_name='"+tablename+"'";
      
         try {
            pstmt = con.prepareStatement(datatypeSql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                list.add(rs.getString("COLUMN_NAME"));
                list.add(rs.getString("data_type"));
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
    
    public int dropTable(Connection c, String tablename, String id) {

         this.con = c;
         int row = 0;
         String dropTableSql="DROP TABLE " + tablename;
         try {
            pstmt = con.prepareStatement(dropTableSql);
            row = pstmt.executeUpdate();
            if (row == 0) {
               throw new SQLException();
            }
         } catch (SQLException e) {
            str = printStackTraceToString(e);
            System.out.println("에러메세지 : " + str);
            setStr(str);
            //e.printStackTrace();
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

         return row;

      }
    
/********************************** 컬럼 제약 조건 ***********************************/
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
   

}