package com.sqlweb.dto;

import java.sql.Date;

public class ReplyDTO {
	
	private int r_sequence;
	private int board_p_id;
	private String r_id;
	private String r_content;
	private Date r_date;
	public int getR_sequence() {
		return r_sequence;
	}
	public void setR_sequence(int r_sequence) {
		this.r_sequence = r_sequence;
	}
	public int getBoard_p_id() {
		return board_p_id;
	}
	public void setBoard_p_id(int board_p_id) {
		this.board_p_id = board_p_id;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
	

}
