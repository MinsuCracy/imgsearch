<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<link rel="stylesheet" type="text/css" href="/resources/user/css/style.css" />
<script src="/resources/user/js/modernizr.custom.63321.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=967f12c12424311a073c2995f73cd4402bfcbd96"></script>

<!-- <link rel="stylesheet" type="text/css" href="/resources/css/map2.css"> -->
<link rel="stylesheet" type="text/css" href="/resources/user/location/css/bootstrap2.css">
<link rel="stylesheet" type="text/css" href="/resources/user/location/css/responsive.css">
<title>Insert title here</title>
<style>
/* html,body{ */
/* 	margin:0; */
/* 	padding:0; */
/*  	border:0;  */
/*  	width: 100%;  */
/*  	height: 100%;  */
	
/* 	background: url(/resources/testImg/back.jpg) no-repeat center center fixed;  */
/* 	-webkit-background-size: 100% 100%; */
/* 	-moz-background-size: 100% 100%; */
/* 	-o-background-size: 100% 100%; */
/* 	background-size: 100% 100%; */
	
/* } */

*{
	margin:0;
	padding:0;
	border:0;
}
/* .wrap { */
/* 	width: 100%; */
/* 	height: 100%; */
/* 	position: absolute; */
/* } */
.topmenu{
	position: fixed; 
	background-color: yellow; 
	width: 100%; 
	height: 5%;
	z-index:999;
}
.logo{
	position: fixed;
	background-color: green; 
	width: 100px; 
	height: 5%; 
	z-index:999;
}
.menu{
	right:0;
	position: fixed;
	background: none; 
	width: 100px; 
	height: 5%; 
	z-index:999;
}
</style>


</head>
<body id="body1" class="">
	<div class="wrap">
		<div class="logo">
			<a href="#">로고</a>
		</div>
		<div class="menu"><jsp:include page="friInclude.jsp" flush="true">
			<jsp:param value="${id}" name="id"/>
			<jsp:param value="${uno}" name="uno"/>
		</jsp:include></div>
		
         
		<div class="container">
				<div id="map" class="map2"></div>
					<input type="hidden" name="id" value="${id}">
					<input type="hidden" name="fri_id" onchange="changeVal()">
					<input type="hidden" name="store" value="${store}">
					<input type="hidden" name="loginForm" value="${loginForm}">
					<div class="mapbutton">
						<button class="btn" onclick="setBounds()">친구 한눈에 보기</button>
						<button class="btn btn-danger" onclick="()">연결 끊기</button>
					</div>
		</div>
		
	</div>
<script src="/resources/node_modules/socket.io/node_modules/socket.io-client/socket.io.js"></script>
<script src="/resources/js/geolocation2.js"></script>
</body>
</html>