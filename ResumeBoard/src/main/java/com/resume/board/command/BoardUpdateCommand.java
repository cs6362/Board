package com.resume.board.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.resume.board.dao.BoardDao;
import com.resume.board.dto.BoardDto;

public class BoardUpdateCommand implements BoardCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map< String, Object> map = model.asMap();
		BoardDto bDto = (BoardDto) map.get("boardDto");
	
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", bDao.updateBoard(bDto));
		
		
		
		
		return resultMap;
	}

}
