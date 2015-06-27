package com.sqlweb.dao;

import com.sqlweb.dto.MemberDTO;
import com.sqlweb.dto.AuthorityDTO;

public interface MemberDAO {
	public int insertAuthority(AuthorityDTO authority);
	
	public int insertMember(MemberDTO member);
	
	public MemberDTO getidfine(String user_name);
	
	public MemberDTO getMypage(String user_id);
		
	public int mypageUpdate(String user_pwd, String user_id);
	
}
