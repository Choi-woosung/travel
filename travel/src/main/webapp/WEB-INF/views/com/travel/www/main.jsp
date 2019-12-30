	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<title>ConsulTravel</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="js/j-query-3.4.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&libraries=places"></script>
<title>My Travel</title>
  
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

.ui-datepicker select.ui-datepicker-month {
	margin-left: 4%;
	padding-bottom: 1.6%;
}

.ui-datepicker select.ui-datepicker-year {
	padding-top: 1.6%;
}

.ui-widget-header {
	background: white;
}

.ui-state-default, .ui-widget-content .ui-state-default,
	.ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover,
	html .ui-button.ui-state-disabled:active {
	border: 1px solid white;
	text-align: center;
	background: white;
	font-weight: normal;
	color: #454545;
}

.city {
	width: 359px;
}

.pCount {
	width: 359px;
	height: 120px;
	background: white;
	position: absolute;
	border: 1px solid gray;
	border-radius: 3px;
	padding: 10px;
	margin-top: 2px;
	display: none;
}

.pCount.view {
	display: block;
}

.totalChange {
	margin-bottom: 20px;
}

.left, .right, .total {
	width: 13px;
	height: 20px;
	background: white;
	float: right;
}

.barcolor {
	background: #222222;
}

.nav-link {
	font-size: 20px;
}

.adult {
	display: flex;
	font-size: 15px;
	justify-content: space-between;
}

.count {
	display: flex;
	font-size: 15px;
	justify-content: space-between;
	
}

.section {
	width: 400px;
	text-align: center;
	height: auto;
	background: white;
	padding: 20px;
}
.pbtn {
	border:none;
}
.leftBtn1{
	position: relative;
	top: -10px;
	left: 5px;
}
.leftBtn2{
	position: relative;
	top: -11px;
	left: 11px;
}
.topIpt{
	position: relative;
	top: -9px;
	left: 2px;
	width: 32px;
	text-align: center;
}
.bottomIpt{
	position: relative;
	top: -10px;
	left: 5px;
	width: 32px;
	text-align: center;
}
.rightBtn1{
	position: relative;
	top: -10px;
	left: 5px;
}
.rightBtn2{
	position: relative;
	top: -11px;
	left: 5px;
}
.confirmBtn{
	position: relative;
	top: -15px;
	left: 0px;
}
.topAdult{
	position: relative;
	top: 0px;
	left: 0px;
}
.countAdult{
	position: relative;
	top: -7px;
	left: 0px;
}

</style>
<script>
	$(function() {
		$('#login').click(function() {
			$(location).attr('href', '/member/login.kit');
		});

		$('#logout').click(function() {
			$(location).attr('href', '/www/member/logout.kit');
		});

		$('#join').click(function() {
			$(location).attr('href', '/member/join.kit');
		});
		
		$('#test').click(function(){
			$(location).attr('href', '/hotelSearch.kit');
		});
		

		/* 인원수 클릭 시 인원 수 창 뜨고 없어지는 기능 */
		$('#people').click(function() {
			$('.pCount').addClass('view');
		});

		$('body').on('click', function(e) {
			var pClass = $(e.target).hasClass('city');
			var psClass = $(e.target).parents().hasClass('tCount');

			if (!pClass && !psClass) {
				$('.pCount').removeClass('view');
			} else if (psClass) {
				return false;
			}
		});
		/* 	캘린더  */
		$('#calendarArea1').click(function(e) {
			e.preventDefault();
			$('#sSdate').focus();
		});
		$('#calendarArea2').click(function(e) {
			e.preventDefault();
			$("#sEdate").focus();
		});
		//예약발행 달력_시작 
		$('#sSdate').datepicker(
				{

					dateFormat : 'yy/mm/dd',
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					numberOfMonths : 1,

					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					minDate : -0
					//오늘날짜 이후부터만 설정되게 
					,
					onClose : function(selectedDate) {
						$('#sEdate').datepicker("option", "minDate", "maxDate",
								selectedDate);
					}

				});
		//기간발행_끝 
		$("#sEdate").datepicker(
				{
					dateFormat : 'yy/mm/dd',
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					numberOfMonths : 1,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					minDate : -0
					//오늘날짜 이후부터만 설정되게 
					,
					onClose : function(selectedDate) {
						$('#sSdate').datepicker("option", "minDate", "maxDate",
								selectedDate);
					},

				});

	

		// 인원수 기능 함수 	
		var a = 0;
		var b = 0;
		$('#cCount').val(a);
		$('#aCount').val(b);
		$('.cbtn').click(function() {
			var tmp = $(this).attr('id');
			var sp = $('#startbtn').html();
			var rp = $('#endbtn').html();
			var nCount = $(this).text();

			if (nCount != sp || nCount != rp) {
				$('#cCount').val();
			}
			if (nCount == sp) {
				if (a == 0) {
					return;
				}
				a--;
				$('#cCount').val(a);
				$('#people').val('성인 : ' + a + ' 어린이 : ' + b);

			}
			if (nCount == rp) {
				if (a == 99) {
					return;
				}
				a++;
				$('#cCount').val(a);
				$('#people').val('성인 : ' + a + ' 어린이 : ' + b);
			}
		});
		
		$('.abtn').click(function() {
			var sp = $('#startbtn').html();
			var rp = $('#endbtn').html();
			var nCount = $(this).text();

			var aCount = $('#aCount').text(b);
			if (nCount != sp || nCount != rp) {
				$('#aCount').val();
			}
			if (nCount == sp) {
				if (b == 0) {
					return;
				}
				b--;
				$('#aCount').val(b);
				$('#people').val('성인 : ' + a + ' 어린이 : ' + b);
			}
			if (nCount == rp) {
				if (b == 99) {
					return;
				}

				b++;
				$('#aCount').val(b);
				$('#people').val('성인 : ' + a + ' 어린이 : ' + b);
			}
		});
		
		$('.exbtn').click(function () {

			$('.pCount').removeClass('view');
			
		})
		
			
		$('#search').click(function() {
			$('#adult12').val(a);
			$('#child12').val(b);
			
					var formid = document.myform;
						$('#frm').attr('action', '/schedule/scheduleList.kit');
						$('#frm').submit();
				});
		
	});
	
	
	function getmake() {
		var formid = document.myform;
		if (formid.sCountry.value == "") {
			formid.sCountry.focus();
			alert("여행 가실 곳을 입력해주세요");
			return;
		} else if (formid.sSdate.value == "") {
			alert("출발일을 입력해주세요");
			formid.sSdate.focus();
			return;
		} else if (formid.sEdate.value == "") {
			alert("도착일을 입력해주세요");
			formid.sEdate.focus();
			return;
		} else {
			$('#frm').attr('action', '/schedule/scheduleUp.kit');
			$('#frm').submit();
		}
		
	};

	
	/* 	function getsearch() {
	 var formid = document.myform;
	 if (formid.sCountry.value == "") {
	 formid.sCountry.focus();
	 alert("여행 가실 곳을 입력해주세요");
	 return;
	 } else if (formid.sSdate.value == "") {
	 alert("출발일을 입력해주세요");
	 formid.sSdate.focus();
	 return;
	 } else if (formid.sEdate.value == "") {
	 alert("도착일을 입력해주세요");
	 formid.sEdate.focus();
	 return;
	 } else {
	 $('#frm').attr('action', '/schedule/scheduleList.kit');
	 $('#frm').submit();
	 }; */
</script>
<script>
	// 구글 맵 api 자동완성기능 //
	$(document).ready(
			function() {
				var autocomplete;
				var options = {
					types : [ 'geocode' ]
				};
				autocomplete = new google.maps.places.Autocomplete(document
						.getElementById('inputArea'), options);
			});
</script>
</head>
<body>
	<header>
		<c:import url="/navigationBar.kit"></c:import>
	</header>
	<div class="jumbotron">
		<div class="container">
			<div class="mainSearch">
				<h3>떠나고 싶은 곳 어디든</h3>
				<h2>지금 검색해보세요.</h2>
				<form method="POST" name="myform" id="frm">
					<div class="form-group">
						<label for="inputArea"> 여행가는 도시 </label> <input type="text"
							class="form-control city" id="inputArea" name="sCountry"
							placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
					</div>
					<div class="row">
						<div class="form-group col-md-6 ">
							<label for="calendarArea" id="calendarArea1"> 출발일 선택 </label> <input
								type="text" class="form-control col-md-12" id="sSdate"
								name="Sdate" placeholder="언제부터 ?" autocomplete="off">
						</div>
						<div class="form-group col-md-6">
							<label for="calendarArea"> 도착일 선택 </label> <input type="text"
								class="form-control col-md-12" id="sEdate" name="Edate"
								placeholder="언제까지 ?" autocomplete="off">

						</div>
					</div>
					<div class="form-group tCount confirmDiv">
						<label for="inputArea"> 인원수 </label> <input type="text"
							class="form-control city" id="people" placeholder="인원수를 선택해주세요" autocomplete="off">
						<div class="pCount" id="pCount">
							<div class="adult topAdult">
								<label> <span class="totalcount">성인</span>
								</label>

								<button class="cbtn ml-4 btn leftBtn1" id="startbtn" >&laquo;</button>
								<input type="text" class="pbtn topIpt" id="cCount">
								<button class="cbtn btn rightBtn1" id="endbtn" >&raquo;</button>
				
							</div>
							<div class="count">
							<label> <span class="totalcount countAdult">어린이</span>
							</label>
								<button class="abtn btn leftBtn2" id="startbtn" >&laquo;</button>
								<input type="text" class="pbtn bottomIpt" id="aCount">
								<button class="abtn btn rightBtn2" id="endbtn">&raquo;</button>
					
							</div>
								<button class="btn btn-outline-info exbtn confirmBtn">확인</button>
						</div>
						<input type="hidden" name="sAtotal" id="adult12">
						<input type="hidden" name="sCtotal" id="child12">	
						<input type="hidden" name="sRn" value="1">				
					</div>
					<button type="button" class="btn btn-outline-info" id="make"
						onclick="getmake()">스케쥴만들기</button>
					<button type="button" class="btn btn-outline-info" id="search">검색</button>
				</form>
			</div>
		</div>
	</div>
	<section>
		<div class="container-fluid" style="width: 90%;">
			<div class="row">
				<div class="section col-md-1 m-5"></div>
				<div class="section col-md-2 ">

					<img src="${DATA.sPic}" class="form-group" style="height: 300px;">
					<div class="form-group">추천수 : ${DATA.sRate }</div>
					<div class="form-group">${DATA.sName }</div>
					<div class="form-group">${DATA.sBody }</div>
					<div class="form-group">가격 : ${DATA.sCost }</div>
				</div>
				<div class="section col-md-1 m-5"></div>
				<div class="section col-md-2 ">
					<div class="form-group"
						style="background: url('/img/main/hongkong.jpg'); height: 300px;">
						여기는 사진</div>
					<div class="form-group">여기는 스케쥴 내용</div>
				</div>
				<div class="section col-md-1 m-5"></div>
				<div class="section col-md-2 ">
					<div class="form-group"
						style="background: url('/img/main/hongkong.jpg'); height: 300px;">
						여기는 사진</div>
					<div class="form-group">여기는 스케쥴 내용</div>
				</div>
				<div class="section col-md-1"></div>
			</div>
		</div>
	</section>
	<footer>
		<c:import url="/footer.kit"></c:import>
	</footer>
</body>
</html>