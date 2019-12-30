<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scheduleList</title>
<link rel="stylesheet" href="/css/w3.css" >
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
<style>
	*{box-sizing: border-box;}
	.container{
		width: 100%;
		height: 100%;
	}
	.searchbar{
		border: 1px solid black;
		height: 430px;
		margin-top: 20px;
	}
	.destination{
		height: 43px;
		border: 1px solid black;
		margin-left: 10px;
		margin-top: 20px;
		font-weight: bold;
	}
	.sortbar{
		heihgt: 58px;
		border: 1px solid black;
 		margin-left: 10px;
		margin-top: 10px;
/* 		padding: 10px; */
	}
	.sortbar li{
		vertical-align: middle;
		border-right: 1px solid black;
		margin-right: 10px;
		list-style: none;
		display: inline-block;
		padding: 10px;
	}
	.list{
		margin-left: 10px;
		margin-top: 10px;
	}
	.imgbox{
		height:300px;
	}
	.tripinfo{
		padding:10px;
	}
</style>
</head>
<body>
	<c:import url="/navigationBar.kit"></c:import>
	<div class="w3-container">
		<div class="searchbar w3-col m2">
			호텔검색
		</div>
		<h3 class="destination w3-col m2">
			${VO.sCountry}
		</h3>
		<ul class="sortbar w3-col m8 w3-ul w3-hoverable">
			<li style= "font-size: 20px;">정렬기준</li>
			<li>어떤거</li>
			<li>어떤거</li>
			<li>어떤거</li>
		</ul>
		<c:forEach var="data" items="${LIST}">
			<div class="list w3-col w3-border m8">
				<div class="imgbox w3-col w3-border m3">
					<img alt="mainimg" src="${data.sPic}" style="width: 100%; height: 100%;">
				</div>
				<div class="tripinfo w3-col m8">
					<h4>${data.sName}</h4>
					<h5>여행시작일: ${data.sSdate}</h5>
					<h5>여행종료일: ${data.sEdate}</h5>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>