<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../include/headBootStrap.jsp" %>
</head>
<!-- 핸들바 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.js"></script>
	<!-- 핸들바 탬플릿 작성 -->

	<script id="replyTemplate" type="text/x-handlebars-template">
		{{#each .}}
			<li class="single_comment_area">
        		<div class="comment-content d-flex">
            		<div class="comment-meta">
                		<div class="d-flex">
                    		<a href="#" class="post-author"><span id="reply_writer">{{writer}}</span></a>
                        	<a href="#" class="post-date">{{insert_time}}</a>
                    	</div>
                    	<p><span id='reply_id{{reply_id}}' > {{content}} </span></p>
            		</div>
        		</div>
				<button class ='btn btn-secondary btnReplyModify' value='{{reply_id}}'>수정</button>
				<button class ='btn btn-secondary btnReplySave' value='{{reply_id}}' style='display:none;'>저장</button>
				<button class ='btn btn-secondary btnReplyCancel' value='{{reply_id}}' style='display:none;'>취소</button>
				<button class ='btn btn-secondary btnReplyDelete' value='{{reply_id}}'>삭제</button>
        	</li>
		{{/each}}
	</script>

	<script type="text/javascript">
	
	 	$(function() {
	 		
	 		replyList();
	 		
	 		// 수정버튼을 클릭했을때 수정폼으로 이동
	 		$('#btnModify').on('click', function(e){
	 			e.preventDefault(); // 객체의 기본기능 소멸
	 			var board_id = $('#board_id').val();
	 			
	 			var user_id = $('#user_id').val();
	 			var writer = $('#writer').text();
	 			
	 			if(user_id == writer || user_id == '관리자'){
	 				$(location).attr('href', '${path}/community/modify?board_id='+ board_id);
	 			} else {	
	 				alert("권한이 없습니다.");
				}
	 			
	 		} );
	 		
	 		// 삭제버튼을 눌렀을때
	 		$('#btnDelete').on('click', function(e) {
	 			e.preventDefault(); // 객체의 기본기능 소멸
	 			
	 			var user_id = $('#user_id').val();
	 			var writer = $('#writer').text();
	 			
	 			var result = confirm('삭제하시겠습니까?');
	 			if (result){
	 				if(user_id == writer || user_id == '관리자'){
	 					var board_id = $('#board_id').val();
		 				$(location).attr('href', '${path}/community/delete?board_id=' + board_id);
		 			} else {	
		 				alert("권한이 없습니다.");
					}			
	 			}
	 			
			});
			
			// 다운로드 버튼을 클릭했을때
			$('.fileDownload').on('click', function(e) {
	 			e.preventDefault(); // 객체의 기본기능 소멸
				var file_name = $(this).val();
				$(location).attr('href', '${path}/file/download?file_name=' +file_name);
				
			});
			
			// 댓글추가저장버튼
			$('#btnReplyAdd').on('click',function(){
				var board_id = $('#board_id').val(); // 게시물번호
				var replyWriter = $('#replyWriter').val(); // 댓글 작성자
				var replyContent = $('#replyContent').val(); // 댓글 내용
				// 공백 체크
				if (replyWriter == ''){
					alert('작성자를 입력해 주세요');
					$('#replyWriter').focus();
					return  // 함수 실행 즉각 종료
				}else if (replyContent == ''){
					alert('내용을 입력해 주세요');
					$('#replyContent').focus();
					return
				}
				
				$.ajax({
					type:'post',
					contentType:'application/json',
					url : '${path}/reply/',
					data : JSON.stringify({board_id:board_id,writer:replyWriter,content:replyContent}), //json문자열 표기법으로 변환
					dataType : 'text',  // 결과값의 타입
					success : function(result){
						alert(result);
						replyList();
						// 추가데이터 클리어
						$('#replyContent').val('');
						
					},
					error:function(result){
						alert("error");
						console.log(result);
					}
				});
			});
			
			// 댓글 조회
			$('#btnReplyList').on('click', function() {
				replyList();
			});
			
			function replyList(){
				var board_id = $('#board_id').val(); // 게시물번호
				$.ajax({
					type:"get",
					url:'${path}/reply/' + board_id, // restful하게 설계
					dataType : 'json', // 결과값의 형태
					success:function(result){
						console.log(result);
						replyDisplay(result);
					},
					error:function(result){
						alert('error');
					}
				});
				
				
			}
			// 댓글리스트 만들고 출력
			function replyDisplay(data) {
				// 핸들바 탬플릿을 이용한 리스트 만들기 
				var source = $('#replyTemplate').html();
				var template = Handlebars.compile(source);
				$('#replies').html(template(data));
			}
			
			// 댓글 수정
			$('#replies').on('click', '.btnReplyModify',function(){
	 			
	 			var user_id = $('#user_id').val();
	 			var writer = $('#reply_writer').text();
				var reply_id = $(this).val();
				var html = '<textarea id="reply_id'+ reply_id + '">'+ $('#reply_id'+reply_id).html() +'</textarea>'; // 수정할수 있게 변경

	 			if(user_id == writer || user_id == '관리자'){
	 				$('#reply_id'+reply_id).replaceWith(html); // 기존의 html을 바꾼다
					// 버튼 컨트롤
					$('.btnReplySave[value=' + reply_id + ']').show(); // 저장버튼 보이기
					$('.btnReplyCancel[value=' + reply_id + ']').show(); // 취소버튼 보이기
					$('.btnReplyModify[value=' + reply_id + ']').hide(); // 수정버튼 감추기
					$('.btnReplyDelete[value=' + reply_id + ']').hide(); // 삭제버튼 감추기
	 			} else {	
	 				alert("권한이 없습니다.");
	 			}
	
			});
			
			// 댓글 취소
			$('#replies').on('click', '.btnReplyCancel',function(){
				var reply_id = $(this).val();
				// 원래상태대로 변경
				var html = '<span id="reply_id'+ reply_id + '">'+ $('#reply_id'+reply_id).html() +'</span>'; 
				
				$('#reply_id'+reply_id).replaceWith(html); // 기존의 html을 바꾼다
				// 버튼 컨트롤
				$('.btnReplySave[value=' + reply_id + ']').hide(); // 저장버튼 감추기
				$('.btnReplyCancel[value=' + reply_id + ']').hide(); // 취소버튼 감추기
				$('.btnReplyModify[value=' + reply_id + ']').show(); // 수정버튼 보이기
				$('.btnReplyDelete[value=' + reply_id + ']').show(); // 삭제버튼 보이기
				
			});
			
			// 댓글수정저장버튼
			$('#replies').on('click', '.btnReplySave',function(){
				var reply_id = $(this).val(); // 댓글번호
				var replyContent = $('#reply_id'+reply_id).val(); // 댓글 내용
				
				$.ajax({
					type:'put', // 수정
					contentType:'application/json', // json형태로 데이터 서버에 보냄
					url : '${path}/reply/'+reply_id, 
					data : JSON.stringify({content:replyContent}), // json문자열 표기법으로 변환
					dataType : 'text',  // 결과값의 타입
					success : function(result){
						alert(result);
						afterSave(reply_id);
					},
					error:function(result){
						alert("error");
						console.log(result);
					}
				});
			});
	
			// 수정저장후 버튼 상태 변경
			function afterSave(reply_id){
				var html = '<span id="reply_id'+ reply_id + '">'+ $('#reply_id'+reply_id).val() +'</span>';
				$('#reply_id'+reply_id).replaceWith(html); // 기존의 html을 바꾼다
				// 버튼 컨트롤
				$('.btnReplySave[value=' + reply_id + ']').hide(); // 저장버튼 감추기
				$('.btnReplyCancel[value=' + reply_id + ']').hide(); // 취소버튼 감추기
				$('.btnReplyModify[value=' + reply_id + ']').show(); // 수정버튼 보이기
				$('.btnReplyDelete[value=' + reply_id + ']').show(); // 삭제버튼 보이기
			}
			
			// 댓글 삭제
			$('#replies').on('click', '.btnReplyDelete',function(){
				var reply_id = $(this).val(); // 댓글번호
				var board_id = $('#board_id').val(); // 게시물번호
				
	 			
	 			var user_id = $('#user_id').val();
	 			var writer = $('#reply_writer').text();
	 			
	 			var result = confirm('삭제하시겠습니까?');
	 			if (result){
	 				if(user_id == writer || user_id == '관리자'){
		 				$.ajax({
							type:"delete",
							url:'${path}/reply/' + reply_id +"?board_id=" + board_id, // restfull하게 설계
							dataType : 'text', // 결과값의 형태
							// data : "board_id=" + board_id, //바디
							success:function(result){
								alert(result);
								replyList();
							},
							error:function(result){
								alert('error');
							}
						});
		 			} else {	
		 				alert("권한이 없습니다.");
					}			
	 			}
	 			 d
			});		
			
		});
	 	
	 </script>
<body>
	<%@ include file="../include/header.jsp" %>
	
    <!-- Single Big Post Area -->
    <div class="col-12">
    	<div class="big-post-content text-center mb-50">
        
        	<input id="board_id" type="hidden" name="board_id" value="${board.board_id}">
        	<a href="#" class="post-tag">No. ${board.board_id}</a>
        	
            <a href="#" class="post-title">${board.title}</a>
            
            <div class="post-meta">
                <a href="#" class="post-author">조회수 : ${board.read_cnt}</a>
                <input type="hidden" id="user_id" value="${sessionScope.user_id}">
                <a href="#" class="post-author">작성자 : <span id="writer">${board.writer}</span></a>
            </div>
            
            <hr>
            	<pre>${board.content}</pre>
			<hr>
			
			<div id="fileGroup" class="col-12">
				<div class="form-group">
					<c:forEach var="file" items="${file_list}">
						${file.file_name} 
						<button class="btn fileDownload" value="${file.file_name}">다운로드</button> <br>
					</c:forEach>	
				</div>		
			</div>
			
			<div>
           		<c:if test="${board.insert_time != null}">
     				등록일자 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.insert_time}"/> <br>
     			</c:if>
     		
	     		<c:if test="${board.update_time != null}">
	     			수정일자 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.update_time}"/> <br>
	     		</c:if>
     		
			</div>

			<div class="col-12">
	            <button class="btn bueno-btn mt-30" id="btnModify">수정</button>
	            <button class="btn bueno-btn mt-30" id="btnDelete">삭제</button>
            </div>

        </div>
    </div>
                
    <!-- Comment Area Start -->
    <div class="comment_area clearfix mb-100">
        <h4 class="mb-50">Comments</h4>

        <ol id="replies">
            
        </ol>
    </div>

    <div class="post-a-comment-area mb-30 clearfix">
        <h4 class="mb-50">Leave a reply</h4>

        <!-- Reply Form -->
        <div class="contact-form-area">
             <div class="row">
                 <div class="col-12 col-lg-6">
                     <input type="text" class="form-control" id="replyWriter" value="${sessionScope.user_id}" readonly>
                 </div>
                 <div class="col-12">
                     <textarea class="form-control" id ="replyContent" cols="30" rows="10" placeholder="댓글을 남겨주세요."></textarea>
                 </div>
                 <div class="col-12">
                     <button class="btn bueno-btn mt-30" id="btnReplyAdd">작성</button>
                 </div>
             </div>
        </div>
    </div>


    <!-- ##### Big Posts Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>