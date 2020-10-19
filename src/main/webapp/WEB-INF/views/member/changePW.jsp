<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/message.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>

	<script type="text/javascript">
	
		$(function() {
			
			// 변경 클릭시
			$('#btnChange').on('click', function(e) {
				e.preventDefault();
				
				var oldPW = $('#oldPW').val();
				var newPW = $('#newPW').val();
				
				if (oldPW == ''){
					alert('기존 비밀번호를 입력하세요.');
					$('#oldPW').focus();
				} else if (newPW == ''){
					alert('변경할 비밀번호를 입력하세요.');
					$('#newPW').focus();
				} else {
					$('#changePWForm').attr('action', '${path}/member/changePW');
					$('#changePWForm').attr('method', 'post');
					
					$('#changePWForm').submit();
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
                        <h4 class="mb-50">비밀번호 변경</h4>

                        <form id="changePWForm">
                            <div class="row">
                            
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="hidden" id="user_id" name="user_id" value="${memberDTO.user_id}">
										<input type="hidden" name="password" value="${memberDTO.password}">
                                        <input type="password" class="form-control" id="oldPW" name="oldPW" placeholder="기존 비밀번호를 입력하세요.">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="newPW" name="newPW" placeholder="변경할 비밀번호를 입력하세요.">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnChange">변경</button>
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