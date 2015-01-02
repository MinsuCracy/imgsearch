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


<!-- 메뉴뷰 관련 -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/main/menuView/css/style1.css" /> -->
<script type="text/javascript" src="/resources/main/menuView/js/modernizr.custom.79639.js"></script>




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
	height: 10px;
}

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
	height: 45%;
	margin-bottom: 20px;
 	padding:1%; 
 	padding-top: 5px;
 	padding-bottom: 0;
}

.store ul {
	list-style: none;
	position: inherit;
 	margin: 0% 10% 0 10%; 
 	padding: 1% 0 1% 0;
	width: 80%;
	height: 100%;
	background-color: #71c39a;
}

.store .menu{
	float:left;
	width:20%;
	height:100%;	
	
}
.store .title{
	float:left;
	width: 60%;
	height: 20%;
	border-bottom : 0.15em dashed #fff;
}
.store .category{
	float:left;
	width: 20%; 
	height: 30%;
}

.store .category font {
	margin: 20% 0 0 20%;
}

.store .content{
	width:80%;
	height: 70%;
}

.storeContent{
	color: #fff;
}

.photo {
	width: 78.5%;
	height: 45%;
	padding:1%;
	margin: auto;
	background-color: #364157; /*  #c7c7c7; */
}

.photoTitle{
	position:inherit;
 	margin:0;
	width:80%;
	height: 15%;
	text-align: left;
	align: left;
}

.photoSlide{
	position:inherit;
	margin:0 10%;
	width:80%;
	height:80%;
}

.review{
	margin: 0 10%;
	width: 78.5%;
	height: 130%;
	margin: auto;
 	margin-top: 20px;
 	background-color: white;
}

.reviewTitle{
	position: inherit;
	padding: 1%;
 	text-align: left;
 	align: left;
 	color: #1d9d74;
}

.reviewBox{
	position:inherit;
	margin:3% auto 0 auto;
	width:70%;
	height:80%;
	background-color: white; 
	color: #3d9167;
}

.review_write{
	width:100%; 
/* 	height:9%;  */
	border-bottom: 0.1em solid gray; 
	margin-top:1%;
}

.reviewBox ul li {
	position: relative;
	padding: 0;
	border-bottom: 1px solid #f2f2f2;
	vertical-align: top;
	list-style: none;
	text-align: -webkit-match-parent;
}

.review_section {
	margin: 5px 0 3px;
	display: block;
}

.review_user_id{
	padding-right: 1px;
	color: #3d3d3d;
	font-size: 14px;
}

.review_regdate{
	vertical-align: top;
	padding-top: 0.7%;
	padding-left: 2%;
	display: inline-block;
	font-size: 10px;
	color: #88888c;
	vertical-align: middle;
}

.review_section2 {
	display: block;
	position: absolute;
	top: 2px;
	right: -0px;
	height: 15px;
	padding-left: 6px;
}

.review_comment {
	padding: 10px 0 10px 1px;
	color: #4a4a4a;
	line-height: 20px;
	display: block;
}


#paging{
	list-style: none;
	width: 60%;
	height: 5%;
	margin-left: 25%;
	padding-top: 20px;
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
	
	<!-- logo -->
	<div class="logo">
		<a href="/img/">
			<img src="/file/view?path=logo2.png" style="max-height: 100%;">
		</a>
	</div>

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
			<li class='menu'><h1 style="color: #fff; margin-left: 5%;">{ STORE }</h1></li>
			<li class='title storeName'><h1 style="color: #fff;"> ${vo.s_name}</h1></li>
			<li class='category'> </li>
			<li class='content'>
				<table class="storeContent">
					<tr>
						<td><img src="/file/view?path=address2.png"></td>
						<td>${vo.s_address}</td>
					</tr>
					<tr>
						<td><img src="/file/view?path=tel2.png"></td>
						<td>전~화~번~호</td>
					</tr>
					<tr>
						<td><img src="/file/view?path=homepage2.png"></td>
						<td><a href="${vo.s_homepage}" target="_new" style="color: #fff;"><i class="fa fa-home fa-lg"></i></a></td>
					</tr>
					<tr>
						<td><img src="/file/view?path=match2.png"></td>
						<td>여기 연예인 들어갈거야아아아</td>
					</tr>
					<tr>
						<td></td>
						<td style="text-align: right;">
							<button id="reservButton"style="float:right; margin:20px;">찜하기</button>
							<a id="menubutton" style="float:right; margin:20px;">메뉴보기</a>
						</td>
					</tr>
				</table>
			</li>
		</ul>
	</div>
	
	
<!-- 	사진스크롤 -->
	<div class='photo'>
		<div class="photoTitle"><h1 style="color: #fff;">{ PHOTO }</h1></div>
		
		<div class="photoSlide">
		<div id="preview">
			<div id="preview-coverflow">
			
				<c:forEach var="img" items="${imgList}" >
				
					<div  class="cover" ><img src="/file/view?path=${img.si_img}.jpg"></div>
										  
				</c:forEach>
			</div>
			
	<style>
	
	#preview {
  		height: 100%; 
  		width:100%;
	}
	
	#preview-coverflow .cover {
		margin-top:3%;
		cursor: pointer;
		width: 25%;
		height: 25%;
	}
	
	#preview-coverflow .cover img {
		position:inherit;
		cursor: pointer;
		width: 100%;
		height: 100%;
	}

	</style>
	
	<script src="/resources/colorbox/jquery.colorbox.js"></script>
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
		
		
		// 메뉴박스 만들기
		var menuOpen = document.getElementById( 'menubutton' );
		
		menuOpen.onclick = function(){
			
			
			$("#menubutton").colorbox({
				href:"/img/menuView?s_no="+${cri.s_no} + "&name=" + '${vo.s_name}',
				iframe:true, 
				width:"80%", height:"80%",
				opacity: 0.5,
			});
			
		};
		
	</script>
	
	
			</div>
		</div>
	</div>
		
	<!-- 리뷰 -->
	<div class="review">
	
		<div class="reviewTitle"><h1>{ REVIEW }</h1></div>
		
		<div class="reviewWrite"> </div>
		
		<div class="reviewBox">	
		
			<div class="review_write">
				<input type='text' name='reviewData' value=''>
				<button onclick='javascript:reviewWrite()'>등록</button>
			</div>

			<ul></ul>
			
		</div>

		<ul id="paging" style="margin-top: 1%;"></ul>
		
	</div>	

	
	
	<button onclick="goList(${cri.page})">현재목록</button>
	<button onclick="goList(1)">최신목록</button>
		<div id="footer">Copyright &copy; 2013-2014 Martijn van der Lee.
		MIT Open Source license applies.</div>
		
		
<script>
	
	// 찜하기 버튼
	$("#reservButton").on("click",function(){
		$("#reserv").css({"display" : "inherit" , "z-index":"100"});		
	});

	// 찜버튼 닫기
	$("#reservClose").on("click",function(){
		console.log("aaaaaa");
		$("#reserv").css({"display" : "none" , "z-index":"-100"});
	});
	
	
	$(document).ready(function(){
		
		goReview(1);
		
	});
	
	var curPage ='';
	
	function goReview(page){
		
		curPage = page;
	 
	 	$.ajax({
	 		url:"/img/store/review?s_no="+${cri.s_no}+"&page="+page,
	 		type:"get",
	 		success:function(data){
	 			
				$(".reviewBox ul").children().remove();
	 
	 			$(data).each(function(index,target){
	 				
					$(".reviewBox ul").append("<li> <div class=\"review_section\">"
										+ "<span class=\"review_user_id\"><strong>"+ target.u_id +"</strong></span>"
										+ "<span class=\"review_regdate\">"+ target.r_regdate +"</span></div>"
										+ "<div class=\"review_section2\">"
										+ "<span><a href='javascript:reviewModify("+target.r_no+")'><i class=\"fa fa-pencil\"></i></a></span>"
										+ "<span style=\"padding-left: 10px;\"><a href='javascript:reviewDelete("+target.r_no+")'><i class=\"fa fa-times\"></i></a></span></div>"
										+ "<div id='"+ target.r_no +"' class=\"review_comment\">"+ target.r_comment +"</div></li>");

	 			});//end each
	 			
	 			$(".reviewBox").append("${pageCri.toString()}");
	 
	 		}//end success
	 
		 });//end ajax
	 
	 
	 	$.ajax({
	 		url:"/img/store/reviewTotal?s_no="+${cri.s_no}+"&page="+page,
	 		type:"get", 
			success:function(cri){
				
				$("#paging").children().remove();
				
				var code = "";
				var page=0;
				
				for(page = cri.startPage; page <= cri.lastPage ; page ++){
					if(cri.prePage == true && page == cri.startPage){
					code +="<li><a href='javascript:goReview("+(cri.startPage-1)+");' >pre</a></li>";
					}
				
					code += "<li><a href='javascript:goReview("+page+");'>"+page+"</a></li>";
				
					if(cri.nextPage == true && page == cri.lastPage){
						code +="<li><a href='javascript:goReview("+(cri.lastPage+1)+");' >n</a></li>";
					}
				}
			
				$("#paging").append(code);
	 
	 		}//end success
	 
	 	});//end ajax
	 
	}//end function goReview
	
	function reviewWrite(){
		
		var writeData = {r_comment :$("[name=reviewData]").val() , s_no :'${cri.s_no}'};
		 
		$.ajax({
			url:"/img/store/reviewWrite",
			type:"post",
			data:writeData,
			success:function(data){
				$("[name=reviewData]").val("");
				goReview(1);
			}
		
		});
		 
	}// end function reviewWrite()
	
	
	function reviewDelete(rno){
		 
		 var target = {r_no : rno};
		 
		 $.ajax({
		 url:"/img/store/reviewDelete",
		 type:"post",
		 data:target,
		 success:function(data){
		 goReview(curPage);
		 
		 }// end success
		 
		 });//end ajax
		 
		}// end function reviewWrite()



		var textData = '';
		// 댓글 수정 진입
		function reviewModify(rno){
		 
		 var $target = $("#"+rno+"");
		 textData = $target.contents(":first-child").text();
		 
		 $target.contents(":first-child").remove();
		 
		 $target.append("<input type='text' name='reviewModifyData' value='"+textData+"' \/>"
		 +"<a href='javascript:reviewModifySubmit("+rno+")'>완료</a>"
		 +"<a href='javascript:reviewModifyCancel("+rno+")'>취소</a>");
		 
		}
		//댓글 수정 완료
		function reviewModifySubmit(rno){

		 var modifyData = {r_no : rno, r_comment : $("[name=reviewModifyData]").val()}
		 
		 console.log(modifyData);
		 
		 $.ajax({
		 url:"/img/store/reviewModify",
		 type:"post",
		 data:modifyData,
		 success:function(data){
		 goReview(curPage);
		 
		 }
		 
		 });

		}
		//댓글 수정 취소
		function reviewModifyCancel(rno){
		 var $target = $("#"+rno+"");
		 console.log($target);
		 $target.children().remove();
		 $target.append(textData);
		}
	
	
	function goList(page){
		document.listForm.method="get";
		document.listForm.action="/img/main";
		document.listForm.page.value=page;
		document.listForm.submit();
	}


</script>


</body>
</html>
