package com.sqlweb.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
      return "login";
   }
   
   @RequestMapping(value="index.html", method=RequestMethod.GET)
   public String index(){
      return "index";
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
      return "userEntry";
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
   
   @RequestMapping(value="/Mailsave.html", method = RequestMethod.GET)
   public ModelAndView MailSuccess(HttpServletRequest request, HttpServletResponse response){
      
      String userid = request.getParameter("idhidden");
      String userpwd = request.getParameter("pwdhidden1");
      String useremail = request.getParameter("emailhidden");
      String username = request.getParameter("namehidden");
      
      MemberDTO memberdto = new MemberDTO(userid, userpwd, useremail, username, 0);
      
      
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("member",memberdto);
      mv.setViewName("userEntry");
      System.out.println("MAIL POST "+userid);
      System.out.println("MAIL POST "+userpwd);
      System.out.println("MAIL POST "+useremail);
      System.out.println("MAIL POST "+username);
      return mv;
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
      this.memberEntryValidator.validate(member, bindingResult);

      
      if (bindingResult.hasErrors()) {
         modelAndView.getModel().putAll(bindingResult.getModel());
         System.out.println("error");
         System.out.println(bindingResult.getErrorCount());
         System.out.println(bindingResult.toString());
         System.out.println(bindingResult.getFieldError());
         System.out.println(bindingResult.getNestedPath());
         System.out.println(bindingResult.getObjectName());
         System.out.println(bindingResult.getTarget());
         System.out.println(bindingResult.hasGlobalErrors());
         System.out.println(bindingResult.getGlobalErrorCount());
         System.out.println(bindingResult.getFieldError("user_email"));
         System.out.println(bindingResult.getModel());
         System.out.println(bindingResult.getModel().values());
         System.out.println(bindingResult.getModel().keySet());
         System.out.println(bindingResult.getModel().toString());
         return modelAndView;
      }

      try {
         
         
         MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
         dao.insertMember(member);

         
         modelAndView.setViewName("userEntrySuccess");
         modelAndView.addObject("member", member);
         return modelAndView;

      } catch (DataIntegrityViolationException e) {
         // 유저ID가 중복일 때, 폼 송신처로 이동
         bindingResult.reject("error.duplicate.member");
         modelAndView.getModel().putAll(bindingResult.getModel());
         return modelAndView;
      }
      
   }
}
