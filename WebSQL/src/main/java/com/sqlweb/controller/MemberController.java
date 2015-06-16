package com.sqlweb.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.MemberDAO;
import com.sqlweb.dto.AuthorityDTO;

@Controller
public class MemberController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "login.html", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "index.html", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "index.html", method = RequestMethod.POST)
	public String noticeReg(AuthorityDTO authority)
			throws IOException, ClassNotFoundException, SQLException {

		MemberDAO memberDao = sqlSession.getMapper(MemberDAO.class);
		memberDao.insertAuthority(authority);

		return "redirect:index";

	}

}
