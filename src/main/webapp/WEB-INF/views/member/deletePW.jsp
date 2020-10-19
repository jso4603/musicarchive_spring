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
		
		// 탈퇴 클릭시
		$('#btnDelete').on('click', function(e) {
			e.preventDefault();
			
			var insertPW = $('#insertPW').val();
			
			if (insertPW == ''){
				alert('탈퇴 할 ID의 비밀번호를 입력하세요.');
				$('#insertPW').focus();
			} else {
				$('#deletePWForm').attr('action', '${path}/member/delete');
				$('#deletePWForm').attr('method', 'post');
				
				$('#deletePWForm').submit();
			}
		});
		
		// 취소 클릭시
		$('#btnCancel').on('click', function(e) {
			e.preventDefault();
			
			var user_id = $('#user_id').val();
			
			$(location).attr('href', '${path}/member/modify?user_id='+user_id);
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
                    
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">비밀번호 확인</h4>

                        <form id="deletePWForm">
                            <div class="row">
                            
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="hidden" id="user_id" name="user_id" value="${memberDTO.user_id}">
										<input type="hidden" name="password" value="${memberDTO.password}">
                                        <input type="password" class="form-control" id="insertPW" name="insertPW" placeholder="탈퇴 할 ID의 비밀번호를 입력하세요.">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnDelete">변경</button>
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