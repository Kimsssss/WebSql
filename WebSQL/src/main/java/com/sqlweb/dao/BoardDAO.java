package com.sqlweb.dao;

import java.sql.SQLException;
import java.util.List;

import com.sqlweb.dto.Board_A_DTO;



public interface BoardDAO {

	//게시물 개수
	public int getCount(String field, String query) throws ClassNotFoundException, SQLException;
	//전체 게시물
	public List<Board_A_DTO> A_Boardlist(int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	public int A_Boardwrite(Board_A_DTO board_a_dto);
	

	/*//게시물 삭제
	public int delete(String seq) throws ClassNotFoundException, SQLException;
	//게시물 수정
	public int update(Notice notice) throws ClassNotFoundException, SQLException;
	//게시물 상세
	public Notice getNotice(String seq) throws ClassNotFoundException, SQLException;
	//게시물 입력
	public int insert(Notice n) throws ClassNotFoundException, SQLException ;

*/
}
	
	

