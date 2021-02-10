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
		boardSelect();
		boardUpdate();
		boardDelete();
		init();
		
		
	});
	
	function boardList(){
		$.ajax({
			url:'boards',
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
		var count = 1;
		$.each(boardList, function(i, board){
			$('<tr>')
			.append($('<td>').html(count++))
			.append($('<td>').html(board.boardTitle))
			.append($('<td>').html(board.boardWriter))
			.append($('<td>').html(board.boardDate))
			.append($('<td>').html('<button id="btnSelect">조회</button>'))
			.append($('<td>').html('<button id="btnDelete">삭제</button>'))
			.append($('<input type="hidden" id="hidden_boardNo" />').val(board.boardNo)) 
			.appendTo('tbody');
		});
	}

	/* 5. 사용자 등록 */
	function boardrInsert() {
		$('#btnInsert').click(function(){
			var boardTitle = $('input:text[name="boardTitle"]').val();
			var boardWriter = $('input:text[name="boardWriter"]').val();
			var boardContent = $('textarea[name="boardContent"]').val();
			var obj = {"boardTitle":boardTitle,"boardWriter":boardWriter,"boardContent":boardContent};
			$.ajax({
				url: 'boards',
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
	
	/* 3. 사용자 정보 가져오기 */
	function boardSelect() {
		// ajax 를 통해서 동적으로 추가된 버튼은 $().click() 이 불가능하다.
		// 동적으로 추가된 요소에 이벤트를 바인딩하려면 $().on() 을 사용한다.
		$('body').on('click', '#btnSelect', function(){
			// var userId = $(this).parents('tr').find('#hidden_userId').val();
			var boardNo = $(this).closest('tr').find('#hidden_boardNo').val();
			$.ajax({
				url: 'boards/' + boardNo,  // @RequestMapping(value="users/{userId}")
				type: 'get',
				dataType: 'json',
				success: function(response) {
					// response
					// {"result":true,"userDto":{"userId":"user2","userName":"사만다","gender":"여","address":"경기"}}
					if (response.result == true) {
						boardSelectResult(response);
					}
				},
				error: function() {
					alert('에러 발생');
				}
			});
		});
	}
	
	/* 4. 사용자 정보 출력하기 */
	function boardSelectResult(response) {
		var board = response.boardDto;
		$('input:hidden[name="boardNo"]').val(board.boardNo);
		$('input:text[name="boardTitle"]').val(board.boardTitle);
		$('input:text[name="boardWriter"]').val(board.boardWriter);
		$('textarea[name="boardContent"]').val(board.boardContent);
	
	}
	
	/* 6. 사용자 수정 */
	function boardUpdate() {
		$('#btnUpdate').click(function(){
			var boardNo = $('input:hidden[name="boardNo"]').val();
			var boardTitle = $('input:text[name="boardTitle"]').val();
			var boardWriter = $('input:text[name="boardWriter"]').val();
			var boardContent = $('textarea[name="boardContent"]').val();
			var obj = {"boardNo":boardNo,"boardTitle":boardTitle,"boardWriter":boardWriter,"boardContent":boardContent};
			$.ajax({
				url: 'boards',
				type: 'put',
				data: JSON.stringify(obj),
				contentType: 'application/json; charset=utf-8',
				dataType: 'json',
				success: function(response) {
					// response
					// {"result":1}
					if (response.result == 1) {
						alert('게시물이 변경되었습니다.');
						boardList();
					}
				},
				error: function() {
					alert('에러 발생');
				}
			});
		});
	}
	
	/* 7. 사용자 삭제 */
	function boardDelete() {
		$('body').on('click', '#btnDelete', function(){
			var boardNo = $(this).closest('tr').find('#hidden_boardNo').val();
			var check = confirm(' 삭제할까요?');
			if (check) {
				$.ajax({
					url: 'boards/' + boardNo,
					type: 'delete',
					dataType: 'json',
					success: function(response) {
						// response
						// {"result":1}
						if (response.result == 1) {
							alert(' 삭제되었습니다.');
							boardList();
						}
					},
					error: function() {
						alert('에러 발생');
					}
				});
			}
		});
	}
	/* 8. 초기화 */
	function init() {
		$('#btnInit').click(function(){
			$('input:hidden[name="boardNo"]').val('');
			$('input:text[name="boardTitle"]').val('');
			$('input:text[name="boardWriter"]').val('');
			$('textarea[name="boardContent"]').val('');
			boardList();
		});
	}
</script>
</head>
<body>

	<div class="wrap">
	
		<div class="left">
			<input type="hidden" name="boardNo"/>
			<h3>사용자 등록/수정</h3>
			<label>제목</label>
			<input type="text" name="boardTitle" /><br/>
			<label>글쓴이</label>
			<input type="text" name="boardWriter" /><br/>
			<label>내용</label>
			<textarea rows="20" cols="30" name="boardContent"></textarea>
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