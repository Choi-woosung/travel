<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<title>Document</title>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/bootstrap.min.js">
<script type="text/javascript">
	$(document).ready(function() {
		$('#cancel').click(function() {
			history.back();
		});
	});
</script>
</head>
<body>
	<form method="POST" action="/member/memberCheck.kit">
		<div class="container" id="edit">
			<h2 class=".col-md-4 text-center">회원 정보 수정</h2>
			<input type="hidden" name="mId" value="${DATA.mId}">
			<div class="col-md-12 border main">
				<div class="ml-4">
					<div class="p-4 row">
						<pre>아   이   디 :</pre>
						<h5 class="ml-4" id="id">${SID }</h5>
					</div>
					<div class="p-4 row">
						<pre>비 밀  번 호 :</pre>
						<h5 class="" id="name"></h5>
						<h5 class="">
							<input type="password" class="ml-4" id="pw" name="mPw"
								required="required">
						</h5>
					</div>
					<div class="">
						<div class="btn btn-info" id="cancel">취소</div>
						<button class="btn btn-info" id="save" type="submit">저장</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>