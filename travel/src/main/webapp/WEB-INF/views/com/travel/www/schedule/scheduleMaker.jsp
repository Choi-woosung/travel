<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<title>ConsulTravel</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&sensor=false&libraries=places"></script>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
}

.nav-underline .nav-link {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: .875rem;
	color: #6c757d;
}

.nav-underline .nav-link:hover {
	color: #007bff;
}

.nav-underline .active {
	font-weight: 500;
	color: #343a40;
}
.nav-scroller {
	z-index : 10;
}
.first {
	margin-left : 50px;
}
.logoText {
	font-size : 20px;
	color : black;
}
.m-content {
	height : 90%;
}
.row {
	height : 100%;
}
.innerpage {
	height : 600px;
	width : 1200px;
}
.main-container {
	display : flex;
  align-items: center;
  justify-content: center;
  background : #f0f0f0;
}
.icons {
	width : 50px;
	height : 50px;
}
.searchBox {
	height : 700px;
}

</style>
</head>
<body>
<div class="nav-scroller bg-light border-bottom bg-light">
    <a class="nav-link active font-weight-bold logoText" href="/main.kit">ConsulTravel</a>
  	<nav class="nav nav-underline">
    <div class="dropdown first">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스케쥴</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">새 스케쥴 만들기</a>
          <a class="dropdown-item" href="#">스케쥴 저장하기</a>
          <a class="dropdown-item" href="#">스케쥴 불러오기</a>
          <a class="dropdown-item" href="#">스케쥴 삭제하기</a>
          <a class="dropdown-item" href="#">스케쥴이름 바꾸기</a>
          <a class="dropdown-item" href="#">스케쥴만들기 종료</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공유하기</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">웹으로 공유하기</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">편집</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">스케쥴 추가</a>
          <a class="dropdown-item" href="#">일자 추가/삭제</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도움말</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">튜토리얼</a>
          <a class="dropdown-item" href="#">버젼</a>
        </div>
    </div>
  </nav>
</div>
<div class="container-fluid m-content">
  <div class="row">
  	<div class="col-xl-10 border main-container">
  		<div class="innerpage bg-white">
  		 바뀌십니다.
  		</div>
  	</div>
  	<div class="col sidebar p-3">
  		<div class="list-group">
 			 <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/bus.png" class="icons">교통</a>
 			 <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/hotel.png" class="icons">숙박</a>
 			 <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/Restaurant.png" class="icons">식사</a>
 			 <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/text.png" class="icons">자유스케쥴</a>
  		</div>
  		<div class="container bg-info">
  			돈 얼마
  		</div>
  	</div>
  </div>
</div>
<div class="modal fade bd-example-modal-xl" id="exampleModalCenter" tabindex="1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content searchBox">
		<c:import url="/test/nearbysearch.kit"></c:import>
    </div>
  </div>
</div>

</body>
</html>