<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<!-- 회원 정보 수정 모달 -->
	<div class="container" id="edit">
				<h2 class=".col-md-4 text-center">회원 정보 수정</h2>
		<div class="col-md-12 border main">
			<div class="ml-4">
				
				<div class="p-4">
					<pre>아   이   디 :</pre>
					<h5 class="" id="id"></h5>
				</div>
				<div class="p-4">
					<pre>회 원  이 름 :</pre>
					<h5 class="" id="name"></h5>
				</div>
				<div class="p-4 ml-1 row">
					<pre>비 밀  번 호 :</pre>
					<h5 class="" id="name"></h5>
					<h5 class=""><input type="password" class="ml-4" id="mail" name="mail"></h5>
				</div>
				<div class="p-4 ml-1 row">
					<pre>비밀번호확인 :</pre>
					<h5 class="" id="name"></h5>
					<h5 class=""><input type="password" class="ml-4" id="mail" name="mail"></h5>
				</div>
				<div class="p-4 row ml-1">
					<pre>이   메  일 :</pre>
					<h5 class="" id="name"></h5>
				</div>
				<div class="p-4 row ml-1">
					<pre>전 화 번 호 :</pre>
					<h5 class="" ><input type="text" class="ml-4 text1" id="tel" name="tel"></h5>
				</div>
				<div class="p-4 row ml-1">
					<pre>주       소 :</pre>
					<h5 class="" ><input type="text" class="ml-4 text1" id="tel" name="tel"></h5>
				</div>
				<div class="p-4 ">
					<pre>가   입   일 :</pre>
					<h5 class="" id="date"></h5>
				</div>
				<div class ="">
					<div class="" id="cancel">취소</div>
					<div class="" id="save">저장</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>