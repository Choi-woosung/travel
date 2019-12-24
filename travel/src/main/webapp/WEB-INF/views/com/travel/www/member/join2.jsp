<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    
    $(function(){
        $(".gnb_menu_btn").click(function(){
            $("#gnb_all").show();
        });
        $(".gnb_close_btn").click(function(){
            $("#gnb_all").hide();
        });
    });

</script>
</head>
<body>
	<!-- 상단 시작 { -->
<div id="hd">
    <h1 id="hd_h1">회원 가입</h1>

    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>

        <div id="tnb">
        <ul>
            <li><a href="http://as8939.dothome.co.kr/bbs/register.php"><i class="fa fa-user-plus" aria-hidden="true"></i> 회원가입</a></li>
            <li><a href="http://as8939.dothome.co.kr/bbs/login.php"><b><i class="fa fa-sign-in" aria-hidden="true"></i> 로그인</b></a></li>
            
        </ul>
  
    </div>
    <div id="hd_wrapper">
        <div id="logo">
            <a href="http://as8939.dothome.co.kr"><img src="http://as8939.dothome.co.kr/img/logo.png" alt="그누보드5"></a>
        </div>
		<nav id="gnb">
			<h2>메인메뉴</h2>
			<div class="gnb_wrap">
				<ul id="gnb_1dul">
											<li class="gnb_empty">메뉴 준비 중입니다.</li>
									</ul>
				<div id="gnb_all">
					<h2>전체메뉴</h2>
					<ul class="gnb_al_ul">
													<li class="gnb_empty">메뉴 준비 중입니다.</li>
											</ul>
					<button type="button" class="gnb_close_btn"><i class="fa fa-times" aria-hidden="true"></i></button>
				</div>
			</div>
		</nav>
   
   		<div class="top_menu">
   			<ul>
   				<li class="top_menu_login">로그인<span>로그인</span></li>
				<li class="top_menu_migam">미감쾌청<span>미감쾌청</span></li>
  				<li class="top_menu_reserv">예약확인<span>예약확인</span></li>
   			</ul>
		</div>
    </div>
    
    
</div>
<!-- } 상단 끝 -->
</body>
</html>