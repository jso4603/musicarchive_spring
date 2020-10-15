<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/includeFile.jsp" %>
<%@ include file="../../include/message.jsp" %>
<%@ include file="../../include/adminCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">
	$(function() {
		// 앨범추가 클릭했을때
		$('#btnAdd').on('click', function() {
			$(location).attr('href','${path}/album/admin/addAlbum');
		});
		
		// 앨범추가 클릭했을때
		$('#btnMain').on('click', function() {
			$(location).attr('href','${path}/album/main');
		});
		
		// 삭제를 클릭했을때
		$('.btnDelete').on('click', function(e) {
 			e.preventDefault(); // 객체의 기본기능 소멸
 			var result = confirm('삭제하시겠습니까?');
 			if (result){
 	 			var album_id = $(this).val();
 	 			console.log(album_id);
 				$(location).attr('href', '${path}/album/admin/delete?album_id=' + album_id);			
 			}
 			
		});
	});
</script>
<body>
<%@ include file="../../include/header.jsp" %>
	<h2>관리자모드</h2>
	<button id="btnAdd">앨범추가</button>
	<button id="btnMain">메인</button>
	<div>
	<p/>
		<table border="1">
			<tr>
				<th>앨범ID</th>
				<th>제목</th>
				<th>아트워크</th>
			</tr>
			
			<c:forEach var="album" items="${album_list}">
				<tr>
					<td>${album.album_id}</td>
					<td>
						${album.album_title}
						<button class="btnDelete" value="${album.album_id}">삭제</button>
					</td>
					<td><img alt="앨범이미지" src="${path}/resources/images/album/${album.artwork_name}"  
						width="100px" height="100px"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<%@ include file="../../include/footer.jsp" %>
</body>
</html>