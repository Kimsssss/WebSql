
package com.sqlweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller

public class IndexController {
	
	@RequestMapping("index.html")
	public String index()
	{
		return "index";
	}	
	
	
	
	@RequestMapping("index2.html")
	public String index2()
	{
		
		
		
		return "home2.index2";
		
	}
}
