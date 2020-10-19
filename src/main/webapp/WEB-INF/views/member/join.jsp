<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/message.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>
	<script type="text/javascript">
		$(function() {
			
			// 회원가입 클릭시
			$('#btnJoin').on('click', function(e) {
				e.preventDefault();
				
				// 필수 값 체크
				var user_id = $('#user_id').val();
				var password = $('#password').val();
				var repw = $('#repw').val();
				
				if (user_id == ''){
					alert('아이디를 입력하세요.');
					$('#user_id').focus();
				} else if (password == ''){
					alert('패스워드를 입력하세요.');
					$('#password').focus();
				} else if (password != repw){
					alert('패스워드가 일치하지 않습니다.');
					$('#repw').focus();
				} else {
					$('#joinForm').attr('action', '${path}/member/join');
		 			$('#joinForm').attr('method', 'post');
		 			
		 			$('#joinForm').submit();
				}
			});
			
			// 취소 클릭 시
			$('#btnCancel').on('click', function(e) {
				e.preventDefault();
				$(location).attr('href', '${path}/main/main');
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
                        <h4 class="mb-50">회원가입</h4>

                        <form id="joinForm">
                            <div class="row">
                            
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="*ID">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="*PW">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="repw" name="repw" placeholder="*재입력">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="zip_code" name="zip_code" placeholder="우편번호">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" class="form-control" id="address" name="address" placeholder="주소">
                                </div>
                                
                                <div class="col-12">
                                    <input type="text" class="form-control" id="address_detail" name="address_detail" placeholder="상세주소">
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnJoin">가입</button>
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