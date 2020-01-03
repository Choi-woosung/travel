<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/sap/resources/css/searchPw.css">
<link rel="stylesheet" href="/css/w3.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
			
	});
</script>
</head>
<body>
<div class="contact-clean">
		<form action="searchPw.do" method="get">
			<h2 class="text-center">비밀번호 찾기</h2>
			<p class="text-center">
				아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 새암호를 보내드립니다<br>
				<br>
			<div class="form-group has-success has-feedback">
				<input type="text" name="username" placeholder="username"
					class="form-control" /><i aria-hidden="true"
					class="form-control-feedback glyphicon glyphicon-ok"></i>
			</div>
			<div class="form-group has-error has-feedback">
				<input type="email" name="email" placeholder="email"
					class="form-control" /><i aria-hidden="true"
					class="form-control-feedback glyphicon glyphicon-remove"></i>
				<p class="help-block">'@'포함한 이메일주소를 정확히 입력해주세요.</p>
			</div>

			<div class="form-group">
				<button allign="center" class="btn btn-primary" type="submit">비밀번호찾기</button>
			</div>
		</form>
	</div>
</body>
</html>