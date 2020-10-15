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
 			var writer = addForm.writer.value;
 			var title = addForm.title.value;
 			var content = addForm.content.value;
 			
 			if(writer ==''){
 				alert('작성자를 입력해주세요');
 				addForm.writer.focus();
 			} else if(title ==''){
 				alert('제목을 입력해주세요');
 				addForm.title.focus();
 			}  else if(content ==''){
 				alert('내용을 입력해주세요');
 				addForm.content.focus();
 			} else { 				
	 			$('#addForm').attr('action', '${path}/community/add');
	 			$('#addForm').attr('method', 'post');
	 			$('#addForm').attr('enctype', 'multipart/form-data');
	 			
	 			$('#addForm').submit();
 			}
 		} );

 		// 취소버튼을 클릭했을때
 		$('#btnCancel').on('click', function(e) {
 			e.preventDefault(); // 객체의 기본기능 소멸
			$(location).attr('href', '${path}/community/main');
		});
 		
		// 파일 삭제 버튼을 클릭했을때
		$('.btnFileDelete').on('click', function(e) {
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
	<h2>게시글 작성</h2>
		<form id="addForm">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" value="${sessionScope.user_id}" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td> <input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="5" cols="20"></textarea> </td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<div id = "fileGroup">
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