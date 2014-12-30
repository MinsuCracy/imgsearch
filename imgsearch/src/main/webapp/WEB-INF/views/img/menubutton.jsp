<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">


<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.js"></script> -->


<!-- 친구찾기 버튼 -->
<link rel="stylesheet" type="text/css" href="/resources/main/menu/css/default.css" />
<link rel="stylesheet" type="text/css" href="/resources/main/menu/css/component.css" />
<script src="/resources/main/menu/js/classie.js"></script>

<!-- Font Awesome -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

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
  background-color: #3d9167; /* #51fcf7; */
}

#navs>li {
  transition: all .6s;
  -webkit-transition: all .6s;
  -moz-transition: .6s;
}

#navs:after {
  content: attr(data-close);
  z-index: 1;
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


</style>
</head>
<body>


<ul id="navs" class="hi-icon hi-icon-images" style="color: #fff;" data-open="-" data-close="메뉴">
  <li><a><i class="fa fa-sign-out fa-lg"></i></a></li>
  <li><a><i class="fa fa-info-circle fa-lg"></i></a></li>
  <li><a id="friend"><i class="fa fa-users fa-lg"></i></a></li>
  <li><a href="/user/location">친구찾기</a></li>
  <li><a><i class="fa fa-cog fa-lg"></i></a></li>
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
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
			<h3>친구목록<span><button id="menuclose" style="float:right;">닫기</button></span></h3>
			<a href="#">강민수</a>
			<a href="#">김동영</a>
			<a href="#">전태환</a>
			<a href="#">정소희</a>
			<a href="#">노도연</a>
		</nav>


<script>
function disableOther( button ) {
	if( button !== 'showRight' ) {
		classie.toggle( showRight, 'disabled' );
	}
}

		var menuRight = document.getElementById( 'cbp-spmenu-s2' )

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