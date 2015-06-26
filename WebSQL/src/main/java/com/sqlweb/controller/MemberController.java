package com.sqlweb.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.sf.json.JSONArray;

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
import com.sqlweb.dto.MemberDTO;
import com.sqlweb.utils.MailTest;
import com.sqlweb.utils.MemberEntryValidator;


@Controller
public class MemberController {
   
   
   @Autowired
   private SqlSession sqlSession;

   @Autowired
   private MemberEntryValidator memberEntryValidator;

   @Autowired
   private MessageSource messageSource;
   
   
   @RequestMapping(value="login.html", method=RequestMethod.GET)
   public String login(){
      return "joinus.login";
   }
   
  
   
   public void setMemberEntryValidator(MemberEntryValidator memberEntryValidator) {
      this.memberEntryValidator = memberEntryValidator;
   }

   public void setMessageSource(MessageSource messageSource) {
      this.messageSource = messageSource;
   }
   
   @RequestMapping(value="/userEntry.html", method = RequestMethod.GET)
   public String toUserEntryView() {
      System.out.println("CONTROLLER GET");
      return "joinus.userEntry";
   }
   
   @RequestMapping(value="/Mail.html", method = RequestMethod.GET)
   public void MailView(HttpServletRequest request, HttpServletResponse response) {
      
      String email = request.getParameter("modalemail");
      System.out.println("비동기"+email);
      
      
      
      
      String viewcode = "";
      
      int[] code = new int[6];
      int temp = 0;
      Random ran = new Random();
      
      for(int i=0; i<6; i++){
         temp = ran.nextInt(10);
         System.out.println(temp);
         code[i] = temp;
         viewcode += temp;
      }
      System.out.println(viewcode);
      System.out.println("Mail GET");
      MailTest mt = new MailTest();
      try {
         
         mt.sendEmail(email,email,email,email,email,code);
         request.setAttribute("code", code);
         //mt.sendEmail(from, to, cc, subject, content, code);
         JSONArray codes = JSONArray.fromObject(code);
         response.getWriter().print(codes);//서버로 데이터 전송
           System.out.println("서버로 list 전송완료");
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
   }
   
   @RequestMapping(value = "/Mailsave.html", method = RequestMethod.POST)
   public void MailSuccess(MemberDTO m,
         HttpServletResponse response) throws UnsupportedEncodingException {
         
      
      
      
        try {
           //request.setCharacterEncoding("UTF-8");
          response.setContentType("text/html;charset=utf-8");
          response.setCharacterEncoding("utf-8");
           
          //MemberDTO memberdto = (MemberDTO)request.getAttribute("memberdto");


          
          System.out.println("MAIL POST " + m.getUser_id());
          System.out.println("MAIL POST " + m.getUser_pwd());
          System.out.println("MAIL POST " + m.getUser_email());
          System.out.println("MAIL POST " + m.getUser_name());
          System.out.println("MAIL POST " + m.getEnabled());
           
           JSONArray codes = JSONArray.fromObject(m);
         response.getWriter().print(codes);
         System.out.println("서버로 list 전송완료");
         
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }//서버로 데이터 전송
        

   }

  @ModelAttribute("member")
   public MemberDTO setForm() {
      MemberDTO member = new MemberDTO();
      MessageSourceAccessor accessor = new MessageSourceAccessor(this.messageSource);
      member.setUser_id(accessor.getMessage("member.user_id.default"));
      member.setUser_name(accessor.getMessage("member.user_name.default"));
      System.out.println(member.getUser_id());
      System.out.println(member.getUser_name());
      return member;
   }

   
   
   @RequestMapping(value="/userEntry.html", method = RequestMethod.POST)
   public ModelAndView fromMemberController(MemberDTO member, BindingResult bindingResult) {
      
      ModelAndView modelAndView = new ModelAndView();
      /*this.memberEntryValidator.validate(member, bindingResult);
      System.out.println(member.getUser_id());
      System.out.println(member.getUser_pwd());
      System.out.println(member.getUser_email());
      System.out.println(member.getUser_name());
      System.out.println(member.getEnabled());
      
      System.out.println(bindingResult.getErrorCount());
      System.out.println(bindingResult.getGlobalErrorCount());
      System.out.println(bindingResult.toString());
      
      MessageSourceAccessor accessor = new MessageSourceAccessor(this.messageSource);
      System.out.println((String) bindingResult.getFieldValue(bindingResult.getObjectName()));
      
      
      
     if (bindingResult.hasErrors()) {
         modelAndView.getModel().putAll(bindingResult.getModel());
         System.out.println("error");
         return modelAndView;
         
      }*/

      try {
         
         System.out.println(member.getUser_id());
          System.out.println(member.getUser_pwd());
          System.out.println(member.getUser_email());
          System.out.println(member.getUser_name());
          System.out.println(member.getEnabled());
         
         MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
         dao.insertMember(member);

         System.out.println(member.getUser_id());
         System.out.println(member.getUser_pwd());
         System.out.println(member.getUser_email());
         System.out.println(member.getUser_name());
         System.out.println(member.getEnabled());
         
         modelAndView.setViewName("joinus.userEntrySuccess");
         modelAndView.addObject("member", member);
         return modelAndView;

      } catch (DataIntegrityViolationException e) {
         // 유저ID가 중복일 때, 폼 송신처로 이동
         bindingResult.reject("error.duplicate.member");
         modelAndView.getModel().putAll(bindingResult.getModel());
         return modelAndView;
      }
      
   }
   
   @RequestMapping(value="/userIDfine.html"  , method = RequestMethod.POST)
   public void IDfine(MemberDTO memberDTO, String user_name ,  HttpServletResponse response) throws IOException{
	   
	   System.out.println("경로 설정 타나? ");
	   
	   response.setContentType("text/html;charset=utf-8");
       response.setCharacterEncoding("utf-8");
	 
	   System.out.println(user_name);

    response.setContentType("text/html;charset=utf-8");
	response.setCharacterEncoding("utf-8");
	 
	MemberDAO memberdao = sqlSession.getMapper(MemberDAO.class);
  
	memberDTO = memberdao.getidfine(user_name);
	 
	System.out.println(memberDTO);
	 
	System.out.println(memberDTO.getUser_id());
    

      response.getWriter().print(memberDTO.getUser_id());
     

   }
}