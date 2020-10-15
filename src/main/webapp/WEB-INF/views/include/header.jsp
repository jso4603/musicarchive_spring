<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 버튼 이동 구현  -->
<script type="text/javascript">
	$(function() {
		
		$('#artist').on('click', function(){
			$(location).attr('href', '${path}/artist/discography')
		});
		
		$('#album').on('click', function(){
			$(location).attr('href', '${path}/album/main')
		});
		
		$('#community').on('click', function(){
			$(location).attr('href', '${path}/community/main')
		});
		
		$('#studio').on('click', function(){
			$(location).attr('href', '${path}/studio/location')
		});
		
		$('#home').on('click', function(){
			$(location).attr('href', '${path}/main/login')
		});
	});
</script>
<!-- 헤더 버튼 구현  -->
	
	<header>
		<button id="artist">Artist</button>
		<button id="album">Album</button>
		<button id="community">Community</button>
		<button id="studio">Studio</button>
		<button id="home">Home</button>
	</header>

<hr>