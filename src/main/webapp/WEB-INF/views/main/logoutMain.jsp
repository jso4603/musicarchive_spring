<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/message.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
<!-- 슬라이더 바 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.slider').bxSlider({
            auto: true,
            autoControls: true,
            stopAutoOnClick: true,
            pager: true,
            slideWidth: 600
        });
    });
</script>
<script type="text/javascript">
	$(function() {
		// 회원가입을 클릭했을때
		$('#btnJoin').on('click', function() {
			$(location).attr('href', '${path}/member/join');
		});
		
		// 로그인을 클릭했을때
		$('#btnLogin').on('click', function() {
			$(location).attr('href', '${path}/login/');
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<button id="btnJoin">회원가입</button>
	<button id="btnLogin">로그인</button>
	
	<div class="slider">
		<c:forEach var="album" items="${albumList}">		
    		<div>
    			<img alt="슬라이더이미지" src="${path}/resources/images/album/${album.artwork_name}"  width="500px" height="500px">
    		</div>
		</c:forEach>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>