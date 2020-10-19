<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<!-- ##### AlbumInfo Section Start ##### -->
	<section class="post-news-area section-padding-100-0 mb-70">
	    <div class="container">
	        <div class="row justify-content-center">
	            
	            <div class="col-12 col-lg-8 col-xl-9">
	            
	                <div class="post-details-content mb-100">
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
	                    </div>
	                </div>
	
	            </div>
	        </div>
	    </div>
	</section>
	<!-- ##### AlbumInfo Section End ##### -->

	<!-- ##### TrackInfo Area Start ##### -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-9">
                <div class="contact-content mb-100">
                    
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">트랙정보</h4>

                        <form>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="${trackDTO.track_id}" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="${trackDTO.track_title}" readonly>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" cols="30" rows="10" placeholder="${trackDTO.lyric}" readonly>${trackDTO.lyric}</textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <audio src ="${path}/resources/trackfile/${trackDTO.file_name}" autoplay controls></audio>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- ##### TrackInfo Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>