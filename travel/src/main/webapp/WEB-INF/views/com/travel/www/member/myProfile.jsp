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
    	* {
    		box-sizing: border-box;
    		padding: 0;
    		margin: 0;
    	}
    	.m_profile_box {
    		display: grid;
    		height: 50vh;
    		width: 1024px;
    		grid-template-columns: repeat(2, 50%);
    		grid-template-rows: repeat(4, 25%);
    		grid-auto-rows: 25%;
    		margin: 0 auto;
    		grid-gap: 16px;
    		margin-top: 5%;
    	}
    	.m_profile_box div {
    		display: flex;
    		border-radius: 8px;
    		color: #666; 
    		box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    		border: 1px solid rgba(0, 0, 0, 0.5);
    		text-align: center;
    		font-family: 'Nanum Brush Script', cursive;
			font-family: 'Gothic A1', sans-serif;
    		font-size: 14px;
    	}
    	.m_profile_box div span {
    		margin: auto;
    	}
    	.m_rela img {
    		max-height: 100%;
    		max-width: 100%;
    	}
    	#edit_btn {
    		grid-column: 1/3;
    	}
    </style>
    <link href="https://fonts.googleapis.com/css?family=Gothic+A1|Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
	<div>
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	<div class="m_profile_box">
		<div class="m_rela"><span><img id="profile" draggable="false" width="117" height="117"></span></div>
		<div><span>이름: ${LIST.mName}</span></div>
		<div><span>휴대전화: ${LIST.mMobile}</span></div> 
		<div><span>이메일: ${LIST.mMail}</span></div>
		<div><span>회원 등급: ${LIST.mGrade}</span></div>
		<div><span>포인트: ${LIST.mPoint}</span></div>
		<div><span>주소: ${LIST.mAddress}</span></div>
		<div><span>가입일: ${LIST.mJdate}</span></div>
		<div id="edit_btn"><span>수정</span></div>
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