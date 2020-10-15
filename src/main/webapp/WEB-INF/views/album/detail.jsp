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
		
		// 제목을 클릭
		$('.aTitle').on('click', function(e) {
			e.preventDefault(); // 기본기능  소멸
			var track_id = $(this).attr('href');
			var album_id = $('#albumID').val();

			$(location).attr('href', 
					'${path}/track/detail?album_id='+album_id+'&track_id='+track_id);
		});
		
	});
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>앨범정보</h2>
		
	<div>
		<input id="albumID" type="hidden" value="${albumDTO.album_id}">
		앨범명 : <b>${albumDTO.album_title}</b> <br>
		아트워크 : <img alt="앨범이미지" src="${path}/resources/images/album/${albumDTO.artwork_name}"  
							width="200px" height="200px">
	</div>
	
	<div>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
			</tr>
			
			<c:forEach var="track" items="${trackList}">
				<tr>
					<td>${track.track_id}</td>
					<td><a class="aTitle" href="${track.track_id}">${track.track_title}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>