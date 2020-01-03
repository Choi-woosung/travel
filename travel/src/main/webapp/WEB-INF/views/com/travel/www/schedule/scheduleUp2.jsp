<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- meta --%>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />

<%-- CSS --%>
<link rel="stylesheet" href="/css/bootstrap.min.css">

<%-- Script --%>
<script src="/js/jquery-3.4.1.min.js"></script>

<%-- title --%>
<title>MY TRAVEL</title>

<%-- style --%>
<style>
	<%-- ALL --%>
	*{
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	    list-style: none;
	    color: #282c37;
	    font-family: -apple-system,
				     BlinkMacSystemFont,
				     "Segoe UI",Roboto,
				     "Helvetica Neue",
				     Arial,"Noto Sans",
				     sans-serif,
				     "Apple Color Emoji",
				     "Segoe UI Emoji",
			         "Segoe UI Symbol",
				     "Noto Color Emoji";
	}
	.mainBody{
		background-color: rgb(51, 51, 51);
	}
	<%-- topDiv --%>
	.topDiv{
		position: fixed;
		top: 0;
		left: 0;
	    width: 100%;
	    height: 70px;
	    z-index: 1;
	}
	<%-- schedule --%>
	.scheduleDiv{
		width: 85%;
		height: calc(100vh - 70px);
		margin-top: 70px;
		text-align: center;
		padding-top: 48px;
	}
	.schedule{
		display: block;
		width: 800px;
		min-height: 500px;
		height: auto;
		background-color: #d9e1e8;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 48px;
		border-radius: 16px;
		padding-bottom: 24px;
		padding-top: 8px;
	}
	.toDay{
		font-size: 2rem;
		user-select: none;
		margin-bottom: 24px;
	}
	<%-- scheduleSide --%>
	.scheduleSide{
		position: fixed;
		bottom: 0;
		right: 0;
		width: 15%;
		height: 100vh;
		background-color: #d9e1e8;
	}
	<%-- show --%>
	.menu{
		position: fixed;
		width: 290px;
		height: 245px;
		z-index: 2;
		background-color: white;
		text-align: center;
		border: 1px solid rgb(51, 51, 51);
		border-radius: 4px;
		user-select: none;
	}
	.ulMenu li{
		padding-top: 4px;
		padding-bottom: 4px;
		border-bottom: 0.1px solid rgb(51, 51, 51);
	}
	.ulMenu li:hover{
		background-color: darkgray;
		color: white;
	}
	<%-- menu --%>
	.hotel, .restaurant, .traffic, .text{
		display: block;
		width: 80%;
		height: 64px;
		padding: 8px;
		border-radius: 8px;
		border: none;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 24px;
	}
	.hotel{
		
	}
	.restaurant{
	
	}
	.traffic{
	
	}
	.text{
	
	}
	
	<%-- del --%>
	.del{
		display: none;
	}
</style>
</head>
<%-- body --%>
<body class="mainBody">
    <%-- topDiv --%>
	<div class="topDiv">
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	
	<%-- scheduleMain --%>
	<ul class="scheduleDiv">
		<c:forEach begin="0" end="${LIST.sDay}" varStatus="data">
		<li class="schedule" id="day${data.count}">
			<div class="toDay">Day ${data.count}</div>
		</li>
		</c:forEach>
	</ul>
	
	<%-- scheduleSide --%>
	<div class="scheduleSide"></div>
	
	<%-- menu --%>
	<div class="menu" id="menu">
		<ul class="ulMenu">
			<li id="hotel">호텔</li>
			<li id="restaurant">식당</li>
			<li id="traffic">교통</li>
			<li id="text">텍스트</li>
		</ul>
	</div>
	
	<%-- delMenu --%>
	<div class="menu" id="delMenu">
		<ul class="ulMenu">
			<li id="del">삭제</li>
		</ul>
	</div>
	
	<%-- del --%>
	<div id="dels" class="del"></div>
	
	<%-- script --%>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', () => {
			<%-- ALL --%>
			localStorage.removeItem('elId');
			localStorage.removeItem('cnt');
			
			<%-- var --%>
			const menu = document.getElementById('menu');
			const delMenu = document.getElementById('delMenu');
			const schedule = document.getElementsByClassName('schedule');
			let cnt = localStorage.getItem('cnt');
			
			<%-- if --%>
			 if (cnt == undefined) {
                localStorage.setItem('cnt', 0);
                cnt = localStorage.getItem('cnt');
            }
			 
			<%-- for --%>
			for (let i = 0; i < menu.children.length; i++) {
				for (let j = 0; j < menu.children[i].children.length; j++) {
	        	    evt(menu.children[i].children[j], 'contextmenu', e => {
	        	    	e.preventDefault();
        	    	});
		        }
	        }
			for (let i = 0; i < delMenu.children.length; i++) {
				for (let j = 0; j < delMenu.children[i].children.length; j++) {
	        	    evt(delMenu.children[i].children[j], 'contextmenu', e => {
	        	    	e.preventDefault();
        	    	});
		        }
	        }
			for (let i = 0; i < schedule.length; i++) {
				let doc = schedule[i];

				evt(doc, 'auxclick', e => {
					let ids = document.getElementsByClassName('toDay');
					let bool = true;
					
					for (let j = 0; j < ids.length; j++) {
						if (ids[j].className == doc.firstElementChild.className) {
							bool = false;
						}
			        }
					
					if (bool) {
						setEl(e);
					}
				});
	        }
			for (let i = 0; i < schedule.length; i++) {
				for (let j = 0; j < schedule[i].children.length; j++) {
					let doc = schedule[i].children[j];

					evt(doc, 'auxclick', e => {
						setEl_(e);
					});
		        }
	        }
			
			<%-- event --%>
			evt(id('.scheduleDiv'), 'contextmenu', click2);
			evt(id('.scheduleSide'), 'contextmenu', click2);
			evt(id('.mainBody'), 'click', e => {
				menuHide();
				if (e.target.getAttribute('use') == undefined) {
					menuHide2();
				}
			});
			evt(id('.topDiv'), 'contextmenu', () => {
				menuHide();
				menuHide2();
			});
			evt(window, 'keydown', keydown_);
			evt(menu, 'contextmenu', e => {
				e.preventDefault();
			});
			evt(delMenu, 'contextmenu', e => {
				e.preventDefault();
			});
			evt(menu, 'click', e => {
				let ids = e.target;
				if (getBol1(ids.id)) {
					
					let id = localStorage.getItem('elId');
					
					if (id != null) {
						let parent = document.getElementById(id);
						let el = getEl(ids.id);
						
						if (el != null && parent != null) {
							parent.appendChild(el);
							localStorage.removeItem('elId');
						}
					}
				}
			});
			evt(id('.mainBody'), 'auxclick', e => {
				if (e.target.getAttribute('use') != undefined) {
					e.preventDefault();
					localStorage.setItem('delId', e.target.id);
					click3(e);
					menuHide();
				}
			});
			evt(id('#del'), 'click', e => {
				if (e.target.getAttribute('use') == undefined) {
					e.preventDefault();
					
					let ids = localStorage.getItem('delId');
					let el = document.getElementById(ids);
					let par = id('#dels');
					
					if (id != null && el != null) {
						par.appendChild(el);
						par.removeChild(el);
						delMenu.style.display = 'none';
						localStorage.removeItem('delId');
					}
				}
			});
			
			<%-- function --%>
            function id(id) {
                return document.querySelector(id);
            }
            function evt(id, evt, fun) {
               	id.addEventListener(evt, fun);
            }
            function click2(e){
           		e.preventDefault();
           		if (e.target.getAttribute('use') == undefined) {
           			menuHide();
           			menuShow(e);
           		}
            }
            function menuShow(e){
            	menuHide();
            	menuHide2();
            	
            	let x = e.clientX;
            	let y = e.clientY;
            	
            	menu.style.left = x + 'px';
            	menu.style.top = y + 'px';
            	menu.style.display = 'block';
            }
            function menuHide(){
				menu.style.display = 'none';
            }
            <%-- delMenu --%>
            function click3(e){
           		e.preventDefault();
           		if (e.target.getAttribute('use') != undefined) {
           			menuShow2(e);
           		}
            }
            function menuShow2(e){
            	menuHide2();
            	
            	let x = e.clientX;
            	let y = e.clientY;
            	
            	delMenu.style.left = x + 'px';
            	delMenu.style.top = y + 'px';
            	delMenu.style.display = 'block';
            }
            function menuHide2(){
            	delMenu.style.display = 'none';
            }
            function keydown_(e){
            	if (menu.style.display == 'block' && (e.keyCode == 123 || e.keyCode == 107 || e.keyCode == 109)) {
           			e.preventDefault();
               		e.returnValue = false;
            	}
            }
            function getBol1(ids){
            	let bol = true;
            	
            	switch (ids) {
            	case 'hotel':
            		break;
            	case 'restaurant':
            		break;
            	case 'traffic':
            		break;
            	case 'text':
            		break;
            	default :
            		bol = false;
            	}
            	
            	return bol;
            }
            function setEl(e) {
           		localStorage.setItem('elId', e.target.id);
            }
            function setEl_(e) {
            	localStorage.setItem('elId', e.target.parentElement.id);
            }
            function getEl(id) {
            	let str = null;
            	let doc = null;
            	cnt++;
            	
            	switch (id) {
            	case 'hotel':
            		str = 'input';
            		doc = document.createElement(str);
            		break;
            	case 'restaurant':
            		str = 'input';
            		doc = document.createElement(str);
            		break;
            	case 'traffic':
            		str = 'input';
            		doc = document.createElement(str);
            		break;
            	case 'text':
            		str = 'input';
            		doc = document.createElement(str);
            		break;
            	}
            	
            	if (str != null) {
            		doc.setAttribute('class', id);
            		doc.setAttribute('use', true);
            		doc.setAttribute('id', 'target' + cnt);
            		
            		return doc;
            	}
            	
            	return str;
            }
		});
	</script>
</body>
</html>