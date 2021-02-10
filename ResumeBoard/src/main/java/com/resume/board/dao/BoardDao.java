package com.resume.board.dao;

import java.util.List;

import com.resume.board.dto.BoardDto;

public interface BoardDao {

	public List<BoardDto> selectBoardList();

	public int insertBoard(BoardDto bDto);
	
	public BoardDto selectByBoardNo(String boardNo);
	
	public int deleteByBoardNo(String boardNo);
}
