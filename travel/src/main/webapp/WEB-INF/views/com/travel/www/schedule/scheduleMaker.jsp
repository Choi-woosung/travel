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
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
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
	 overflow-y:hidden;
    overflow-x:auto;
    white-space:nowrap;
  text-align: center;
	 
}
.innerpage2 {
	height: 300px;
	width : 300px;
	 display:inline-block;
    overflow:auto;
    
    text-align: center;
    margin: 150px 10px auto;
    
}
.main-container {
	display : flex;
  align-items: center;
  justify-content: center;
  background : #f0f0f0;
}
.icon {
	width : 50px;
	height : 50px;
}
.searchBox {
	height : 700px;
	overflow : hidden;
}
.credel{
	display: none;
}
</style>
<script>

	$(function() {
		var status = 1;

		$('#sName').click(function () {
			$('#sNText').css('display', 'block');
			$('#sName').css('display', 'none');
		});
		
		$('#didi1').click(function () {
			if(status == 1){
				return;
			}
		$('#d'+(status-1)).remove();
			   status--;
		});
		
		$('#didi2').click(function () {
			var div = document.createElement('div');
			var headContent = document.createTextNode(status + "일차입니다");
			div.append(headContent);
			div.setAttribute('class', 'innerpage2 bg-white shadow');
			div.setAttribute('id', 'd'+status);
			div.setAttribute('ondrop', 'drop(event)');
			$('#dldl').append(div);
			status++;
		});
		
		$('#didi3').click(function () {
			$('.innerpage2').remove();
				status = 1;
		});
		$('#didi').click(function () {
			$('.credel').css('display', 'block');
		});
		$('#sNText').keydown(function(e) {
			if(e.keyCode == '13'){
			$('#sNText').css('display', 'none');
			$('#sName').css('display', 'block');
			$('#sName').text($('#sNText').val());
			}
			
		});
	});
</script>
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
          <a class="dropdown-item" href="/main.kit">스케쥴만들기 종료</a>
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
          <a class="dropdown-item" id="didi" href="#">일자 추가/삭제</a>
        </div>
    </div>
    <div class="dropdown">
    <a class="nav-link dropdown-toggle" role="button" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도움말</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01" >
          <a class="dropdown-item" href="#">튜토리얼</a>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#version">버젼</a>
        </div>
    </div>
  </nav>
</div>
<div class="container-fluid m-content">
  <div class="row">
  	<div class="col-xl-10 border main-container row">
  		<a class="container col-xl-9" id="sName" href="#" style="height: 40px; font-size: 30px;">스케줄 이름<img src="/img/icon/pencil.svg"></a>
  		
  		<input type="text" id="sNText" class="container col-xl-9" style="height: 40px;display: none;">
  		<button type="button" class="btn credel" id="didi1"> - </button>
  		<button type="button" class="btn credel" id="didi2"> + </button>
  		<button type="button" class="btn credel" id="didi3"> 전체삭제 </button>

  		<div class="innerpage bg-white shadow" id="dldl" style="margin-top: -100px;" dropzone="true">
  		</div>
  	</div>
  	<div class="col sidebar p-3">
  		<div class="list-group " >
 			 <a href="#" class="list-group-item list-group-item-action icons" id="subway_station" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/bus.png" class="icon" >교통</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" id="lodging"  data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/hotel.png" class="icon">숙박</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" id="restaurant" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/Restaurant.png" class="icon">식사</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" id="type" data-toggle="modal" data-target="#exampleModalCenter"><img src="/img/icon/text.png" class="icon">자유스케쥴</a>
  		</div>
  		<hr>
				<div class="container bg-white">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">교통비 : </li>
						<li class="list-group-item">식비 : </li>
						<li class="list-group-item">숙박비 : </li>
						<li class="list-group-item">기타비용 : </li>
						<li class="list-group-item">총액 :  </li>
					</ul>
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
<div class="modal fade" id="version" tabindex="-1" role="dialog" aria-labelledby="versionTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
     <button type="button" class="close btn" data-dismiss="modal" aria-label="Close" style="text-align: right;">&times;</button>
      <div class="modal-header ">
      	<div class="mx-auto">
    	  <img src="/img/main/favicon2.ico"style="width: 100px; height: 100px;">
    	</div>
    </div>
      <div class="modal-body">
		<h5>All material © 2019 – 2019 MyTravel Company Pte. Ltd., AllRights Reserved.</h5>

		마이 트레블은 온라인 여행에 관한 각종 정보를 한 곳에서 찾아볼 수 있고 스케쥴을 짤 수 있는 사이트 입니다. sdfsdfsdf

		해당 사이트에 등록된 모든 정보는 MyTravel Company 의 지적 자산이므로 당사의 협의없는 상업적 사용은 불허합니다.
      </div>
    </div>
  </div>
</div>
</body>
</html>