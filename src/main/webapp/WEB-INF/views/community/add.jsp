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
	 		
	 		// 저장버튼을 클릭했을때
	 		$('#btnAdd').on('click', function(e){
	 			e.preventDefault(); // 객체의 기본기능 소멸
	 			
	 			// 입력값 체크
	 			var title = addForm.title.value;
	 			var content = addForm.content.value;
	 			
	 			if(title ==''){
	 				alert('제목을 입력해주세요');
	 				addForm.title.focus();
	 			}  else if(content ==''){
	 				alert('내용을 입력해주세요');
	 				addForm.content.focus();
	 			} else { 				
		 			$('#addForm').attr('action', '${path}/community/add');
		 			$('#addForm').attr('method', 'post');
		 			$('#addForm').attr('enctype', 'multipart/form-data');
		 			
		 			$('#addForm').submit();
	 			}
	 		} );
	
	 		// 취소버튼을 클릭했을때
	 		$('#btnCancel').on('click', function(e) {
	 			e.preventDefault(); // 객체의 기본기능 소멸
				$(location).attr('href', '${path}/community/main');
			});
	 		
			// 파일 삭제 버튼을 클릭했을때
			$('#fileGroup').on('click','button', function(e) {
				e.preventDefault(); 
				$(this).parent().remove();
			});
			
			// 파일이 change
			// 동적 생성 엘리먼트에 이벤트 달기
			$('#fileGroup').on('change',function(e){
				e.preventDefault(); 
				// 파일 선택 추가 
				var appendHtml = '<div class="form-group">' +
								'<input type="file" name="boardFiles">' +	
								'<button class="btnFileDelete btn bueno-btn">파일삭제</button>'+		
								'</div>';
				$('#fileGroup').append(appendHtml);
			});
			
		});
	 	
	 </script>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<!-- ##### Form Area Start ##### -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-9">
                <div class="contact-content mb-100">
                    
                    <!-- Add Form Area -->
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">게시글 작성</h4>

                        <form id="addForm" name="addForm">
                            <div class="row">
                            
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="writer" value="${sessionScope.user_id}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                    	*<input type="text" class="form-control" name="title" placeholder="제목">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                        *<textarea class="form-control" name="content" cols="30" rows="10" placeholder="내용"></textarea>
                                    </div>
                                </div>
                                
                                <div id="fileGroup" class="col-12">
									<div class="form-group">
										<input type="file" name="boardFiles">	
										<button class="btnFileDelete btn bueno-btn">파일삭제</button>		
									</div>		
								</div>
  
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnAdd">저장</button>
                                    <button class="btn bueno-btn mt-30" id="btnCancel">취소</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- ##### Form Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>