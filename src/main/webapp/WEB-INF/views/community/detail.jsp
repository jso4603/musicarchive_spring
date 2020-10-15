<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
<!-- 핸들바 라이브러리 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.js"></script>
<!-- 핸들바 탬플릿 작성 -->
<script id="replyTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<li>
			<div>
				번호 : {{reply_id}} <br>
				작성자 : {{writer}} <br>
				내용 : <span id='reply_id{{reply_id}}' > {{content}} </span> <br>
				등록일자 : {{insert_time}} <br>
				<button class ='btnReplyModify' value='{{reply_id}}'>수정</button>
				<button class ='btnReplySave' value='{{reply_id}}' hidden>저장</button>
				<button class ='btnReplyCancel' value='{{reply_id}}' hidden>취소</button>
				<button class ='btnReplyDelete' value='{{reply_id}}'>삭제</button>
			</div>
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
			$(location).attr('href', '${path}/community/modify?board_id='+ board_id);
 		} );
 		
 		// 삭제버튼을 눌렀을때
 		$('#btnDelete').on('click', function(e) {
 			e.preventDefault(); // 객체의 기본기능 소멸
 			var result = confirm('삭제하시겠습니까?');
 			if (result){
 	 			var board_id = $('#board_id').val();
 				$(location).attr('href', '${path}/community/delete?board_id=' + board_id);			
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
			var reply_id = $(this).val();
			var html = '<textarea id="reply_id'+ reply_id + '">'+ $('#reply_id'+reply_id).html() +'</textarea>'; // 수정할수 있게 변경
			$('#reply_id'+reply_id).replaceWith(html); // 기존의 html을 바꾼다
			// 버튼 컨트롤
			$('.btnReplySave[value=' + reply_id + ']').show(); // 저장버튼 보이기
			$('.btnReplyCancel[value=' + reply_id + ']').show(); // 취소버튼 보이기
			$('.btnReplyModify[value=' + reply_id + ']').hide(); // 수정버튼 감추기
			$('.btnReplyDelete[value=' + reply_id + ']').hide(); // 삭제버튼 감추기
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
			
		});		
		
	});
 </script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	
	<div>
	<h2>게시글 상세정보</h2>
		<table border = "1">
			<tr>
				<td>번호</td>
				<td><input id="board_id" type="text" name="board_id" size='5' value="${board.board_id}"></td>
				<td>조회수</td>
				<td>${board.read_cnt}
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="3">${board.writer}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${board.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><pre>${board.content}</pre></td>
			</tr>
			<tr>
				<td>파일</td>
				<td colspan="3">
					<c:forEach var="file" items="${file_list}">
						${file.file_name} 
						<button class="fileDownload" value="${file.file_name}">다운로드</button> <br>
					</c:forEach>
				</td>	
			</tr>
			<tr>
				<td>등록일자</td>
				<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.insert_time}"/> </td>
			</tr>
			<tr>
				<td>수정일자</td>
				<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.update_time}"/></td>
			</tr>
			
			<tr>
				<td colspan="4">
					<button id="btnModify">수정</button>
					<button id="btnDelete">삭제</button>
				</td>
				
			</tr>
		</table>
	</div>
	
	<!-- 댓글달기 -->
	<div>
		<h2>댓글</h2>
		<div>
			<label>작성자</label>
			<input type="text" id="replyWriter" value="${sessionScope.user_id}" readonly><br>
			 <div>
				<label>내용</label>
				<textarea id ="replyContent" rows="2" cols="20"></textarea>
			</div>
			<button id="btnReplyAdd">댓글추가</button>	
		</div>
		
		<!-- 댓글목록 -->
		<div id="replies">
		
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>