<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>

	<script type="text/javascript">
	
		//세션체크
		if ('${sessionScope.user_id}' != '관리자'){
			alert("관리자로 로그인해주세요!");
			location.href ="${path}/main/logout";
		}
		
	</script>