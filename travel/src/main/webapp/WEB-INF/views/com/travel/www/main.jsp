<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="js/j-query-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>Document</title>

<style>
.jumbotron {
	background-image: url("/img/main/hongkong.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: right center;
	height: 800px;
}

.mainSearch {
	width: 400px;
	height: 500px;
	background: white;
	padding: 20px;
	position: relative;
	left: -200px;
	top: 50px;
}

.form-control {
	width: 350px;
}

.mainSubmit {
	float: right;
	background:
}

.disabled {
	color: white;
	margin-left: 50px;
}

.ui-datepicker select.ui-datepicker-month{
	margin-left: 4%;
	padding-bottom: 1.6%;
}
.ui-datepicker select.ui-datepicker-year{
	padding-top: 1.6%;
	
}
.ui-widget-header {
	background: white;

}
.ui-state-default, 
.ui-widget-content .ui-state-default, 
.ui-widget-header .ui-state-default, 
.ui-button, html .ui-button.ui-state-disabled:hover, 
html .ui-button.ui-state-disabled:active {
    border: 1px solid white;
    text-align: center;
    background: white;
    font-weight: normal;
    color: #454545;
}
.city{
	width : 359px;
}
.peopleClick{
	width: 359px;
	height : 200px;
	background : white;
	display : none;
}
.city{
   width : 359px;
}
.peopleClick{
   width: 359px;
   height : 120px;
   background : white;
   display : none;
   position : absolute;
   border : 1px solid gray;
   border-radius : 3px;
   padding : 20px;
   margin-top : 2px;
}

.totalChange{
	margin-bottom : 20px;
}

.left, .right, .total{
	width : 13px;
	height : 20px;
	background : white;
	float : right;
}
.headertext {
	color : white;
	font-size : 25px;
	float : right;
	font-weight : bold;
	margin-left : 30px;
}
.barcolor {
	background : #222222;
}


</style>
<script>
$(function() {
	$('#login').click(function () {
		$(location).attr('href', '/member/login.kit')
	});
	
	$('#join').click(function () {
		$(location).attr('href', '/member/join.kit')
	});
	
	$('#make').click(function () {
		$(location).attr('href', '/schedule/scheduleUp.kit')
	});
	
	/* 인원수 클릭 시 인원 수 창 뜨고 없어지는 기능 */
	$("#people").focusin(function(){
	    $(".peopleClick").css("display" , "block");
	});
	
/* 	캘린더  */
	$('#calendarArea1').click(function(e) {
		e.preventDefault();
		$('#startDatePicker').focus();
	});
	$('#calendarArea2').click(function(e) {
		e.preventDefault();
		$("#endDatePicker").focus();
	});
	//예약발행 달력_시작 
	$('#startDatePicker').datepicker({	
		
				dateFormat : 'yy-mm-dd',
				showMonthAfterYear : true,
				changeMonth : true,
				changeYear : true,
				numberOfMonths : 1,
				
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				minDate : -0
				//오늘날짜 이후부터만 설정되게 
				,
				onClose : function(selectedDate) {
					$('#endDatePicker').datepicker("option", "minDate",
							selectedDate);
				}

			});
	//기간발행_끝 
	$("#endDatePicker").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				showMonthAfterYear : true,
				changeMonth : true,
				changeYear : true,
				numberOfMonths : 1,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월','8월', '9월', '10월', '11월', '12월' ],
				minDate : -0
				//오늘날짜 이후부터만 설정되게 
				,
				onClose : function(selectedDate) {
					$('#startDatePicker').datepicker("option", "maxDate",
							selectedDate);
				},
				
			});
	});
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Travel</a>
	<ul>
		<li><a>로그인</a></li>
		<li><a>회원가입</a></li>
	</ul>
</nav>
<div class="jumbotron">
	<div class="container">
		<div class="mainSearch">
			<h3>떠나고 싶은 곳 어디든</h3>
			<h2>지금 검색해보세요.</h2>
			<form method="POST" action="/schedule/scheduleLi.kit">
			<div class="form-group">
				<label for="inputArea"> 여행가는 도시 </label> 
				<input type="text" class="form-control city" id="inputArea" name="sCountry" placeholder="떠나실 장소를 검색해보세요">
			</div>
			<div class="row">
				<div class="form-group col-md-6 ">
					<label for="calendarArea" id="calendarArea1"> 출발일 선택 </label> 
					<input type="text" class="form-control col-md-12" id="startDatePicker" name="sSdate" placeholder="언제부터 ?">
				</div>
				<div class="form-group col-md-6">
					<label for="calendarArea"> 도착일 선택 </label>
					<input type="text" class="form-control col-md-12" id="endDatePicker" name="sEdate" placeholder="언제까지 ?">
				</div>
			</div>
			<div class="form-group">
				<label for="inputArea"> 인원수 </label> 
				<input type="text" class="form-control city" id="people" name="sPtotal" placeholder="인원수를 선택해주세요">
				<div class="peopleClick">
					성인 
                  		<button class="left total"></button>
                	  	<input type="text" class="col-md-1 total" id="adult" value="0">
                	  	<button class="right total totalChange"></button>
                	  	<br>
               		 아이
                  	 	<button class="left total"></button>
                  	 	<input type="text" class="col-md-1 total" id="baby" value = "0">
                   	<button class="right total"></button>
				</div>
			</div>
			<button class="btn btn-default" id="make" type="button">스케쥴 만들기</button>
			<button type="submit" class="btn btn-default mainSubmit">검색</button>
			</form>
		</div>
	</div>	
</div>
<section>
	<div class="container">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis. Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus. Pulvinar elementum integer enim neque volutpat ac.

Senectus et netus et malesuada. Nunc pulvinar sapien et ligula ullamcorper malesuada proin. Neque convallis a cras semper auctor. Libero id faucibus nisl tincidunt eget. Leo a diam sollicitudin tempor id. A lacus vestibulum sed arcu non odio euismod lacinia. In tellus integer feugiat scelerisque. Feugiat in fermentum posuere urna nec tincidunt praesent. Porttitor rhoncus dolor purus non enim praesent elementum facilisis. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Et malesuada fames ac turpis egestas sed. Sit amet nisl suscipit adipiscing bibendum est ultricies. Arcu ac tortor dignissim convallis aenean et tortor at. Pretium viverra suspendisse potenti nullam ac tortor vitae purus. Eros donec ac odio tempor orci dapibus ultrices. Elementum nibh tellus molestie nunc. Et magnis dis parturient montes nascetur. Est placerat in egestas erat imperdiet. Consequat interdum varius sit amet mattis vulputate enim.

Sit amet nulla facilisi morbi tempus. Nulla facilisi cras fermentum odio eu. Etiam erat velit scelerisque in dictum non consectetur a erat. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Ut sem nulla pharetra diam. Fames ac turpis egestas maecenas. Bibendum neque egestas congue quisque egestas diam. Laoreet id donec ultrices tincidunt arcu non sodales neque. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Faucibus interdum posuere lorem ipsum dolor sit.</div>
</section>
<hr>
<footer>
	<div class="container">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit. Ornare arcu dui vivamus arcu felis. Egestas integer eget aliquet nibh praesent. In hac habitasse platea dictumst quisque sagittis purus. Pulvinar elementum integer enim neque volutpat ac.

Senectus et netus et malesuada. Nunc pulvinar sapien et ligula ullamcorper malesuada proin. Neque convallis a cras semper auctor. Libero id faucibus nisl tincidunt eget. Leo a diam sollicitudin tempor id. A lacus vestibulum sed arcu non odio euismod lacinia. In tellus integer feugiat scelerisque. Feugiat in fermentum posuere urna nec tincidunt praesent. Porttitor rhoncus dolor purus non enim praesent elementum facilisis. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Et malesuada fames ac turpis egestas sed. Sit amet nisl suscipit adipiscing bibendum est ultricies. Arcu ac tortor dignissim convallis aenean et tortor at. Pretium viverra suspendisse potenti nullam ac tortor vitae purus. Eros donec ac odio tempor orci dapibus ultrices. Elementum nibh tellus molestie nunc. Et magnis dis parturient montes nascetur. Est placerat in egestas erat imperdiet. Consequat interdum varius sit amet mattis vulputate enim.

Sit amet nulla facilisi morbi tempus. Nulla facilisi cras fermentum odio eu. Etiam erat velit scelerisque in dictum non consectetur a erat. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Ut sem nulla pharetra diam. Fames ac turpis egestas maecenas. Bibendum neque egestas congue quisque egestas diam. Laoreet id donec ultrices tincidunt arcu non sodales neque. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Faucibus interdum posuere lorem ipsum dolor sit.</div>
</footer>
</body>
</html>