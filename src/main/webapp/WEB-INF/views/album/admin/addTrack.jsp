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
		// 트랙추가 개수 처음에 1로 초기화
		var num = 1;
		
		// 트랙 전체저장 클릭했을때
		$('#btnAddTrackList').on('click', function(e) {
			e.preventDefault(); // 객체의 기본기능 소멸
		
			for (var i = 0; i < num; i++) {
				// 입력값 체크
				var track_title = $('#track_title_'+i).val();
				var lyric = $('#lyric_'+i).val();
				var track_file = $('#track_file_'+i).val();

	 			if(track_title ==''){
	 				alert('트랙 제목을 입력해주세요');
	 				$('#track_title_'+i).focus();
	 				break;
	 			} else if(lyric ==''){
	 				alert('가사를 입력해주세요');
	 				$('#lyric_'+i).focus();
	 				break;
	 			} else if(track_file ==''){
	 				alert('음원을 입력해주세요');
	 				$('#track_file_'+i).focus();
	 				break;
	 			} else {
	 				// 마지막 트랙리스트까지 확인하지 않았다면 continue
	 				if(i < num-1){
	 					continue;
	 				} else {	
		 				$('#addTrackForm').attr('action', '${path}/track/addTrack');
		 	 			$('#addTrackForm').attr('method', 'post');
		 	 			$('#addTrackForm').attr('enctype', 'multipart/form-data');
		 	 			
		 	 			$('#addTrackForm').submit();
					}
	 			}
			}
		});
		
		// 전체저장 취소 클릭했을때
		$('#btnCancelTrackList').on('click', function(e) {
			e.preventDefault();
			$(location).attr('href', '${path}/album/admin/main');
		});
		
		// 트랙 추가 클릭했을때
		$('#btnAddTrack').on('click', function(e) {
			e.preventDefault();
			var albumID = $('#albumID').val();
			var appendHtml = 
							'<div id="trackInfo">' +
							'<br>'+
								'<input name="trackList['+num+'].album_id" type="hidden" value="'+albumID+'">' +
								'&nbsp; 트랙 번호 <input name="trackList['+num+'].track_id" type="number" value="'+(num+1)+'" readonly> <br>' +
								'&nbsp; *트랙 제목 <input id="track_title_'+num+'" name="trackList['+num+'].track_title" type="text"> <br>' +
								'&nbsp; *가사 <br>' +
								'&nbsp; <textarea id="lyric_'+num+'" name="trackList['+num+'].lyric" rows="5" cols="50"></textarea> <br>' +
								'&nbsp; *음원 <input id="track_file_'+num+'" name="trackFiles" type="file">' +
							'</div>' ;
							
			$('#trackGroup').append(appendHtml);
			num++;
		});
		
		// 트랙 추가 취소 클릭했을때
		$('#btnCancelTrack').on('click', function(e) {
			e.preventDefault();
			$("#trackInfo").remove();
			num--;
		});
		
	});
</script>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<form id="addTrackForm">
		
		<h2>트랙 추가</h2>
		앨범명 : <b>${albumDTO.album_title}</b> 
		<p/>
		
		<div>		
			&nbsp; <button id="btnAddTrack">트랙 추가</button>
			&nbsp; <button id="btnCancelTrack">취소</button>
		</div>
		<hr>
		
		<div id="trackGroup">
			<div>
			<br>
				<input id="albumID" name="trackList[0].album_id" type="hidden" value="${albumDTO.album_id}">
				&nbsp; 트랙 번호 <input name="trackList[0].track_id" type="number" value="1" readonly> <br>
				&nbsp; *트랙 제목 <input id="track_title_0" name="trackList[0].track_title" type="text"> <br>
				&nbsp; *가사 <br>
				&nbsp; <textarea id="lyric_0" name="trackList[0].lyric" rows="5" cols="50"></textarea> <br>
				&nbsp; *음원 <input id="track_file_0" name="trackFiles" type="file">
			</div>
		</div>
		<hr>
		
		<button id="btnAddTrackList">트랙 전체저장</button>
		<button id="btnCancelTrackList">취소</button>
	</form>
	
	<%@ include file="../../include/footer.jsp" %>
</body>
</html>