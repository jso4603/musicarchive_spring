<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>

	<script type="text/javascript">
		
		$(function() {
			
			// 관리자 세션 확인
			if ('${sessionScope.user_id}' != '관리자'){
				$('#btnAdmin').hide();
			}
			
			// 관리자모드 클릭했을때
			$('#btnAdmin').on('click', function() {
				$(location).attr('href', '${path}/album/admin/main');
			});
			
			// 앨범이미지 클릭했을때
			$('.post-title').on('click', function(e) {
				e.preventDefault(); // 기본기능  소멸
				var album_id = $(this).attr('href');
				
				$(location).attr('href', '${path}/album/detail?album_id='+album_id);
			});
			
		});
		
	</script>
	
<body>
	<%@ include file="../include/header.jsp" %>
	
	<div class="col-12">
        <button id="btnAdmin" class="btn bueno-btn mt-30">관리자모드</button>
    </div>

	<!-- ##### Album Area Start ##### -->
    <div class="post-catagory section-padding-100"> 
        <div class="container">
		<h2>Album</h2>
            <div class="row">
                
                <c:forEach var="album" items="${album_list}">
                
	                <div class="col-12 col-sm-6 col-lg-4">
	                    <div class="single-post-catagory mb-30">
	                    	<a href="${album.album_id}" class="post-title">
	                        <img src="${path}/resources/images/album/${album.artwork_name}" alt="">
	                        </a>
	                        <!-- Content -->
	                        <div class="catagory-content-bg">
	                            <div class="catagory-content">
	                                <a href="${path}/album/detail?album_id=${album.album_id}" class="post-tag">앨범명</a>
	                                <a href="${album.album_id}" class="post-title">${album.album_title}</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                
                </c:forEach>

            </div>
        </div>
    </div>
    <!-- ##### Album Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>