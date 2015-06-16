package com.sqlweb.dto;

public class AuthorityDTO {
	String user_id;
	String authority;
	public AuthorityDTO(){}
	
	public AuthorityDTO(String user_id, String authority){
		this.user_id = user_id;
		this.authority = authority;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	

}
