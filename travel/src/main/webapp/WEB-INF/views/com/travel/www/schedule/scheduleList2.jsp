<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ConsulTravel</title>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&libraries=places"></script>
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
<style>
body, html { 
    margin: 0;
    padding: 0;
    background : #f0f0f0;
}
#nav{
  height: 70px;;
  background-color: rgba( 0, 0, 0, 0.7);
  display: block;
  width: 100%;
  z-index: 99999;
  transition: all ease .5s;
   }
   

#logo {
   font-family: 'Ubuntu', sans-serif;
   color: #fff;
   font-size: 30px;
   padding : 10px;
   transition: all ease .5s;
   text-align: left;
}

.navBtn {
   float : left;
   margin-left : 50px;
    list-style : none;
    cursor : pointer;
}

.btns{
   float : left;
   position : relative;
   left : 1100px;
   font-size : 20px;
}

.searchBar{
   width : 400px;
   height : 50px;
   border : 1px solid black;
   border-radius : 1px;
   color : black;
   text-align : center;
}

.logoText {
    cursor : pointer;
}

.outerbox {
	display : flex;
	padding : 20px;
}

.leftbox {
	flex : 2;
	height : 300px;
	border-radius : 5px;
	background : white;
	padding : 10px;
	margin-top : 53px;
}

.rightbox {
	flex : 8;
}

.innerbox {
	height : 300px;
	margin : 20px;
	padding : 20px;
	background : white;
	display : flex;
}

.listheadtext {
	margin-left : 20px;
}

.searchbar {
	width : 100%;
	border : 1px solid #dee2e6;
}

input:focus{
    outline: none;
}

.listpic {
	flex : 3;
	border : 1px solid black;
}

.listinfo {
	flex : 7;
	border : 1px solid black;
	padding : 10px;
}

.searchbarBtn {
	float : right;
}

.left {
	margin-top : 50px;
}

/* 	별만들기 */
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
	
	
	.infotextbox {
		margin-top : 50px;
		margin-left : 20px;
	}
	
	.clickEvent {
		margin-left : 20px;
	}

</style>
<script>
$(function(){
    $(window).scroll(function() {
        if($(document).scrollTop() > 50) {
          $('#nav').addClass('shrink');
       }
       else {
       $('#nav').removeClass('shrink');
       }
	});
    
    $('.clickEvent').click(function(e){
  	  var submitBtn = $(e).parents().find('form');
  	  console.log(submitBtn);
  	  submitBtn.submit();
 	});
    
    $('#signIn').click(function() {
        $(location).attr('href', '/member/login.kit');
     });
     
     $('#logout').click(function() {
        $(location).attr('href', '/www/member/logout.kit');
     });
     
     $('#signUp').click(function() {
        $(location).attr('href', '/member/join.kit');
     });
     
     $('.logoText').click(function(){
    	 $(location).attr('href', '/main.kit');
     });
     var autocomplete;
     autocomplete = new google.maps.places.Autocomplete(
           document.getElementById("inputArea"), {
           types: ['(cities)']
     });
     google.maps.event.addListener(autocomplete, 'place_changed', function() {
         var place = autocomplete.getPlace();
         var components = place.address_components;
         var component0 = components[0];
         var street0 = component0['long_name'];
         
         $('#sArea').val(street0);
     });
});


</script>
</head>
<body>
   <div id="nav">
         <div id="logo">
         	<span class="logoText">ConsulTravel</span>
            <div class="btns">
               <ul>
                  <c:if test="${empty SID }">
                  <li class="navBtn" id="signIn">Sign In</li>
                  <li class="navBtn" id="signUp">Sign Up</li>
                  </c:if>
                  <c:if test="${!empty SID }">
                  <li class="navBtn" id="myInfo">My Info</li>
                  <li class="navBtn" id="logout">Logout</li>
                  </c:if>
               </ul>
            </div>
         </div>
   </div>
   <div class="container outerbox">
   		<div class="leftbox">
   		<form method="POST" name="myform" id="frm">
   			<div class="left">
               <input type="text" class="searchbar" id="inputArea" name="address" value="${ADDRESS}" placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
               <button type="button" class="searchbarBtn btn btn-light">검색</button>
               <input type="hidden" name="sCountry" id="sCountry">
               <input type="hidden" name="sArea" id="sArea">
            </div>
            <div class="left">
               <span class="standard">정렬기준</span>
   				<a href="#" class="sortmenu" id="ratinglist">평점순</a>
   				<a href="#" class="sortmenu" id="recentlist">최신순</a>            
            </div>
            <div class="left">
   				<a class="sortmonth">
	   			<select name="month" id="month">
   					<option value="">월별검색</option>
	   				<option value="01">1월</option>
	   				<option value="02">2월</option>
	   				<option value="03">3월</option>
	   				<option value="04">4월</option>
	   				<option value="05">5월</option>
	   				<option value="06">6월</option>
	   				<option value="07">7월</option>
	   				<option value="08">8월</option>
	   				<option value="09">9월</option>
	   				<option value="10">10월</option>
	   				<option value="11">11월</option>
	   				<option value="12">12월</option>
	   			</select>
	   			<input type="button" value="검색" id="searchmonth" class="btn btn-light">
   			</a>
   			</div>
        </form>
   		</div>
   		<div class="rightbox">
   		<h3 class="listheadtext">검색된 여행 스케쥴 <span id="listlength"></span>개</h3>
   		<c:forEach var="data" items="${LIST}" varStatus="status">
   			<input type="hidden" name="count" class="counter">
			<form action="/schedule/scheduleDetail.kit" method="get">
				<div class="innerbox">
					<div class="listpic">
					</div>
					<div class="listinfo">
						<h4 class="clickEvent"> ${data.sName }</h4>
							<div class="star_score row">
								<span class="st_off">
								<span class="st_on" style="width: ${data.likeAvg * 20}%;"></span>
								</span>
								<div class="avg" id="avg"></div>
							</div>
						<div class="infotextbox">
						<p> 여행시작일  ${data.sSdate } ~  ${data.sEdate} 까지 </p>
						<p> 나라 : ${data.sCountry } , 도시 : ${data.sArea } </p>
						<p> ${data.sBody } </p>
						</div>
					</div>
				</div>
			</form>
		</c:forEach>
   		</div>
   </div>
   <script>
   var counter = document.querySelectorAll('.counter').length;
   	document.getElementById('listlength').innerHTML = counter;
   </script>
</body>
</html>