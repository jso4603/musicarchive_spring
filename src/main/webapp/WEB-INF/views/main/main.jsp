<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/message.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<!-- ##### Hero Area Start ##### -->
    <div class="hero-area">
        <!-- Hero Post Slides -->
        <div class="hero-post-slides owl-carousel">
        	
        	<c:forEach var="album" items="${albumList}">
        	
        		<div class="single-slide">
        		
	                <!-- Blog Thumbnail -->
	                <div class="blog-thumbnail">
	                    <a href="#"><img src="${path}/resources/images/album/${album.artwork_name}" alt=""></a>
	                </div>

	                <!-- Blog Content -->
	                <div class="blog-content-bg">
	                    <div class="blog-content">
	                        <a href="#" class="post-tag">Album Title</a>
	                        <a href="#" class="post-title">${album.album_title}</a>
	                        <div class="post-meta">
	                            <a href="#" class="post-date">July 11, 2018</a>
	                            <a href="#" class="post-author">By 장상옥</a>
	                        </div>
	                    </div>
	                </div>
	                
	            </div>
            
        	</c:forEach>
        
        </div>
    </div>
    <!-- ##### Hero Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>