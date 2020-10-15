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

	// 비밀번호 일치 시 opener의 update함수 실행 후 창 닫기
	if ('${msg}' == "비밀번호 일치"){
		alert('${msg}');
		opener.update();
		close();
		
	} else if ('${msg}' == "비밀번호 불일치"){
		alert('${msg}');
	}
	
	$(function() {
		// 확인 클릭시
		$('#btnCheck').on('click', function(e) {
			e.preventDefault();
			
			var insertPW = $('#insertPW').val();
			
			if (insertPW == ''){
				alert('비밀번호를 입력하세요.');
				$('#insertPW').focus();
			} else {
				$('#checkPWForm').attr('action', '${path}/member/checkPW');
				$('#checkPWForm').attr('method', 'post');
				
				$('#checkPWForm').submit();
			}
			
		});
		
		// 취소 클릭시
		$('#btnCancel').on('click', function(e) {
			e.preventDefault();
			
			close();
		});
	});
	
</script>
<body>
	<h2>비밀번호 확인</h2>
	비밀번호를 입력하세요.<br>
	<form id="checkPWForm">
	
		<input type="hidden" name="password">
		
		<input type="password" id="insertPW" name="insertPW">
		
		<button id="btnCheck">확인</button>
		<button id="btnCancel">취소</button>
	</form>
	
<script type="text/javascript">
	<!-- 부모에서 값 가져오기 -->
	opener.getValue();
</script>
</body>
</html>