package com.sqlweb.utils;


import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.sqlweb.dto.MemberDTO;

public class MemberEntryValidator implements Validator {

	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	public void validate(Object command, Errors errors) {

		MemberDTO member = (MemberDTO) command;

		if (!StringUtils.hasLength(member.getUser_id())) {
			errors.rejectValue("user_id", "error.required");
			
		}

		if (!StringUtils.hasLength(member.getUser_pwd())) {
			errors.rejectValue("user_pwd", "error.required");
		}

		if (!StringUtils.hasLength(member.getUser_email())) {
			errors.rejectValue("user_email", "error.required");
		}

		if (errors.hasErrors()) {
			// 오류가 있으면, 메시지 입력 오류 메시지 추가
			errors.reject("error.input.member");
		}
	}
}
