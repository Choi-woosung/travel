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
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
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
	height : 700px;
	width : 1200px;
	 overflow-y:hidden;
    overflow-x:auto;
    white-space:nowrap;
  text-align: center;
	 
}
.innerpage2 {
	width : 300px;
	height : 50px;
	display : inline-block;
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
.no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}


</style>
<script>

	$(function() {
		var status = 1;
		$('#dayCount_minus').click(function() {
			if(status == 1){
				return;
			}
			$('#d'+(status-1)).remove();
			   status--;
		});
		
		$('#dayCount_plus').click(function() {
			var scheduleDiv = document.createElement('div');
			var headContent = document.createTextNode(status + "일차");
			scheduleDiv.appendChild(headContent);
			scheduleDiv.setAttribute('class', 'innerpage2 bg-white shadow');
			scheduleDiv.setAttribute('draggable', 'false');
			scheduleDiv.setAttribute('id', 'd'+status);
			$('#dayCount').append(scheduleDiv);
			
			status++;
		});
		
		$('#dayCount_reset').click(function() {
			$('.innerpage2').remove();
				status = 1;
		});
	});
	
	
	function allowDrop(ev) {
	  ev.preventDefault();
	}

	function drag(ev) {
	 ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	  console.log(data);
	  var data = event.dataTransfer.getData("text");
	  var tf = getParents(ev.target);
	  var targetDiv;
	  if(tf.className == 'innerpage2 bg-white shadow'){
		  targetDiv = tf;
		  var acode = document.createElement('li');
		  var divcode = document.createElement('ul');
		  divcode.setAttribute('class' , 'list-group');
		  divcode.setAttribute('data-toggle', 'modal');
		  divcode.setAttribute('data-target', '#dataModal'); 
		  divcode.setAttribute('onclick', 'searchPlace("'+data+'")');
		  divcode.setAttribute('draggable', 'false');
		  acode.setAttribute('class', 'list-group-item');
		  acode.setAttribute('draggable', 'false');
		  var textcode = document.createTextNode("+"); 
		  divcode.appendChild(acode);
		  acode.appendChild(textcode);
		  targetDiv.appendChild(divcode);
	  }
	}
	
	function getParents(e){
		var tf = false;
		var parentData = e;
		var tempNode;
		while(parentData){
			tempNode = parentData;
			if(parentData.className == 'innerpage2 bg-white shadow'){
				tf = true;
				break;
			};
			parentData = tempNode.parentNode;
		}
		if(tf == true){
			return parentData;
		} else {
			return tf;
		}
	}
	
</script>
</head>
<body class="no-drag">
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
          <a class="dropdown-item" id="dayCount_nav" href="#">일자 추가/삭제</a>
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
  	<div class="col-xl-10 border main-container">
<!--   		<a class="container col-xl-9" id="sName" href="#" style="height: 40px; font-size: 30px;">스케줄 이름<img src="/img/icon/pencil.svg"></a>
  		
  		<input type="text" id="sNText" class="container col-xl-9" style="height: 40px;display: none;"> -->
  		<div class="innerpage bg-white shadow" id="dayCount" style="margin-top: -100px;" ondrop="drop(event)" ondragover="allowDrop(event)">
  		</div>
  	</div>
  	<div class="col p-4">
  		<div class="btn_group text-center">
  			<p class="font-weight-bold">스케쥴 일 추가하기</p>
  			<button type="button" class="btn btn_outline_dark" id="dayCount_minus"> - </button>
  			<button type="button" class="btn btn_outline_dark" id="dayCount_plus"> + </button>
  			<button type="button" class="btn btn_outline_dark" id="dayCount_reset"> 전체삭제 </button>
  		</div>
  		<hr>
  		<div class="list-group" >
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="subway_station" data-toggle="modal" data-target="#dataModal"><img src="/img/icon/bus.png" class="icon" >교통</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="lodging"  data-toggle="modal" data-target="#dataModal"><img src="/img/icon/hotel.png" class="icon">숙박</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="restaurant" data-toggle="modal" data-target="#dataModal"><img src="/img/icon/Restaurant.png" class="icon">식사</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="type" data-toggle="modal" data-target="#dataModal"><img src="/img/icon/text.png" class="icon">자유스케쥴</a>
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
<div class="modal fade bd-example-modal-xl" id="dataModal" tabindex="1" role="dialog" aria-labelledby="dataModalTiTle" aria-hidden="true">
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