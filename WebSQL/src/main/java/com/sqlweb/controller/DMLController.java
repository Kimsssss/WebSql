package com.sqlweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DMLController {

	@RequestMapping(value="/dml.html", method=RequestMethod.GET)
	public String test(){
		System.out.println("DML controller");
		return "DML";
	}
	/*@RequestMapping
	public void Select(){
		
	}
	
	@RequestMapping
	public void Update(){
		
	}
	
	@RequestMapping
	public void Insert(){
		
	}
	
	@RequestMapping
	public void Delete(){
		
	}*/
	
}
