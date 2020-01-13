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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript"
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&libraries=places"></script>
  
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
.seduction{
   position: relative;
   top: -350px;
   left: 950px;
   width: 600px;
   height: 600px;
/*    border: 1px solid black; */
   color: white;
   font-size: 50px;
   font-weight: bold;
}
#make {
   float : right;
}

/* 별만들기 */
.starL{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
	}
	
	.starR{
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px; 
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starL.on{background-position:0 0;}
	.starR.on{background-position:-15px 0;}
	
	.star_score span{display:inline-block;
	height:30px;
	background:url(/img/icon/sp_ico3.png) no-repeat -9999px -9999px}
	.star_score span.st_off{
	position:relative;
	width:115px;
	margin-right:2px; 
	background-position: 0 -895px;
	}
	.star_score{
		float: right;
/* 		margin-top: 10px; */
		
	}
	.star_score span.st_on{overflow:hidden;
	position:absolute;
	top: 0px;
	left:0;
	z-index:10;
	background-position:0 -920px;
	text-indent:-9999px}
	
	.avg, .score{
	font-size: 20px;
	}
	.score{
		margin-top: 10px;
		margin-left: 5px;
	}
	.avg{
	margin-left: 5px;
	margin-right: 10px;
	}
	
	.star_rate{
	display: inline-block;
	    font-weight: 400;
	    color: #212529;
	    text-align: center;
	    vertical-align: middle;
		float: right;
		user-select: none;
	    background-color: lavender;
	    border: 1px solid transparent;
	    padding: .375rem .75rem;
	    font-size: 1rem;
	    line-height: 1.5;
	    border-radius: .25rem;
	    
	}
	.star_rating{
		margin-top: 10px;
		margin-left: 50px;
		display: none;
	}
	img{
		width: 100%;
		height: 100%;
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
      
      $('#certification').click(function(){
         $(location).attr('href', '/member/email.kit');
      });
      
      $('#nearbysearch').click(function(){
         $(location).attr('href', '/test/nearbysearch.kit');
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
      /*    캘린더  */
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
      $('.abtn').click(function() {
         var tmp = $(this).attr('id');
         var sp = $('#startbtn1').html();
         var rp = $('#endbtn1').html();
         var nCount = $(this).text();
         if (nCount != sp || nCount != rp) {
            $('#aCount').val();
         }
         if (nCount == sp) {
            if (a == 0) {
               return;
            }
            a--;
            $('#aCount').val(a);
            $('#people').val('성인 : ' + a + ' 어린이 : ' + b);
         }
         if (nCount == rp) {
            if (a == 99) {
               return;
            }
            a++;
            $('#aCount').val(a);
            $('#people').val('성인 : ' + a + ' 어린이 : ' + b);
         }
      });
      
      $('.cbtn').click(function() {
         var sp = $('#startbtn2').html();
         var rp = $('#endbtn2').html();
         var nCount = $(this).text();
         var aCount = $('#cCount').text(b);
         if (nCount != sp || nCount != rp) {
            $('#cCount').val();
         }
         if (nCount == sp) {
            if (b == 0) {
               return;
            }
            b--;
            $('#cCount').val(b);
            $('#people').val('성인 : ' + a + ' 어린이 : ' + b);
         }
         if (nCount == rp) {
            if (b == 99) {
               return;
            }
            b++;
            $('#cCount').val(b);
            $('#people').val('성인 : ' + a + ' 어린이 : ' + b);
         }
      });
      
      $('.exbtn').click(function () {
         $('.pCount').removeClass('view');
      });
      
         
      $('#search').click(function() {
         $('#adult12').val(a);
         $('#child12').val(b);
         
         var sarea = $('#sArea').val();
         var address = $('#inputArea').val();
               var formid = document.myform;
                  $('#frm').attr('action', '/schedule/scheduleList.kit?sarea=' + sarea + "&address=" + address);
                  $('#frm').submit();
            });
      
      
      $('#make').click(function(){
         
         let url = '/schedule/scheduleMaker.kit';
         $(location).attr('href', url);
      }); 
   });
   /*    function getsearch() {
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
            google.maps.event.addListener(autocomplete, 'place_changed', function() {
               var place = autocomplete.getPlace();
               var components = place.address_components;
               var component0 = components[0];
               var component2 = components[2];
               var street0 = component0['long_name'];
               var street2 = component2['long_name'];
               
               console.log(street0);
               console.log(street2);
               
               $('#sCountry').val(street2);
               $('#sArea').val(street0);
            });
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
                     class="form-control city" id="inputArea" name="address"
                     placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
                     <input type="hidden" name="sCountry" id="sCountry">
                     <input type="hidden" name="sArea" id="sArea">
               </div>
               <div class="row">
                  <div class="form-group col-md-6 ">
                     <label for="calendarArea" id="calendarArea1"> 출발일 선택 </label> <input
                        type="text" class="form-control col-md-12" id="sSdate"
                        name="sSdate" placeholder="언제부터 ?" autocomplete="off">
                  </div>
                  <div class="form-group col-md-6">
                     <label for="calendarArea"> 도착일 선택 </label> <input type="text"
                        class="form-control col-md-12" id="sEdate" name="Edate"
                        placeholder="언제까지 ?" autocomplete="off">

                  </div>
               </div>
               <div class="form-group tCount confirmDiv">
                  <label for="inputArea"> 인원수 </label> <input type="text"
                     class="form-control city" id="people" name="people" placeholder="인원수를 선택해주세요" autocomplete="off">
                  <div class="pCount" id="pCount">
                     <div class="adult topAdult">
                        <label> <span class="totalcount">성인</span>
                        </label>

                        <button class="abtn ml-4 btn leftBtn1" id="startbtn1" >&laquo;</button>
                        <input type="text" class="pbtn topIpt" id="aCount">
                        <button class="abtn btn rightBtn1" id="endbtn1" >&raquo;</button>
            
                     </div>
                     <div class="count">
                     <label> <span class="totalcount countAdult">어린이</span>
                     </label>
                        <button class="cbtn btn leftBtn2" id="startbtn2" >&laquo;</button>
                        <input type="text" class="pbtn bottomIpt" id="cCount">
                        <button class="cbtn btn rightBtn2" id="endbtn2">&raquo;</button>
               
                     </div>
                        <button class="btn btn-outline-info exbtn confirmBtn">확인</button>
                  </div>
                  <input type="hidden" name="sAtotal" id="adult12">
                  <input type="hidden" name="sCtotal" id="child12">   
                  <input type="hidden" name="sRn" value="1">            
               </div>
   <!--             <button type="button" class="btn btn-outline-info" id="make">스케쥴만들기</button> -->
               <button type="button" class="btn btn-outline-info" id="search">여행추천</button>
   <!--           <button type="button" class="btn btn-outline-info" id="certification">이메일인증</button> -->
               <button type="button" class="btn btn-outline-info" id="nearbysearch">근처검색</button>
            </form>
         </div>
      </div>
      <div class="seduction">
         <p>여러분의 스케줄을 만들어보세요! </p>
         <button type="button" class="btn btn-light btn-lg" id="make">스케줄 만들어보기</button>
      </div>
   </div>
   <section>
      <div class="container-fluid">
         <div class="row">
         <c:forEach var="data" items="${LIST}" begin="0" end="2">
            <div class="section col-md-2 ">
            	<p>${data.sName}</p>
            	<img alt="photo" src="${data.sPic}" style="width: 300px; height: 300px;">
            	<div class="star_score row">
				    <span class="st_off">
				   		<span class="st_on" style="width: ${data.likeAvg * 20}%;" ></span>
					</span>
				</div>
				<p>${data.sBody}</p>
				<img alt="profile" src="/img/profile/${data.avatarName}" style="width: 50px; height: 50px;">
				<p>${data.mId}</p>
            </div>
         </c:forEach>
         </div>
      </div>
   </section>
   <footer>
      <c:import url="/footer.kit"></c:import>
   </footer>
</body>
</html>