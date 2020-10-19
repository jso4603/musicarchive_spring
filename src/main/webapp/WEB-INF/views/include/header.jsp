<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-content">
            <h2>MusicArchive In Progress..</h2>
            <div id="area"></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Logo Area -->
        <div class="logo-area">
            <a href="${path}/main/main"><img src="${path}/resources/img/core-img/logo.png" alt="로고이미지"></a>
        </div>

        <!-- Navbar Area -->
        <div class="bueno-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="buenoNav">
                    
                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="${path}/artist/discography">Artist</a></li>
                                    <li><a href="${path}/album/main">Album</a></li>
                                    <li><a href="${path}/community/main">Community</a></li>
                                    <li><a href="${path}/studio/location">Studio</a></li>
                                    <li><a href="${path}/main/main">Home</a></li>
                                </ul>

								<%
                                	String user_id = (String)session.getAttribute("user_id");
                                	if(user_id == null){
                                %> 
                                <!-- Login/Register -->
                                <div class="login-area">
                                    <a href="${path}/login/">Login</a>
                                    &emsp;<a href="${path}/member/join">Register</a>
                                </div>
                                
                                <%
                                	} else {
                                %>   
                                <script type="text/javascript">
									$(function() {
										// 로그아웃을 클릭했을때
										$('#Logout').bind('click', function(e) {
											e.preventDefault();
											
											var result = confirm('로그아웃 하시겠습니까?');
											
											if(result){
												$(location).attr('href', '${path}/login/logout');
											}
										});
									});
								</script>  
                                
                                <!-- MyPage/Logout -->
                                <div class="login-area">
                                    <a href="${path}/member/modify?user_id=${sessionScope.user_id}">MyPage</a>
                                    &emsp;<a id="Logout">Logout</a>
                                </div>
                                
                                <%
                                	}
                                %>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->