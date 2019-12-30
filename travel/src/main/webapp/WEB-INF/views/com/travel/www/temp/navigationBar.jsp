<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
					<li class="nav-item"><a class="nav-link"
						href="/hotelSearch.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">테스트</button>
					</a></li>
				</c:if>
				<c:if test="${!empty SID }">
					<li class="nav-item"><a class="nav-link"
						href="/member/logout.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">로그아웃</button>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/member/memberForm.kit">
							<button class="btn btn-outline-light my-2 my-sm-0">회원정보보기</button>
					</a></li>
				</c:if>
			</ul>
		</div>
	</nav>


</body>
</html>