package com.sqlweb.dto;

import java.sql.Date;

public class Board_P_DTO {
	
	private int board_p_id;
	private String board_p_title;
	private String board_p_content;
	private Date board_p_date;
	private String user_id;
	public int getBoard_p_id() {
		return board_p_id;
	}
	public void setBoard_p_id(int board_p_id) {
		this.board_p_id = board_p_id;
	}
	public String getBoard_p_title() {
		return board_p_title;
	}
	public void setBoard_p_title(String board_p_title) {
		this.board_p_title = board_p_title;
	}
	public String getBoard_p_content() {
		return board_p_content;
	}
	public void setBoard_p_content(String board_p_content) {
		this.board_p_content = board_p_content;
	}
	public Date getBoard_p_date() {
		return board_p_date;
	}
	public void setBoard_p_date(Date board_p_date) {
		this.board_p_date = board_p_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	
}
