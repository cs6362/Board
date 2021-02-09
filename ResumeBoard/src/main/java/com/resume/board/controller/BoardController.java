package com.resume.board.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.resume.board.command.BoardCommand;
import com.resume.board.command.BoardInsertCommand;
import com.resume.board.command.BoardListCommand;
import com.resume.board.command.BoardViewCommand;
import com.resume.board.dto.BoardDto;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;

	/*
	 * 사용자 관리 RESTful 웹 서비스
	 * 
	 * RESTful : URI + HTTP Method
	 * 
	 *			Resource URI	HTTP Method		기존 방식의 URI
	 * 목록		users			GET				selectUserList
	 * 보기		users/{userId}	GET				selectByUserId?userId=admin
	 * 삽입		users			POST			insertUser
	 * 수정		users			PUT				updateUser
	 * 삭제		users/{userId}	DELETE			deleteUser?userId=admin
	 */
	
	
	
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping(value="boards",
								method=RequestMethod.GET,
								produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> selectBoardList(Model model){
		boardCommand = new BoardListCommand();
		Map<String, Object> map = boardCommand.execute(sqlSession, model);
		
		return map;
	}
	
	@RequestMapping(value="boards",
			method=RequestMethod.POST,
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> insertBoard(@RequestBody BoardDto boardDto,
									  Model model) {
	if (boardDto != null) {
		model.addAttribute("boardDto", boardDto);
		boardCommand = new BoardInsertCommand();
	}
	return boardCommand.execute(sqlSession, model);
	}
		
	
	@RequestMapping(value="boards/{boardNo}",
			method=RequestMethod.GET,
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> selectByUserId(@PathVariable("boardNo") String boardNo,
										  Model model) {
	model.addAttribute("boardNo", boardNo);
	boardCommand = new BoardViewCommand();
	
	return boardCommand.execute(sqlSession, model);
}

	
	
	
}







