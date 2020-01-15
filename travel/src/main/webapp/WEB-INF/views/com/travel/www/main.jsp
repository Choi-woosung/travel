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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&libraries=places"></script>
   <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
   
  
<style>
.mainview {
   background-image: url("/img/main/wallpaper2.jpeg");
   background-size: cover;
   background-repeat: no-repeat;
   background-position: right center;
   height: 900px;
   position : relative;
}

.seduction{
   position: relative;
   top: 300px;
   left: 1050px;
   width: 600px;
   height: 600px;
/*    border: 1px solid black; */
   color: white;
   font-size: 50px;
   font-weight: bold;
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
	
	#nav{
  height: 70px;
  background: transparent;
  display: block;
  position: fixed;
  width: 100%;
  z-index: 99999;
  transition: all ease .5s;
	}
	

#logo {
	font-family: 'Ubuntu', sans-serif;
	color: #fff;
	padding: 20px;
	font-size: 30px;
	transition: all ease .5s;
	text-align: left;
	cursor: pointer;
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
	top : 10px;
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

#nav.shrink {
  height: 70px;
  transition: all ease .5s;
  background-color: rgba( 0, 0, 0, 0.7);
}

#nav.shrink #logo {
  padding: 10px;
  transition: all ease .5s;
}

input:focus{
    outline: none;
}

.section1 {
	padding : 50px;
}

.sectionText {
	padding-top: 30px;
}

</style>
<script>
   $(function() {
      $('#signIn').click(function() {
         $(location).attr('href', '/member/login.kit');
      });
      
      $('#logout').click(function() {
         $(location).attr('href', '/www/member/logout.kit');
      });
      
      $('#signUp').click(function() {
         $(location).attr('href', '/member/join.kit');
      });
      
      $('#myInfo').click(function(){
    	  
      });
      
      $('#certification').click(function(){
         $(location).attr('href', '/member/email.kit');
      });
      
      $('#make').click(function(){
         $(location).attr('href', '/schedule/scheduleMaker.kit');
      });
      
      $('.searchicon').click(function(){
    	 var sarea = $('#sArea').val();
    	 
         $(location).attr('href', '/schedule/scheduleList.kit?sarea=' + sarea);
      });

		$(window).scroll(function() {
	  	if($(document).scrollTop() > 50) {
	    	$('#nav').addClass('shrink');
	    }
	    else {
	    $('#nav').removeClass('shrink');
	    }
	});
		
	//구글맵 자동검색
   var autocomplete;
   autocomplete = new google.maps.places.Autocomplete(
		   document.getElementById("searchBar"), {
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
   			ConsulTravel
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
   <div class="mainview">
      <div class="seduction">
         <p>자기만의 여행 계획을 </p>
         <p>만들어보세요 </p>
         <button type="button" class="btn btn-light btn-lg" id="make">스케줄 만들어보기</button>
      </div>
   </div>
   <div class="container text-center section1">
   		<h1>가고 싶은 어디든 지금 검색해보세요</h1>
   		<br>
   		<input id="searchBar" type="text" class="searchBar" autocomplete="false">
   		<span class="searchicon"><img src="/img/icon/search.svg" style="width : 50px; height : 50px;"></span>
   		<h3 class="sectionText">원하시는 여행 장소를 입력해서 다양한 여행 계획을 검색해보세요</h3>
		<input type="hidden" id="sArea">
   </div>
   <hr>
   <section>
      <div class="container">
         <div class="row">
         <c:forEach var="data" items="${LIST}" begin="0" end="2">
            <div class="col-md-4 text-center">
            	<p>${data.sName}</p>
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