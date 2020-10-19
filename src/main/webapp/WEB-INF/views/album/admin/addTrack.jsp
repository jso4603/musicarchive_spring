<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/includeFile.jsp" %>
<%@ include file="../../include/adminCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../include/headBootStrap.jsp" %>
</head>

	<script type="text/javascript">
	
		$(function() {
			
			// 트랙추가 개수 처음에 1로 초기화
			var num = 1;
			
			// 트랙 전체저장 클릭했을때
			$('#btnAddTrackList').on('click', function(e) {
				e.preventDefault(); // 객체의 기본기능 소멸
			
				for (var i = 0; i < num; i++) {
					// 입력값 체크
					var track_title = $('#track_title_'+i).val();
					var lyric = $('#lyric_'+i).val();
					var track_file = $('#track_file_'+i).val();
	
		 			if(track_title ==''){
		 				alert('트랙 제목을 입력해주세요');
		 				$('#track_title_'+i).focus();
		 				break;
		 			} else if(lyric ==''){
		 				alert('가사를 입력해주세요');
		 				$('#lyric_'+i).focus();
		 				break;
		 			} else if(track_file ==''){
		 				alert('음원을 입력해주세요');
		 				$('#track_file_'+i).focus();
		 				break;
		 			} else {
		 				// 마지막 트랙리스트까지 확인하지 않았다면 continue
		 				if(i < num-1){
		 					continue;
		 				} else {	
			 				$('#addTrackForm').attr('action', '${path}/track/addTrack');
			 	 			$('#addTrackForm').attr('method', 'post');
			 	 			$('#addTrackForm').attr('enctype', 'multipart/form-data');
			 	 			
			 	 			$('#addTrackForm').submit();
						}
		 			}
				}
			});
			
			// 전체저장 취소 클릭했을때
			$('#btnCancelTrackList').on('click', function(e) {
				e.preventDefault();
				$(location).attr('href', '${path}/album/admin/main');
			});
			
			// 트랙 추가 클릭했을때
			$('#btnAddTrack').on('click', function(e) {
				e.preventDefault();
				var albumID = $('#albumID').val();
								
				var appendHtml = '<div id="trackInfo'+ num +'">' +
								'<h5 class="mb-50">트랙추가</h5>' + 
									'<div class="row">' +
	                    				'<div class="col-lg-6">' +
	                						'<div class="form-group">'	+
	                	   						'<input type="hidden" id="albumID" name="trackList['+num+'].album_id" value="'+albumID+'">' +
	                    						'<input type="number" class="form-control" name="trackList['+num+'].track_id" value="'+(num+1)+'" readonly>' +
	                				 		'</div>' +
	            						'</div>' +
	            					 	'<div class="col-lg-6">' +
	                						'<div class="form-group">' +
	                    						'<input type="text" class="form-control" id="track_title_'+num+'" name="trackList['+num+'].track_title" placeholder="*트랙 제목">' +
	                						'</div>' +
	            						'</div>' +
	            						'<div class="col-12">' +
	                						'<div class="form-group">' +
	                    						'<textarea class="form-control" id="lyric_'+num+'" name="trackList['+num+'].lyric"' +
	                    							'rows="5" cols="50" placeholder="*가사">${trackDTO.lyric}</textarea>' +
	                						'</div>' +
	            						'</div>' +
	            						'<div class="col-12">' +
	                						'<input class="form-control" id="track_file_'+num+'" name="trackFiles" type="file">' +
	            						'</div>' +
	       							'</div>' +
	       						'</div>';
									
				$('#trackGroup').append(appendHtml);
				num++;
			});
			
			// 트랙 추가 취소 클릭했을때
			$('#btnCancelTrack').on('click', function(e) {
				e.preventDefault();

				if(num > 1) {
					num--;
					$("#trackInfo"+num).remove();
				} else {
					return;
				}
			});
			
		});
		
	</script>
	
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<form id="addTrackForm">
		<!-- ##### Track AddSection Area Start ##### -->
	    <section class="post-news-area section-padding-100-0 mb-70">
	        <div class="container">
	            <div class="row justify-content-center">
	            
	                <!-- Post Details Content Area -->
	                <div class="col-12 col-lg-8 col-xl-9">
	                
	                    <div class="post-details-content mb-100">
	                        <div class="blog-content">
	                        
	                        	<!-- 앨범정보 -->
	                        	<input id="albumID" type="hidden" value="${albumDTO.album_id}">
	                            <a href="#" class="post-tag">앨범명</a>
	                            <h4 class="post-title">${albumDTO.album_title}</h4>
	                            
	                        </div>
	                    </div>
	                    
	                    <div class="col-12">
                           <div class="form-group">
			    				<button id="btnAddTrack" class="btn bueno-btn mt-30">트랙추가</button>
			    				<button id="btnCancelTrack" class="btn bueno-btn mt-30">취소</button>
                           </div>
                       </div>
	
	                </div>
	                
	            </div>
	        </div>
	    </section>
	    <!-- ##### Track AddSection Area End ##### -->
	    <hr>
		
		<!-- ##### TrackInfoContainer Area Start ##### -->
	    <div class="container">
           <div class="row justify-content-center">
               <div class="col-12 col-lg-8 col-xl-9">
                   <div class="contact-content mb-100"> 
                       <div class="contact-form-area mb-70">
                           <h4 class="mb-50">트랙정보</h4>
                           
                           	  <!-- ##### TrackGroup Area Start ##### -->
						   	  <div id="trackGroup">
							   	  <div id="trackInfo0">
							   	  <h5 class="mb-50">트랙추가</h5>
		                              <div class="row">
		                                  <div class="col-lg-6">
		                                      <div class="form-group">
		                                      	   <input type="hidden" id="albumID" name="trackList[0].album_id" value="${albumDTO.album_id}">
		                                          <input type="number" class="form-control" name="trackList[0].track_id" value="1" readonly>
		                                      </div>
		                                  </div>
		                                  <div class="col-lg-6">
		                                      <div class="form-group">
		                                          <input type="text" class="form-control" id="track_title_0" name="trackList[0].track_title" placeholder="*트랙 제목">
		                                      </div>
		                                  </div>
		                                  <div class="col-12">
		                                      <div class="form-group">
		                                          <textarea class="form-control" id="lyric_0" name="trackList[0].lyric" 
		                                          		rows="5" cols="50" placeholder="*가사">${trackDTO.lyric}</textarea>
		                                      </div>
		                                  </div>
		                                  <div class="col-12">
		                                      <input class="form-control" id="track_file_0" name="trackFiles" type="file">
		                                  </div>
		                              </div>
							   	  </div>
                              </div>
                              <!-- ##### TrackGroup Area End ##### -->
                             
                       </div>
                   </div>
               </div>
           </div>
	    </div>
	    <!-- ##### TrackInfoContainer Area End ##### -->
	    <hr>
	    
	    
	    <!-- ##### TrackSave Area Start ##### -->
        <div class="col-12">
	    	<div class="form-group">
				<button id="btnAddTrackList" class="btn bueno-btn mt-30">트랙 전체저장</button>
				<button id="btnCancelTrackList" class="btn bueno-btn mt-30">취소</button>
	       </div>
        </div>
   		<!-- ##### TrackSave Area End ##### -->
	</form>
	
	<%@ include file="../../include/footer.jsp" %>
	<%@ include file="../../include/footBootStrap.jsp" %>
</body>
</html>