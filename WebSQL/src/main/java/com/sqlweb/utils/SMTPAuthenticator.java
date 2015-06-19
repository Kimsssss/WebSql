package com.sqlweb.utils;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPAuthenticator extends Authenticator {
	protected PasswordAuthentication getPasswordAuthentication() {
		String username = "psmco9@gmail.com"; // gmail 사용자;
		String password = "!!14754qkr"; // 패스워드;
		return new PasswordAuthentication(username, password);
	}
}