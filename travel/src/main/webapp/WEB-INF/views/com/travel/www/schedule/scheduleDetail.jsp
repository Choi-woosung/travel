<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ConsulTravel</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow-y: scroll;
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
	margin-top : 30px;
	padding-bottom : 50px;
	height: auto;
}
.title{
	height: auto;
}
.money{
	height: 80px;
}
.b1 {
	height: 400px;
	width : 400px;
	display : inline-block;
    overflow:auto;
    text-align: center;
    margin-top: 15px ; 
    margin-left: 15px;
}
.b2 {
	height: 300px;
	width : 300px;
	display : inline-block;
    overflow:auto;
    margin-top: 20px ; 
}
.mtext{
	height: auto;
	font-size: 20px;
}
.titleh{
	margin: 10px;
}
.city, .travelbody, .sBody{

	margin: 20px;
}
.travelbody{
	font-size: 15px;
}
.sBody2{
	margin: 30px;
}
.btn1{
	
	float: right;
	margin-top: 10px;
}
.btn2{
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}
.mbody{
	width: 1000px;
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


</style>
<script>

	$(function() {
		var bool = false;
			var likeAvg = "${likeAvg}";
			alert(likeAvg);
			$(".star_rating2 a").
			$(".star_rating a").on({
				mouseenter : function () {
					if(bool==true){
						return;}
				$(this).nextAll('a').removeClass("on");
		    	$(this).addClass("on").prevAll("a").addClass("on");
		    	var star = $(this).attr('data-id');
				$('#avg').html(star);
				return false;
				},		
				mouseleave : function () {
					if(bool==true){
						return;}
					$(".star_rating a").removeClass("on");
					$('#avg').html(0);
					return false;
				} 					
			});

		$( ".star_rating a" ).click(function () {
			bool = true;
    		$(this).nextAll('a').removeClass("on");
    		$(this).addClass("on").prevAll("a").addClass("on");
    			var star = $(this).attr('data-id');
    			var sid = '${SID}';
    			alert(sid);
    		$('#avg').html(star);
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
    				if(data == 2){
    					alert("등록완료");
    				}else if(data < 2){
    						alert("이미 평점을 등록하셨습니다.");
    					}
    				}, error : function() {
					alert("수정실패");
					}
    			}); 
    			return false;
		});

		
	});
</script>
</head>
<body class="bg-light">
	<header>
		<c:import url="/navigationBar.kit"></c:import>
	</header>
  	<div class="container mbody">
			  	<div class="border main bg-white shadow">
			<div class="col border title bg-white">
				<h3 class="titleh">${DATA.sName }</h3>
				<div class="city">${DATA.sCountry} ${DATA.sArea }</div>
			</div>
  			<div class="border b1 bg-white"><img src="${DATA.sPic }" style="width: 100%; height: 100%;"></div>
  			<div class="b2 bg-white"> 
  			<div class="travelbody"><strong>나라 : </strong>${DATA.sCountry}</div>
  			<div class="travelbody"><strong>도시 : </strong>${DATA.sArea}</div>
  			<div class="travelbody"><strong>총 경비 : </strong>${DATA.sCost } WON</div>
  			</div>
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
  		<p class="star_rating2">
		    <a href="#" class="starL2" data-id="0.5"></a>
		    <a href="#" class="starR2" data-id="1"></a>
		    <a href="#" class="starL2" data-id="1.5"></a>
		    <a href="#" class="starR2" data-id="2"></a>
		    <a href="#" class="starL2" data-id="2.5"></a>
		    <a href="#" class="starR2" data-id="3"></a>
		    <a href="#" class="starL2" data-id="3.5"></a>
		    <a href="#" class="starR2" data-id="4"></a>
		    <a href="#" class="starL2" data-id="4.5"></a>
		    <a href="#" class="starR2" data-id="5"></a>
		</p>
		<div id="avg"></div>
  		</div>
			<div class="col border money bg-white shadow">
			</div>
			<div class="col border mtext bg-white shadow">
			<h4 class="sBody">계획</h4>
			<h5 class="sBody2">${DATA.sBody }</h5>
			</div>
  		<button type="button" class="btn bg-white border col-md-1 btn1">목록</button>
  		<button type="button" class="btn bg-white border col-md-1 btn2">수정</button>
</div>
</body>
</html>