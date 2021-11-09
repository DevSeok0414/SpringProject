package com.devseok0414.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		
		return "redirect:/index.do";
	}
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String indexProc() {
		
		return "index";
	}
}
