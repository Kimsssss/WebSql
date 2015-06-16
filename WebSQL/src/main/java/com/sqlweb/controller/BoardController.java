package com.sqlweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class BoardController {

	@RequestMapping(value="board.html")
	public String Boardwrite(){
		
		return "Boardwrite";
	}
	
}
