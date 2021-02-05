package com.resume.board.command;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class BoardViewCommand implements BoardCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
	
		return null;
	}

}
