package com.sqlweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sqlweb.dao.MemberDAO;

@Controller
public class MemberController {
	@RequestMapping(value="login.html", method=RequestMethod.GET)
	public String login(){
		return "login";
	}

}
