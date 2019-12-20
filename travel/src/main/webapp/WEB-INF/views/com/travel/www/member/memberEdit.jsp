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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<body>
<!-- 회원 정보 수정 모달 -->
	<div class="container-fluid" id="edit">
		<div class="container-md mt-3 border">
			<div class="">
				
				<h2 class=".col-md-4">회원 정보 수정</h2>
				<span id=""
					class="" style="top:10px;">&times;</span>
				<div class="">
					<h5 class="">회원번호 :</h5>
					<h5 class="" id="no"></h5>
				</div>
				<div class="">
					<h5 class="">아이디 :</h5>
					<h5 class="" id="id"></h5>
				</div>
				<div class="">
					<h5 class="">회원이름 :</h5>
					<h5 class="" id="name"></h5>
				</div>
				<div class="">
					<h5 class="">이메일 :</h5>
					<h5 class=""><input type="text" id="mail" name="mail"></h5>
				</div>
				<div class="">
					<h5 class="">전화번호 :</h5> 
					<h5 class="" ><input type="text" class="" id="tel" name="tel"></h5>
				</div>
				<div class="">
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