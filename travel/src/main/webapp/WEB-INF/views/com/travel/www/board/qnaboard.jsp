<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<title>Page Title</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
	<!-- <script src='main.js'></script> -->
	<style>
		* {
			box-sizing: border-box;
			list-style: none;
			padding: 0;
			margin: 0;
		}
		/* container */
		.b_container {
			width: 70%;
			height: 100vh;
			margin: 0 auto;
		}
		/* left bar */
		.left_bar {
			width: 200px;
			height: 100vh;
			background-color: #F9FAFA;
			text-align: center;
			float: left;
		}
		.left_bar ul li {
			border-bottom: 1px solid #EBEBEB;
			padding: 8px;
		}
		#writing {
			font-weight: 700;
		}
		/* board */
		.board {
			width: calc(100% - 200px);
			height: 100%;
			float: right;
		}
		.board_list {
			display: grid;
			text-align: center;
			grid-template-columns: 10% 65% 12.5% 12.5%;
			border-bottom: 1px solid #EBEBEB;
			font-weight: 700;
			background-color: #FFFFFF;
			font-size: 15px;
			padding-left: 8px;
			padding-right: 8px; 
			padding-top: 9px;
			padding-bottom: 9px;
		}
		/* mdoal */
		.modal_box {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100vh;
			opacity: 0.4;
			background-color: black;
		}
		.modal_contents {
			display: flex;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100vh;
		}
		.modal_content {
			width: 50%;
			height: 60%;
			background-color: white;
			margin: auto;
			border-radius: 4px;
		}
		.modal_text {
			width: 100%;
			height: 90%;
		}
		.modal_text #modal_head {
			width: calc(100% - 16px);
			height: 10%;
			resize: none;
			font-size: 12px;
			padding-top: 10px;
			/* border: none;
			border-bottom: 1px solid #EBEBEB; */
			margin-top: 8px;
			margin-left: 8px;
			margin-right: 8px;
			padding-left: 8px;
			padding-right: 8px;
			overflow: hidden;
		}
		.modal_text #modal_text {
			width: calc(100% - 16px);
			height: calc(90% - 22px);
			font-size: 12px;
			resize: none;
			/* border: none; */
			padding-top: 8px;
			margin-left: 8px;
			margin-right: 8px;
			padding-left: 8px;
			padding-right: 8px;
		}
		.modal_text textarea:focus {
			outline: none;
		}
		.modal_cancel {
			width: 50%;
			height: 10%;
			border: none;
			background-color: #28313D;
			font-size: 14px;
			color: #FFFFFF;
			border-bottom-right-radius: 4px;
			float: right;
		}
		.modal_btn {
			width: 50%;
			height: 10%;
			border: none;
			background-color: #28313D;
			font-size: 14px;
			color: #FFFFFF;
			border-bottom-left-radius: 4px;
			float: left;
		}
		.modal_cancel:hover {
			background-color: #4E545D;
			color: #FFFFFF;
		}
		.modal_btn:hover {
			background-color: #4E545D;
			color: #FFFFFF;
		}
		.modal_cancel:focus {
			outline: none;
		}
		.modal_btn:focus {
			outline: none;
		}
		/* hide */
		.hide {
			display: none;
		}
		.overflow {
			overflow: hidden;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	<div class="b_container">
		<div class="left_bar">
			<ul>
				<li id="writing">문의하기</li>
				<li>내 문의내역</li>
			</ul>
		</div>
		<div class="board">
			<div class="board_list">
				<div>번호</div>
				<div>제목</div>
				<div>날짜</div>
				<div>상태</div>
			</div>
		</div>
	</div>

	<!-- modalbox -->
	<div class="hide" id="modal_box"></div>
	<div class="hide" id="modal_contents">
		<div class="modal_content" id="modal_content">
			<div class="modal_text">
				<textarea id="modal_head" maxlength="30" placeholder="제목"></textarea>
				<textarea id="modal_text" maxlength="4000" placeholder="문의내용"></textarea>
			</div>
			<input type="button" value="문의하기" class="modal_btn" id="modal_btn">
			<input type="button" value="취소" class="modal_cancel" id="modal_cancel">
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', () => {
			let writing = document.getElementById('writing');
			let body = document.querySelector('body');
			let modal_box = document.getElementById('modal_box');
			let modal_contents = document.getElementById('modal_contents');
			let modal_cancel = document.getElementById('modal_cancel');
			let modal_btn = document.getElementById('modal_btn');
			let modal_text = document.getElementById('modal_text');

			writing.addEventListener('click', () => {
				if (body.className == '') {
					body.className = 'overflow';
				} else {
					body.className = '';
				}
				if (modal_box.className == 'hide') {
					modal_box.className = 'modal_box';
				} else {
					modal_box.className = 'hide';
				}
				if (modal_contents.className == 'hide') {
					modal_contents.className = 'modal_contents';
				} else {
					modal_contents.className = 'hide';
				}
			});
			modal_cancel.addEventListener('click', () => {
				writing.click();
			});
			modal_btn.addEventListener('click', () => {
				fetch('/board/qnawriting.kit', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded'
					},
					body: "Sq_no=" + modal_text.value
				});
				writing.click();
			});
		});
	</script>
</body>
</html>