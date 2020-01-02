<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/img/main/favicon2.ico" />
<title>회원가입</title>
    <style>
        #wrap{
            width:530px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            border:3px solid skyblue
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
        
        .small{
        	margin:3px;
        	float:right;
        }
    </style>


<link rel="stylesheet" href="/css/w3.css" >
<script type="text/javascript" src="/js/jquery-3.4.1.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$('#Idbtn').click(function(){
			var sid = $('#userId').val();
			
			$.ajax({
				url  : "idCheck.kit",
				type : "post",
				dataType : "text",
				data : {
					"id" : sid
				},
			
			
			success : function(data){
				var ok = data;
				
				if(ok == 1){
					// 이미 회원가입 된거
					$('#userId').val("");
					alert("이미 가입된 아이디입니다.");
						
				} else {
					// 회원가입 가능		
					
					alert("사용 가능한 아이디입니다.");
				}
			},
			error : function(){
				alert("Error");
			}
		});
	});
});
</script>
</head>
<body>
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        <div class="small">
         <input type="button" id="Idbtn" value="중복확인" size="40"> 
        </div>
        <form method="post" action="/member/joinProc.kit">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" id="userId" name="mId" maxlength="10" size="32">
                    </td>
                </tr>
                          
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" id="userPw" name="mPw" maxlength="10" size="32">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" id="userPw2" name="mPw2" maxlength="10"  size="32">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" id="name" name="mName" maxlength="10" size="32">
                    </td>
                </tr>
                    
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="email" id="email" name="mMail" maxlength="30" size="32">
                    </td>
                </tr>
                    

                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" id="address" name="mAddress" maxlength="40" size="32">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">PCdate</td>
                    <td>
                        <input type="text" id="userNo" name="sPcdate" maxlength="10" size="32">
                    </td>
                </tr>
                
                 <tr>
                    <td id="title">핸드폰</td>
                    <td>
                        <input type="text" id="userMobile" name="mMobile" maxlength="16" size="32">
                    </td>
                </tr>
                
        		<tr>
                    <td id="title">Grade</td>
                    <td>
                        <input type="text" id="userGrdae" name="mGrade" maxlength="10" size="32">
                    </td>
                </tr>     
                            
        		<tr>
                    <td id="title">Point</td>
                    <td>
                        <input type="text" id="userPoint" name="mPoint" maxlength="10" size="32">
                    </td>
                </tr>    
            </table>
            <br>
            <input type="submit" class="w3-margin" value="가입">     
            <input type="button" class="w3-margin" value="취소">
        </form>
    </div>



	




</body>
</html>