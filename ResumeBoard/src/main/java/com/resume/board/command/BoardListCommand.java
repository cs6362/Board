package com.resume.board.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.resume.board.dao.BoardDao;
import com.resume.board.dto.BoardDto;

public class BoardListCommand  implements BoardCommand{
	
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		List<BoardDto> boardList = bDao.selectBoardList();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardList", boardList);
		map.put("result", true);
		
		return map;
	
	}

}
