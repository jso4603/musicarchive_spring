<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/includeFile.jsp" %>
<%@ include file="../../include/adminCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">

	$(function() {
		
		// 앨범 저장 클릭했을때
		$('#btnAddAlbum').on('click', function(e) {
			e.preventDefault();
			
			// 입력값 체크
 			var album_title = addAlbumForm.album_title.value;
 			var artwork_file = addAlbumForm.artwork_file.value;
 			
 			if(album_title ==''){
 				alert('앨범명을 입력해주세요');
 				addAlbumForm.album_title.focus();
 			} else if(artwork_file ==''){
 				alert('아트워크를 등록해주세요');
 				addAlbumForm.artwork_file.focus();
 			} else { 				
				$('#addAlbumForm').attr('action', '${path}/album/admin/addAlbum');
	 			$('#addAlbumForm').attr('method', 'post');
	 			$('#addAlbumForm').attr('enctype', 'multipart/form-data');
	 			
	 			$('#addAlbumForm').submit();
 			}
		});
		
		// 앨범 취소 클릭했을때
		$('#btnCancelAlbum').on('click', function(e) {
			e.preventDefault();
			$(location).attr('href', '${path}/album/admin/main');
		});
	});
</script>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<h2>앨범 추가</h2>
	
	<form id="addAlbumForm">
		<table border="1">
			<tr>
				<th>앨범명</th>
				<td><input name="album_title" type="text"></td>
			</tr>
			<tr>
				<th>아트워크</th>
				<td><input name="artwork_file" type="file"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="btnAddAlbum">앨범저장</button>
					<button id="btnCancelAlbum">취소</button>
				</td>
			</tr>
		</table>
	</form>
	
	<%@ include file="../../include/footer.jsp" %>
</body>
</html>