<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<title>Document</title>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/bootstrap.min.js">

<style>
.main {
	width: 80%;
	height: auto;
	background: white;
	padding: 20px;
	position: relative;
	left: 10%;
	top: 50px;

}
.text1 {
	width : 600px;
}
</style>
<script type="text/javascript">

	

		function checkPw() {
		var pw1 = $('#pw').val();
		var pw2 = $('#pw2').val();
	if(pw1 == pw2){
		$('.pwok').css('display', 'block');
		$('.pwx').css('display', 'none');
	} else {
		$('.pwok').css('display', 'none');
		$('.pwx').css('display', 'block');
	}
			
		};


	
		
	


</script>
</head>
<body>
<!-- 회원 정보 수정 모달 -->
	<div class="container" id="edit">
				<h2 class=".col-md-4 text-center">회원 정보 수정</h2>
		<div class="col-md-12 border main">
			<div class="ml-4">
				
				<div class="p-4 row">
					<pre>아   이   디 :</pre>
					<h5 class="ml-4" id="id">${DATA.mId }</h5>
				</div>
				<div class="p-4 row">
					<pre>회 원  이 름 :</pre>
					<h5 class="ml-4" id="name">${DATA.mName }</h5>
				</div>
				<div class="p-4 row">
					<pre>비 밀  번 호 :</pre>
					<h5 class="" id="name"></h5>
					<h5 class=""><input type="password" class="ml-4" id="pw" onkeyup="checkPw()" name="mPw"></h5>
				</div>
				<div class="p-4 row">
					<pre>비밀번호확인 :</pre>
					<h5 class="" id="name"></h5>
					<h5 class=""><input type="password" class="ml-4" id="pw2" onkeyup="checkPw()" name="mPw2"></h5>
				</div>
				<div class="pwx" >
					<h5 class="">비밀번호가 틀립니다.</h5>
				</div>
				<div class="pwok" style="display: none; color: red;">
					<h5 class="">비밀번호가 같습니다.</h5>
				</div>
				<div class="p-4 row">
					<pre>이   메  일 :</pre>
					<h5 class="ml-4" id="name">${DATA.mMail }</h5>
				</div>
				<div class="p-4 row">
					<pre>전 화 번 호 :</pre>
					<h5 class="ml-4" ><input type="text" class=" text1" id="tel" name="tel" value="${DATA.mMobile }"></h5>
				</div>
				<div class="p-4 row">
					<pre>주       소 :</pre>
					<h5 class="ml-4" ><input type="text" class=" text1" id="tel" name="tel" value="${DATA.mAddress }"></h5>
				</div>
				<div class="p-4 row">
					<pre>가   입   일 :</pre>
					<h5 class="ml-4" id="date">${DATA.mJdate }</h5>
				</div>
				<div class ="">
					<div class="btn btn-info" id="cancel">취소</div>
					<div class="btn btn-info" id="save">저장</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>