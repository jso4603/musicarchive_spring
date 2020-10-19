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
		
		// 로그인 클릭시
		$('#btnLogin').on('click', function(e) {
			e.preventDefault();
			
			// 필수 값 체크
			var user_id = $('#user_id').val();
			var password = $('#password').val();
			
			if (user_id == ''){
				alert('아이디를 입력하세요.');
				$('#user_id').focus();
			} else if (password == ''){
				alert('패스워드를 입력하세요.');
				$('#password').focus();
			} else {
				$('#loginForm').attr('action', '${path}/login/');
	 			$('#loginForm').attr('method', 'post');
	 			
	 			$('#loginForm').submit();
			}
		});
		
		// 취소 클릭 시
		$('#btnCancel').on('click', function(e) {
			e.preventDefault();
			$(location).attr('href', '${path}/main/main');
		});
		
		// 회원가입 클릭 시
		$('#btnJoin').on('click', function(e) {
			e.preventDefault();
			$(location).attr('href', '${path}/member/join');
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
                        <h4 class="mb-50">로그인</h4>

                        <form id="loginForm">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="user_id" name="user_id" placeholder="*ID">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
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
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnLogin">로그인</button>
                                    <button class="btn bueno-btn mt-30" id="btnCancel">취소</button>
                                    <button class="btn bueno-btn mt-30" id="btnJoin">회원가입</button>
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