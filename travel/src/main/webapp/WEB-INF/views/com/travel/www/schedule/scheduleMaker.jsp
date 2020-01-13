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
	 overflow-y : auto;
    overflow-x:auto;
    white-space:nowrap;
  text-align: center;
	 padding : 50px;
}
.innerpage2 {
	width : 300px;
	height : 50px;
	display : inline-table;   
	margin : 20px;
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

/* 드래그 방지용 */
.no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}

/* 스케쥴 이름 수정 */

.nameEdit {
	display : flex;
	height : 43px;
}

.nameEditLeft{
	flex : 1;
}

.nameEditRight {
	flex : 9;
}

.scheduleName {
	display : none;
	border : 0px;
	border-bottom : 1px solid black;
	width : 90%;
	resize: none;
	overflow : hidden;
}

textarea:focus {
  outline: none;
}

input:focus {
	outline : none;
}




</style>
<script>
	var nameBool = false;

	$(function() {
		var statusCnt = 1;
		$('#dayCount_minus').click(function() {
			if(statusCnt == 1){
				return;
			}
			$('#d'+(statusCnt-1)).remove();
			   statusCnt--;
		});
		
		$('#dayCount_plus').click(function() {
			var scheduleDiv = document.createElement('div');
			var headContent = document.createTextNode(statusCnt + "일차");
			scheduleDiv.appendChild(headContent);
			scheduleDiv.setAttribute('class', 'innerpage2 bg-white shadow');
			scheduleDiv.setAttribute('draggable', 'false');
			scheduleDiv.setAttribute('id', 'd'+statusCnt);
			$('#dayCount').append(scheduleDiv);
			
			statusCnt++;
		});
		
		$('#dayCount_reset').click(function() {
			$('.innerpage2').remove();
				statusCnt = 1;
		});
		
		$('#nameEdit').click(function(){
			$('#scheduleName').css("display" , 'block');
			$('#scheduleNameDiv').css("display" , "none");
			$('#scheduleName').focus();
		});

		$("textarea[name=scheduleName]").keydown(function (key) {
			if(key.keyCode == 13){
				if($('#scheduleName').val() == ''){
					$('#scheduleNameDiv').text("제목 설정하기");
					$("#scheduleName").val('');
				} else {
					$('#scheduleNameDiv').text($("#scheduleName").val());
				}
				$('#scheduleName').css("display" , 'none');
				$('#scheduleNameDiv').css("display" , "block");
			}
		});
		/* $('#submitBtn').click(function(){
		    $("#form").each( function (index) {
		        $(this).find("input[name=pid]").attr("name", "Schedules[" + index + "].pid");
		        $(this).find("input[name=type]").attr("name", "Schedules[" + index + "].type");
		        $(this).find("input[name=placeName]").attr("name", "Schedules[" + index + "].placeName");
		        $(this).find("input[name=liCnt]").attr("name", "Schedules[" + index + "].liCnt");
		        $(this).find("input[name=placeAddress]").attr("name", "Schedules[" + index + "].placeAddress");
		        $(this).find("input[name=body]").attr("name", "Schedules[" + index + "].body");
		        $(this).find("input[name=price]").attr("name", "Schedules[" + index + "].price");
		        $(this).find("input[name=dayCount]").attr("name", "Schedules[" + index + "].dayCount");
		        $(this).submit();
		    });
		}); */

	});
	
	function allowDrop(ev) {
	  ev.preventDefault();
	}

	function drag(ev) {
	 ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
		if(event.dataTransfer.getData("text") != "subway_station" && event.dataTransfer.getData("text") != "lodging" && event.dataTransfer.getData("text") != "restaurant" && event.dataTransfer.getData("text") != "freeSchedule"){
			ev.preventDefault();
			return;
		}
	  document.getElementById('infobox').style.display = 'block';
	  var data = event.dataTransfer.getData("text");
	  var tf = getParents(ev.target);
	  var targetDiv;
	  if(tf.className == 'innerpage2 bg-white shadow'){
		  targetDiv = tf;
		  var liId = idGenerator(targetDiv);
		  var cnt = targetDiv.querySelectorAll('li').length + 1;
		  var dayCnt = liId.substring(1, liId.indexOf("li"));
		  var ulDiv;
		  if(targetDiv.querySelector('ul') == null){
			  var createUl = document.createElement('ul');
			  createUl.setAttribute('class', 'list-group');
			  targetDiv.appendChild(createUl);
			  ulDiv = targetDiv.querySelector('ul');
			  var licode = document.createElement('li');
			  licode.setAttribute('data-toggle' , 'modal');
			  licode.setAttribute('data-target' , '#dataModal');
			  licode.setAttribute('onclick', 'searchPlace("'+data+'", "'+liId+'", "'+cnt+'" , "'+dayCnt+'")');
			  licode.setAttribute('class', 'list-group-item list-group-item-action');
			  licode.setAttribute('id' , liId);
			  var textcode = document.createTextNode("+"); 
			  ulDiv.appendChild(licode);
			  licode.appendChild(textcode);
		  } else {
			  ulDiv = targetDiv.querySelector('ul');
			  var licode = document.createElement('li');
			  licode.setAttribute('data-toggle' , 'modal');
			  licode.setAttribute('data-target' , '#dataModal');
			  licode.setAttribute('class', 'list-group-item list-group-item-action');
			  licode.setAttribute('onclick', 'searchPlace("'+data+'", "'+liId+'", "'+cnt+'")');
			  licode.setAttribute('id' , liId);
			  var textcode = document.createTextNode("+"); 
			  ulDiv.appendChild(licode);
			  licode.appendChild(textcode);
		  }
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
	
	function idGenerator(e){
		var id = e.id;
		var cnt = e.querySelectorAll('li').length;
		var result = e.id+"li"+cnt;
		return result;
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
          <a class="dropdown-item" href="#">스케쥴이름바꾸기</a>
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
  		<form id="form" action="/schedule/test.kit" method="post" enctype="multipart/form-data">
  			<div class="innerpage bg-white shadow" id="dayCount" style="margin-top: -100px;" ondrop="drop(event)" ondragover="allowDrop(event)">
  			</div>
  		</form>
  	</div>
  	<div class="col p-4">
  		<div id="nameEdit" class="nameEdit">
  			<div class="nameEditLeft"><img src="/img/icon/document-text.svg"></div>
  			<div class="nameEditRight">
  				<span id="scheduleNameDiv" class="font-weight-bold mx-1">제목 설정하기</span>
  				<textarea name="scheduleName" id="scheduleName" class="scheduleName" rows="2"></textarea>
  			</div>
  		</div>
  		<hr>
  		<div class="btn_group text-center">
  			<p class="font-weight-bold">스케쥴 일 추가하기</p>
  			<button type="button" class="btn btn_outline_dark" id="dayCount_minus"> - </button>
  			<button type="button" class="btn btn_outline_dark" id="dayCount_plus"> + </button>
  			<button type="button" class="btn btn_outline_dark" id="dayCount_reset"> 전체삭제 </button>
  		</div>
  		<hr>
  		<div class="list-group" >
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="subway_station"><img src="/img/icon/bus.png" class="icon" >교통</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="lodging"><img src="/img/icon/hotel.png" class="icon">숙박</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="restaurant"><img src="/img/icon/Restaurant.png" class="icon">식사</a>
 			 <a href="#" class="list-group-item list-group-item-action icons" draggable="true" ondragstart="drag(event)" id="freeSchedule"><img src="/img/icon/text.png" class="icon">자유스케쥴</a>
  		</div>
  		<hr>
		<div class="container bg-white">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">교통비 : <span id="trafficPrice" class="prices">0</span></li>
				<li class="list-group-item">식비 : <span id="eatPrice" class="prices">0</span></li>
				<li class="list-group-item">숙박비 : <span id="lodgingPrice" class="prices">0</span></li> 
				<li class="list-group-item">기타비용 : <span id="otherPrice" class="prices">0</span></li>
				<li class="list-group-item">총액 : <span id="totalPrice" class="prices">0</span></li>
			</ul>
		</div>
		<div id="flieUpload" class="nameEdit">
			<input type="file" name="scheduleImg" accept="image/gif, image/jpeg, image/png" multiple="multiple">
  		</div>
		<div class="container">
			<button id="submitBtn">누르셈</button>
		</div>
	</div>
  </div>
</div>
<textarea name="scheduleBody" class="d-none">임시데이터 입니다</textarea>
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
<script>
	document.getElementById('submitBtn').addEventListener('click', e => {
		alert("버튼 작동");
		let data = new FormData();
		let nameValue = ['pid', 'type', 'placeName', 'liCnt', 'placeAddress', 'body', 'price', 'dayCount', 'placeLat' , 'placeLng'];

		for (var i = 0; i < nameValue.length; i++) {
			document.querySelectorAll("input[name="+nameValue[i]+"]").forEach(function(e, index){
				e.name = "Schedules[" + index + "]."+nameValue[i];
				data.append(e.name, e.value);
			});
		}
		var nameData = document.getElementById("scheduleNameDiv").value;
		var bodyData = document.getElementById("scheduleBody").value;
		data.append("scheduleName", nameData);
		data.append("scheduleBody", bodyData);
		document.querySelector("input[type=file]").files.forEach(function(e, index){
			data.append("scheduleImg", e);
		});
		
		let options = {
			method: 'POST',
			body: data
		};

		fetch("/scheduleMaker/test.kit", options);
	});
</script>
</body>
</html>