<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/w3.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#find_btn').click(function(){
			$(location).attr('href', '/member/find.kit');
		});
		
		$('#btn').click(function(){
			$(location).attr('href', '/www/member/loginProc.kit');
			
		});
	});
</script>
</head>
<body>


<c:if test="${empty SID}">
<<<<<<< HEAD
<form method="POST" action="/loginProc.kit">
=======
<form method="POST" action="/member/loginProc.kit">
>>>>>>> branch 'working' of https://github.com/Choi-woosung/travel.git
	<div class="w3-col m12 w3-center w3-margin-top">
		<h1 class="w3-col w3-center" >L O G I N</h1>
	</div>
		
	<div class="w3-col m12 w3-center">
	
<<<<<<< HEAD
	<div><input type="text" id="id" placeholder="아이디" maxlength="10"></div>
	<div><input type="password" id="pw" placeholder="비밀번호" maxlength="8"></div>
	
=======
	<div><input type="text" name="mId" id="id" placeholder="아이디를 입력하세요" maxlength="10"></div>
	<div><input type="password" name="mPw" id="pw" placeholder="비밀번호를 입력하세요" maxlength="8"></div>

>>>>>>> branch 'working' of https://github.com/Choi-woosung/travel.git
	<div class="w3-padding">
		<input class="w3-margin" type="submit" id="btn" value="확인">
		<input class="w3-margin" type="button" id="home" value="취소">
	</div>
	
		
	<div class="w3-padding">
		<div id="find_btn" class="w3-margin">아이디 | 비밀번호찾기</div>
	</div>
	</div>
</form>
</c:if>

	<c:if test="${not empty SID}">
		<div class="w3-col m6 w3-center" id="d1">
			<h3>${SID} 님은 이미 로그인 하셨습니다.</h3>
			<h6>메인 페이지로 이동합니다.</h6>
		</div>
	</c:if>
	




<<<<<<< HEAD

=======
>>>>>>> branch 'working' of https://github.com/Choi-woosung/travel.git
</body>
</html>