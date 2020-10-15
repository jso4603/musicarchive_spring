<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
<script type="text/javascript">
	$(function() {
 		// 저장버튼을 클릭했을때
 		$('#btnAdd').on('click', function(e){
 			e.preventDefault(); // 객체의 기본기능 소멸
 			
 			// 입력값 체크
 			var writer = modifyForm.writer.value;
 			var title = modifyForm.title.value;
 			var content = modifyForm.content.value;
 			
 			if(writer ==''){
 				alert('작성자를 입력해주세요');
 				modifyForm.writer.focus();
 			} else if(title ==''){
 				alert('제목을 입력해주세요');
 				modifyForm.title.focus();
 			}  else if(content ==''){
 				alert('내용을 입력해주세요');
 				modifyForm.content.focus();
 			} else { 				
	 			$('#modifyForm').attr('action', '${path}/community/modify');
	 			$('#modifyForm').attr('method', 'post');
	 			$('#modifyForm').attr('enctype', 'multipart/form-data');
	 			
	 			$('#modifyForm').submit();
 			}
 		} );

 		// 취소버튼을 클릭했을때
 		$('#btnCancel').on('click', function(e) {
 			e.preventDefault(); // 객체의 기본기능 소멸
			$(location).attr('href', '${path}/community/main');
		});
		
		
		// 파일 삭제 버튼을 클릭했을때
		$('#fileGroup').on('click','.btnFileDelete', function(e) {
			e.preventDefault(); 
			$(this).parent().remove();
		});
		
		// 파일이 change
		// 동적 생성 엘리먼트에 이벤트 달기
		$('#fileGroup').on('change','div',function(e){
			e.preventDefault(); 
			// 파일 선택 추가 
			var appendHtml = '<div>' +
							'<input type="file" name="boardFiles">' +	
							'<button class="btnFileDelete">삭제</button>'+		
							'</div>';
			$('#fileGroup').append(appendHtml);
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>게시글 수정</h2>
	<form id="modifyForm">
		<table border = "1">
			<tr>
				<td>번호</td>
				<td><input type="text" name="board_id" value="${board.board_id}" readonly></td>
			</tr>		
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="${sessionScope.user_id}" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td> <input type="text" name="title" placeholder="${board.title}"> </td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name ="content" rows="5" cols="20">${board.content}</textarea> </td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<div id="fileGroup">
						<c:forEach var="file" items="${file_list}">
							<div>
								<input type="hidden" name="file_id" value="${file.file_id}"> 
								${file.file_name}	
								<button class="btnFileDelete">삭제</button>
							</div>
						</c:forEach>
						<div>
							<input type="file" name="boardFiles">	
							<button class="btnFileDelete">삭제</button>		
						</div>
					</div>
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<button id="btnAdd">저장</button>
					<button id="btnCancel">취소</button>
				</td>
				
			</tr>
		</table>
	</form>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>