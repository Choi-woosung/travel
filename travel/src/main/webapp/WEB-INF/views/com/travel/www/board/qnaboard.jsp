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
		body div:not(#nav) {
    		font-family: 'Nanum Brush Script', cursive;
			font-family: 'Gothic A1', sans-serif;	
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
			user-select: none;
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
			background-color: #FFFFFF;
			font-size: 14px;
			padding-left: 8px;
			padding-right: 8px; 
			padding-top: 9px;
			padding-bottom: 9px;
			color: #666;
		}
		.board_list:hover {
			color: #666;
			text-decoration: none;
		}
		.font_we div {
			font-weight: 700;
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
			border: 1px solid #EBEBEB;
			padding-top: 16px;
			padding-bottom: 16px;
			padding-left: 16px;
			padding-right: 16px;
			border-radius: 4px;
			margin-top: 8px;
		}
		.w_file {
			width: calc(100% - 8px);
			height: 64px;
			margin: 0 auto;
			margin-top: 8px;
			border: 1px solid #EBEBEB;
			display: flex;
			border-radius: 4px;
			user-select: none;
		}
		.w_file div {
			border-radius: 4px;
			border: 1px solid #EBEBEB;
			margin-right: auto;
			text-align: center;
			padding-top: 12px;
			width: 200px;
			height: 80%;
			margin-top: auto;
			margin-bottom: auto;
			margin-left: 6px;
			background-color: #F9FAFA;
			font-weight: 700;
		}
		.w_file div:hover {
			background-color: #666666;
			color: #FFFFFF;
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
			background-color: #F9FAFA;
			user-select: none;
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
			background-color: #F9FAFA;
			user-select: none;
		}
		.w_cancel:hover {
			background-color: #666666;
			color: #FFFFFF;
		}
		.help_box {
			width: calc(100% - 200px);
			height: 100%;
			float: right;
			padding-left: 8px;
			padding-right: 8px;
		}
		/* hide */
		.hide {
			display: none;
		}
		.backColor {
			background-color: #212529;
			color: #F9FAFA;
		}
		.overflow {
			overflow: hidden;
		}
		/* modal */
		.modal_box {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100vh;
			background-color: black;
			opacity: 0.4;
			z-index: 3;
		}
		.modal_file_box {
			display: flex;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100vh;
			z-index: 4;
		}
		.modal_contents {
			margin: auto;
			flex-basis: 40%;
			height: 70%;
			background-color: white;
			text-align: center;
			border-radius: 4px;
		}
		.file_add_btn {
			border: 1px solid #EBEBEB;
			font-weight: 700;
			width: 100%;
			height: 50%;
			border-radius: 4px;
			padding-top: 20px;
			user-select: none;
		}
		.file_cancel_btn {
			border: 1px solid #EBEBEB;
			font-weight: 700;
			width: 100%;
			height: 100%;
			float: right;
			border-radius: 4px;
			padding-top: 20px;
			user-select: none;
		}
		.file_cancel_btn:hover {
			background-color: #666666;
			color: #FFFFFF;
		}
		.file_item1 {
			width: calc(100% - 32px);
			margin-top: 16px;
			margin-bottom: 16px;
			margin-left: 16px;
			margin-right: 16px;
		}
		.m_btn_box {
			width: 100%;
			height: 10%;
		}
		.new_file {
			width: 100%;
			height: 90%;
		}
		.board_item_box{
			width: calc(100% - 200px);
			height: 100vh;
			font-size: 15px;
			float: right;
		}
		.board_item1 {
			display: grid;
			width: 100%;
			height: 40px; 
			grid-template-columns: 80% 20%;
			font-weight: 700;
			padding-top: 8px;
			padding-right: 8px;
			border-bottom: 1px solid #EBEBEB;
			border-right: 1px solid #EBEBEB;
		}
		.board_item2 {
			display: inline-block;
			width: 100%;
			min-height: 300px;
			padding: 8px;
			border-bottom: 1px solid #EBEBEB;
			border-right: 1px solid #EBEBEB;
		}
		.board_item3 {
			display: inline-block;
			width: 100%;
			min-height: 300px;
			padding: 8px;
			border-bottom: 1px solid #EBEBEB;
			border-right: 1px solid #EBEBEB;
		}
		.b_item1{
			text-align: center;
		}
		.b_item2{
			text-align: right;
		}
		.a_btn {
			border: 1px solid #EBEBEB;
			width: 100%;
			height: 10%;
			text-align: center;
			padding-top: 32px;
			margin-left: 4px;
			float: left;
			margin-bottom: 8px;
			font-weight: 700;
			border-radius: 4px;
			background-color: #F9FAFA;
			user-select: none;
			padding-top: 16px;
			padding-bottom: 16px;
		}
		.a_btn:hover {
			background-color: #666666;
			color: #FFFFFF;
		}
	</style>
    <link href="https://fonts.googleapis.com/css?family=Gothic+A1|Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
	<div id="nav">
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	<div class="b_container" id="b_container">
		<div class="left_bar">
			<ul id="left_ul" class="left_ul">
				<li id="writing">문의하기</li>
				<li id="moon" class="backColor">내 문의내역</li>
				<li id="help">도움말</li>
			</ul>
		</div>
		<div class="hide" id="writing_box">
			<div class="w_head" contenteditable="true" placeholder="제목" id="w_haed"></div>
			<div class="w_file">
				<div id="w_file_add_btn">파일첨부<span id="file_size"></span></div>
			</div>
			<div class="w_body" contenteditable="true" placeholder="본문" id="w_body"></div>
			<div class="w_col"></div>
			<div class="w_btn" id="w_btn">문의하기</div>
			<div class="w_cancel" id="w_cancel">취소</div>
		</div>
		<c:if test="${empty list}">
			<div class="board" id="board">
				<div class="board_list font_we">
					<div>번호</div>
					<div>제목</div>
					<div>날짜</div>
					<div>상태</div>
				</div>
				<div id="board_items">
					<c:forEach var="data" items="${LIST}">
						<a class="board_list unset" href="?no=${data.q_no}">
							<span>${data.q_no}</span>
							<span>${data.q_head}</span>
							<span>${data.q_wdate}</span>
							<span>${data.q_status}</span>
						</a>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<div class="hide" id="help_box">
			<div class="h_contents">
				<ul>
					<li>1. a</li>
					<li>2. b</li>
					<li>3. c</li>
					<li>4. d</li>
					<li>5. e</li>
				</ul>
			</div>
		</div>
		<c:if test="${not empty list}">
			<div class="board_item_box">
				<div class="board_item1">
					<div class="hide">${list.q_no}</div>
					<div class="b_item1">${list.q_head}</div>
					<div class="b_item2">${list.q_wdate}</div>
				</div>
				<div class="board_item2">
					<div>${list.q_body}</div>
				</div>
				<div class="board_item3" id="writ">${list.q_answer}</div>
			</div>
		</c:if>	
	</div>

	<!-- modal -->
	<div class="hide" id="modal_box"></div>
	<!-- modal_file_box -->
	<div class="hide" id="modal_file_box">
		<div class="modal_contents">
			<div id="new_file" class="new_file">
				<input type="file" class="file_item1" multiple="multiple" id="isFile">
			</div>
			<div class="m_btn_box">
				<div class="file_cancel_btn" id="file_cancel_btn">뒤로 가기</div>
			</div>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', () => {
			let b_container = document.getElementById('b_container');
			let writing_box = document.getElementById('writing_box');
			let help_box = document.getElementById('help_box');
			let writing = document.getElementById('writing');
			let left_ul = document.getElementById('left_ul');
			let board = document.getElementById('board');
			let moon = document.getElementById('moon');
			let help = document.getElementById('help');
			let w_haed = document.getElementById('w_haed');
			let w_body = document.getElementById('w_body');
			let w_btn = document.getElementById('w_btn');
			let w_cancel = document.getElementById('w_cancel');
			let w_file_add_btn = document.getElementById('w_file_add_btn');
			let body = document.querySelector('body');
			let modal_box = document.getElementById('modal_box');
			let modal_file_box = document.getElementById('modal_file_box');
			let new_file = document.getElementById('new_file');
			let file_upload_btn = document.getElementById('file_upload_btn');
			let file_cancel_btn = document.getElementById('file_cancel_btn');
			let file_size = document.getElementById('file_size');
			
			<c:if test="${empty list}">
				let board_items = document.getElementById('board_items').children;
				
				for (var i = 0; i < board_items.length; i++) {
					if (board_items[i].children[3].textContent == 'N') {
						board_items[i].children[3].textContent = '처리중'; 
					} else {
						board_items[i].children[3].textContent = '처리완료';
					}
					
				}
			</c:if>
			
			writing.addEventListener('click', () => {
				removeCls(writing_box, '', 'hide', 'writing_box');
				isCls(writing, '', 'backColor');
			});
			moon.addEventListener('click', () => {
				location.href = '/board/qnaBoard.kit';
			});
			help.addEventListener('click', () => {
				removeCls(help_box, '', 'hide', 'help_box');
				isCls(help, '', 'backColor');
			});
			w_btn.addEventListener('click', () => {
				let files = document.getElementById('isFile').files;
				let data = new FormData();
				
				data.append('q_head', w_haed.textContent);
				data.append('q_body', w_body.textContent);		
				
				if (files != null) {
					for (var i = 0; i < files.length; i++) {
						data.append('files', files[i]);
					}
				}
				
				let options = {
					method: 'POST',
					body: data
				};
				
				if (w_haed.textContent != '' && w_body != '') {
					fetch('/board/qnaWriting.kit', options).then(() => {
						moon.click();
					});
				}
				
			});
			w_cancel.addEventListener('click', () => {
				reSet();
				moon.click();
				file_size_reset();
			});
			w_file_add_btn.addEventListener('click', () => {
				isCls(body, '', 'overflow');
				isCls(modal_box, 'hide', 'modal_box');
				isCls(modal_file_box, 'hide', 'modal_file_box');
			});
			file_cancel_btn.addEventListener('click', () => {
				isCls(body, 'overflow', '');
				isCls(modal_box, 'modal_box', 'hide');
				isCls(modal_file_box, 'modal_file_box', 'hide');
				let files = document.querySelector('.file_item1').files;				
				if (files.length == 0) {
					file_size_reset();
				} else {
					file_size.textContent = ' ' + files.length + '개';
				}
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
			
			function reSet() {
				w_haed.innerHTML = '';
				w_body.innerHTML = '';
				new_file.innerHTML = '';
				let el = document.createElement('input');
				el.type = 'file';
				el.className = 'file_item1';
				new_file.appendChild(el);
			}
			function file_size_reset() {
				file_size.textContent = '';
			}
		});
	</script>
</body>
</html>