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
				String field = "TITLE";
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
				model.addAttribute("list", list);
				
			
				
	
		return "A_BoardList";
	}
	
	
	@RequestMapping(value="board.html" ,method=RequestMethod.GET )
	public String boardget(){
		return "A_Boardwrite";
	}
	
	@RequestMapping(value="board.html", method=RequestMethod.POST)
	   public String A_BoardWrite(Model model ,Board_A_DTO board_a_dto){
	    
		
		
		System.out.println(board_a_dto.toString());
		
		BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
		boardDao.A_Boardwrite(board_a_dto);
		
		
		
		
		return "redirect:boardlist.html";
	   }
	
	
	
	   
	 /*  @RequestMapping(value="")
	   public String A_BoardRead(){
	      return "";
	   }
	   
	   
	   
	   @RequestMapping(value="")
	   public String A_BoardDelete(){
		   return "";
	   }
	   
	   @RequestMapping(value="")
	   public String A_BoardUpdate(){
		   return "";
	   }
	   
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
