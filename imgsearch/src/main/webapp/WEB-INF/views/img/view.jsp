<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Search { ${vo.s_name} }</title>

<!-- jQuery/jQueryUI (hosted) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/jquery-ui.js"></script>

<!-- Prettyprint -->
<link
	href="https://google-code-prettify.googlecode.com/svn/loader/prettify.css"
	rel="stylesheet" type="text/css" />

<!-- Index -->
<style>
html, body{
	position:absolute;
	width:100%;
	height:100%;
	background-color: rgb(247, 245, 240); 
}

body {
	font-family: "Segoe UI", Verdana, Helvetica, Arial, sans-serif;
	font-size: 90%;
	color: #fff;
	
}
*{
	margin:0;
	padding:0;
	border:0;
}

.logo{
	background: none; 
	width: 200px; 
	height: 7%; 
}

#menu {
	width:100%;
	height: 10px; /* 50px; */
	/* margin-botton: 5px; */
}

/* #preview { */
/* /* 	background-color : white; */ */
/* /* 	height:100%; */ */
/* 	border: solid thin silver; */
/* /* 	padding: 3em; */ */
/* /*  	margin: 0 5% 3% 5%;  */ */
/* /* 	text-align: center; */ */
/* 	box-shadow: 0 0 2em silver; */
/* } */

.chapter {

	-webkit-columns: 460px;
	-moz-columns: 460px;
	columns: 460px;
	-webkit-column-gap: 4em;
	-moz-column-gap: 4em;
	column-gap: 4em;
	-webkit-column-rule: thin solid silver;
	-moz-column-rule: thin solid silver;
	column-rule: thin solid silver;
	text-align: justify;
}

.store {
	width: 100%;
	height: 25%; /* 15%; */
/*  margin-bottom: 20px;  */
	background-color: #71c39a;
 	padding:1%; 
}

/* .store ul {
	list-style: none;
	position: inherit;
 	margin: 3% 10% 0 10%; 
	width: 80%;
	height: 100%;
	border-bottom : 0.2em solid white;
} */

.store ul {
	list-style: none;
	position: inherit;
 	margin: 0% 10% 0 10%; 
	width: 80%;
	height: 100%;
}

.store .menu{
	float:left;
	width:20%;
	height:100%;	
	
}
.store .title{
	float:left;
	width: 60%;/* 50%; */
	height: 30%; /* 40%; */
	border-bottom : 0.15em solid #fff; /* 0.2em solid rgb(0, 205, 205); */
}
.store .category{
	float:left;
	width: 20%; /* 30%; */
	height: 30%; /* 40%; */	
/* 	border-bottom : 0.2em solid rgb(0, 205, 205); */
}
.store .content{
	/* float:left; */
	width:80%;
	height: 70%;/* 60%; */
}

.storeContent{
	list-style: none;
}

.photo {
	width: 100%;
	height: 45%;
	padding:1%;
	background-color: #c7c7c7;
}

.photoTitle{
	position:inherit;
 	margin:0 10%;
	width:80%;
	height: 15%; /* 20%; */
	text-align: center;
}
.photoSlide{
	position:inherit;
	margin:0 10%;
	width:80%;
	height:80%;
/*  background-color:white;  */
}

.review{
	margin: 0 10%;
	width: 80%;
/* 	height: 180%; */
 	margin-top: 20px;
}

.reviewTitle{
	position:inherit;
	
	width:100%;
	height:10%; 
 	text-align: center;
}

.reviewBox{
	position:inherit;
	margin:3% 5% 0 5%;
	width:90%;
	height:80%;
	background-color: white; 
	color: #3d9167;
}

#paging{
	list-style: none; 
	width:60%; 
	height:10%;
	margin-left:20%;
	margin-bottom:40px;
}

#paging li{
	float:left;
	width:8%;
}
#paging li a{
	color:black;
}
#footer {
	margin-top: 4em;
	text-align: center;
	color: silver;
	border-top: thin solid silver;
	padding-top: 1em;
}

.output {
	font-family: monospace;
	border: solid thin silver;
	padding: .2em .4em;
	background-color: #cf3;
}

.clickable {
	cursor: pointer;
}


#unittest{
	width: 80%;
	margin: 0 10% 3% 10%;
	height:500px;
	background-color:yellow;
}

#popup{
 	position :fixed;;
 	text-align: center;
	width: 90%;
	height:90%;
	left:5%;
 	top:2%; 
   	display: none;    
	z-index:1000;
	background-color: yellow;
	
}
#reserv{
 	position :fixed;;
 	text-align: center;
	width: 50%;
	height:50%;
	left:25%;
 	top:25%; 
  	display: none;      
	z-index:1000;
	background-color: red;
	
}
/* pre { */
/* 	tab-size: 4; */
/* 	overflow-x: auto; */
/* 	background-color: #eee; */
/* 	-webkit-column-break-inside: avoid; */
/* } */

/* h1, h2 {	 */
/* position:inherit; */
/* 	width: 80%; */
/* 	margin: 5% 10% 3% 10%; */
/* 	background: black; */
/* 	color: white; */
/* 	padding: .2em .4em; */
/* } */

/* h1 { */
/* /* 	width: 80%; */ */
/* /* 	margin: 0 10% 0% 10%; */ */
/* } */

/* h2 { */
/* 	background: gray; */
/* } */

/* hr { */
/* 	border-top: double; */
/* 	margin: 2em 25%; */
/* } */

</style>
<script>
			$(function() {
				function tabsToSpaces(line, tabsize) {
					var out		= '',
						tabsize = tabsize || 4,
						c;
					for (c in line) {
						var ch = line.charAt(c);
						if (ch === '\t') {
							do {
								out += ' ';
							} while (out.length % tabsize);
						} else {
							out += ch;
						}
					}
					return out;
				}

				function visualizeElement(element, type) {
					var code		= $(element).html().split('\n'),
						tabsize		= 4,
						minlength	= 2E53,
						l;

					// Convert tabs to spaces
					for (l in code) {
						code[l] = tabsToSpaces(code[l], tabsize);
					}


					// determine minimum length
					var minlength = 2E53;
					var first = 2E53;
					var last = 0;
					for (l in code) {
						if (/\S/.test(code[l])) {
							minlength = Math.min(minlength, /^\s*/.exec(code[l])[0].length);
							first = Math.min(first, l);
							last = Math.max(last, l);
						}
					}

					code = code.slice(first, last + 1);

					// strip tabs at start
					for (l in code) {
						code[l] = code[l].slice(minlength);
					}

					// recombine
					code = code.join('\n');

					var fragment = $('<pre class="prettyprint"><code/></pre>').text(code).insertAfter(element);
					$('<h3 class="clickable">'+type+'&hellip;</h3>').insertBefore(fragment).click(function() {
						fragment.slideToggle();
					});
				}

				// extract html fragments
				$('div.prettyprint, span.prettyprint').each(function() {
					visualizeElement(this, 'HTML');
				});

				// extract scripts
				$('script.prettyprint').each(function() {
					visualizeElement(this, 'Javascript');
				});

			});
		</script>

<!-- Plugin -->
<script src="/resources/main/read/jquery.coverflow.js"></script>
<!-- Optionals -->
<script src="/resources/main/read/jquery.interpolate.js"></script>
<script src="/resources/main/read/jquery.mousewheel.js"></script>
<script src="/resources/main/read/jquery.touchSwipe.min.js"></script>
<script src="/resources/main/read/reflection.js"></script>
</head>
<body>

	<form name="listForm">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<input type="hidden" name="e_no" value="${cri.e_no}">
		<input type="hidden" name="page" value="">
	</form>

	<!-- Logo -->
	<div class="logo"><a href="/img/"><img src="/file/view?path=logo2.png" style="max-height: 100%;"></a></div>
	
	<div id="reserv">
		<button id="reservClose" sytle="text-align : left">닫기</button>
		<div>
			<form>
				<input type="text" name="endKeyword" placeholder="예약기능 구현..">
				<input type="submit" value="검색">			
			</form>		
		</div>
	</div>
	
	<div id="menu"><jsp:include page="menubutton.jsp"></jsp:include></div>
	
	<div class='store'>
		<ul>
			<li class='menu'><h1>{ STORE }</h1></li>
			<li class='title storeName'><h1> ${vo.s_name}</h1></li>
			<li class='category'>&nbsp; <font style="float: right;">${category[0]} > ${category[1]} > ${category[2]}</font></li>
			<li class='content'>
				<ul class="storeContent">
					<li><img src='/file/view?path=address2.png'> ${vo.s_address}</li>
					<li><img src='/file/view?path=homepage2.png'> ${vo.s_homepage}</li>
					<li><button id="reservButton"style="float:right; margin:20px;">찜하기</button>
						<button style="float:right; margin:20px;">메뉴보기</button></li>
				</ul>
			</li>
		</ul>
	</div>
	
	
<!-- 	사진스크롤 -->
	<div class='photo'>
		<div class="photoTitle"><h1 align="left">{ PHOTO }</h1></div>
		
		<div class="photoSlide">
		<div id="preview">
			<div id="preview-coverflow">
			
				<c:forEach var="img" items="${imgList}" >
				
					<div  class="cover" ><img src="/file/view?path=${img.si_img}.jpg"></div>
										  
				</c:forEach>
			</div>
	<style>
	#preview {
	
/*  		padding:5% 0 5% 0;  */
  		height: 100%; 
  		width:100%;
/*   		background-color: green; */
	}
	
	#preview-coverflow .cover {
		margin-top:3%;
		cursor: pointer;
		width: 25%;
		height: 25%;
/* 		box-shadow: 0 0 4em 1em white; */
	}
	#preview-coverflow .cover img {
		position:inherit;
		cursor: pointer;
		width: 100%;
		height: 100%;
/* 		box-shadow: 0 0 4em 1em white; */
	}
	</style>
	<script>
		$(function() {
			if ($.fn.reflect) {
				$('#preview-coverflow .cover').reflect();	// only possible in very specific situations
			}
	
			$('#preview-coverflow').coverflow({
				index:			2,
				density:		2,
				innerOffset:	50,
				innerScale:		.7,
				animateStep:	function(event, cover, offset, isVisible, isMiddle, sin, cos) {
					if (isVisible) {
						if (isMiddle) {
							$(cover).css({
								'filter':			'none',
								'-webkit-filter':	'none'
							});
						} else {
							var brightness	= 1 + Math.abs(sin),
								contrast	= 1 - Math.abs(sin),
								filter		= 'contrast('+contrast+') brightness('+brightness+')';
							$(cover).css({
								'filter':			filter,
								'-webkit-filter':	filter
							});
						}
					}
				}
			});
		});
	</script>
			</div>
		</div>
	</div>
		
<!-- 		리뷰 -->
	<div class="review">
		<div class="reviewTitle" style="color: #71c39a;"><h1 align="left">{ REVIEW }</h1></div>
		
		<div class="reviewBox">
		
<%-- 			${reviewList } --%>
		
		</div>
		
	</div>	
	
		

	<ul id="paging">
<%-- 			<c:if test="${cri.prePage == 'true' }"> --%>
<%-- 				<li><a href="javascript:goPage(${cri.startPage-1 });" style="font-color:black">pre</a></li> --%>
<%-- 			</c:if> --%>
<%-- 		<c:forEach var="page" begin="${cri.startPage }" end="${cri.lastPage }"> --%>
			
<%-- 			<li><a href="javascript:goPage(${page });">${page}</a></li> --%>
	
<%-- 		</c:forEach> --%>
			
<%-- 			<c:if test="${cri.nextPage == 'true' }"> --%>
<%-- 				<li><a href="javascript:goPage(${cri.lastPage+1 });">next</a></li> --%>
<%-- 			</c:if> --%>
	</ul>
	
	<button onclick="goList(${cri.page})">현재목록</button>
	<button onclick="goList(1)">최신목록</button>
		<div id="footer">Copyright &copy; 2013-2014 Martijn van der Lee.
		MIT Open Source license applies.</div>
		
		
		

	
	
	
<!-- 게시글 -->
<!-- 	<div ID="book"> -->
<!-- 		<div id="readme"></div> -->

<!-- 		<h1>소개</h1> -->
<!-- 		<div id="examples" class="chapter"> -->
<%-- 			${vo} --%>
<!-- 			<h2>가게정보</h2> -->
<!-- 				<h4>안알랴줌... -->
<!-- 				안알랴줌...1 -->
<!-- 				안알랴줌...1 -->
<!-- 				안알랴줌...1 -->
<!-- 				안알랴줌... -->
<!-- 				안알랴줌...11 -->
<!-- 				안알랴줌... -->
<!-- 				안알랴줌...1 -->
<!-- 				안알랴줌... -->
<!-- 				안알랴줌...</h4> -->
<!-- 			<h2>영업비밀</h2> -->
<!-- 			<h2>영업시간</h2> -->
<!-- 			<h2>결혼유무</h2> -->
			
<!-- 		</div> -->
<%-- 		<button class="menuList" id="${vo.s_no }">메뉴보기</button> --%>
<!-- 		<h1>여긴 리뷰넣을곳..</h1> -->
<!-- 		<div id="unittest" class="chapter"> -->
<!-- 			리뷰를 넣어라.... -->
			
<!-- 		</div> -->
<!-- 	</div> -->


<script>

	$("#reservButton").on("click",function(){
		$("#reserv").css({"display" : "inherit" , "z-index":"100"});		
	});

	$("#reservClose").on("click",function(){
		console.log("aaaaaa");
		$("#reserv").css({"display" : "none" , "z-index":"-100"});
	});
	
	
	$(document).ready(function(){
		
		$.ajax({
			url:"/img/review?s_no="+'${cri.s_no}',
			type:"get",
			dataType:"json",
			success:function(data){
								
				$(data).each(function(index,target){
					var data = JSON.stringify(target);
					
					$(".reviewBox").append("<div style='width:100%; height:9%; border-bottom: 2px solid black; margin-top:1%; '>"
// 										+"<span>"+"r_no :"+target.r_no+"</span>"
// 										+"<span>"+"s_no :"+target.s_no+"</span>"
// 										+"<span>"+"순번 :"+index+"</span>"
// 										+"<span>"+"r_regdate :"+target.r_regdate+"</span> "
										+"<span>"+"u_id :"+target.u_id+"</span> "
										+"<span>"+"r_score :"+target.r_score+"</span> "		
										+"<span><button id='"+target.r_no+"'>수정</button></span> "
										+"<span><button id='"+target.r_no+"'>삭제</button></span> "
										+"<div>"+"r_comment :"+target.r_comment+"</div> "
									+"</div>");
				});//end each
					
			}//end success
						
		});//end ajax
		
		
	});
	
// 	$(".menulist").on("click",function(){
		
		
// 	});
	
	function goList(page){
		document.listForm.method="get";
		document.listForm.action="/img/main";
		document.listForm.page.value=page;
		document.listForm.submit();
		
	}


</script>


</body>
</html>
