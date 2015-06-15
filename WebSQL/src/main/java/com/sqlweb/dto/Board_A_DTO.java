package com.sqlweb.dto;

import java.sql.Date;

public class Board_A_DTO {

	private int board_a_id;
	private String board_a_title;
	private String board_a_content;
	private Date board_a_date;
	private String user_id;
	public int getBoard_a_id() {
		return board_a_id;
	}
	public void setBoard_a_id(int board_a_id) {
		this.board_a_id = board_a_id;
	}
	public String getBoard_a_title() {
		return board_a_title;
	}
	public void setBoard_a_title(String board_a_title) {
		this.board_a_title = board_a_title;
	}
	public String getBoard_a_content() {
		return board_a_content;
	}
	public void setBoard_a_content(String board_a_content) {
		this.board_a_content = board_a_content;
	}
	public Date getBoard_a_date() {
		return board_a_date;
	}
	public void setBoard_a_date(Date board_a_date) {
		this.board_a_date = board_a_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
