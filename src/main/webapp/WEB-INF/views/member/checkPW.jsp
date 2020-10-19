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
	
		// 비밀번호 일치 시 opener의 update함수 실행 후 창 닫기
		if ('${msg}' == "비밀번호 일치"){
			alert('${msg}');
			opener.update();
			close();
			
		} else if ('${msg}' == "비밀번호 불일치"){
			alert('${msg}');
		}
		
		$(function() {
			// 확인 클릭시
			$('#btnCheck').on('click', function(e) {
				e.preventDefault();
				
				var insertPW = $('#insertPW').val();
				
				if (insertPW == ''){
					alert('비밀번호를 입력하세요.');
					$('#insertPW').focus();
				} else {
					$('#checkPWForm').attr('action', '${path}/member/checkPW');
					$('#checkPWForm').attr('method', 'post');
					
					$('#checkPWForm').submit();
				}
				
			});
			
			// 취소 클릭시
			$('#btnCancel').on('click', function(e) {
				e.preventDefault();
				
				close();
			});
			
		});
		
	</script>
<body>

	<!-- ##### Form Area Start ##### -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-9">
                <div class="contact-content mb-100">
                    <div class="contact-form-area mb-70">
                        <h4 class="mb-50">비밀번호 확인</h4>

                        <form id="checkPWForm">
                            <div class="row">
                            
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <input type="hidden" name="password">
                                        <input type="password" class="form-control" id="insertPW" name="insertPW" placeholder="비밀번호를 입력하세요.">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <button class="btn bueno-btn mt-30" id="btnCheck">확인</button>
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
	
	<script type="text/javascript">
	
		<!-- 부모에서 값 가져오기 -->
		opener.getValue();
		
	</script>

	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>