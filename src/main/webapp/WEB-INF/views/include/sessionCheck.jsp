<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>  

	<!-- Session Check  -->
	<script type="text/javascript">
		
		if ('${sessionScope.user_id}' == ''){
			alert("로그인후 이용하세요!");
			location.href ="${path}/login/";
		}
		
	</script>