<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/includeFile.jsp" %>
<%@include file="../include/message.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">
	$(function() {
		// 변경 클릭시
		$('#btnChange').on('click', function(e) {
			e.preventDefault();
			
			var oldPW = $('#oldPW').val();
			var newPW = $('#newPW').val();
			
			if (oldPW == ''){
				alert('기존 비밀번호를 입력하세요.');
				$('#oldPW').focus();
			} else if (newPW == ''){
				alert('변경할 비밀번호를 입력하세요.');
				$('#newPW').focus();
			} else {
				$('#changePWForm').attr('action', '${path}/member/changePW');
				$('#changePWForm').attr('method', 'post');
				
				$('#changePWForm').submit();
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
	<h2>비밀번호 변경</h2>
	<form id="changePWForm">
		<input type="hidden" id="user_id" name="user_id" value="${memberDTO.user_id}">
		<input type="hidden" name="password" value="${memberDTO.password}">
		
		기존 비밀번호 : 
		<input type="password" id="oldPW" name="oldPW"> <br>
		변경할 비밀번호 :
		<input type="password" id="newPW" name="newPW"> <br>
		<button id="btnChange">변경</button>
		<button id="btnCancel">취소</button>
	</form>
</body>
</html>