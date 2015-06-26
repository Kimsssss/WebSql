package com.sqlweb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.ReplyDAO;
import com.sqlweb.dto.ReplyDTO;

@Controller
public class ReplyController {

	@Autowired
	private SqlSession sqlSession;

	// 댓글 글 insert
	@RequestMapping(value = "reply.html", method = RequestMethod.GET)
	public String reply(ReplyDTO reply, HttpServletRequest request, Model model) {
		reply.setR_id(request.getParameter("r_id"));
		int board_p_id = Integer.parseInt(request.getParameter("board_p_id"));
		reply.setBoard_p_id(board_p_id);
		ReplyDAO replyDao = sqlSession.getMapper(ReplyDAO.class);
		replyDao.replyInsert(reply);

		return "redirect:p_boardDetail.html?board_p_id="+ board_p_id;
	}
	
	
	// 댓글 삭제
	@RequestMapping("replyDel.html")
	public String replyDel(int r_sequence, ReplyDTO reply, HttpServletRequest request, HttpServletResponse response, Principal principal) throws IOException {
		
		String r_id = request.getParameter("r_id");
		int board_p_id = Integer.parseInt(request.getParameter("board_p_id"));
		System.out.println(r_id + " / " + principal.getName() + " /  " + board_p_id);
		if(r_id.equals(principal.getName())){
			ReplyDAO replyDao = sqlSession.getMapper(ReplyDAO.class);
			replyDao.replyDelete(r_sequence);
		}else if(!r_id.equals(principal.getName())){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 수 없습니다.');");
			out.println("location.href='p_boardDetail.html?board_p_id=" + board_p_id + "'");
			out.println("</script>");
			out.close();
		}
		
		return "redirect:p_boardDetail.html?board_p_id=" + board_p_id;
	}
	

}
