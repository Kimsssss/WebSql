package com.sqlweb.dto;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;



public class MemberDTO {
	
	//@NotNull
	@NotEmpty(message = "아이디를 입력해주세요.")
	@Size(min=6,max=15,message="6자이상 15자미만으로 작성해야 합니다.")
	@Pattern(regexp = "^[a-zA-Z0-9]*$", message="영문과 숫자로만 입력하세요.")
	private String user_id;
	//@NotNull
	@NotEmpty(message = "암호를 입력해주세요.")
	@Size(min=8,max=20,message="8자이상 20자미만으로 작성해야 합니다.")
	//@NotBlank
	private String user_pwd;
	//@NotNull
	@NotEmpty(message = "이메일 인증을 해주세요.")
	@Pattern(regexp = "^[_0-9a-zA-Z-]+@[0-9a-zA-Z]+(.[_0-9a-zA-Z-]+)*$", message="올바른 패턴으로 입력하세요.")
	private String user_email;
	//@NotNull
	@NotEmpty(message = "이름을 입력하시오.")
	@Size(min=2,max=20,message="2자이상 20자미만으로 작성해야 합니다.")
	@Pattern(regexp = "^[a-zA-Z0-9가-힣]*$", message="한글/영문/숫자만 입력 가능합니다.")
	private String user_name;
	//@NotNull
	//@NotEmpty(message = "id!!!!!!!!!")
	private int enabled;
	private String user_pwd2;
	
	
	
	public String getUser_pwd2() {
		return user_pwd2;
	}

	public void setUser_pwd2(String user_pwd2) {
		this.user_pwd2 = user_pwd2;
	}

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
