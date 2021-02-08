package com.resume.board.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// lombok 라이브러리 사용
// @Data : @Getter, @Setter
// @NoArgsConstructor : 디폴트 생성자
// @AllArgsConstructor : 필드를 이용한 생성자

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {

	private String boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date boardDate;
	
}