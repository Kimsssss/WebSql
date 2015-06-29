package com.sqlweb.dao;

import java.sql.SQLException;
import java.util.List;

import com.sqlweb.dto.Board_A_DTO;
import com.sqlweb.dto.Board_P_DTO;

public interface BoardDAO {

   // 게시물 개수
   public int getCount(String field, String query)
         throws ClassNotFoundException, SQLException;

   // 전체 게시물
   public List<Board_A_DTO> A_Boardlist(int page, String field, String query)
         throws ClassNotFoundException, SQLException;

   public int A_Boardwrite(Board_A_DTO board_a_dto);

   // 게시물 상세
   public Board_A_DTO getNotice(int board_a_id) throws ClassNotFoundException,
         SQLException;

   // 게시물 수정
   public int update(Board_A_DTO board_a_dto) throws ClassNotFoundException,
         SQLException;

   public int delete(int board_a_id) throws ClassNotFoundException,
         SQLException;

   // 건의사항 게시판
   public int p_getCount(String field, String query);
   
   public List<Board_P_DTO> P_Boardlist(int page, String field, String query);

   public int P_Boardwrite(Board_P_DTO baord_p_dto);

   public Board_P_DTO P_BoardDetail(int board_p_id);

   public int P_Boardupdate(Board_P_DTO baord_p_dto)  ;

   public int P_Boarddelete(int board_p_id);
   
   public int reply_Del(int board_p_id);
   
   public int reply_board_del(String user_id);
   
   public int memBoardDel(String user_id);

}