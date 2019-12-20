<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scheduleList</title>
<link rel="stylesheet" href="/css/w3.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('th').attr('class', 'w3-xlarge w3-center w3-col m4');
		$('td').attr('class', 'w3-xlarge w3-center w3-col m4');
		
		//상세보기
		$('.simpleInfo').click(function(){
			$('#detailInfo').css('display', 'block');
		});
		
		//상세보기 종료
		$('#exit').click(function(){
			$('#detailInfo').css('display', 'none');
		});
	});
</script>
<style>
	*{box-sizing: border-box;}
	body{
		background-image: url("/img/schedule/scheduleList_background.jpg");
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
		-ms-background-size: cover;
   	 	-o-background-size: cover;
    	-moz-background-size: cover;
	    -webkit-background-size: cover;
		background-repeat: no-repeat;
	}
	.container{
		width: 100%;
		height: 100%;
	}
	#detailInfo{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -57%);
		width: 75%;
		height: 70%;
  		display : none; 
	}
</style>
</head>
<body>
	<div class="w3-container container">
		<div class="w3-col m1"><p></p></div>
		<h1 class="w3-col m10 w3-center w3-text-white w3-padding" style="font-weight: bold; background-color: #203767;">스케쥴 리스트</h1>
		<div class="w3-bar w3-margin-bottom w3-col">
		<div class="w3-col m1"><p></p></div>
		  <a href="/main.kit" class="w3-bar-item w3-button w3-padding w3-text-white w3-col m5 w3-xlarge" style="background-color: #203767;">Home</a>
		  <a href="/schedule/scheduleUp.kit" class="w3-bar-item w3-button w3-text-white w3-padding w3-col m5 w3-xlarge" style="background-color: #203767;">스케쥴 등록</a>
		</div>
		<div class="w3-col m1"><p></p></div>
		<table class="w3-table-all w3-col m10 w3-hoverable">
			<thead>
				<tr class="w3-dark-gray">
					<th>스케쥴번호</th>
					<th>스케쥴이름</th>
					<th>예상금액</th>
				</tr>
			</thead>
			<c:forEach var="data" items="${LIST}">
			<tr class="simpleInfo">
				<td>${data.sNo}</td>
				<td>${data.sName}</td>
				<td>400,000원</td>
			</tr>
			</c:forEach>
		</table>
		<div class="w3-center">
			<div class="w3-bar w3-round w3-margin-top" style="background-color: #203767;">
				<a href="#" class="w3-bar-item w3-button w3-text-white">&laquo;</a>
				<a href="#" class="w3-bar-item w3-button w3-text-white">1</a>
				<a href="#" class="w3-bar-item w3-button w3-text-white">2</a>
				<a href="#" class="w3-bar-item w3-button w3-text-white">3</a>
				<a href="#" class="w3-bar-item w3-button w3-text-white">4</a>
				<a href="#" class="w3-bar-item w3-button w3-text-white">&raquo;</a>
			</div>
		</div>
	</div>
	<div id="detailInfo" class="w3-modal-content">
		<header class="w3-container w3-text-white" style="background-color: #8FCEFF;">
		<span id="exit" class="w3-button w3-display-topright">&times;</span>
		<h2 class="w3-center" style="font-weight: bold;">스케쥴 상세보기</h2>
		</header>
		<div class="w3-container">
			<h4 class="w3-center">스케쥴 제목</h4>
			<p>여행시작날짜</p>
			<p>여행종료날짜</p>
		</div>
	</div>
</body>
</html>