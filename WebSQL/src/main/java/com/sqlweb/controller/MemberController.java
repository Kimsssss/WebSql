package com.sqlweb.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sqlweb.dao.MemberDAO;
import com.sqlweb.dto.AuthorityDTO;
import com.sqlweb.dto.MemberDTO;
import com.sqlweb.utils.MemberEntryValidator;

@Controller
public class MemberController {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	private MemberEntryValidator memberEntryValidator;
	public void setMemberEntryValidator(MemberEntryValidator memberEntryValidator) {
		this.memberEntryValidator = memberEntryValidator;
	}
	
	@Autowired
	private MessageSource messageSource;
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}
	
	@RequestMapping(value="login.html", method=RequestMethod.GET)

	public String login(){
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
	
	@RequestMapping(value="/User.html", method = RequestMethod.GET)
	public String toUserEntryView() {
		System.out.println("CONTROLLER GET");
		return "userEntry";
	}

	@ModelAttribute("member")
	public MemberDTO setForm() {
		MemberDTO member = new MemberDTO();
		MessageSourceAccessor accessor = new MessageSourceAccessor(this.messageSource);
		member.setUser_id(accessor.getMessage("member.user_id.default"));
		member.setUser_name(accessor.getMessage("member.user_name.default"));
		System.out.println(member.getUser_id());
		return member;
	}

	
	
	@RequestMapping(value="/User.html", method = RequestMethod.POST)
	public ModelAndView fromMemberController(MemberDTO member, AuthorityDTO authority, BindingResult result) {
		
		ModelAndView modelAndView;
		this.memberEntryValidator.validate(member, result);

		modelAndView = new ModelAndView();
		if (result.hasErrors()) {
			modelAndView.getModel().putAll(result.getModel());
			return modelAndView;
		}

		try {
			
			modelAndView = new ModelAndView();
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			dao.insertMember(member);
			dao.insertAuthority(authority);
			

			
			modelAndView.setViewName("userEntrySuccess");
			modelAndView.addObject("member", member);
			return modelAndView;

		} catch (DataIntegrityViolationException e) {
			// 유저ID가 중복일 때, 폼 송신처로 이동
			result.reject("error.duplicate.member");
			modelAndView.getModel().putAll(result.getModel());
			return modelAndView;
		}
		
	}
}

