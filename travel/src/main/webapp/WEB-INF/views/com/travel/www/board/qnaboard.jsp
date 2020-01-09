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
			position: fixed;
			bottom: 0;
			width: 200px;
			height: 100%;
			background-color: #F9FAFA;
			text-align: center;
			float: left;
			z-index: 1;
		}
		.left_bar ul li {
			border-bottom: 1px solid #EBEBEB;
			padding: 8px;
		}
		.left_ul {
			margin-top: 76px;
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
		/* writing */
		.writing_box {
			width: calc(100% - 200px);
			height: 100%;
			min-height: auto;
			float: right;
			padding-left: 8px;
			padding-right: 8px;
		}
		.w_head {
			width: calc(100% - 8px);
			height: 10%;
			margin: 0 auto;
			margin-top: 8px;
			border: 1px solid #EBEBEB;
			padding-top: 32px;
			padding-bottom: 16px;
			padding-left: 16px;
			padding-right: 16px;
			border-radius: 4px;
		}
		.w_head:empty:before {
			content: attr(placeholder);
			color: gray;
		}
		.w_body:empty:before {
			content: attr(placeholder);
			color: gray;
		}
		.w_body {
			width: calc(100% - 8px);
			min-height: 80%;
			margin: 0 auto;
			margin-top: 8px;
			border: 1px solid #EBEBEB;
			padding-top: 16px;
			padding-bottom: 16px;
			padding-left: 16px;
			padding-right: 16px;
			border-radius: 4px;
		}
		.w_col {
			margin-top: 8px;
		}
		.w_btn {
			border: 1px solid #EBEBEB;
			width: calc(50% - 8px);
			height: 10%;
			text-align: center;
			padding-top: 32px;
			margin-left: 4px;
			float: left;
			margin-bottom: 8px;
			font-weight: 700;
			border-radius: 4px;
		}
		.w_btn:hover {
			background-color: #666666;
			color: #FFFFFF;
		}
		.w_cancel {
			border: 1px solid #EBEBEB;
			width: calc(50% - 8px);
			height: 10%;
			text-align: center;
			padding-top: 32px;
			margin-right: 4px;
			float: right;
			margin-bottom: 8px;
			font-weight: 700;
			border-radius: 4px;
		}
		.w_cancel:hover {
			background-color: #666666;
			color: #FFFFFF;
		}
		/* hide */
		.hide {
			display: none;
		}
		.backColor {
			background-color: #212529;
			color: #F9FAFA;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	<div class="b_container" id="b_container">
		<div class="left_bar">
			<ul id="left_ul" class="left_ul">
				<li id="writing">문의하기</li>
				<li id="moon">내 문의내역</li>
				<li id="help">도움말</li>
			</ul>
		</div>
		<div class="hide" id="writing_box">
			<div class="w_head" contenteditable="true" placeholder="제목"></div>
			<div class="w_body" contenteditable="true" placeholder="본문"></div>
			<div class="w_col"></div>
			<div class="w_btn">문의하기</div>
			<div class="w_cancel">취소</div>
		</div>
		<div class="hide" id="board">
			<div class="board_list">
				<div>번호</div>
				<div>제목</div>
				<div>날짜</div>
				<div>상태</div>
			</div>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', () => {
			let b_container = document.getElementById('b_container');
			let writing_box = document.getElementById('writing_box');
			let writing = document.getElementById('writing');
			let left_ul = document.getElementById('left_ul');
			let board = document.getElementById('board');
			let moon = document.getElementById('moon');
			let help = document.getElementById('help');
			
			writing.addEventListener('click', () => {
				removeCls(writing_box, '', 'hide', 'writing_box');
				isCls(writing, '', 'backColor');
			});
			moon.addEventListener('click', () => {
				removeCls(board, '', 'hide', 'board');
				isCls(moon, '', 'backColor');
			});
			moon.click();
			help.addEventListener('click', () => {
				removeCls('', '', 'hide', '');
				isCls(help, '', 'backColor');
			});
			
			/* 매개변수 ( 앨리먼트, 클래스1, 클래스2, 클래스3(변환시킬 클래스) ) 클래스를 삭제하는 함수 */
			function removeCls(el, cls1, cls2, cls3) {
				let ch = left_ul.children;
				let bc = b_container.children;
				for (var i = 0; i < ch.length; i++) {
					ch[i].className = cls1;
				}
				for (var i = 0; i < bc.length; i++) {
					if (bc[i].className != 'left_bar') {
						bc[i].className = cls2;
					}
				}
				if (el != '') {
					el.className = cls3;
				}
			}
			
			/* 매개변수 ( 앨리먼트, 클래스1, 클래스2 ) 클래스를 바꾸는 함수 */
			function isCls(el, cls1, cls2) {
				if (el.className == cls1) {
					el.className = cls2;
				} else {
					el.className = cls1;
				}
			}
		});
	</script>
</body>
</html>