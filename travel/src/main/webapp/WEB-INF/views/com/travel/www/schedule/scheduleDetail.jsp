<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ConsulTravel</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
<style>
body, html {
	margin: 0;
	padding: 0;

	overflow-x: hidden;
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
.main{
	width: 80%;
	margin-top : 30px;
	padding-bottom : 50px;
	height: auto;
	margin-left: 10%;
}
.title{

	height: auto;
}
.b1 {
	height: 200px;
	width : 200px;
	display : inline-block;
    overflow:auto;
    text-align: center;
    margin-top: 35px ; 
    margin-left: 10%;
}
.b2 {
	height: 200px;
	width : 400px;
	margin-top: 35px ;
	display : inline-block;
    margin-top: 20px; 
}
.mtext{
	margin-left: 10%;
	width: 80%;
	height: auto;
	font-size: 20px;
}
.titleh{
	margin: 20px;
}
.travelbody{
	margin-top: 30px;
	margin-left: 10%;
} 
.sBody{
	margin: 30px;
}
.city{
	font-size: 20px;
	margin-top: 10px;
	margin-left: 40px;
}
.travelbody{
	font-size: 15px;
}
.sBody2{
	margin: 30px;
}
.btn1{
	margin-right: 110px;
	float: right;
	margin-top: 10px;
}
.btn2{
	float: right;
	margin-top: 10px;
}
.mbody{
		width:90%;
}
.fa-heart{
	font-size:48px;
	color:red; 
}
.fa-heart-o{
	font-size:48px;
	color:red;
}



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

.star_score span{
	display:inline-block;
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
	margin-top: 10px;
	margin-bottom: 30px;
}
.star_score span.st_on{
	overflow:hidden;
	position:absolute;
	top:0;
	left:0;
	z-index:10;
	background-position:0 -920px;
	text-indent:-9999px
}

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

.daybox {
	width : 300px;
	margin : 3%;
	height : 50px;
    display: inline-table;
}
.money{
	margin-left: 10%;
	width: 80%;
	margin-top: 20px;
	margin-bottom: 20px;
	overflow-x: scroll; 
}

#nav{
	height: 70px;
	background: rgba( 0, 0, 0, 0.7);
	display: block;
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
.logoText{
	cursor: pointer;
}
</style>
<script>

	$(function() {
		$('#list').click(function() {
			history.back();
		});
		var bool = false;
		var likeAvg = "${likeAvg}";
			if(likeAvg == Infinity || likeAvg == 'NaN'){
				likeAvg = 0;
			}
		$('#avg').html(likeAvg);
		$(".star_rating a").on({
			mouseenter : function () {
				if(bool==true){
					return;}
				$(this).nextAll('a').removeClass("on");
				$(this).addClass("on").prevAll("a").addClass("on");
			   	var star = $(this).attr('data-id');
				$('#score').html(star);
					return false;
		},		
			mouseleave : function () {
				if(bool==true){
					return;}
				$(".star_rating a").removeClass("on");
				$('#score').html(0);
					return false;
				} 					
			});
		
		$( ".star_rating a" ).click(function () {
			bool = true;
			$('.star_rate').css('display', 'block');
			$('.star_rating').css('display', 'none');
			$('.score').css('display', 'none');
    		$(this).nextAll('a').removeClass("on");
    		$(this).addClass("on").prevAll("a").addClass("on");
    			var star = $(this).attr('data-id');
    			var sid = '${SID}';
    		$('#score').html(star);
    			var sNo = "${DATA.sNo}";
    			 $.ajax({
    				url : "/schedule/scheduleStar.kit",
    				type : "POST",
    				dataType : "json",
	    			data : {
    					"sRate" : star,
    					"sNo" : sNo,
    					"mId" : sid
    				}, success : function(data){
    					if(data.cnt == 2){
    						alert("등록완료");
    					$('.st_on').css('width', data.likeAvg*20+'%');
    					$('#avg').html(data.likeAvg);
    						
    					}else if(data.idCheck == 1){
    						alert("이미 평점을 등록하셨습니다.");
    					}
    				}, error : function() {
					alert("수정실패");
					}
    			}); 
    		return false;
		});
		$('.star_rate').click(function () {
			$('.star_rate').css('display', 'none');
			$('.star_rating').css('display', 'block');
		});

		$('#signIn').click(function() {
	         $(location).attr('href', '/member/login.kit');
	      });
	      
	    $('#logout').click(function() {
	         $(location).attr('href', '/member/logout.kit');
	      });
	    $('#signUp').click(function() {
	         $(location).attr('href', '/member/join.kit');
	      });
	      
	    $('#myInfo').click(function(){
	         $(location).attr('href', '/member/memberForm.kit')
	      });
	    $('.logoText').click(function () {
			$(location).attr('href', '/main.kit')
		});
	});
	
</script>
</head>

<body class="bg-light">
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
  	<div class="container mbody">
			  	<div class="border main bg-white shadow">
			<div class="col  title bg-white">
				<h3 class="titleh">${DATA.sName }</h3>
				<div class="city">${DATA.sCountry} ${DATA.sArea }</div>
				<div class="star_score row ">
		    <span class="st_off" >
		   		<span class="st_on" style="width: ${likeAvg * 20}%;" ></span>
			</span>
				<div class="avg" id="avg"></div>
			</div>
				<div class="travelbody"><strong>작성자 : ${DATA.mId }</strong> <img src="/img/profile/${DATA.avatarName}"></div>
			</div>
			
  			<div class="border b1 bg-white"><%-- <img src="${DATA.sPic }" > --%></div>
  			<div class="b2 bg-white "> 
  			<div class="travelbody"><strong>나라 : </strong>${DATA.sCountry}</div>
  			<div class="travelbody"><strong>도시 : </strong>${DATA.sArea}</div>
  			<div class="travelbody"><strong>출발일 : </strong>${DATA.sSdate}</div>
  			<div class="travelbody"><strong>도착일 : </strong>${DATA.sEdate}</div>
 
  			<div class="travelbody"><strong>작성일 : </strong>${DATA.sWdate }</div>
  			</div>
  			<c:if test="${!empty SID }">
		<div class="row">
  		<p class="star_rating">
		    <a href="#" class="starL" data-id="0.5"></a>
		    <a href="#" class="starR" data-id="1"></a>
		    <a href="#" class="starL" data-id="1.5"></a>
		    <a href="#" class="starR" data-id="2"></a>
		    <a href="#" class="starL" data-id="2.5"></a>
		    <a href="#" class="starR" data-id="3"></a>
		    <a href="#" class="starL" data-id="3.5"></a>
		    <a href="#" class="starR" data-id="4"></a>
		    <a href="#" class="starL" data-id="4.5"></a>
		    <a href="#" class="starR" data-id="5"></a>
		</p>			
  		
		<div class="score" id="score"></div>
		</div>
			<button type="button" class="star_rate ">평점등록</button>
  			</c:if>
  		</div>
			<div class="border money bg-white shadow">
				<c:forEach items="${lenOfDay}" var="day" varStatus="status">
				<div class="daybox">
				<ul class="list-group">
					<c:forEach items="${LIST}" var="data">
					<c:if test="${data.dayCount == status.count}">
					<li class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">${data.placeName }</h5>
							<small class="text-muted">${data.liCnt }</small>
						</div>
						<p class="mb-1 text-left">${data.placeAddress }</p>
						<div class="content-body-text input-group-sm mb-1">
							<div class="bodycontext">${data.body }</div>
							<div class="inputPrice"><span class="priceLeft">비용 : ${data.price }원</span>
							</div>
						</div>
						<div class="row">
						<div class="col-sm border mx-3" data-toggle="modal" data-target="#dataModal"><img src="/img/icon/search.svg" alt="" width="16" height="16" title="search"></div>
						</div>
					</li>
					</c:if>
					</c:forEach>
					</ul>
				</div>
				</c:forEach> 
			</div>
			<div class="border mtext bg-white shadow">
			<h4 class="sBody">계획</h4>
			<h5 class="sBody2">${DATA.sBody }</h5>
			</div>
  		<button type="button" class="btn bg-white border col-md-1 btn1" id="list">목록</button>
  		<button type="button" class="btn bg-white border col-md-1 btn2" id="">수정</button>
</div>
</body>
</html>