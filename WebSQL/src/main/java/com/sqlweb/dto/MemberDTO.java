package com.sqlweb.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class MemberDTO {
	
	@NotNull
	@Size(min=6,max=15,message="6자이상 15자미만으로 작성해야 합니다.")
	private String user_id;
	@NotNull
	@Size(min=8,max=20,message="8자이상 20자미만으로 작성해야 합니다.")
	private String user_pwd;
	@NotNull
	private String user_email;
	@NotNull
	@Size(min=2,max=20,message="2자이상 20자미만으로 작성해야 합니다.")
	private String user_name;
	@NotNull
	private int enabled;
	
	public MemberDTO(){}
	
	public MemberDTO(String user_id,String user_pwd,String user_email,
			String user_name,int enabled){
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_email = user_email;
		this.user_name = user_name;
		this.enabled = enabled;	
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	

}
