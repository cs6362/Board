package com.resume.board.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.resume.board.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		String boardNo = (String) map.get("boardNo");
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", bDao.deleteByBoardNo(boardNo));
		
		return resultMap;
	}

}
