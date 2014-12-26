<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- 친구찾기 버튼 -->
<link rel="stylesheet" type="text/css" href="/resources/user/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/user/component3.css" />
<link rel="stylesheet" type="text/css" href="/resources/colorbox/colorbox.css" />
<script src="/resources/user/classie.js"></script>
<script src="/resources/colorbox/jquery.colorbox.js"></script>



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
  color: #fff;
  cursor: pointer;
}

#navs>li,
#navs:after {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  -webkit-border-radius: 50%;
  background-color: #e74c3c;
}

#navs>li {
  transition: all .6s;
  -webkit-transition: all .6s;
  -moz-transition: .6s;
}

#navs:after {
  content: attr(data-close);
  z-index: 1;
  border-radius: 50%;
  -webkit-border-radius: 50%;
}


#navs a {
  width: 40px;
  height: 40px;
  display: inline-block;
  border-radius: 50%;
  -webkit-border-radius: 50%;
  text-decoration: none;
  color: #fff;
  font-size: 0.8em;
}
</style>
</head>
<body>


<ul id="navs" data-open="-" data-close="+">
  <li><a id="login" href="/user/loginform">login</a></li>
  <li><a>memb</a></li>
  <li><a id="friend">friend</a></li>
  <li><a>menu</a></li>
  <li><a>menu</a></li>
</ul>

<script type="text/javascript">
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
		<h3>
			친구목록<span><button class="close" id="menuclose"/></span>
		</h3>
		<div class="friList">
			<a href="#"><i class="icon-ok" style="display: none"></i>강민수</a>
					<a href="#"><i class="icon-ok" style="display: none"></i>김동영</a> 
					<a href="#"><i class="icon-ok" style="display: none"></i>전태환</a> 
					<a href="#"><i class="icon-ok" style="display: none"></i>정소희</a> 
					<a href="#"><i class="icon-ok" style="display: none"></i>노도연</a>
					<a href="#"><i class="icon-ok" style="display: none"></i>정소희</a> 
					<a href="#"><i class="icon-ok" style="display: none"></i>노도연</a>
					<a href="#"><i class="icon-ok" style="display: none"></i>정소희</a> 
					<a href="#"><i class="icon-ok" style="display: none"></i>노도연</a>
					<a href="#"><i class="icon-ok" style="display: none"></i>정소희</a> 
					<a href="#"><i class="icon-ok" style="display: none"></i>노도연</a>
					<a href="#"><i class="icon-ok" style="display: none"></i>정소희</a> 
		</div>
		<div class="search">
			<form class="form-search">
				<input type="text" class="input-medium search-query"
					name="addFriend" />
				<button class="btn">추가</button>
			</form>
		</div>
		<!-- 	</nav> -->
	</div>

<script>
$("a").click(function(event){
	event.preventDefault();
	$(this).children().toggle();
});


function disableOther( button ) {
	if( button !== 'showRight' ) {
		classie.toggle( showRight, 'disabled' );
	}
}

		var menuRight = document.getElementById( 'cbp-spmenu-s2' )
		var loginOpen = document.getElementById( 'login' );
		
		$(document).ready(function (){
			
			var loginForm = $("[name=loginForm]").val();
			console.log(" 로그인 여부 : " + loginForm);
			if(loginForm){
				$("#login").trigger("click");
			}
		});
		
		
		loginOpen.onclick = function(){
			$("#login").colorbox({
				iframe:true, 
				width:"40%", height:"50%",
				opacity: 0.5,
				});
		};
		
		var friendOpen = document.getElementById( 'friend' );
		var friendClose = document.getElementById( 'menuclose');
		
		
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

</script>


</body>
</html>