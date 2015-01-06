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
<link rel="stylesheet" type="text/css" href="/resources/user/location/css/bootstrap.css">
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
.logo{
	position: fixed;
	background: none; 
	width: 200px; 
	height: 7%; /* 5%; */ 
	z-index:999;
}
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>


</head>
<body id="body1" class="">
	<div class="wrap">
		<div class="logo"><a href="/img/"><img src="/file/view?path=logo2.png" style="height:55px;width:100%;"></a></div>
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
