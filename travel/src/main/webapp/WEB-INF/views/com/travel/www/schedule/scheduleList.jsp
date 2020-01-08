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
      
      //인원수 창
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
       
       //인원수 창 확인버튼
       $('.exbtn').click(function () {
           $('.pCount').removeClass('view');
       });
       
       //인원수 증가 감소
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
        
       var a = $('#aCount').val();
       var b = $('#cCount').val();
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
           
           console.log(street0);
           console.log(street2);
           
           $('#sCountry').val(street2);
           $('#sArea').val(street0);
        });
        
        //검색
        $('#search').click(function(){
        	console.log("들어오냐?");
        	var sarea = $('#sArea').val();
            var address = $('#inputArea').val();
        	
        	$('#frm').attr('action', '/schedule/scheduleList.kit?sarea=' + sarea + "&address=" + address);
        	$('#frm').submit();
        });
        
        //리스트 최신순
        $('#recentlist').click(function(){
        	var url = decodeURIComponent(location.href);
        	var params;
        	var param;
        	
        	params = url.substring(url.indexOf('?') + 1, url.length);
        	params = params.split('&');
        	
        	param = params[0];
        	
        	console.log(param);
        	
	        $.ajax({
	        	url : "/schedule/recentlist.kit?sarea" + param,
	        	type : "post",
	        	dataType : "json",
	        	data : {
	        		"sarea" : param
	        	},
	        	
	        	success : function(data){
	        		var list = data;
	        		var content = "";
	        		
	        		alert("성공");
	        		
	        		console.log(list);
	        		
	        		$('.delete').remove();
	        		
	        		for(var i = 0; i < list.length; i++){
	        			console.log(i + "번째");
	        			
	        			content += '<div class="delete">';
	        			content += '	<form action="/schedule/scheduleDetail.kit" method="post" class="box">';
	        			content += '		<div class="w3-container w3-card w3-margin-bottom content">';
	        			content += '    		<input type="hidden" name="sNo" value="' + list[i].sNO + '"' + '>';
	        			content += '        		<div class="w3-col m6">';
	        			content += '           			<img alt="mainpic" src="' + list[i].sPic + '" style="width: 250px; height: 250px">';
	        			content += '        		</div>';
	        			content += '        		<div class="w3-col m6">';
	        			content += '           			<h5 class="w3-bottombar w3-border-blue w3-padding">스케쥴제목 : ' + list[i].sName + '</h5>'; 
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
	        			console.log(content + "초기화");
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
/*    인원수창 안보이기 */
	.pCount {
		width: 241px;
		height: 130px;
		background: white;
		position: absolute;
		border: 1px solid gray;
		border-radius: 3px;
		padding: 10px;
		margin-top: 2px;
		display: none;
	}
	
/* 	검색창 위치 조정 */
	.leftBtn2 {
		margin-left: 7px;
	}
	
/* 	검색창 input 크기 */
	.pbtn {
		width: 80px;
		text-align: center;
	}
   
/*     인원수창 */
   .pCount.view {
	   display: block;
	}
	
/* 	검색창 크기 */
	.searchbox {
		height: auto;
/* 		background-color: #c8d6db; */
	}
	
/* 	정렬기준 */
	.sortbox {
		width: 100%;
		height: 50px;
		padding: 10px;
/* 		background-color: #c8d6db; */
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
/* 		background-color: #c8d6db; */
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
      <div class="w3-col m3 w3-border w3-padding w3-margin-top searchbox">
         <div class="mainSearch">
            <form method="POST" name="myform" id="frm">
               <div class="form-group">
                  <label for="inputArea"> 여행가는 도시 </label> <input type="text"
                     class="form-control city" id="inputArea" name="address" value="${ADDRESS}"
                     placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
                     <input type="hidden" name="sCountry" id="sCountry">
                     <input type="hidden" name="sArea" id="sArea">
               </div>
<!--                <div class="form-group tCount confirmDiv"> -->
<!--                   <label for="inputArea"> 인원수 </label> <input type="text" -->
<%--                      class="form-control city" id="people" name="people" value="${PEOPLE}" placeholder="인원수를 선택해주세요" autocomplete="off"> --%>
<!--                   <div class="pCount" id="pCount"> -->
<!--                      <div class="adult topAdult"> -->
<!--                         <label> <span class="totalcount">성인</span> -->
<!--                         </label> -->

<!--                         <button class="abtn ml-4 btn leftBtn1" id="startbtn1" >&laquo;</button> -->
<%--                         <input type="text" class="pbtn topIpt" id="aCount" value="${SVO.sAtotal}"> --%>
<!--                         <button class="abtn btn rightBtn1" id="endbtn1" >&raquo;</button> -->
            
<!--                      </div> -->
<!--                      <div class="count"> -->
<!--                      <label> <span class="totalcount countAdult">어린이</span> -->
<!--                      </label> -->
<!--                         <button class="cbtn btn leftBtn2" id="startbtn2" >&laquo;</button> -->
<%--                         <input type="text" class="pbtn bottomIpt" id="cCount" value="${SVO.sCtotal}"> --%>
<!--                         <button class="cbtn btn rightBtn2" id="endbtn2">&raquo;</button> -->
               
<!--                      </div> -->
<!--                         <button class="btn btn-outline-info exbtn confirmBtn">확인</button> -->
<!--                   </div> -->
<!--                   <input type="hidden" name="sAtotal" id="adult12"> -->
<!--                   <input type="hidden" name="sCtotal" id="child12">    -->
<!--                   <input type="hidden" name="sRn" value="1">             -->
<!--                </div> -->
      <!--             <button type="button" class="btn btn-outline-info" id="make">스케쥴만들기</button> -->
               <button type="button" class="btn btn-outline-info" id="search">검색</button>
<!--                <button type="button" class="btn btn-outline-info" id="certification">이메일인증</button> -->
<!--                <button type="button" class="btn btn-outline-info" id="nearbysearch">근처검색</button> -->
            </form>
         </div>
      </div>
      <div class="w3-col m8 w3-margin-top w3-margin-left">
      <div class="sortbox w3-card w3-margin-bottom">
   			<span class="standard">정렬기준</span>
   			<a href="#" class="sortmenu" id="ratinglist">평점순</a>
   			<a href="#" class="sortmenu" id="recentlist">최신순</a>
   		</div>
		<div class="add">
			<div class="delete">
				<c:forEach var="data" items="${LIST}">
					<form action="/schedule/scheduleDetail.kit" method="post" class="box">
						<div class="w3-container w3-card w3-margin-bottom content">
							<input type="hidden" name="sNo" value="${data.sNo}">
							<div class="w3-col m6">
								<img alt="mainpic" src="${data.sPic}" style="width: 250px; height: 250px">
							</div>
							<div class="w3-col m6">
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