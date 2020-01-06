<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
	<title>ConsulTravel</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
	<!-- <script src='main.js'></script> -->
	<style>
		* {
			box-sizing: border-box;
			padding: 0;
			margin: 0;
			font-family: -apple-system, 
					BlinkMacSystemFont, 
							"Segoe UI", 
								Roboto, 
					  "Helvetica Neue", 
					  			 Arial, 
						   "Noto Sans", 
						    sans-serif, 
				   "Apple Color Emoji", 
				   	  "Segoe UI Emoji", 
					 "Segoe UI Symbol", 
					"Noto Color Emoji";
		}
		/* header */
		.c_header {
			width: 100%;
			height: 76px;
			background-color: #2CB5E9;
		}
		/* left */
		.c_header_left {
			width: 50%;
			height: 100%;
			float: left;
		}
		.c_header_left img {
			margin-top: 13px;
			margin-left: 16px;
		}
		.c_header_left img:hover {
			cursor: pointer;
		}
		/* right */
		.c_header_right {
			width: 50%;
			height: 100%;
			float: right;
		}
		.c_header_btn_box {
			min-width: 50%;
			height: 100%;
			float: right;
			overflow: hidden;
			text-align: right;
		}
		.c_header_btn_box:last-child {
			margin-right: 13px;
		}
		.c_header_btn {
			display: inline-block;
			min-width: 74px;
			height: 38px;
			border: 1px solid #F8F9FA;
			padding: 6px 12px 6px 12px;
			border-radius: 4px;
			color: #F8F9FA;
			margin-top: 19px;
			margin-right: 11.5px;
			line-height: 24px;
		}
		.c_header_btn:hover {
			cursor: pointer;
			background-color: #F8F9FA;
			color: #212529;
			transition: color 0.15s ease-in-out 0s, 
			 background-color 0.15s ease-in-out 0s, 
			     border-color 0.15s ease-in-out 0s, 
				   box-shadow 0.15s ease-in-out 0s;
		}
		/* main */
		.c_main {
			width: 100%;
			height: 800px;
			background-image: url("/img/main/hongkong.jpg");
			background-repeat: no-repeat;
			background-size: cover;
		}
		/* left */
		.c_main_left {
			width: 50%;
			height: 100%;
			float: left;
		}
		.c_main_left_search_box {	
			position: relative;
			top: 25px;
			left: 25px;
			height: 500px;
			width: 400px;
			background-color: white;
			padding-top: 20px;
			padding-left: 20px;
			z-index: 1;
		}
		.c_main_left_search_box div input {
			margin-top: 8px;
			border-radius: 4px;
		}
		.c_main_left_search_box div input::-webkit-input-placeholder {
			font-size: 16px;
		}
		.c_main_left_search_box div{
			margin-bottom: 16px;
		}
		.c_main_left_div1 {
			font-size: 28px;
		}
		.c_main_left_div2 {
			font-size: 32px;
		}
		.c_main_left_town {
			height: 38px;
			width: 359px;
			border: 1px solid#CED4DA;
			padding-left: 16px;
			padding-right: 16px;
		}
		.c_main_right_ipt {
			margin-left: 25px;
		}
		.c_main_date {
			height: 38px;
			width: 165px;
			border: 1px solid#CED4DA;
			padding-left: 16px;
			padding-right: 16px;
		}
		.c_main_sDate {
			margin-right: auto;
		}
		.c_main_eDate {
			margin-left: 105px;
		}
		.c_main_left_btn input{
			height: 38px;
			padding: 6px 12px 6px 12px;
			border: 1px solid#17A2B8;
			background-color: white;
			color: #17A2B8;
			font-size: 16px;
		}
		/* right */
		.c_main_right {
			width: 50%;
			height: 100%;
			float: right;
			text-align: center;
		}
		.c_main_right_label {
			position: relative;
			top: 0;
			left: 0;
			font-size: 50px;
			font-weight: 700;
			line-height: 175px;
			color: white;
		}
		.c_main_right_schedule_btn {
			height: 48px;
			width: 199.484px;
			border-radius: 4px;
			font-size: 20px;
			background-color: #F8F9FA;
			border: 1px solid  #F8F9FA;
			line-height: 30px;
		}
		/* contents */
		.c_contents {
			width: 100%;
			height: 436px;
		}
		/* footer */
		.c_footer {
			width: 100%;
			height: 313px;
			background-color: #333333;
			color:#808080;
			text-align: center;
			font-size: 12px;
			padding-top: 5%;
		}
		.c_footer div {
			margin-bottom: 1%;
		}
	</style>
</head>
<body>
	<div class="c_header">
		<div class="c_header_left">
			<img src="/img/main/logo2.png" alt="logo" height="50" width="153" id="logo">
		</div>
		<div class="c_header_right">
			<div class="c_header_btn_box">
				<div class="c_header_btn" id="login">로그인</div>
				<div class="c_header_btn" id="signup">회원가입</div>
				<!-- <div class="c_header_btn">테스트</div>
				<div class="c_header_btn">크롤러</div> -->
			</div>
		</div>
	</div>
	<div class="c_main">
		<div class="c_main_left">
			<div class="c_main_left_search_box">
				<div class="c_main_left_div1">떠나고 싶은 곳 어디든</div>
				<div class="c_main_left_div2">지금 검색해보세요.</div>
				<div>
					<label for="town">여행가는 도시</label>
					<input type="text" placeholder="떠나실 장소를 검색해보세요" class="c_main_left_town">
				</div>
				<div>
					<label for="sDate" class="c_main_sDate">출발일 선택</label>
					<label for="eDate" class="c_main_eDate">도착일 선택</label>
					<input type="text" placeholder="언제부터 ?" class="c_main_date">
					<input type="text" placeholder="언제까지 ?" class="c_main_date c_main_right_ipt">
				</div>
				<div>
					<label for="sDate">인원수</label>
					<input type="text" placeholder="인원수를 선택해주세요" class="c_main_left_town">
				</div>
				<div class="c_main_left_btn">
					<input type="button" value="검색" id="search">
					<!-- <input type="button" value="이메일인증"> -->
					<input type="button" value="근처검색" id="nearbysearch">
				</div>
			</div>
		</div>
		<div class="c_main_right">
			<label for="c_main_right_label" class="c_main_right_label">여러분의 스케줄을 만들어 보세요!</label>
			<input type="button" value="스케줄 만들어보기" class="c_main_right_schedule_btn" id="make">
		</div>
	</div>
	<div class="c_contents"></div>
	<div class="c_footer">
		<div>All material © 2019 – 2019 MyTravel Company Pte. Ltd., AllRights Reserved.</div>
		<div>마이 트레블은 온라인 여행에 관한 각종 정보를 한 곳에서 찾아볼 수 있고 스케쥴을 짤 수 있는 사이트 입니다.</div>
		<div>해당 사이트에 등록된 모든 정보는 MyTravel Company 의 지적 자산이므로 당사의 협의없는 상업적 사용은 불허합니다.</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			let make = document.getElementById('make');
			let search = document.getElementById('search');
			let nearbysearch = document.getElementById('nearbysearch');
			let login = document.getElementById('login');
			let signup = document.getElementById('signup');
			let logo = document.getElementById('logo');

			make.addEventListener('click', () => {
				location.href = '/schedule/scheduleMaker.kit';
			});
			search.addEventListener('click', () => {
				location.href = '/schedule/scheduleList.kit';
			});
			nearbysearch.addEventListener('click', () => {
				location.href = '/test/nearbysearch.kit';
			});
			login.addEventListener('click', () => {
				location.href = '/member/login.kit';
			});
			signup.addEventListener('click', () => {
				location.href = '/member/join.kit';
			});
			logo.addEventListener('click', () => {
				location.href = '/main2.kit';
			});
		});
	</script>
</body>
</html>
