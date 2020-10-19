<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/includeFile.jsp" %>
<%@ include file="../../include/adminCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../include/headBootStrap.jsp" %>
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
	
	<!-- ##### Container Area Start ##### -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-9">
                <div class="contact-content mb-100">
                    
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">앨범추가</h4>

						<!-- ##### Form Area Start ##### -->
                        <form id="addAlbumForm">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="album_title" name="album_title" placeholder="*앨범명">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    	<input type="file" class="form-control" id="artwork_file" name="artwork_file">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group"> 
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnAddAlbum">앨범저장</button>
                                    <button class="btn bueno-btn mt-30" id="btnCancelAlbum">취소</button>
                                </div>
                            </div>
                        </form>
                        <!-- ##### Form Area End ##### -->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Container Area End ##### -->
	
	<%@ include file="../../include/footer.jsp" %>
	<%@ include file="../../include/footBootStrap.jsp" %>
</body>
</html>