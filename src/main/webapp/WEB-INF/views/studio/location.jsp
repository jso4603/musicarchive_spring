<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bu893hnprh"></script>
<script type="text/javascript">
	$(function() {
		// 맵 옵션 : 지도 속성 초기화 하는 데 사용
		var mapOptions = {
	    	center: new naver.maps.LatLng(37.48892593383789, 126.92343139648438),
		    zoom: 15
		}
	
		// 옵션을 이용하여 맵 생성
		var map = new naver.maps.Map('map', mapOptions);
	
		// 마커 만들기
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(37.48892593383789, 126.92343139648438),
		    map: map
		});
		
		// 정보 표시하기
		var contentString = [
	        '<div class="iw_inner">',
	        '   <h3>장상옥 MUSIC STUDIO</h3>',
	        '   <p>서울특별시 관악구 신림동 1449-19 | 서울특별시 관악구 관천로 24길 26 <br />',
	        '   </p>',
	        '</div>'
	    ].join('');

		var infowindow = new naver.maps.InfoWindow({
		    content: contentString
		});
	
		naver.maps.Event.addListener(marker, "click", function(e) {
		    if (infowindow.getMap()) {
		        infowindow.close();
		    } else {
		        infowindow.open(map, marker);
		    }
		});
	});
</script>

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<h2>스튜디오 위치</h2>
	<img alt="스튜디오이미지" src="${path}/resources/images/profile/02_studio.jpeg"  width="500px" height="500px">
	
	<div id="map" style="width:600px;height:400px;"></div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>