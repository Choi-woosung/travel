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
		.container {
			width: 70%;
			height: 100vh;
			margin: 0 auto;
		}
		/* left bar */
		.left_bar {
			width: 200px;
			height: 100vh;
			background-color: gray;
			text-align: center;
			float: left;
		}
		.left_bar_list {
			font-weight: bold;
			padding: 8px;
			border-bottom: 1px solid black;
		}
		.left_bar ul li {
			border-bottom: 1px solid black;
			padding: 8px;
		}
		/* board */
		.board {
			width: calc(100% - 200px);
			height: 100%;
			background-color: aqua;
			float: right;
		}
		.board_list {
			display: grid;
			text-align: center;
			grid-template-columns: 15% 65% 20%;
			padding: 8px;
			border-bottom: 1px solid black;
		}
		.board_list div:not(:last-child) {
			border-right: 1px solid black;
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
			width: 800px;
			height: 800px;
			background-color: white;
			margin: auto;
		}
		.modal_text {
			width: 100%;
			height: 90%;
			padding: 16px;
			font-size: 16px;
			resize: none;
		}
		.modal_cancel {
			width: 50%;
			height: 10%;
			float: left;
		}
		.modal_btn {
			width: 50%;
			height: 10%;
			float: right;
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
	<div class="container">
		<div class="left_bar">
			<div class="left_bar_list" id="list">메뉴</div>
			<ul>
				<li>로그인</li>
				<li>QnA Board</li>
				<li id="writing">질문작성</li>
			</ul>
		</div>
		<div class="board">
			<div class="board_list">
				<div>글번호</div>
				<div>제목</div>
				<div>작성자</div>
			</div>
			<div class="board_list">
				<div>글번호</div>
				<div>제목</div>
				<div>작성자</div>
			</div>
		</div>
	</div>

	<!-- modalbox -->
	<div class="hide" id="modal_box"></div>
	<div class="hide" id="modal_contents">
		<div class="modal_content" id="modal_content">
			<textarea name="" id="modal_text" cols="30" rows="10" class="modal_text" maxlength="4000"></textarea>
			<input type="button" value="취소" class="modal_cancel" id="modal_cancel">
			<input type="button" value="질문보내기" class="modal_btn" id="modal_btn">
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