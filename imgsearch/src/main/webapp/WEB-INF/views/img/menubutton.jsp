<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">


<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.js"></script> -->


<!-- 제이쿼리가 잇으면 뷰페이지에서 다른 스크립트 오류남 -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->


<!-- 친구찾기 버튼 -->
<link rel="stylesheet" type="text/css" href="/resources/main/menu/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/main/menu/css/component.css" />
<script src="/resources/main/menu/js/classie.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/colorbox/colorbox.css" />
<script src="/resources/colorbox/jquery.colorbox.js"></script>
<!-- Font Awesome -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" >
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0c2b0a9685b5d431411a98ce97c1961f2e0f49b4"></script>
<script src="/resources/node_modules/socket.io/node_modules/socket.io-client/socket.io.js"></script>
<script src="/resources/js/geolocation.js"></script>
<style type="text/css">

#navs {
  position: fixed;
  right: 10px;
  top: 10px;
  width: 40px;
  height: 40px;
  line-height: 40px;
  list-style-type: none;
  margin: 0;
  padding: 0;
  text-align: center;
  font-family: 'Nanum Gothic';
  color: black; 
  cursor: pointer;
  
}

#navs>li,
#navs:after {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border-radius: 20%;
  -webkit-border-radius: 20%;
  background-color: #74CA9F; /* #51fcf7; */
}


#navs>li {
  transition: all .6s;
  -webkit-transition: all .6s;
  -moz-transition: .6s;
  
}

#navs:after {
  font-family: FontAwesome;
  font-size:2em;
  content: "\f03a";
  z-index: 999;
  border-radius: 20%;
  -webkit-border-radius: 20%;
}


#navs a {
  width: 40px;
  height: 40px;
  display: inline-block;
  border-radius: 30%;
  -webkit-border-radius: 30%;
  text-decoration: none;
  color: #fff;
  font-size: 0.8em;
  padding-top: 10px;
}

#toTop{
	display:none;
	position:fixed;
	bottom:5px;
	right:5px;
	width:64px;
	height:64px;
	background-image:url(/images/up.png);
	background-repeat:no-repeat;
	opacity:.6;
	filter:alpha(opacity=60);
	}
	
#toTop:hover{
	opacity:1;
	filter:alpha(opacity=100);
}
.rfd{
	width:240px;
	height:130px;
	padding:19px;
	font-size:15px;
	background-color: #3d9167;
	position: fixed;
	right:0px;
	bottom:-130px;
	text-align: center;
	z-index: 9999;
}
</style>
</head>
<body>

<!-- data-open="-" data-close="asdfsaf" -->
<ul id="navs" class="fa fa-list-ul" style="color: #fff;">
<%--   <sec:authorize ifNotGranted="ROLE_USER"> --%>
  <li><a id="login" href="/user/loginform"><i class="fa fa-sign-in fa-lg fa-2x"></i></a></li>
<%--   </sec:authorize> --%>
<%--   <sec:authorize ifAnyGranted="ROLE_USER"> --%>
  <li><a id="login" href="/j_spring_security_logout"><i class="fa fa-sign-out fa-lg fa-2x"></i></a></li>
  <li><a><i class="fa fa-info-circle fa-lg fa-2x"></i></a></li>
  <li><a id="friend"><i class="fa fa-users fa-lg fa-2x"></i></a></li>
  <li><a href="/user/location"><i class="fa fa-map-marker fa-2x"></i></a></li>
  <li><a href="/admin/main"><i  class="fa fa-cog fa-lg fa-2x"></i></a></li>
<%--   </sec:authorize> --%>
</ul>

<script >
(function(){
	var ul=$("#navs"),li=$("#navs li"),i=li.length,n=i-1,r=120;
	ul.click(function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			for(var a=0;a<i;a++){
				li.eq(a).css({
					'transition-delay':""+(50*a)+"ms",
					'-webkit-transition-delay':""+(50*a)+"ms",
					'left':(-r*Math.cos(90/n*a*(Math.PI/180))),
					'top':(r*Math.sin(90/n*a*(Math.PI/180)))	
				});
			}
		}else{
			li.removeAttr('style');
		}
	});
})($);
</script>
		
		<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
		<!-- 	<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2"> -->
		<h3 class="friTitle" style='display: block'>
			친구목록 <span><button class="close" id="friclose"/></span>
		</h3>
		<h3 class="bookmarkTitle" style='display: none'>
			북마크 <span><button class="close" id="bookclose"/></span>
		</h3>
		<div class="friList" style='display: block'>
		</div>
		<div class="bookmarkList" style='display: none'>
		</div>
		<div class="search">
			<div style="margin-bottom:3px">
				<button class="btn btn-success fribtn" style='display: inline;' onclick="javascript:locationShare()">위치 공유</button>
				<button class="btn btn-success bmbtn" style='display: none;' onclick="javascript:storeShare()">위치 공유</button>
				<button class="btn" style='display: inline;' onclick="javascript:bookmarkListDisplay()">북마크</button>
				<button class="btn" style='display: inline;' onclick="javascript:friListDisplay()">친구목록</button>
			</div>
			<form class="form-search" style='display: inline;'>
				<input type="hidden" value="${id}" name="myid"></input>
				<input type="text" class="input-medium search-query"
					name="f_uid" />
			</form>
				<button class="btn"  style='display: inline;' onclick="addFriend()">추가</button>
		</div>
		<!-- 	</nav> -->
	</div>
	
<!-- 	<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="request-Friend"> -->
<!-- 		<h3>requestFriend</h3> -->
<!-- 	</div> -->

<script>




function disableOther( button ) {
	if( button !== 'showRight' ) {
		classie.toggle( showRight, 'disabled' );
	}
}

		var menuRight = document.getElementById( 'cbp-spmenu-s2' )
		var loginOpen = document.getElementById( 'login' );
		
		$(document).ready(function (){
			
			var loginForm = $("[name=loginForm]").val();
			if(loginForm){
				$("#login").trigger("click");
			}
			$.ajax({
				url:"/user/friendlist",
				success:function(data){
					var content = "";
					$.each(data, function(idx, val){
						content += "<a class='friend' href='#'><i class='icon-ok' data-id='"+val.f_uid+"' style='display: none'></i>"+val.f_uid+"</a>";
					});
					$(".friList").html(content);
					
					$(".friend").click(function(event){
						event.preventDefault();
						$(this).children().toggle("fast",function(){
							if($(this).attr("data-check") == "checked"){
								$(this).attr("data-check","");
								return;
							}
							$(this).attr("data-check","checked");
						});
					});
				}
			});
			$.ajax({
				url:"/user/bookmarklist",
				success:function(data){
					var content = "";
					$.each(data, function(idx, val){
						content += "<a class='bookmark' href='#'><i class='icon-ok' data-store='"+val.s_name+"' data-lat='"+val.s_lat+"' data-lng='"+val.s_lng+"' style='display: none'></i>"+val.s_name+"</a>";
					});
					$(".bookmarkList").html(content);
					
					$(".bookmark").click(function(event){
						event.preventDefault();
						$(this).children().toggle("fast",function(){
							if($(this).attr("data-check") == "checked"){
								$(this).attr("data-check","");
								return;
							}
							$(this).attr("data-check","checked");
						});
					});
				}
			});
		});
		
		
		loginOpen.onclick = function(){
			$("#login").colorbox({
				iframe:true, 
				width:"40%", height:"50%",
				opacity: 0.5,
				onClosed: function() {
					location.reload();
				}
			});
		};

		var friendOpen = document.getElementById( 'friend' );
		var friendClose = document.getElementById( 'friclose');
		var bookmarkClose = document.getElementById( 'bookclose');
		
		friendOpen.onclick = function() {
			
			classie.toggle( this, 'active' );
			classie.toggle( menuRight, 'cbp-spmenu-open' );
			disableOther( 'showRight' );
		};
		
		friendClose.onclick = function() {
			
			classie.toggle( this, 'active' );
			classie.toggle( menuRight, 'cbp-spmenu-open' );
			disableOther( 'showRight' );
		};
		bookmarkClose.onclick = function() {
			
			classie.toggle( this, 'active' );
			classie.toggle( menuRight, 'cbp-spmenu-open' );
			disableOther( 'showRight' );
		};
		function requestFriend(name,state){
			console.log("requestFriend 실행: " +name+", 상태 : "+state);
			var div = "<div class='rfd' id='"+name+"'><h5>"+name+"님이<br/> 친구 요청을 하셨습니다.</h5><button onclick='reject("+name+")' class='btn' style='margin-right:10px'>거절</button><button id='agree' onclick='javascript:accept("+name+");' class='btn'>수락</button></div>";
			$("body").append(div);
			$('#'+name).animate({ bottom:'1px'},1000);
		}
		function friendListAjax(){
			$.ajax({
				url:"/user/friendlist",
				success:function(data){
					var content = "";
					$.each(data, function(idx, val){
						content += "<a class='friend' href='#'><i class='icon-ok' style='display: none'></i>"+val.f_uid+"</a>";
					});
					$(".friList").html(content);
				}
			});
		}
		function friListDisplay(){
			  $(".friList").css("display","block");
			  $(".bookmarkList").css("display","none");
			  $(".bookmarkTitle").css("display","none");
			  $(".friTitle").css("display","block");
			  $(".friTitle").css("display","block");
			  $(".fribtn").css("display","inline");
			  $(".bmbtn").css("display","none");
			  
		}
		function bookmarkListDisplay(){
			  $(".friList").css("display","none");
			  $(".bookmarkList").css("display","block");
			  $(".bookmarkTitle").css("display","block");
			  $(".friTitle").css("display","none");
			  $(".fribtn").css("display","none");
			  $(".bmbtn").css("display","inline");
		}
		
</script>

</body>
</html>
