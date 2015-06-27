package com.sqlweb.dao;

import com.sqlweb.dto.MemberDTO;
import com.sqlweb.dto.AuthorityDTO;

public interface MemberDAO {
	public int insertAuthority(AuthorityDTO authority);
	
	public int insertMember(MemberDTO member);
	
	public MemberDTO getidfine(String user_name);
	
	public MemberDTO getpwdfine(String user_name , String user_id , String user_email);
		
}
