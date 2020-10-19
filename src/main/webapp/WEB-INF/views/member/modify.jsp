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
			
			// 회원정보수정 클릭시
			$('#btnUpdate').on('click', function(e) {
				e.preventDefault();
				
				pop = window.open('${path}/member/checkPW','pop','width=700,height=600,left=1000');
			});
			
			// PW변경 클릭시
			$('#btnChangePW').on('click', function(e) {
				e.preventDefault();
				
				var user_id = $('#user_id').val();
				
				$(location).attr('href', '${path}/member/changePW?user_id='+user_id);
			});
			
			// 회원탈퇴 클릭시
			$('#btnDelete').on('click', function(e) {
				e.preventDefault();
				
				var user_id = $('#user_id').val();
				var result = confirm('탈퇴하시겠습니까?');
				
				if(result){
					$(location).attr('href', '${path}/member/delete?user_id='+user_id);
				}
			});
			
			// 취소 클릭시
			$('#btnCancel').on('click', function(e) {
				e.preventDefault();
				
				$(location).attr('href', '${path}/main/main');
			});
		});
		
		//팝업창에 pw 전달
		function getValue(){
			pop.checkPWForm.password.value = $('#password').val();
		}
		
		// 수정 실행
		function update() {
			$('#modifyForm').attr('action', '${path}/member/modify');
			$('#modifyForm').attr('method', 'post');
			
			$('#modifyForm').submit();
		}
	</script>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<!-- ##### Form Area Start ##### -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-9">
                <div class="contact-content mb-100">
                    
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">마이페이지</h4>

                        <form id="modifyForm">
                            <div class="row">
                            
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="user_id" name="user_id" value="${memberDTO.user_id}" readonly>
                                        <input type="hidden" id="password" name="password" value="${memberDTO.password}">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        *<input type="text" class="form-control" id="zip_code" name="zip_code" value="${memberDTO.zip_code}" placeholder="우편번호">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                
                                <div class="col-lg-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    *<input type="text" class="form-control" id="address" name="address" value="${memberDTO.address}" placeholder="주소">
                                </div>
                                
                                <div class="col-12">
                                    *<input type="text" class="form-control" id="address_detail" name="address_detail" value="${memberDTO.address_detail}" placeholder="상세주소">
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnUpdate">정보수정</button>
                                    <button class="btn bueno-btn mt-30" id="btnChangePW">PW변경</button>
                                    <button class="btn bueno-btn mt-30" id="btnDelete">회원탈퇴</button>
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