<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- meta --%>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<%-- CSS --%>

<%-- Script --%>

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
	}
	.mainBody{
		background-color: rgb(51, 51, 51);
	}
	<%-- schedule --%>
	.scheduleDiv{
		width: 85%;
		height: 100vh;
		padding-top: 48px;
	}
	.schedule{
		display: block;
		width: 1200px;
		min-height: 800px;
		height: auto;
		background-color: #d9e1e8;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 48px;
		border-radius: 16px;
	}
	.toDay{
		font-size: 2rem;
		user-select: none;
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
	<%-- menu --%>
	.menu li input{
		display: block;
		width: 128px;
		height: 64px;
		border-radius: 16px;
		border: 1px solid rgb(51, 51, 51);
		background-color: #ffffff;
		font-size: 1.5rem;
	}
</style>
</head>
<%-- body --%>
<body class="mainBody">
	<%-- scheduleMain --%>
	<ul class="scheduleDiv">
		<c:forEach begin="0" end="${LIST.sDay}" varStatus="data">
		<li class="schedule" id="day${data.count}">
			<div class="toDay">Day ${data.count}</div>
			<ul class="menu">
				<li>
					<input type="button" class="hotel" value="호텔">				
				</li>
				<li>
					<input type="button" class="traffic" value="교통">
				
				</li>
				<li>
					<input type="button" class="restaurant" value="식당">		
				</li>
			</ul>
		</li>
		</c:forEach>
	</ul>
	
	<%-- scheduleSide --%>
	<div class="scheduleSide"></div>
	   
	<%-- script --%> 
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded',()=>{
			const schedule = document.getElementsByClassName('schedule');
			
			for (let i=0; i<schedule.length; i++){
				schedule[i].addEventListener('click',e=>{
					const target = e.target;
					const cls = target.className;
					
					console.log(cls); 
				});
			}
		});
	</script>
</body>
</html>