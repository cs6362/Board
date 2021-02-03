package com.resume.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	

	@RequestMapping("/")
	public String index() {
		return "home";
	}
	
	
}







