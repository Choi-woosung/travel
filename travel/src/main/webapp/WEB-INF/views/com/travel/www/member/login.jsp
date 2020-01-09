<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
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
		var passRule = /^(?=.*[0-9])(?=.*[a-z]).{8,20}$/;//숫자와 문자 포함 형태의 8~20자리  암호 정규식
		var blank_pattern = /[\s]/g; // 공백입력 불가
		
 		$('#userPw').keyup(function(){
 			if(!passRule.test($('#userPw').val())){
 				// 정규식 false div 출력
 				$('.pwex').css('display', 'block');
 			} else{
 				$('.pwex').css('display', 'none');
 			}
 		});
 		
		$('#find_btn').click(function(){
			$(location).attr('href', '/member/find_pw.kit');
		});
		
		$('#find_pw_btn').click(function(){
			$(location).attr('href', '/member/find_pw.kit');
		});
		
		$('#btn').click(function(){
			$(location).attr('href', '/member/loginProc.kit');
			
		});
		
		$('#logout').click(function(){
			$(location).attr('href', '/member/logoutProc.kit');
		});
		
		$('#btn').click(function(){
			$(location).attr('href', '/member/main.kit')
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
      
  	body{
	background-color: #f5f5f5;
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
  <img class="mb-4" src="/img/main/favicon2.ico" alt="" width="80" height="80" style="border-radius : 20px;">
  <h1 class="h3 mb-3 font-weight-normal">L O G I N </h1>
 
  <div class="w3-margin">
    <input type="text" id="userId" name="mId" class="form-control" placeholder="아이디" maxlength="10" > 
  </div>

  <div class="w3-margin">
    <input type="password" id="userPw" name="mPw" class="form-control" placeholder="비밀번호" maxlength="8" required> 
 	<span id="find_pw_btn"></span>
  </div>
  
  <div class="pwex" style="display: none; color: red;">
	<h6 class="">숫자와 문자 포함 형태의 8~20자리 이내의 비밀번호를 입력해주세요</h6>
  </div>
  
  <div class="checkbox mb-3 w3-center">
      <input type="checkbox" value="remember-me"> 기억하기
  </div>
  
    <button id="find_btn" class="w3-margin w3-center w3-button w3-hover-#f5f5f5">| 비밀번호찾기 |</button>
  
      
  <button class="btn btn-lg btn-primary btn-block" id="btn" type="submit">Sign in</button>
  
  </div>
  </form>
  </c:if>

	<c:if test="${not empty SID}">
		<div class="btn btn-lg btn-primary btn-block" id="logout">로그아웃</div>
	</c:if>





</body>
</html>	