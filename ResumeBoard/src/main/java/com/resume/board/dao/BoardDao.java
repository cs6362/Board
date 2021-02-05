package com.resume.board.dao;

import java.util.List;

import com.resume.board.dto.BoardDto;

public interface BoardDao {

	public List<BoardDto> selectBoardList();

}
