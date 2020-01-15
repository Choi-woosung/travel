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
        
        var cnt;
        
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
                 
                 alert("성공");
                 
                 $('.delete').remove();
                 
                 for(var i = 0; i < list.length; i++){
                    var content = "";
                    
                    content += '<div class="delete">';
                    content += '   <form action="/schedule/scheduleDetail.kit" method="post" class="box" onclick="this.submit();">';
                    content += '      <div class="w3-container w3-card w3-margin-bottom content">';
                    content += '          <input type="hidden" name="sNo" value="' + list[i].sNo + '"' + '>';
                    content += '              <div class="w3-col m4">';
                    content += '              </div>';
                    content += '              <div class="w3-col m8 infobox">';
                    content += '                 <div class="star_score row">';
                    content += '                    <span class="st_off">';
                    content += '                       <span class="st_on" style="width: ' + list[i].likeAvg * 20 + '%;"></span>';
                    content += '                    </span>';
                    content += '                 </div>';
                    content += '                    <h5 class="sname w3-padding">' + list[i].sName + '</h5>'; 
                    content += '                    <div class="info w3-padding">'; 
                    content += '	<p> 여행시작일 ' + list[i].sSdate + ' ~ ' + list[i].sEdate + ' 까지 </p>';
                    content += '<p> 나라 : ' + list[i].sCountry  + ', 도시 : ' + list[i].sArea + '</p>';
                    content += '					<p> ' + list[i].sBody + ' </p>';
                    content += '                 </div>';
                    content += '              </div>';
                    content += '       </div>';
                    content += '   </form>';
                    content += '</div>';
                    
                    $('.add').append(content);
                 }
              },
              error : function(){
                 alert("통신오류");
              }
           });
        });
        
        //평점순 리스트
        $('#ratinglist').click(function(){
           var sarea = $('#sArea').val();
            var address = $('#inputArea').val();
            var month = $('#month').val();
            var sNo = $('#sNo').val();
            
            var url = decodeURIComponent(location.href);
           var params;
           var param;
           
           params = url.substring(url.indexOf('?') + 1, url.length);
           params = params.split('&');
           
           param = params[0];
           
           $.ajax({
              url : "/schedule/sortrating.kit?sarea=" + param + "&month=" + month,
              type : "post",
              dataType : "json",
              data : {
                 "sarea" : param,
                 "month" : month
              },
              success : function(data){
                 var list = data;
                 
                 alert("성공");
                 
                 $('.delete').remove();
                 
                 for(var i = 0; i < list.length; i++){
                    var content = "";
                    
                    content += '<div class="delete">';
                    content += '   <form action="/schedule/scheduleDetail.kit" method="post" class="box" onclick="this.submit();">';
                    content += '      <div class="w3-container w3-card w3-margin-bottom content">';
                    content += '          <input type="hidden" name="sNo" value="' + list[i].sNo + '"' + '>';
                    content += '              <div class="w3-col m4">';
                    content += '              </div>';
                    content += '              <div class="w3-col m8 infobox">';
                    content += '                 <div class="star_score row">';
                    content += '                    <span class="st_off">';
                    content += '                       <span class="st_on" style="width: ' + list[i].likeAvg * 20 + '%;"></span>';
                    content += '                    </span>';
                    content += '                 </div>';
                    content += '                    <h5 class="sname w3-padding">' + list[i].sName + '</h5>'; 
                    content += '                    <div class="info w3-padding">'; 
                    content += '	<p> 여행시작일 ' + list[i].sSdate + ' ~ ' + list[i].sEdate + ' 까지 </p>';
                    content += '<p> 나라 : ' + list[i].sCountry  + ', 도시 : ' + list[i].sArea + '</p>';
                    content += '					<p> ' + list[i].sBody + ' </p>';
                    content += '                 </div>';
                    content += '              </div>';
                    content += '       </div>';
                    content += '   </form>';
                    content += '</div>';
                    
                    $('.add').append(content);
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
                 
                 alert("성공");
                 
                 $('.delete').remove();
                 
                 for(var i = 0; i < list.length; i++){
                    var content = "";
                    
                    content += '<div class="delete">';
                    content += '   <form action="/schedule/scheduleDetail.kit" method="post" class="box" onclick="this.submit();">';
                    content += '      <div class="w3-container w3-card w3-margin-bottom content">';
                    content += '          <input type="hidden" name="sNo" value="' + list[i].sNo + '"' + '>';
                    content += '              <div class="w3-col m4">';
                    content += '              </div>';
                    content += '              <div class="w3-col m8 infobox">';
                    content += '                 <div class="star_score row">';
                    content += '                    <span class="st_off">';
                    content += '                       <span class="st_on" style="width: ' + list[i].likeAvg * 20 + '%;"></span>';
                    content += '                    </span>';
                    content += '                 </div>';
                    content += '                    <h5 class="sname w3-padding">' + list[i].sName + '</h5>'; 
                    content += '                    <div class="info w3-padding">'; 
                    content += '	<p> 여행시작일 ' + list[i].sSdate + ' ~ ' + list[i].sEdate + ' 까지 </p>';
                    content += '<p> 나라 : ' + list[i].sCountry  + ', 도시 : ' + list[i].sArea + '</p>';
                    content += '					<p> ' + list[i].sBody + ' </p>';
                    content += '                 </div>';
                    content += '              </div>';
                    content += '       </div>';
                    content += '   </form>';
                    content += '</div>';
				
					

                    $('.add').append(content);
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
	body{
		background : #f0f0f0;
	}
   *{box-sizing: border-box;}
   
/*    검색창 박스 크기 */
   .mainSearch {
      padding: 10px;
      margin-left: 21px;
   }
   
/*    검색창 위치 조정 */
   .leftBtn2 {
      margin-left: 7px;
   }
   
/*    검색창 input 크기 */
   .pbtn {
      width : 400px;
      padding: 4px;
      text-align: center;
      position : absolute;
      left : 950px;
      top : 130px;
   }
   
/*    주소검색버튼 */
   #search {
   	position : absolute;
      margin-bottom: 4px;
      left : 1400px;
      top : 130px;
   }
   
/*    월별선택버튼 */
   #month {
      position: relative;
      top: -3px;
   }
   
/*    월별검색버튼 */
   #searchmonth {
      position: relative;
      top: -3px;
      font-size: 15px;
   }
   
/*    정렬기준 */
   .sortbox {
/*        background-color: #DDDDFF; */
/*       border-radius: 10px 10px; */
/*        border: 1px solid #afafdb; */
      width: 100%;
      height: 50px;
      padding: 8px;
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
   .sortmonth {
      font-size: 15px;
      margin-left: 30px;
   }
   .sortmenu:hover {
      text-decoration: none;
   }
   
/*    콘텐트박스 */
   .content {
      border: 1px solid #dee2e6;
      height: 316px;
      padding: 30px;
   }
   
/*    콘텐트박스hover */
   .content:hover {
       border: 1px solid #2cb5e9; 
       background-color: rgba(222, 226, 230, 0.2);
   }
   
/*    스케쥴제목 */
   .sname{
      border-bottom: 8px solid rgba(44, 181, 233, 0.5);
      font-weight: bold;
   }
   
/*    스케쥴정보박스 */
   .infobox {
      position: relative;
      top: -11px;
   }
   
/*    스케쥴정보 */
   .info {
      margin-top: 10px;
/*       border: 3px solid rgba(0, 73, 191, 0.3); */
   }
   
/*    별만들기 */
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
/*       margin-top: 10px; */
      
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

.content {
	background : white;
}
   
</style>
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
   <div class="container">
      <div class="w3-container w3-margin-top mainSearch">

      </div>
      
      <div class="w3-container w3-margin-top w3-margin-left">
      <div class="sortbox w3-margin-bottom">
            <span class="standard">정렬기준</span>
            <a href="#" class="sortmenu" id="ratinglist">평점순</a>
            <a href="#" class="sortmenu" id="recentlist">최신순</a>
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
               <input type="button" class="btn btn-dark" value="검색" id="searchmonth">	
				</a>
				<form method="POST" name="myform" id="frm">
					<input type="text" class="city pbtn" id="inputArea" name="address" value="${ADDRESS}" placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
					<input type="hidden" name="sCountry" id="sCountry"> <input type="hidden" name="sArea" id="sArea">
					<button type="button" class="btn btn-dark" id="search">검색</button>
				</form>
			</div>
      <div class="add" id="add">
        <h3 class="listheadtext">검색된 여행 스케쥴 <span id="listlength"></span>개</h3>
         <div class="delete">
            <c:forEach var="data" items="${LIST}" varStatus="status">
   			<input type="hidden" name="count" class="counter">
               <form action="/schedule/scheduleDetail.kit" method="get" class="box">
                  <div class="w3-container w3-margin-bottom content">
                     <input type="hidden" name="sNo" value="${data.sNo}">
                     <input type="hidden" name="sCountry">
                           <input type="hidden" name="sArea">
                           
                     <div class="w3-col m4"> 
                     </div>
                     <div class="w3-col m8 infobox">
                        <div class="star_score row">
                            <span class="st_off">
                                 <span class="st_on" style="width: ${data.likeAvg * 20}%;" ></span>
                           </span>
                           <div class="avg" id="avg"></div>
                        </div>
                        <h5 class="sname w3-padding">${data.sName}</h5>
                        <div class="info w3-padding">
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
      </div>
   </div>
   <script>
   var counter = document.querySelectorAll('.counter').length;
   	document.getElementById('listlength').innerHTML = counter;
   </script>
</body>
</html>