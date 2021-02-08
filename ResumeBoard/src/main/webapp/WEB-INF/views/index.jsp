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
		boardrInsert();
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
			.append($('<input type="hidden" id="hidden_boardContent" />').val(board.boardContent)) 
			.appendTo('tbody');
		});
	}

	/* 5. 사용자 등록 */
	function boardrInsert() {
		$('#btnInsert').click(function(){
			var boardTitle = $('input:text[name="boardTitle"]').val();
			var boardWriter = $('input:text[name="boardWriter"]').val();
			var boardContent = $('textarea[name="boardContent"]').val();
			alert(boardContent);
			var obj = {"boardTitle":boardTitle,"boardWriter":boardWriter,"boardContent":boardContent};
			$.ajax({
				url: 'users',
				type: 'post',
				data: JSON.stringify(obj),  // @RequestBody UserDto userDto
				contentType: 'application/json; charset=utf-8',  // data 를 @RequestBody 가 받을 때 작성
				dataType: 'json',
				success: function(response) {
					// response
					// {"result":1}
					if (response.result == 1) {
						alert('사용자가 등록되었습니다.');
						boardList();
					}
				},
				error: function() {
					alert('에러 발생');
				}
			});
		});
	}

</script>
</head>
<body>

	<div class="wrap">
	
		<div class="left">
			<h3>사용자 등록/수정</h3>
			<label>제목</label>
			<input type="text" name="boardTitle" /><br/>
			<label>글쓴이</label>
			<input type="text" name="boardWriter" /><br/>
			<label>내용</label>
			<textarea rows="3" cols="10" name="boardContent"></textarea>
			<br/><br/>
			<input type="button" value="등록" id="btnInsert" />
			<input type="button" value="수정" id="btnUpdate" />
			<input type="button" value="초기화" id="btnInit" />
		</div>

		<div class="right">
			<h3>게시판 목록</h3>
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td colspan="2">비고</td>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	
	</div>


</body>
</html>