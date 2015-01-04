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
	z-index:1000;
}
</style>


</head>
<body id="body1" class="">
	<div class="wrap">
		<div class="logo">
			<a href="#">로고</a>
		</div>
		<div class="menu"><jsp:include page="/WEB-INF/views/img/menubutton.jsp" flush="true">
			<jsp:param value="${id}" name="id"/>
			<jsp:param value="${uno}" name="uno"/>
		</jsp:include></div>
		
         
		<div class="container">
				<div id="map" class="map2"></div>
<%-- 					<input type="hidden" name="id" value="${id}"> --%>
					<input type="hidden" name="store" value="${store}">
					<div class="mapbutton">
						<button class="btn" onclick="setBounds()">친구 한눈에 보기</button>
						<button class="btn btn-danger" onclick="disconnect('${id}')">연결 끊기</button>
					</div>
		</div>
		
	</div>
	
 <link href="/resources/defualtFont.css" rel="stylesheet"
 type="text/css" />

</body>
</html>