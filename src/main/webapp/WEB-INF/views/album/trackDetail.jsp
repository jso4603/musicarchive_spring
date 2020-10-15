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
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>트랙정보</h2>
	
	<div>
		앨범 : <b>${albumDTO.album_title}</b> <br>
		아트워크 : <img alt="앨범이미지" src="${path}/resources/images/album/${albumDTO.artwork_name}"  
							width="200px" height="200px">
	</div>
	
	<table border="1">
		<tr>
			<th>트랙번호</th>
			<td>${trackDTO.track_id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${trackDTO.track_title}</td>
		</tr>
		<tr>
			<th>가사</th>
			<td><pre>${trackDTO.lyric}</pre></td>
		</tr>
		<tr>
			<th>음원</th>
			<td>
				<audio src ="${path}/resources/trackfile/${trackDTO.file_name}" autoplay controls></audio>
			</td>
		</tr>
	</table>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>