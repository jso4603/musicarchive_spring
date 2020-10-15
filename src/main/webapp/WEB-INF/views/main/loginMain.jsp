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
		// 마이페이지를 클릭했을때
		$('#btnMyPage').on('click', function(e) {
			e.preventDefault();
			
			var user_id = $('#user_id').val();
			$(location).attr('href','${path}/member/modify?user_id='+user_id);
		});
		
		// 로그아웃을 클릭했을때
		$('#btnLogout').on('click', function(e) {
			e.preventDefault();
			
			var result = confirm('로그아웃 하시겠습니까?');
			
			if(result){
				$(location).attr('href', '${path}/login/logout');
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>

	${sessionScope.user_id}님 반갑습니다.
	<input id="user_id" type="hidden" value="${sessionScope.user_id}">
	<button id="btnMyPage">마이페이지</button>
	<button id="btnLogout">로그아웃</button>
	
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