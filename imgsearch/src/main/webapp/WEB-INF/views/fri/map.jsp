<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ab026499e6217ef57dd358c62e517c3d870d2cbb"></script>
<script src="../../resources/node_modules/socket.io/node_modules/socket.io-client/socket.io.js"></script>
<script src="../../resources/js/geolocation.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/map2.css">
</head>
<body>
	<div class="main">
	    <p id="support"></p>
	    <p id="lat"></p>
	    <p id="lng"></p>
	    <p id="acc"></p>
    <div id="map" style="width:700px;height:400px;margin:auto;margin-top:70px"></div>
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name= "store" value="${store}">
    <button onclick="setBounds()">친구 한눈에 보기</button>
	</div>

 <link href="/resources/defualtFont.css" rel="stylesheet"
 type="text/css" />
	
</body>
</html>