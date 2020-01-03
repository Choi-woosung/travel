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
	background-image : url("/img/main/pattern.png");
}

</style>
</head>
<body>
<div class="nav-scroller bg-light border-bottom bg-light">
    <a class="nav-link active font-weight-bold logoText" href="#">ConsulTravel</a>
  	<nav class="nav nav-underline">
    <div class="dropdown first">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">프로젝트</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">페이지</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">편집</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도움말</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </div>
  </nav>
</div>
<div class="container-fluid m-content">
  <div class="row">
  	<div class="col-xl-10 border main-container">
  		<div class="innerpage bg-white">
  		ㄴㅇㅍㅇㄹasd 바껴라 좀
  		</div>
  	</div>
  	<div class="col sidebar">
  		<div class="container border-bottom">
  			아이콘 모음
  		</div>
  		<div class="container bg-info">
  			호텔 : 얼마
  			교통비 : 얼마
  			식당비 : 얼마
  			기타비용 : 얼마
  			가격 : 10000000원
  		</div>
  	</div>
  </div>
</div>
</body>
</html>