<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<%@ include file="../include/message.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장상옥MUSICARCHIVE</title>
</head>
<script type="text/javascript">
	// document가 로딩 완료된후 함수 실행
	$(function() {
		// 조회버튼 클릭
		$('#btnSearch').on('click', function(){
			var find_key = $('#find_key').val();
			var find_value = $('#find_value').val();

			$(location).attr('href',
					'${path}/community/main?find_key='+find_key+'&find_value='+find_value);
		});
		// 작성 버튼 클릭
		$('#btnAdd').on('click', function() {
			$(location).attr('href','${path}/community/add');
		});
		// 제목을 클릭
		$('.aTitle').on('click', function(e) {
			e.preventDefault(); // 기본기능  소멸
			var board_id = $(this).attr('href');

			$(location).attr('href', '${path}/community/detail?board_id='+board_id);
		});
		
		// 페이지를 클릭
		$('.aPage').on('click', function(e) {
			e.preventDefault(); // 기본기능  소멸
			var cur_page = $(this).attr('href');
			var find_key = $('#find_key').val();
			var find_value = $('#find_value').val();
			
			$(location).attr('href','${path}/community/main?cur_page='+cur_page+'&find_key='+find_key+'&find_value='+find_value);
		});
	});
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<h2>자유게시판</h2>
	<div>
		<select id ="find_key">
			<option value="writer" <c:out value="${pageDTO.find_key=='writer'?'selected':''}" />>작성자</option>
			<option value="title" <c:out value="${pageDTO.find_key=='subject'?'selected':''}" />>제목</option>
			<option value="content" <c:out value="${pageDTO.find_key=='content'?'selected':''}" />>내용</option>
			<option value="sub_con" <c:out value="${pageDTO.find_key=='sub_con'?'selected':''}" />>제목+내용</option>
		</select>
		<input type="text" id="find_value" value="${pageDTO.find_value}">
		<input id="btnSearch" type="button" value="조회">
		<input id="btnAdd" type="button" value="작성">
	</div>
	
	<!-- 리스트 출력 -->
	<div>
		<table border="1">
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>댓글수</th>
			</tr>
		
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.board_id}</td>
					<td><a class="aTitle" href="${board.board_id}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.read_cnt}</td>
					<td>${board.reply_cnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이징 처리 -->
	<div>
		<c:if test="${pageDTO.start_page!=1}">
			<a class ="aPage" href="${pageDTO.start_page-1}">이전</a>
		</c:if> 
		<c:forEach var="cur_page" begin="${pageDTO.start_page}" end="${pageDTO.end_page}">
			<a class ="aPage" href="${cur_page}"> ${cur_page}</a>
		</c:forEach>
		<c:if test="${pageDTO.end_page < pageDTO.tot_page}">
			<a class ="aPage" href="${pageDTO.end_page+1}">다음</a>
		</c:if>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>