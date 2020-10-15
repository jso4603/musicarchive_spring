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
		// 회원가입 클릭시
		$('#btnJoin').on('click', function(e) {
			e.preventDefault();
			
			// 필수 값 체크
			var user_id = $('#user_id').val();
			var password = $('#password').val();
			var repw = $('#repw').val();
			
			if (user_id == ''){
				alert('아이디를 입력하세요.');
				$('#user_id').focus();
			} else if (password == ''){
				alert('패스워드를 입력하세요.');
				$('#password').focus();
			} else if (password != repw){
				alert('패스워드가 일치하지 않습니다.');
				$('#repw').focus();
			} else {
				$('#joinForm').attr('action', '${path}/member/join');
	 			$('#joinForm').attr('method', 'post');
	 			
	 			$('#joinForm').submit();
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
	<h2>회원가입</h2>
	<hr>
	
	<form id="joinForm">
		<table>
			<tr>
				<th>*아이디</th>
				<td><input type="text" id="user_id" name="user_id"></td>
			</tr>
			<tr>
				<th>*비밀번호</th>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<th>*비밀번호 재입력</th>
				<td><input type="password" id="repw" name="repw"> </td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" id="zip_code" name="zip_code"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" id="address_detail" name="address_detail"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id="btnJoin">가입</button>
					<button id="btnCancel">취소</button>
				</td>
			</tr>
		</table>
	</form>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>