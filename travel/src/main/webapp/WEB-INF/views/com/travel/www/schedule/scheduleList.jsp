<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scheduleList</title>
<link rel="stylesheet" href="/css/w3.css" >
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<link rel="stylesheet" href="/css/bootstrap.min.css">

<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript"
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&libraries=places"></script>

<script type="text/javascript">
   $(document).ready(function(){
      //상세보기
      $('.box').click(function(){
    	  $(this).submit();
      });
        
        //구글 맵 api 자동완성
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
           
//            console.log(street0);
//            console.log(street2);
           
           $('#sCountry').val(street2);
           $('#sArea').val(street0);
        });
        
        //검색
        $('#search').click(function(){
        	var sarea = $('#sArea').val();
            var address = $('#inputArea').val();
        	
        	$('#frm').attr('action', '/schedule/scheduleList.kit?sarea=' + sarea + "&address=" + address);
        	$('#frm').submit();
        });
        
        //리스트 최신순
        $('#recentlist').click(function(){
        	var month = $('#month').val();
        	
        	var url = decodeURIComponent(location.href);
        	var params;
        	var param;
        	
        	params = url.substring(url.indexOf('?') + 1, url.length);
        	params = params.split('&');
        	
        	param = params[0];
        	
	        $.ajax({
	        	url : "/schedule/recentlist.kit?sarea=" + param + "&month=" + month,
	        	type : "post",
	        	dataType : "json",
	        	data : {
	        		"sarea" : param,
	        		"month" : month
	        	},
	        	
	        	success : function(data){
	        		var list = data;
	        		var content = "";
	        		
	        		alert("성공");
	        		console.log(list);
	        		
	        		$('.delete').remove();
	        		
	        		for(var i = 0; i < list.length; i++){
	        			content += '<div class="delete">';
	        			content += '	<form action="/schedule/scheduleDetail.kit" method="post" class="box" onclick="this.submit();">';
	        			content += '		<div class="w3-container w3-card w3-margin-bottom content">';
	        			content += '    		<input type="hidden" name="sNo" value="' + list[i].sNo + '"' + '>';
	        			content += '        		<div class="w3-col m4">';
	        			content += '           			<img alt="mainpic" src="' + list[i].sPic + '" style="width: 250px; height: 250px">';
	        			content += '        		</div>';
	        			content += '        		<div class="w3-col m8">';
	        			content += '           			<h5 class="sname w3-padding">스케쥴제목 : ' + list[i].sName + '</h5>'; 
	        			content += '           			<div class="info w3-padding">'; 
	        			content += '           				<p>여행시작일 : ' + list[i].sSdate + '</p>';
	        			content += '           				<p>여행종료일 : ' + list[i].sEdate + '</p>';
	        			content += '           				<p>작성일 : ' + list[i].sWdate + '</p>';
	        			content += '           				<p>총금액 : ' + list[i].sCost + ' 원</p>';
	        			content += '        			</div>';
	        			content += '        		</div>';
	        			content += ' 		</div>';
	        			content += '	</form>';
	        			content += '</div>';
	        			
	        			$('.add').append(content);
	        			
	        			content = "";
	        		}
	        	},
	        	error : function(){
	        		alert("통신오류");
	        	}
	        });
        });
        
        //월별순 리스트
        $('#searchmonth').click(function(){
        	var sarea = $('#sArea').val();
            var address = $('#inputArea').val();
            var month = $('#month').val();
            
            var url = decodeURIComponent(location.href);
        	var params;
        	var param;
        	
        	params = url.substring(url.indexOf('?') + 1, url.length);
        	params = params.split('&');
        	
        	param = params[0];
        	
	        $.ajax({
	        	url : "/schedule/sortmonth.kit?sarea=" + param + "&month=" + month,
	        	type : "post",
	        	dataType : "json",
	        	data : {
	        		"sarea" : param,
	        		"month" : month
	        	},
	        	
	        	success : function(data){
	        		var list = data;
	        		var content = "";
	        		
	        		alert("성공");
	        		
	        		$('.delete').remove();
	        		
	        		for(var i = 0; i < list.length; i++){
	        			content += '<div class="delete">';
	        			content += '	<form action="/schedule/scheduleDetail.kit" method="get" class="box" onclick="this.submit();">';
	        			content += '		<div class="w3-container w3-card w3-margin-bottom content">';
	        			content += '    		<input type="hidden" name="sNo" value="' + list[i].sNo + '"' + '>';
	        			content += '        		<div class="w3-col m4">';
	        			content += '           			<img alt="mainpic" src="' + list[i].sPic + '" style="width: 250px; height: 250px">';
	        			content += '        		</div>';
	        			content += '        		<div class="w3-col m8">';
	        			content += '           			<h5 class="sname w3-padding">스케쥴제목 : ' + list[i].sName + '</h5>'; 
	        			content += '           			<div class="info w3-padding">'; 
	        			content += '           				<p>여행시작일 : ' + list[i].sSdate + '</p>';
	        			content += '           				<p>여행종료일 : ' + list[i].sEdate + '</p>';
	        			content += '           				<p>작성일 : ' + list[i].sWdate + '</p>';
	        			content += '           				<p>총금액 : ' + list[i].sCost + ' 원</p>';
	        			content += '        			</div>';
	        			content += '        		</div>';
	        			content += ' 		</div>';
	        			content += '	</form>';
	        			content += '</div>';
	        			
	        			$('.add').append(content);
	        			
	        			content = "";
	        		}
	        	},
	        	error : function(){
	        		alert("통신오류");
	        	}
	        });
        });
   });
</script>
<style>
   *{box-sizing: border-box;}
   
/*    검색창 박스 크기 */
	.mainSearch {
		padding: 10px;
		margin-left: 21px;
	}
   
/* 	검색창 위치 조정 */
	.leftBtn2 {
		margin-left: 7px;
	}
	
/* 	검색창 input 크기 */
	.pbtn {
		width: 500px;
		padding: 4px;
		text-align: center;
	}
	
/* 	검색버튼 */
	#search {
		margin-bottom: 4px;
	}
	
/* 	정렬기준 */
	.sortbox {
		width: 100%;
		height: 50px;
		padding: 10px;
	}
	.standard {
		font-size: 20px;
		font-weight: bold;
		padding: 5px;
	}
	.sortmenu {
		font-size: 20px;
		margin-left: 30px;
	}
	.sortmenu:hover {
		text-decoration: none;
	}
	
/* 	콘텐트박스 */
	.content {
		height: 316px;
		padding: 30px;
	}
	
/* 	스케쥴제목 */
	.sname{
		border-bottom: 8px solid rgba(44, 181, 233, 0.4);
		font-weight: bold;
	}
	
/* 	스케쥴정보박스 */
	.info {
		margin-top: 20px;
		border: 3px solid rgba(0, 73, 191, 0.3);
	}
</style>
</head>
<body>
   <header>
      <c:import url="/navigationBar.kit"></c:import>
   </header>
   <div class="container">
      <div class="w3-container w3-margin-top mainSearch">
<!--          <div class="mainSearch"> -->
            <form method="POST" name="myform" id="frm">
                 <input type="text" class="city pbtn" id="inputArea" name="address" value="${ADDRESS}"
                    placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
                    
                    <input type="hidden" name="sCountry" id="sCountry">
                    <input type="hidden" name="sArea" id="sArea">
              		<button type="button" class="btn btn-outline-info" id="search">검색</button>
            </form>
<!--          </div> -->
      </div>
      
      <div class="w3-container w3-margin-top w3-margin-left">
      <div class="sortbox w3-card w3-margin-bottom">
   			<span class="standard">정렬기준</span>
   			<a href="#" class="sortmenu" id="ratinglist">평점순</a>
   			<a href="#" class="sortmenu" id="recentlist">최신순</a>
   			<a class="sortmenu">
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
	   			<input type="button" value="검색" id="searchmonth">
   			</a>
   		</div>
		<div class="add" id="add">
			<div class="delete">
				<c:forEach var="data" items="${LIST}">
					<form action="/schedule/scheduleDetail.kit" method="get" class="box">
						<div class="w3-container w3-card w3-margin-bottom content">
							<input type="hidden" name="sNo" value="${data.sNo}">
							<input type="hidden" name="sCountry">
                     		<input type="hidden" name="sArea">
							<div class="w3-col m4"> 
								<img alt="mainpic" src="${data.sPic}" style="width: 250px; height: 250px">
							</div>
							<div class="w3-col m8">
								<h5 class="sname w3-padding">${data.sName}</h5>
								<div class="info w3-padding">
									<p>여행시작일 : ${data.sSdate}</p>
									<p>여행종료일 : ${data.sEdate}</p>
									<p>작성일 : ${data.sWdate}</p>
									<p>총금액 : ${data.sCost} 원</p>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
		</div>
      </div>
   </div>
</body>
</html>