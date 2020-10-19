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
	
	<!-- ##### AlbumDetail Area Start ##### -->
    <section class="post-news-area section-padding-100-0 mb-70">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8 col-xl-9">
                    <div class="post-details-content mb-100">
                    
                    	<!-- ##### AlbumDetailInfo Start ##### -->
                        <div class="blog-thumbnail mb-50">
                            <img src="${path}/resources/images/album/${albumDTO.artwork_name}" alt="">
                        </div>

                        <div class="blog-content">
                
                        	<input id="albumID" type="hidden" value="${albumDTO.album_id}">
                            <a href="#" class="post-tag">앨범명</a>
                            <h4 class="post-title">${albumDTO.album_title}</h4>
                            
                            <div class="post-meta mb-50">
                                <a href="#" class="post-author">Released</a>
                                <a href="#" class="post-date">August 4, 2020</a>
                            </div>
                          
                           
                            <div>
	                            <c:forEach var="track" items="${trackList}">
									<p>${track.track_id}. &nbsp; <a class="aTitle" href="${track.track_id}">${track.track_title}</a> &lt;--Listen</p> 
								</c:forEach>
                            </div>
                        </div>
                        <!-- ##### AlbumDetailInfo End ##### -->
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### AlbumDetail Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>