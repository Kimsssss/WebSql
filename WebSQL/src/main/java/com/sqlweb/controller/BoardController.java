package com.sqlweb.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.BoardDAO;
import com.sqlweb.dto.Board_A_DTO;



@Controller
public class BoardController {
   
     @Autowired
     private SqlSession sqlSession;
   
   @RequestMapping("boardlist.html")
   public String A_Boardlist(String pg , String f , String q , Model model) throws ClassNotFoundException, SQLException{
      
      
      
             int page = 1;
            String field = "BOARD_A_TITLE";
            String query ="%%";

            if(pg != null && !pg.equals("")){
               page = Integer.parseInt(pg);
            }
            if(f != null && !f.equals("")){
               field = f;
            }
            if(q != null && !q.equals("")){
               query = q;
            }
         
            
            BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
            List<Board_A_DTO> list= boardDao.A_Boardlist(page, field, query);
            int cnt = boardDao.getCount(field, query);
            model.addAttribute("list", list);
            model.addAttribute("cnt", cnt);
            model.addAttribute("cpage", page);
            
            
            
            System.out.println(page);
            System.out.println("ssss");
            
            
   
      return "A_BoardList";
   }
   
   
   @RequestMapping(value="board.html" ,method=RequestMethod.GET )
   public String boardget(){
      return "A_Boardwrite";
   }
   
   @RequestMapping(value="board.html", method=RequestMethod.POST)
      public String A_BoardWrite(Model model ,Board_A_DTO board_a_dto){
       

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.A_Boardwrite(board_a_dto);
      
      
      
      
      return "redirect:boardlist.html";
      }
   
   
    @RequestMapping(value="boardDetail.html")
      public String getnotice(int board_a_id,Model model) throws ClassNotFoundException, SQLException{
       
       BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
       Board_A_DTO board_a_dto = boardDao.getNotice(board_a_id);
         
       model.addAttribute("a_notice", board_a_dto);
      
       
       return "A_BoardDetail";
      }
    
      
    @RequestMapping(value="boardE.html" , method=RequestMethod.GET)
      public String A_BoardUpdate(int board_a_id  , Model model) throws ClassNotFoundException, SQLException{
         
       BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
       Board_A_DTO board_a_dto = boardDao.getNotice(board_a_id);
         
       model.addAttribute("a_notice", board_a_dto);
       
       return "A_BoardEdit";
      }
    
    
    @RequestMapping(value="boardE.html" , method=RequestMethod.POST)
      public String A_BoardUpdate(Board_A_DTO board_a_dto) throws ClassNotFoundException, SQLException{
    
       BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
        boardDao.update(board_a_dto);

       return "redirect:boardDetail.html?board_a_id="+board_a_dto.getBoard_a_id();
    }
   
    @RequestMapping(value="boardDelete.html")
      public String A_BoardDelete(int board_a_id) throws ClassNotFoundException, SQLException{
         

       BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
       boardDao.delete(board_a_id);
       return "redirect:boardlist.html";
      }
    
   
   
      
    /*  
      
   
      @RequestMapping(value="")
      public String P_BoardWrite(){
         return "";
      }
      
      @RequestMapping(value="")
      public String P_BoardRead(){
         return "";
      }
      
      @RequestMapping(value="")
      public String P_BoardDelete(){
         return "";
      }
      
      @RequestMapping(value="")
      public String P_BoardUpdate(){
         return "";
      }*/
   
}