<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">
	$(function() {
		// 탈퇴 클릭시
		$('#btnDelete').on('click', function(e) {
			e.preventDefault();
			
			var insertPW = $('#insertPW').val();
			
			if (insertPW == ''){
				alert('탈퇴 할 ID의 비밀번호를 입력하세요.');
				$('#insertPW').focus();
			} else {
				$('#deletePWForm').attr('action', '${path}/member/delete');
				$('#deletePWForm').attr('method', 'post');
				
				$('#deletePWForm').submit();
			}
		});
		
		// 취소 클릭시
		$('#btnCancel').on('click', function(e) {
			e.preventDefault();
			
			var user_id = $('#user_id').val();
			
			$(location).attr('href', '${path}/member/modify?user_id='+user_id);
		});
	});
</script>
<body>
	<h2>비밀번호 확인</h2>
	탈퇴 할 ID의 비밀번호를 입력하세요.<br>
	<form id="deletePWForm">
		<input type="hidden" id="user_id" name="user_id" value="${memberDTO.user_id}">
		<input type="hidden" name="password" value="${memberDTO.password}">
		
		<input type="password" id="insertPW" name="insertPW">
		
		<button id="btnDelete">탈퇴</button>
		<button id="btnCancel">취소</button>
	</form>
</body>
</html>