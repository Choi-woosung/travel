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
   });
</script>
<style>
   *{box-sizing: border-box;}
   
/*    인원수창 안보이기 */
	.pCount {
	   height: 130px;
	   background: white;
	   position: absolute;
	   border: 1px solid gray;
	   border-radius: 3px;
	   padding: 10px;
	   margin-top: 2px;
	   display: none;
	}
   
/*     인원수창 */
   .pCount.view {
	   display: block;
	}
</style>
</head>
<body>
   <header>
      <c:import url="/navigationBar.kit"></c:import>
   </header>
   <div class="container">
      <div class="w3-col m3 w3-border w3-padding w3-margin-top">
         <div class="mainSearch">
            <form method="POST" name="myform" id="frm">
               <div class="form-group">
                  <label for="inputArea"> 여행가는 도시 </label> <input type="text"
                     class="form-control city" id="inputArea" name="sCountry" value="${ADDRESS}"
                     placeholder="떠나실 장소를 검색해보세요" autocomplete="off">
               </div>
               <div class="row">
                  <div class="form-group col-md-6 ">
                     <label for="calendarArea" id="calendarArea1"> 출발일 선택 </label> <input
                        type="text" class="form-control col-md-12" id="sSdate"
                        name="Sdate" value="${SVO.sSdate}" placeholder="언제부터 ?" autocomplete="off">
                  </div>
                  <div class="form-group col-md-6">
                     <label for="calendarArea"> 도착일 선택 </label> <input type="text"
                        class="form-control col-md-12" id="sEdate" name="Edate" value="${SVO.sEdate}"
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
                        <input type="text" class="pbtn topIpt" id="aCount" value="${SVO.sAtotal}">
                        <button class="abtn btn rightBtn1" id="endbtn1" >&raquo;</button>
            
                     </div>
                     <div class="count">
                     <label> <span class="totalcount countAdult">어린이</span>
                     </label>
                        <button class="cbtn btn leftBtn2" id="startbtn2" >&laquo;</button>
                        <input type="text" class="pbtn bottomIpt" id="cCount" value="${SVO.sCtotal}">
                        <button class="cbtn btn rightBtn2" id="endbtn2">&raquo;</button>
               
                     </div>
                        <button class="btn btn-outline-info exbtn confirmBtn">확인</button>
                  </div>
                  <input type="hidden" name="sAtotal" id="adult12">
                  <input type="hidden" name="sCtotal" id="child12">   
                  <input type="hidden" name="sRn" value="1">            
               </div>
      <!--             <button type="button" class="btn btn-outline-info" id="make">스케쥴만들기</button> -->
               <button type="button" class="btn btn-outline-info" id="search">검색</button>
<!--                <button type="button" class="btn btn-outline-info" id="certification">이메일인증</button> -->
<!--                <button type="button" class="btn btn-outline-info" id="nearbysearch">근처검색</button> -->
            </form>
         </div>
      </div>
      <div class="w3-col m8 w3-margin-top w3-margin-left">
      <c:forEach var="data" items="${LIST}">
      <form action="/schedule/scheduleDetail.kit" method="post" class="box">
         <input type="hidden" name="sNo" value="${data.sNo}">
         <div class="w3-container w3-card w3-padding">
            <div class="w3-col m6">
               <img alt="mainpic" src="${data.sPic}" style="width: 300px; height: 300px">
            </div>
            <div class="w3-col m6">
               <h4>${data.sName}</h4> 
            </div>
         </div>
      </form>
      </c:forEach> 
      </div>
   </div>
</body>
</html>