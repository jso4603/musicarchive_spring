<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">
	
	$(function() {
		// 관리자 확인
		if ('${sessionScope.user_id}' != 'admin'){
			$('#btnAdmin').hide();
		}
		
		// 관리자모드 클릭했을때
		$('#btnAdmin').on('click', function() {
			$(location).attr('href', '${path}/album/admin/main');
		});
		
		// 앨범이미지 클릭했을때
		$('.aImage').on('click', function(e) {
			e.preventDefault(); // 기본기능  소멸
			var album_id = $(this).attr('href');
			
			$(location).attr('href', '${path}/album/detail?album_id='+album_id);
		});
	});
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>Album</h2> 
	<button id="btnAdmin">관리자모드</button>
	<p/>
	<div>
		<c:forEach var="album" items="${album_list}">
			<a class="aImage" href="${album.album_id}">
				<img alt="앨범이미지" src="${path}/resources/images/album/${album.artwork_name}"  
						width="200px" height="200px">
			</a>
		</c:forEach>
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>