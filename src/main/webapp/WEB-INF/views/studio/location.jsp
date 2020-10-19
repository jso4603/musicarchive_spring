<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>
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
		        '   <h5>장상옥 MUSIC STUDIO</h5>',
		        '   <p>서울특별시 관악구 신림동 1449-19 | 서울특별시 관악구 관천로 24길 26 <br>',
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

<body>
	<%@ include file="../include/header.jsp" %>
	
	

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8 col-xl-9">
                    <div class="contact-content mb-100">
                        <h4 class="mb-50">Studio</h4>

                        <div class="row align-items-center mt-30 mb-50">
                        
                            <div class="col-12 col-lg-4">
                                <!-- Single Contact Info -->
                                <div class="single-contact-info d-flex align-items-center">
                                    <div class="icon mr-15">
                                        <img src="${path}/resources/img/core-img/placeholder.png" alt="">
                                    </div>
                                    <p>서울시 관악구 관천로 24길 26</p>
                                </div>

                                <!-- Single Contact Info -->
                                <div class="single-contact-info d-flex align-items-center">
                                    <div class="icon mr-15">
                                        <img src="${path}/resources/img/core-img/smartphone.png" alt="">
                                    </div>
                                    <p>+82 10 4737 4603</p>
                                </div>

                                <!-- Single Contact Info -->
                                <div class="single-contact-info d-flex align-items-center">
                                    <div class="icon mr-15">
                                        <img src="${path}/resources/img/core-img/message.png" alt="">
                                    </div>
                                    <p>jso46033@gmail.com</p>
                                </div>
                            </div>
                            
                            <div class="col-12 col-lg-8">
                                <!-- ##### Maps ##### -->
                                <div id="map" style="width:600px;height:400px;">
                                    
                                </div>
                            </div>
                            
                       </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    
    <%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>

</html>