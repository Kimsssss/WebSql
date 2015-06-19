package com.sqlweb.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.BoardDAO;
import com.sqlweb.dao.ReplyDAO;
import com.sqlweb.dto.Board_A_DTO;
import com.sqlweb.dto.Board_P_DTO;
import com.sqlweb.dto.ReplyDTO;

@Controller
public class BoardController {

   @Autowired
   private SqlSession sqlSession;

   @RequestMapping("boardlist.html")
   public String A_Boardlist(String pg, String f, String q, Model model)
         throws ClassNotFoundException, SQLException {

      int page = 1;
      String field = "BOARD_A_TITLE";
      String query = "%%";

      if (pg != null && !pg.equals("")) {
         page = Integer.parseInt(pg);
      }
      if (f != null && !f.equals("")) {
         field = f;
      }
      if (q != null && !q.equals("")) {
         query = q;
      }

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      List<Board_A_DTO> list = boardDao.A_Boardlist(page, field, query);
      int cnt = boardDao.getCount(field, query);
      model.addAttribute("list", list);
      model.addAttribute("cnt", cnt);
      model.addAttribute("cpage", page);

      System.out.println(page);
     

      return "A_BoardList";
   }

   @RequestMapping(value = "board.html", method = RequestMethod.GET)
   public String boardget() {
      return "A_Boardwrite";
   }

   @RequestMapping(value = "board.html", method = RequestMethod.POST)
   public String A_BoardWrite(Model model, Board_A_DTO board_a_dto) {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.A_Boardwrite(board_a_dto);

      return "redirect:boardlist.html";
   }

   @RequestMapping(value = "boardDetail.html")
   public String getnotice(int board_a_id, Model model)
         throws ClassNotFoundException, SQLException {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      Board_A_DTO board_a_dto = boardDao.getNotice(board_a_id);

      model.addAttribute("a_notice", board_a_dto);

      return "A_BoardDetail";
   }

   @RequestMapping(value = "boardE.html", method = RequestMethod.GET)
   public String A_BoardUpdate(int board_a_id, Model model)
         throws ClassNotFoundException, SQLException {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      Board_A_DTO board_a_dto = boardDao.getNotice(board_a_id);

      model.addAttribute("a_notice", board_a_dto);

      return "A_BoardEdit";
   }

   @RequestMapping(value = "boardE.html", method = RequestMethod.POST)
   public String A_BoardUpdate(Board_A_DTO board_a_dto)
         throws ClassNotFoundException, SQLException {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.update(board_a_dto);

      return "redirect:boardDetail.html?board_a_id="
            + board_a_dto.getBoard_a_id();
   }

   @RequestMapping(value = "boardDelete.html")
   public String A_BoardDelete(int board_a_id) throws ClassNotFoundException,
         SQLException {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.delete(board_a_id);
      return "redirect:boardlist.html";
   }

   // 건의사항 리스트
   @RequestMapping("p_boardlist.html")
   public String P_Boardlist(String pg, String f, String q, Model model) {

      int page = 1;
      String field = "TITLE";
      String query = "%%";

      if (pg != null && !pg.equals("")) {
         page = Integer.parseInt(pg);
      }
      if (f != null && !f.equals("")) {
         field = f;
      }
      if (q != null && !q.equals("")) {
         query = q;
      }

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      List<Board_P_DTO> p_list = boardDao.P_Boardlist(page, field, query);
      model.addAttribute("p_list", p_list);

      return "P_BoardList";
   }

   @RequestMapping(value = "p_board.html", method = RequestMethod.GET)
   public String p_boardget() {
      return "P_Boardwrite";
   }

   // 건의사항 글 등록
   @RequestMapping(value = "p_board.html", method = RequestMethod.POST)
   public String P_BoardWrite(Model model, Board_P_DTO board_p_dto,
         Principal principal) {

      board_p_dto.setUser_id(principal.getName());

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.P_Boardwrite(board_p_dto);

      return "redirect:p_boardlist.html";
   }

   // 건의 글 상세보기
   @RequestMapping("p_boardDetail.html")
   public String P_BoardDetail(int board_p_id, Model model) {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      Board_P_DTO board_p_dto = boardDao.P_BoardDetail(board_p_id);

      model.addAttribute("p_detail", board_p_dto);

      List<ReplyDTO> list = new ArrayList<ReplyDTO>();

      ReplyDAO replyDao = sqlSession.getMapper(ReplyDAO.class);
      list = replyDao.replyDetail(board_p_id);
      // System.out.println(reply.getR_content());

      model.addAttribute("reply", list);

      return "p_BoardDetail";
   }

   @RequestMapping(value = "p_boardEdit.html", method = RequestMethod.GET)
   public String noticeEdit(int board_p_id, Model model) {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      Board_P_DTO board_p_dto = boardDao.P_BoardDetail(board_p_id);

      model.addAttribute("p_detail", board_p_dto);

      return "p_BoardEdit";
   }

   @RequestMapping(value = "p_boardEdit.html", method = RequestMethod.POST)
   public String P_BoardEdit(Board_P_DTO board_p_dto) {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.P_Boardupdate(board_p_dto);

      return "redirect:p_boardDetail.html?board_p_id="
            + board_p_dto.getBoard_p_id();
   }

   // 건의 글 삭제하기
   @RequestMapping("p_boardDel.html")
   public String P_BoardDel(int board_p_id) {

      BoardDAO boardDao = sqlSession.getMapper(BoardDAO.class);
      boardDao.P_Boarddelete(board_p_id);
      return "redirect:p_boardlist.html";
   }

}