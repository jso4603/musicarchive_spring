<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@include file="../include/message.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">
	$(function() {
		// 로그인 클릭시
		$('#btnLogin').on('click', function(e) {
			e.preventDefault();
			
			// 필수 값 체크
			var user_id = $('#user_id').val();
			var password = $('#password').val();
			
			if (user_id == ''){
				alert('아이디를 입력하세요.');
				$('#user_id').focus();
			} else if (password == ''){
				alert('패스워드를 입력하세요.');
				$('#password').focus();
			} else {
				$('#loginForm').attr('action', '${path}/login/');
	 			$('#loginForm').attr('method', 'post');
	 			
	 			$('#loginForm').submit();
			}
		});
		
		// 취소 클릭 시
		$('#btnCancel').on('click', function(e) {
			e.preventDefault();
			$(location).attr('href', '${path}/main/logout');
		});
	});
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>로그인</h2>
	<form id="loginForm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id="btnLogin">로그인</button>
					<button id="btnCancel">취소</button>
				</td>
			</tr>
		</table>
	</form>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>