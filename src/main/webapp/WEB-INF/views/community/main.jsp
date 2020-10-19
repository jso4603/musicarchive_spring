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
			
			// 조회 클릭
			$('#btnSearch').on('click', function(){
				var find_key = $('#find_key').val();
				var find_value = $('#find_value').val();
	
				$(location).attr('href',
						'${path}/community/main?find_key='+find_key+'&find_value='+find_value);
			});
			
			// 작성 클릭
			$('#btnAdd').on('click', function() {
				$(location).attr('href','${path}/community/add');
			});
			
			// 제목 클릭
			$('.aTitle').on('click', function(e) {
				e.preventDefault(); // 기본기능  소멸
				var board_id = $(this).attr('href');
	
				$(location).attr('href', '${path}/community/detail?board_id='+board_id);
			});
			
			// 페이지 클릭
			$('.page-link').on('click', function(e) {
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
	

    <h2 class="mb-50">Community</h2>
	
	<!-- ##### Search Area Start ##### -->
    <div class="bueno-search-area section-padding-100-0 pb-70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-12 col-sm-6 col-lg-3">
                            <div class="form-group mb-30">
                                <select class="form-control" id ="find_key">
                                  <option value="writer" <c:out value="${pageDTO.find_key=='writer'?'selected':''}" />>작성자</option>
                                  <option value="title" <c:out value="${pageDTO.find_key=='subject'?'selected':''}" />>제목</option>
                                  <option value="content" <c:out value="${pageDTO.find_key=='content'?'selected':''}" />>내용</option>
                                  <option value="sub_con" <c:out value="${pageDTO.find_key=='sub_con'?'selected':''}" />>제목+내용</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="col-12 col-sm-6 col-lg-3">
                            <div class="form-group mb-30">
                                <input type="text" class="bueno-btn w-100" id="find_value" value="${pageDTO.find_value}" 
                                	style="color: black; background-color: white;" placeholder="검색어를 입력해주세요.">
                            </div>
                        </div>
                       
                        <div class="col-12 col-sm-6 col-lg-3">
                            <div class="form-group mb-30">
                                <button class="btn bueno-btn w-100" id="btnSearch">조회</button>
                            </div>
                        </div>
                        
                        <div class="col-12 col-sm-6 col-lg-3">
                            <div class="form-group mb-30">
                                <button class="btn bueno-btn w-100" id="btnAdd">작성</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Search Area End ##### -->
	
	<!-- ##### Table Area Start ##### -->
	<div>
		<table class="table">
		    <thead style="color: white; background: #b0c364;">
		    	<tr>
					<th>순번</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>댓글수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.board_id}</td>
					<td><a class="aTitle" href="${board.board_id}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.read_cnt}</td>
					<td>${board.reply_cnt}</td>
				</tr>
				</c:forEach>
		    </tbody>
	    </table>
	</div>
	<!-- ##### Table Area End ##### -->
  
    <!-- ##### Pagination Area Start ##### -->
	<div class="container">
		<ul class="pagination">
		
			<!-- ##### Prev Area Start ##### -->
			<c:choose>
				<c:when test="${pageDTO.start_page!=1}">
					<li class="page-item"><a class="page-link" href="${pageDTO.start_page-1}">Prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="1">Prev</a></li>
				</c:otherwise>
			</c:choose>
			<!-- ##### Prev Area End ##### -->

			<!-- ##### cur_page Area Start ##### -->
			<c:forEach var="cur_page" begin="${pageDTO.start_page}" end="${pageDTO.end_page}">
				<c:choose>
					<c:when test="${pageDTO.cur_page==cur_page}">
						<li class="page-item active"><a class="page-link" href="${cur_page}">${cur_page}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${cur_page}">${cur_page}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- ##### cur_page Area End ##### -->
			
			<!-- ##### Next Area Start ##### -->
			<c:choose>
				<c:when test="${pageDTO.end_page < pageDTO.tot_page}">
					<li class="page-item"><a class="page-link" href="${pageDTO.end_page+1}">Next</a></li>
				</c:when>
				<c:when test="${pageDTO.end_page == 0}">
					<li class="page-item"><a class="page-link" href="1">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${pageDTO.end_page}">Next</a></li>
				</c:otherwise>
			</c:choose>
			<!-- ##### Next Area End ##### -->
			
		</ul>
	</div>
	<!-- ##### Pagination Area End ##### -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footBootStrap.jsp" %>
</body>
</html>