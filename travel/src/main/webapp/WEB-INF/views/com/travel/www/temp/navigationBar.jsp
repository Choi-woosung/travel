<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
	<title>ConsulTravel</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<style>
<%--내비게이션 바 관련 css --%>
.barcolor {
	background: #222222;
}
.nav-link {
	font-size: 20px;
}
.use{
	user-select: none;
}
.back {
	background : #2cb5e9;
}
</style>
<style type="text/css">
	* {
		box-sizing: border-box;
		list-style: none;
		padding: 0;
		margin: 0;
	}
	.profile_box {
		width: 200px;
		height: 50px;
		user-select: none;
	}
	.profile_hide {
		display: none;
	}
	.profile_show {
		display: block;
		text-align: center;
		margin-left: -1px;
	}
	.profile_show li a {
		display: block;
		border-top: none;
		padding-left: 8px;
		padding-right: 8px;
		padding-top: 4px;
		padding-bottom: 4px;
		width: 200px;
		background-color: #2CB5E9;
		text-decoration: none;
		color: white;
	}
	.profile_show li a:hover {
		cursor: pointer;
		color: #2CB5E9;
		background-color: menu;
	}
	.profile_img {
		display: block;
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
<%-- 공통 내비게이션 바 부분 --%>


	<nav class="navbar navbar-expand-lg navbar-dark back">
		<a class="navbar-brand use" href="/main.kit">
			<img src="/img/main/logo2.png">		
		</a>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarCollapse">
			<ul class="navbar-nav">
				<c:if test="${empty SID }">
					<li class="nav-item"><a class="nav-link"
						href="/member/login.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">로그인</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/member/join.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">회원가입</button>
					</a></li>
					<%-- <li class="nav-item"><a class="nav-link"
						href="/hotelSearch.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">테스트</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/crawler.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">크롤러</button>
					</a></li>--%>
				</c:if>
				<c:if test="${!empty SID }">
					<li class="profile_box">
						<img class="profile_img" id="profile_btn">
						<ul class="profile_hide" id="profile_menu">
							<li><a href="/member/memberForm.kit">회원정보보기</a></li>
							<li><a href="/member/logout.kit">로그아웃</a></li>
						</ul>
					</li>
					<script type="text/javascript">
						document.addEventListener('DOMContentLoaded', () => {
							let profile_btn = document.getElementById('profile_btn'); 
							let profile_menu = document.getElementById('profile_menu');
						
							fetch('/board/getprofile.kit').then(response => response.text())
							.then(text => profile_btn.src = '/img/profile/' + text);
							
							document.addEventListener('click', e => {
								if (e.target != profile_btn) {
									if (profile_menu.className == 'profile_show') {
										profile_menu.className = 'profile_hide';
									}
								}
							});
							profile_btn.addEventListener('click', () => {
								if (profile_menu.className == 'profile_hide') {
									profile_menu.className = 'profile_show';
								} else {
									profile_menu.className = 'profile_hide';
								}
							});
						});
					</script>
				</c:if>
			</ul>
		</div>
	</nav>
</body>
</html>
