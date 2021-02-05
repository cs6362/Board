<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		boardList();
		
	});
	
	function boardList(){
		$.ajax({
			url:'users',
			type:'get',
			dataType:'json',
			success:function(response){
				
				if(response.result==true){
					boardListResult(response);
				}
			},
			error:function(){
				alert('에러 발생');
			}
		});
	}
	
	/* 2. 사용자 목록 테이블 만들기 */
	function boardListResult(response) {
		$('tbody').empty();
		var boardList = response.boardList;
		$.each(boardList, function(i, board){
			$('<tr>')
			.append($('<td>').html(board.boardNo))
			.append($('<td>').html(board.boardTitle))
			.append($('<td>').html(board.boardWriter))
			.append($('<td>').html(board.boardDate))
			.append($('<td>').html('<button id="btnSelect">조회</button>'))
			.append($('<td>').html('<button id="btnDelete">삭제</button>'))
			.append($('<input type="hidden" id="hidden_boardNo" />').val(board.boardNo))
			.appendTo('tbody');
		});
	}



</script>
</head>
<body>

	<div class="wrap">
	
		<div class="left">
			<h3>사용자 등록/수정</h3>
			<label>아이디</label>
			<input type="text" name="userId" /><br/>
			<label>이름</label>
			<input type="text" name="userName" /><br/>
			<label>성별</label>
			<input type="radio" name="gender" value="남" />남<br/>
			<input type="radio" name="gender" value="여" />여<br/>
			<label>주소</label>
			<select name="address">
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
			</select>
			<br/><br/>
			<input type="button" value="등록" id="btnInsert" />
			<input type="button" value="수정" id="btnUpdate" />
			<input type="button" value="초기화" id="btnInit" />
		</div>

		<div class="right">
			<h3>사용자 목록</h3>
			<table>
				<thead>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>성별</td>
						<td>주소</td>
						<td colspan="2">비고</td>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	
	</div>


</body>
</html>