<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
<%@ include file="../include/message.jsp" %> 
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
<script type="text/javascript">
	$(function() {
		
		// 회원정보수정 클릭시
		$('#btnUpdate').on('click', function(e) {
			e.preventDefault();
			
			pop = window.open('${path}/member/checkPW','pop','width=700,height=600,left=1000');
		});
		
		// PW변경 클릭시
		$('#btnChangePW').on('click', function(e) {
			e.preventDefault();
			
			var user_id = $('#user_id').val();
			
			$(location).attr('href', '${path}/member/changePW?user_id='+user_id);
		});
		
		// 회원탈퇴 클릭시
		$('#btnDelete').on('click', function(e) {
			e.preventDefault();
			
			var user_id = $('#user_id').val();
			var result = confirm('탈퇴하시겠습니까?');
			
			if(result){
				$(location).attr('href', '${path}/member/delete?user_id='+user_id);
			}
		});
		
		// 취소 클릭시
		$('#btnCancel').on('click', function(e) {
			e.preventDefault();
			
			$(location).attr('href', '${path}/main/login');
		});
	});
	
	//팝업창에 pw 전달
	function getValue(){
		pop.checkPWForm.password.value = $('#password').val();
	}
	
	// 수정 실행
	function update() {
		$('#modifyForm').attr('action', '${path}/member/modify');
		$('#modifyForm').attr('method', 'post');
		
		$('#modifyForm').submit();
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>마이페이지</h2>
	
	<form id="modifyForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="user_id" name="user_id" value="${memberDTO.user_id}" readonly>
					<input type="hidden" id="password" name="password" value="${memberDTO.password}">
				</td>
			</tr>
			<tr>
				<th>*우편번호</th>
				<td><input type="text" id="zip_code" name="zip_code" placeholder="${memberDTO.zip_code}"></td>
			</tr>
			<tr>
				<th>*주소</th>
				<td><input type="text" id="address" name="address" placeholder="${memberDTO.address}"></td>
			</tr>
			<tr>
				<th>*상세주소</th>
				<td><input type="text" id="address_detail" name="address_detail" placeholder="${memberDTO.address_detail}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id="btnUpdate">회원정보수정</button>
					<button id="btnChangePW">PW변경</button>
					<button id="btnDelete">회원탈퇴</button>
					<button id="btnCancel">취소</button>
				</td>
			</tr>
		</table>
	</form>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>