<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/includeFile.jsp" %>
<%@ include file="../../include/message.jsp" %>
<%@ include file="../../include/adminCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../include/headBootStrap.jsp" %>
</head>

	<script type="text/javascript">
	
		$(function() {
			
			// 앨범추가 클릭했을때
			$('#btnAdd').on('click', function() {
				$(location).attr('href','${path}/album/admin/addAlbum');
			});
			
			// 메인 클릭했을때
			$('#btnMain').on('click', function() {
				$(location).attr('href','${path}/album/main');
			});
			
			// 삭제 클릭했을때
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
	
	<!-- ##### AdminMain Area Start ##### -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-9">
                <div class="contact-content mb-100">
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">관리자모드</h4>
                        <div class="row">
                            
                            <!-- ##### AlbumAdd Area Start ##### -->
                            <div class="col-12">
                                <div class="form-group">
			        				<button id="btnAdd" class="btn bueno-btn mt-30">앨범추가</button>
			        				<button id="btnMain" class="btn bueno-btn mt-30">메인</button>
                                </div>
                            </div>
                            <!-- ##### AlbumAdd Area End ##### -->
                            
                            <!-- ##### AlbumList Area Start ##### -->
                            <c:forEach var="album" items="${album_list}">
                            
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <input type="number" class="form-control" value="${album.album_id}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="${album.album_title}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <img alt="앨범이미지" src="${path}/resources/images/album/${album.artwork_name}"  
											width="100px" height="100px">
                                    </div>
                                </div>
                                
                                <div class="col-lg-2">
                                	<div class="form-group">
		        						<button class="btnDelete btn bueno-btn mt-30" value="${album.album_id}">삭제</button>
									</div>
                                </div>
                                
                             </c:forEach>
                             <!-- ##### AlbumList Area End ##### -->
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### AdminMain Area End ##### -->
	
	<%@ include file="../../include/footer.jsp" %>
	<%@ include file="../../include/footBootStrap.jsp" %>
</body>
</html>