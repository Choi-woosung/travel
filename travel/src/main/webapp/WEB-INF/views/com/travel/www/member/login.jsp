<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>

.form-label-group{
	padding-top : 30px;
}

.form-control{
	display: block;
	width: 50%;
	line-height: 1.5;
	align-items: center;
}	

	
</style>
<title>로그인</title>
<link rel="stylesheet" href="/css/w3.css" >
<link rel="stylesheet" href="/css/bootstrap.css" >
<link rel="stylesheet" href="/css/bootstrap.min.css" >
<link rel="stylesheet" href="/css/bootstrap-grid.css" >
<link rel="stylesheet" href="/css/bootstrap-grid.min.css" >
<link rel="stylesheet" href="/css/bootstrap-reboot.css" >
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
 	$(document).ready(function(){
		$('#find_btn').click(function(){
			$(location).attr('href', '/member/find.kit');
		});
		
		$('#btn').click(function(){
			$(location).attr('href', '/member/loginProc.kit');
			
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/member/logoutProc.kit');
		});
		

	}); 
</script>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      
      .form-signin{
      	width : 500px;
      	margin : 0 auto;
      }
      
  

	.text-center{
		margin-top:100px;
	}

</style>
</head>
 <body class="text-center">
 
 <c:if test="${empty SID}">
    <form method="POST" action="/member/loginProc.kit" class="form-signin justify-content-md-center">
 <div class="text-center mb-1">
  <h1 class="h3 mb-3 font-weight-normal">L O G I N </h1>
 
  <div class="w3-margin">
    <input type="text" id="userId" name="mId" class="form-control" placeholder="아이디" maxlength="10" > 
  </div>

  <div class="w3-margin">
    <input type="password" id="userPw" name="mPw" class="form-control" placeholder="비밀번호" maxlength="8" required> 
  </div>
  
  <div class="checkbox mb-3 w3-center">
      <input type="checkbox" value="remember-me"> 기억하기
  </div>
  
  <div id="find_btn" class="w3-margin w3-center"> 아이디 | 비밀번호찾기</div>
      
  <button class="btn btn-lg btn-primary btn-block" id="btn" type="submit">Sign in</button>
  
  </div>
</form>
</c:if>
	<c:if test="${not empty SID}">
		<div class="btn btn-lg btn-primary btn-block" id="logout">로그아웃</div>
	</c:if>

</body>
</html>