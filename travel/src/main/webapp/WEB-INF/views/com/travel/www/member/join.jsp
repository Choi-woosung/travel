<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/www/css/w3.css" >
<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$('#Idbtn').click(function(){
			var sid = $('#userId').val();
			
			$.ajax({
				url  : "/idCheck.kit",
				type : "post",
				dataType : "text",
				data : {
					"id" : sid
				},
			
			},
			success : function(){
				var ok = data;
				
				if(ok == 1){
					// 이미 회원가입 된거
					$('#userId').val("");
					$('#Idbtn').attr('class', '');
					$('#Idbtn').toggleClass('w3-text-red');
					$('#Idbtn').html("이미 가입된 아이디입니다.");					
				
				} else {
					// 회원가입 가능
					$('#Idbtn').attr('class', '');
					$('#Idbtn').toggleClass('w3-text-green');
					$('#Idbtn').html("사용 가능한 아이디입니다.");
				}
			},
			error : function(){
				alert("Error");
			}			
		});
	});
	
</script>
</head>
<body>
<div class="w3-center">

 <h3 class="panel-title">Please Sign In</h3>
				
<form method="POST" action="/member/main.kit" ><!-- enctype = 파일 업로드 -->
	

	<div class="form-group w3-margin">
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="mId" placeholder="아이디" maxlength="8">
		<input type="button" id="Idbtn" value="중복확인" class=" " style="width: 120px; height: 30px; padding: 0px;">
	</div>
	
	<div class="form-group w3-margin">
		<label for="userPw">패스워드</label>
		<input type="password" id="userPw" name="mPw" placeholder="패스워드" maxlength="10">
	</div>
	
	<div class="form-group w3-margin">
		<label for="userName">이름</label>
		<input type="text" id="userName" name="mName" placeholder="이름" maxlength="5">
	</div>
	
	<div class="form-group w3-margin">
		<label for="email">이메일</label>
		<input type="email" id="email" name="mMail" placeholder="이메일" maxlength="25">
	</div>
	

	<div class="w3-margin">
		<button type="submit" class="btn-ok">확인</button>
		<button type="submit" class="btn-cc">취소</button>
	</div>
	
</form>
</div>	



</body>
</html>