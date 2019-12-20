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
					<h5 class="">회원번호 :</h5>
					<h5 class="" id="no"></h5>
				</div>
				<div class="p-4">
					<h5 class="">아 이 디   :</h5>
					<h5 class="" id="id"></h5>
				</div>
				<div class="p-4">
					<h5 class="">회원이름 :</h5>
					<h5 class="" id="name"></h5>
				</div>
				<div class="p-4 ml-1 row">
					<h5 class="">비밀번호 :</h5>
					<h5 class="" id="name"></h5>
					<h5 class=""><input type="password" class="ml-4" id="mail" name="mail"></h5>
				</div>
				<div class="p-4 row ml-1">
					<pre><h5 class="">이 메 일   :   </h5></pre>
					<h5 class=""><input type="text" class="ml-4" id="mail" name="mail"></h5>
				</div>
				<div class="p-4 row ml-1">
					<h5 class="">전화번호 :</h5> 
					<h5 class="" ><input type="text" class="ml-4 text1" id="tel" name="tel"></h5>
				</div>
				<div class="p-4 ">
					<h5 class="">가 입 일 :</h5>
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