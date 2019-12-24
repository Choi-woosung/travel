<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- meta --%>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<%-- CSS --%>
<link rel="stylesheet" href="/css/bootstrap.min.css">

<%-- Script --%>
<script src="/js/jquery-3.4.1.min.js"></script>

<%-- title --%>
<title>MY TRAVEL</title>

<%-- style --%>
<style>
	<%-- ALL --%>
	*{
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	    list-style: none;
	    color: #282c37;
	    font-family: -apple-system,
				     BlinkMacSystemFont,
				     "Segoe UI",Roboto,
				     "Helvetica Neue",
				     Arial,"Noto Sans",
				     sans-serif,
				     "Apple Color Emoji",
				     "Segoe UI Emoji",
			         "Segoe UI Symbol",
				     "Noto Color Emoji";
	}
	.mainBody{
		background-color: rgb(51, 51, 51);
	}
	<%-- topDiv --%>
	.topDiv{
		position: fixed;
		top: 0;
		left: 0;
	    width: 100%;
	    height: 70px;
	    z-index: 1;
	}
	<%-- schedule --%>
	.scheduleDiv{
		width: 85%;
		height: calc(100vh - 70px);
		margin-top: 70px;
		text-align: center;
		padding-top: 48px;
	}
	.schedule{
		display: block;
		width: 800px;
		min-height: 500px;
		height: auto;
		background-color: #d9e1e8;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 48px;
		border-radius: 16px;
	}
	.toDay{
		font-size: 2rem;
	}
	<%-- scheduleSide --%>
	.scheduleSide{
		position: fixed;
		bottom: 0;
		right: 0;
		width: 15%;
		height: 100vh;
		background-color: #d9e1e8;
	}
</style>
</head>
<%-- body --%>
<body class="mainBody">
    <%-- topDiv --%>
	<div class="topDiv">
		<c:import url="/navigationBar.kit"></c:import>
	</div>
	
	<%-- scheduleMain --%>
	<ul class="scheduleDiv">
		<c:forEach begin="0" end="${LIST.sDay}" varStatus="data">
		<li class="schedule">
			<div class="toDay">Day ${data.count}</div>
		</li>
		</c:forEach>
	</ul>
	
	<%-- scheduleSide --%>
	<div class="scheduleSide">
		
	</div>
	
	<%-- script --%>
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', () => {
			<%-- function --%>
            function id(id) {
                return document.querySelector(id);
            }
            function evt(id, evt, fun) {
                if (id != null) {
                	id.addEventListener(evt, fun);
                }
            }
		});
	</script>
</body>
</html>