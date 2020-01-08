<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>			
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
    <!-- <script src='main.js'></script> -->
    <style type="text/css">
    	.my_profile {
    		width: 100%;
    		height: 100vh;
    	}
		.my_profile .item {
			width: 100%;
    		height: 100%;
		}
		.p_img_box1 {
			display: inline-block;
			margin-top: 50px;
			margin-left: 50px;
			padding: 16px;
		}
		.p_img_box1 div {
			display: inline-block;
		}
		.p_box2{
			display: inline-block;
			margin-top: 50px;
			margin-left: 50px;
			padding: 16px;
		}
		.p_box2 div:not(:last-child) {
			margin-bottom: 16px;
		}
		.p_box3{
			display: inline-block;
			margin-top: 50px;
			margin-left: 50px;
			padding: 16px;
		}
		.p_box3:hover {
			cursor: pointer;
		}
		.user_none {
			user-select: none;
			border-radius: 4px;
			border: 1px solid black;
		}
    </style>
</head>
<body>
	<div>
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	<div class="my_profile">
		<div class="item" id="item">
			<div class="p_img_box1 user_none">
				<img id="profile" width="128" height="128" draggable="false">
				<div>이름 : ${LIST.mName}</div>
			</div>
			<div></div>
			<div class="p_box2 user_none">
				<div>회원 등급 : ${LIST.mGrade}</div>
				<div>포인트 : ${LIST.mPoint}</div>
				<div>이메일 : ${LIST.mMail}</div>
				<div>휴대전화 : ${LIST.mMobile}</div> 
				<div>주소 : ${LIST.mAddress}</div>
				<div>가입일 : ${LIST.mJdate}</div>
			</div>
			<div></div>
			<div class="p_box3 user_none" id="edit_btn">수정</div>
		</div>
	</div>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', () => {
			let profile = document.getElementById('profile');
			let edit_btn = document.getElementById('edit_btn');
			
			profile.src = "/img/profile/profile${(LIST.mAvatar - 10)}.png";
			edit_btn.addEventListener('click', () => {
				location.href = '/member/memberForm.kit';
			});
		});
	</script>
</body>
</html>