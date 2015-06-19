package com.sqlweb.dao;

import java.sql.SQLException;

import com.sqlweb.dto.MemberDTO;
import com.sqlweb.dto.AuthorityDTO;

public interface MemberDAO {
	public int insertAuthority(AuthorityDTO authority);
	
	public int insertMember(MemberDTO member);
		
}
