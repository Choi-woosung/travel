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
		<h1 class="w3-col w3-center w3-text-white w3-padding" style="font-weight: bold; background-color: #203767;">스케쥴 리스트</h1>
		<div class="w3-bar w3-margin-bottom w3-col">
		<div class="w3-col m1"><p></p></div>
		  <a href="/main.kit" class="w3-bar-item w3-button w3-padding w3-text-white w3-col m5 w3-xlarge" style="background-color: #203767;">Home</a>
		  <a href="/schedule/scheduleUp.kit" class="w3-bar-item w3-button w3-text-white w3-padding w3-col m5 w3-xlarge" style="background-color: #203767;">스케쥴 등록</a>
		</div>
		<div class="w3-col m1"><p></p></div>
		<c:forEach var="data" items="${LIST}">
			<div class="w3-col m10 w3-border">
				<img class="w3-col m4 w3-padding" alt="해당여행사진" src="/img/main/hongkong.jpg" style="width: 400px; height: 400px;">
				<div class="w3-col m8">
					<p class="w3-xxlarge">${data.sName}</p>
					<p class="w3-large">여행시작일 : ${data.sSdate}</p>
					<p class="w3-large">여행종료일 : ${data.sEdate}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>