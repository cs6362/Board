package com.resume.board.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.resume.board.command.BoardCommand;
import com.resume.board.command.BoardListCommand;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping(value="users",
								method=RequestMethod.GET,
								produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> selectBoardList(Model model){
		boardCommand = new BoardListCommand();
		Map<String, Object> map = boardCommand.execute(sqlSession, model);
		
		return map;
	}
	
	
}







