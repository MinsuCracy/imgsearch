<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/user/location/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/user/location/css/responsive.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="/resources/main/bbs/css/style.css" /> -->
<!-- <script src="/resources/main/bbs/js/modernizr.custom.63321.js"></script> -->

<title>Image Search</title>
<style>
html,body{
	margin:0;
	padding:0;
	border:0;
	width: 100%;
	height: 100%;
	z-index:200; 
	background-color: rgb(247, 245, 240);
 	
}

*{
	margin:0;
	padding:0;
	border:0;
}

.wrap {
	width: 100%;
	height: 100%;
 	background-color: white;	  
	position: absolute;
	
	
}

.topmenu{
	position: fixed; 
	background-color: yellow; 
	width: 100%; 
	height: 5%;
	z-index:999;
}
.logo{
	position: fixed;
	background: none; 
	width: 200px; 
	height: 7%; /* 5%; */ 
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
#mainBar{
	position: fixed; 
	background-color: #71c39a; /* rgb(0, 205, 205); */
	width: 100%; 
	height: 60px;
	z-index:-100; 
}
#searchGrid div{ 
 	position: relative;
/* 	top:30%;  */
 	width:100%; 
 	height:40px; 
} 
#searchGrid div input[type="text"]{
	margin-left:3%;
	width:25%;
	height:35px;
}
#searchGrid form input[type="submit"]{
	height:35px;
}
#searchGrid{
	text-align: center;
	z-index:200; 
/*   	position: absolute; 
/*   	top:75%; */
/* 	margin-top:63%; */
/* 	margin:3% 0% 0 0%; */
/* 	float:left; */
/* 	margin-top:3%; */
	width: 100%;
	height: 18%;
/* 	background-color: rgba(0, 205, 205,0.5); */
 	background-color: #80d9ab; 
/* 	background-image: url('/resources/images/etc/MainBack.jpg'); */
	
}
#mainGridWrap{
	z-index:200; 
/* 	position:absolute; */
/*  	padding-top:3%;  */
/* 	margin:3% 10% 0 10%; */
	padding-top:60px;
	padding-bottom:3%;
	background-color: rgb(247, 245, 240); /* white; */
	width: 100%;
	height: 77%; /* 70%; */
	
/*  	background-image: url('/resources/images/etc/MainBack.jpg');  */
	
}
#mainGrid{
	padding-top:1%;
	padding-left:15%;
	padding-right:15%;
	width: 100%;
	height: 100%;
	background-color: rgb(247, 245, 240); 
} 
#mainGrid div{
  	background-color: none; 
 	float:left;
 	width:20%;
	height:33%;
 	
  	background-size: 100% 100%; 
	-webkit-perspective: 800px;
	-webkit-transform-style: preserve-3d;
	-webkit-transition-duration: 1s;  	
}	
#mainGrid div .one {
	width:100%; 
	height:100%;
	position:absolute;
	float:left;
	border-radius : 10%;
	background: none;
}

#mainGrid div .two {
	width:100%; 
	height:100%;
	position:absolute;
	float:left;
	border-radius :10%;
	padding:3%;
 	-webkit-transform:translateZ(-1000px) rotateY(-360deg) translateY(-1000px);
}
.two img{
	width:80%;
	margin-left:10%;
	height:100%;
	border-radius :10%;
/*  	border : 0.2em solid; */
 	border-color : rgba(102,255,102,0.7); 
/* 	box-shadow: 0 0 2em silver; */
}

#grid1 ul li{
	height:30%;
	width:60px;
	text-align: center;
}
#grid16_1 img,
#grid16_2 img{
	width:100%;
	height:100%;
	position:inherit;
}

#goup{
	display:none;
	position:fixed;
	bottom:5px;
	right:5px;
	width:64px;
	height:64px;
	background-image:url('/resources/images/up.png');
	background-repeat:no-repeat;
	opacity:.6;
	filter:alpha(opacity=60);
}

#goup:hover{
	opacity:1;
	filter:alpha(opacity=100);
}

#entView{
	background-color : none;
  	position :fixed;; 
 	text-align: center;
	width: 25%; /* 50%; */
	height: 50%;
	left: 40%; /* 25%; */
 	top: 15%; 
	z-index:-1000;
}

#popup2{
 	position :fixed;;
 	text-align: center;
	width: 300px;
	height:150px;
/* 	left:25%; */
 	top:30%; 
  	display: none;     
	z-index:-100;
/*  	background-color: white; */
/*  	border-radius : 10%;  */
/*  	border : 0.1em black solid; 	 */
	
}

#popup2 input{
 	position :inherit;
 	width:70%; 
/*  	margin: 0 0 0 0;; */
	
}

.closepopup{
	padding: 0;
	cursor: pointer;
	background: transparent;
	border: 0;
	background: url('/resources/testImg/cancel-32.png') no-repeat;
	-webkit-appearance: none;
	float:right; 
	height:35px;
	width:35px;
}

.closeentView{
	padding: 0;
	cursor: pointer;
	background: transparent;
	border: 0;
	background: url('/resources/testImg/cancel-32.png') no-repeat;
	-webkit-appearance: none;
	float:right; 
	height:35px;
	width:35px;
}
</style>



<style>
#searchList{
 	position:absolute;
 	width: 100%;
	height: 100%;	
	margin-top:80px;
}

</style>
</head>
<body >
	<form name="MainForm" style="margin: 0 ;">
		<input type="hidden" name="keyword" value="${cri.keyword }">
		<input type="hidden" name="e_no" value="${cri.e_no }">
		<input type="hidden" name="page" value="${cri.page }">
<!-- 		<input type="hidden" name="s_no" > -->
	</form>
	
	
	
		<div id="entView">
			
			<div class="imgFocus" style="border-radius:15%;width:100%; height:100%;-webkit-transform: scale(0.1) rotateX(-360deg);">
				<div style="width:100%; height:90%;">
					<button class="closeentView" sytle=""></button>
					<img style="width:100%; height:100%;border-radius:15%;box-shadow: 0 0 4em 1em white;" src='' >
				</div>
			</div>
		</div>
		
		<div id="popup2">
			
			
			<div style="width:100%; height:35px;">
				<span><button onclick="javascript:entSearchClose();"class="closepopup" sytle=""></button></span>
			</div>
	
<!-- 			<div style="width:100%; height:20%; text-align: left"> </div> -->
			
			
			<div style="width:100%; height:39px; border:2px solid black;  background-color: white; margin-bottom:5px; border-radius:5px;">
				<input style="float:left;margin-left:10px;width:75%; height:35px; " type="text" name="entsearchkey" placeholder="연예인 이름으로 검색">
				<button style="float:left;margin-left:10px;width:35px; height:35px;background-color: white; " id="entsubmit""><i class="fa fa-search fa-lg"></i></button>
			</div>
			
			
			<div id="returnText" style="width: 100%;  height: 35px; border-radius:5px;"><h1></h1></div>
		
	</div>
	
	
	
<div class="wrap" > 
	
	<div id="mainBar" style="text-align: center;">
<!-- 		<form style="text-align: center; "> -->
			<input style="height:30px; width:25%; margin-top:10px; " Stype="text" name="topSearch" value="">
			<button style="height:30px; width:30px; margin-top:10px; background-color: white; "><i class="fa fa-search fa-lg"></i></button>
<!-- 			<input style="height:30px; width:5%; margin-top:10px;" type="submit1" vlaue="검색"> -->
<!-- 		</form> -->
	
	</div>
	
	
	<div class="logo"><a href="/img/"><img src="/file/view?path=logo2.png" style="height:55px;width:100%;"></a></div>
	<div class="menu">
		<jsp:include page="menubutton.jsp">
			<jsp:param value="${id}" name="id"/>
		</jsp:include>
	</div>
	
	
	<div id="mainGridWrap">
		<div id="mainGrid">
			
			<div id="grid1" >
				<ul style="list-style: none; text-align: center; float:right;padding-top:30%; padding-right: 10%; height:100%;">
					<li><input id="default" type="checkbox" name="type"><span > 기본</span></li>
					<li><input id="rank" type="checkbox" name="type"><span> 랭크</span></li>
					<li><input id="style" type="checkbox" name="type"><span> 성향</span></li>
				</ul>
			</div>
			
			
			<div id="grid2">
				<div class="two" id="" >
					<img>
				</div>
			</div>
			<div id="grid3">
				<div class="two"  >
					<img>
				</div>
			</div>
			<div id="grid4">
				<div class="two"  >
					<img>
				</div>
			</div>
			<div id="grid5">
				<div class="two"   >
					<img>
				</div>
			</div>
			<div id="grid6">
				<div class="two" >
					<img>
				</div>
			</div>		
			<div id="grid7">
				<div class="two" >
					<img>
				</div>
			</div>
			<div id="grid8">
				<div class="two"  >
					<img>
				</div>
			</div>
			<div id="grid9">
				<div class="two"   >
					<img>
				</div>
			</div>
			<div id="grid10">
				<div class="two"  >
					<img>
				</div>
			</div>
			<div id="grid11">
				<div class="two">
					<img>
				</div>
			</div>
			<div id="grid12">
				<div class="two"  >
					<img>
				</div>	
			</div>
			<div id="grid13">
				<div class="two"    >
					<img>
				</div>
			</div>
			<div id="grid14">
				<div class="two"  >
					<img>
				</div>
			</div>
	<!-- 		<div id="grid15"> -->
	<!-- 			<div class="two"    > -->
	<!-- 				<img> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
			<div id="grid16" style="-webkit-transform:;border-radius :15%;">
				<div id="grid16_1" style="width:45%; height:45%;margin-left:45%; margin-top:4%; background-color: #cdd4d4; border-radius:30%;">
					<img id="grid16_1_1" src="/resources/images/etc/search.png" >
				</div>
				<div id="grid16_2" style="width:45%; height:45%;;margin-left:10%;background-color: #cdd4d4;border-radius:30%;">
					<img id="grid16_2_1" src="/resources/images/etc/refresh.png" >
				</div>
			</div>
		</div>
	</div>
	
	<div id="searchGrid">	
		<h1 style="padding-top:10px">연예인을 선택하세요</h1>
		<div id="searchBar" style="z-index:-1000;">
			<input  type="text" name="searchKeyword" placeholder="search" value="" >
			<input type="hidden" name="e_no" value="">
			
			<button style="height: 35px; width:35px;background-color: white;"><i class="fa fa-search fa-lg"></i></button>
		</div>

	</div>
</div>	
	

<script>




var entType ='${cri.type}';
$("#grid1 ul li input").on("click",function(e){
	
	var $targetId = $(e.target);
	
	$("#default").prop("checked",false);
	$("#rank").prop("checked",false);
	$("#style").prop("checked",false);
	if($targetId.attr("id") == "default"){
		$("#default").prop("checked",true);
		entType = "default";	
		
	}else if($targetId.attr("id") == "rank"){
		$("#rank").prop("checked",true);
		entType = "rank";
	}else{ // style
		$("#style").prop("checked",true);
		entType = "style";
	}
	ImgPage=1;
	entImg();
	
});



// 연예인 선택 기능
var $grid = null;

$("#mainGrid").on("click",function(e){
	
	
	
	var $target = $(e.target);
	var $targetId = $target.attr("id");
	
	
	if(e.target.localName != "img"){
		return true;
	}
	
	if($targetId == "grid16_2_1"){
		
		entImg();
		return true;
	}
	
	if($targetId == "grid16_1_1"){
		
		entSearch();
		return true;
	}	
	// 타겟에서 제외할것들..
	if($targetId == "grid16_2_1"||$targetId == "grid16_2"||$targetId == "grid16_1_1"||$targetId == "grid16_1" ||$targetId == "grid1" || $targetId == "grid16"){
		return true;
	}
	
	
	$("[name=e_no]").val($target.parent().attr("id"));
	
	entFocusingView($target.attr("src"));
	
	

});//end function



// // 연예인 선택 기능
// var $grid = null;

// $("#mainGrid").on("click",function(e){
	
// 	$("#searchBar").css("z-index" , "1000");
// 	$("#searchGrid").contents(":first-child").text("키워드를 입력해라");
	
// 	var $target = $(e.target);
// 	var $targetId = $target.attr("id");
	
// 	if(e.target.localName != "img"){
	
// 		return;
// 	}
	
// 	if($targetId == "grid16_2_1"){
// 		entImg();
// 		return true;
// 	}
	
// 	if($targetId == "grid16_1_1"){
// 		entSearch();
// 		return true;
// 	}
	
	
// 	// 타겟에서 제외할것들..
// 	if($targetId == "grid16_2_1"||$targetId == "grid16_2"||$targetId == "grid16_1_1"||$targetId == "grid16_1" ||$targetId == "grid1" || $targetId == "grid16"){
// 		return true;
// 	}
	
// 	// 기존에 타겟이 선택된적 잇엇을때
// 	if($grid != null){		
		
// 		// 타겟이 기존 타겟일때
// 		if($grid.attr("id") == $target.attr("id")){
			
// 			$("#searchBar").css("z-index" , "-1000");
// 			$("#searchGrid").contents(":first-child").text("연예인를 선택해라");
			
			
// 			var $array = $("#mainGrid div").children();
			
// 			$array.each(function(index,target){				
// 				if(target.localName != "div"){
// 					return true;
// 				}				
// 				var grid = $(target).contents(":first-child").attr("id");				
// 				if(grid == "grid16_2_1"||grid == "grid16_2"||grid == "grid16_1_1"||grid == "grid16_1" ||grid == "grid1" || grid == "grid16"){
// 					return true;
// 				}
// 				$(target).children().css({"z-index":"0","opacity":"1"});
// 				$(target).css({"z-index":"0","opacity":"1"});
// 			});	//end each		
			
// 			$("[name=e_no]").val("");
			
// 			$grid.css({"-webkit-transition-duration" : "0.5s","-webkit-transform": "rotateX(0deg) translateZ(0px)"});
// 			$grid=null;
// 			return true;
		
// 		// 타겟이 선택된적 있고 현재 선택한 타겟이 기존에 선택되지 않앗을때
// 		}else{
			
// 			$grid.css({"z-index":"0","opacity":"0.3","-webkit-transition-duration" : "0.5s","-webkit-transform": "rotateX(0deg) translateZ(0px)"});
// 			$target.parent().css({"opacity":"1"});
// 			$target.css({"opacity":"1","-webkit-transition-duration" : "0.7s","-webkit-transform": "rotateX(360deg) translateZ(200px)"});
			
// 			$("[name=e_no]").val($target.parent().attr("id"));
							
// 			$grid = $target;
// 		}//end if
	
// 	// 타겟이 선택된적 없을때	
// 	}else{
		
// 		if($targetId == "grid16_2_1"||$targetId == "grid16_2"||$targetId == "grid16_1_1"||$targetId == "grid16_1"||$targetId == "mainGrid" ||$targetId == "grid1" || $targetId == "grid16"){
// 			return true;
// 		}//end if
		
// 		var $array = $("#mainGrid div").children();
			
// 		$array.each(function(index,target){
			
// 			if(target.localName != "div"){
// 				return true;
// 			}
// 			var grid = $(target).contents(":first-child").attr("id");
			
// 			if(grid == $targetId || grid == "grid16_2_1"||grid == "grid16_2"||grid == "grid16_1_1"||grid == "grid16_1" ||grid == "grid1" || grid == "grid16"){
// 				return true;
// 			}
// 			$(target).css({"z-index":"0","opacity":"0.3"});
// 		});//end each
		
// 		$target.css({"-webkit-transition-duration" : "0.7s","-webkit-transform": "rotateX(360deg) translateZ(200px)"});
		
// 		$("[name=e_no]").val($target.parent().attr("id"));
		
// 		$grid = $target;
// 	}//end else
// });//end function



// var imgCount = 0;
// function newImg(){
// 	console.log("newImg");
// }//end function

// 연예인 검색팝업
function entSearch(){
	
	$("#mainGrid").css("opacity" , "0.3");
	$("#popup2").css({ "display": "inherit" , "z-index":"250","opacity" : "1" });
		
}//end function



//연예인검색 팝업 닫기
function entSearchClose(){

	$("#popup2").css({"display" :"none", "z-index":"-100"});
	$("#mainGrid").css("opacity" ,"1");
	$("#returnText").css("background-color" , "");
	$("#returnText h1").text("");

}


//연예인 검색서밋
$("#entsubmit").on("click",function(){
	
	var ename = $("[name=entsearchkey]").val();
	
	entSearch
	$.ajax({
		url:"/img/entSearch?e_name="+ename,
		type:"get",
		success:function(data){
			
			
			// 데이터가 왔을때
			if(data != ""){
				entSearchClose();
				entFocusingView("/file/view?path="+data.e_img);
			//데이터가 안왔을때	
			}else{
				$("#returnText").css("background-color" , "#80d9ab");
			 	$("#returnText h1").text("일치하는 연예인이 없습니다");
			}
			$("[name=entsearchkey]").val("");
		}
	});
	
});

// 사진선택
function entFocusingView(enoImg){
	console.log(enoImg);
	$("#entView").css({ "display": "inherit" , "z-index":"250"});
	
	$(".imgFocus").css({ "-webkit-transition-duration" : "1s","-webkit-transform": "rotateX(0deg) translateZ(0px) scale(1.00) "});
	
	$("#mainGrid").css("opacity" ,"0.3");
	
	$("#entView div img").attr("src", enoImg);
	
	$("#searchBar").css("z-index" , "1000");
	$("#searchGrid").contents(":first-child").text("키워드를 입력하세요");
	
	
}//end function

// 사진선택 닫기
$("#entView button").on("click",function(){
	
	$("#searchBar").css("z-index" , "-1000");
	$("#searchGrid").contents(":first-child").text("연예인을 선택하세요");
	
	$("#mainGrid").css("opacity" ,"1");
	$("#entView").css({"z-index":"-100"});
	$(".imgFocus").css({"display" : "", "-webkit-transition-duration" : "","-webkit-transform": "rotateX(-360deg) scale(0.1) "});
	
});//end function

// 연예인 검색과 이미지 새로고침
// $("#grid16").children().on("click",function(e){
// 	var $target = $(e.target);
	
// 	if($target.parent().attr("id") ==  "grid16_1"){
// 		entSearch();
// 	}
// 	if($target.parent().attr("id") ==  "grid16_2"){
// 		newImg();
// 	}
// });//end function



var searchKey ="";

// 상단 검색버튼 클릭시..search함수 실행
$("#mainBar button").on("click", function(){
	
	location.href="/img/main?keyword="+$("[name=topSearch]").val()
					+"&e_no="+$("[name=e_no]").val()
					+"&page=1";
	
// 	gosearch($("[name=topSearch]").val(),($("[name=e_no]").val()),1);
// 	searchKey = $("[name=topSearch]").val();
// 	console.log(searchKey);
// 	$("[name=keyword]").val(searchKey);
	
});//end function


// 하단 검색버튼 클릭시..search함수 실행
$("#searchGrid button").on("click", function(){
	gosearch($("[name=searchKeyword]").val(),($("[name=e_no]").val()),1);
	searchKey = $("[name=searchKeyword]").val();
	$("[name=keyword]").val(searchKey);
	
	
});//end function

//페이지 스크롤 (아래로)
function vp_GoTo(scroll){
   
    $('html, body').animate({ scrollTop: scroll }, 'slow');
       
}//end function

function vp_GoListView(){
	 var target = document.getElementById("searchList");
	 target.scrollIntoView(true);
       
}//end function

// 스크롤시 지속적으로 함수 실행됨
$(window).scroll(function(){
	if($(window).scrollTop() < 100){
		$("#entView").css("display","");
	}else if($(window).scrollTop() > 100){
		$("#entView").css("display","none");
	}

	if($(window).scrollTop()+50>$(window).height()){
		$("#mainBar").css("z-index","500");
		$("[name=topSearch]").val(searchKey);
		
		//스크롤 내려가면서 로고1로 변경됨
		$(".logo a img").attr("src", "/file/view?path=logo1.png");
		
	}
	if($(window).scrollTop()<$(window).height()){
		$("#mainBar").css("z-index","-100");
		
		//스크롤 내려가면서 로고2로 변경됨
		$(".logo a img").attr("src", "/file/view?path=logo2.png");
	}
});


// 뷰페이지 닫기
$("#popup button").on("click",function(){
	
	$("#popup").css({"display" :"none", "z-index":"-100"});
	
});//end function


var firstConnect = true;
var yDeg = 0;
var ImgPage = 1;
function entImg(){
	
	
// 	$("#mainGrid div .two").css({
// 		"-webkit-transform":"translateZ(-1000px) rotateY(-360deg) translateY(-1000px)"
// 	});
	
	var imgArray = [];
	var total = '';
	
	$.ajax({
		url:"/img/entImg?page="+ImgPage+"&type="+entType,
		type:"get",
		
		success:function(data){
			$(data).each(function(index,vo){
				var target = $("#grid"+ (index+2) +"")	;
				
				target.contents(":first-child").attr("id",vo.e_no);
				target.contents(":first-child").contents(":first-child").attr("src", "/file/view?path="+vo.e_img);
			
			});//end each
			
		}// end success
	});//end ajax
	
	
	//criteria 수정해야함... 뷰가 10개일경우와 14개일경우가 다르기 때문에 경우에 따라서 값을 바꿔줄수 잇게끔
	$.ajax({
		url:"/img/entImgTotal",
		type:"get",
		
		success:function(data){
			if(data/10 > ImgPage){
				ImgPage++;
			}else{
				
				ImgPage=1;
			}//end if
		}//end success
	});//end ajax
	
	var Grid = $("#mainGrid").children();
	
	
	

	Grid.each(function(index,target){
		
		var time = (Math.random()*3)+1;
		var $target = $(target).contents(":last-child");
		
		if( $target.parent().attr("id") == "grid16" || $target.parent().attr("id") == "grid1"){
			return true;
		}
		
		if(firstConnect == true){
			
			$target.css({"-webkit-transition-duration" : time+"s","-webkit-transform": "translateZ(-1000px) rotateY(-180deg) translateY(0px)"});
			$target.on('webkitTransitionEnd', function(e){
				
				$target.css({"-webkit-transition-duration" : "0.5s","-webkit-transform": "translateZ(0px)"});
				
				
			});//end target on
		}else{
			
			$target.css({"-webkit-transition-duration" :"1s","-webkit-transform": "translateZ(-1000px) rotateY(-180deg) translateY(-2000px)"});
			$target.on('webkitTransitionEnd', function(e){
				
				$target.css({"-webkit-transition-duration" : time/2+"s","-webkit-transform": "translateZ(-1000px) rotateY(-180deg) translateY(0px)"});
				$target.on('webkitTransitionEnd', function(e){
					
					$target.css({"-webkit-transition-duration" : "0.5s","-webkit-transform": "translateZ(0px)"});
					
					
				});//end target on
				
			});//end target on
		}
		
	});// end each	

}//end function


var bbsList = false;
// 도큐먼트 레디... 서치 바 조정 및 이미지 애니매이션
$(document).ready(function() {
	
	entImg();
	firstConnect = false;
	
	$("#popup2").css("left", (($(document.body).width()-300)/2)+"px");
	
	
	if('${cri.type}' == "default"){
		$("#default").prop("checked",true);
	}else if('${cri.type}' == "rank"){
		$("#rank").prop("checked",true);
	}else{
		$("#rank").prop("checked",true);
	}
	
	
	if('${cri.keyword}' !=  "" && '${cri.e_no}' != null){
		bbsList = true;
		gosearch('${cri.keyword}','${cri.e_no}','${cri.page}');
		searchKey = '${cri.keyword}';
		$("[name=searchKeyword]").val(searchKey);
		$("[name=topSearch]").val(searchKey);
		
	}
	

		
}); // end function


$(window).resize(function(){
	
	$("#popup2").css("left", (($(document.body).width()-300)/2)+"px");
});
//윈도우 리사이즈... 서치 바 조정 및 이미지 애니매이션
// $(window).resize(function(){
// 	$(".searchBar").css({width : ($(document.body).width()) * 0.3,	height : ($(document.body).height()) * 0.05	});
// 	var Grid = $(".mainGrid").children();
	
// 	Grid.each(function(index,target){
// 		var time = (Math.random()*3);
// 		var $target = $(target).contents(":last-child");
// 		$target.css({"-webkit-transition-duration" : time+"s","-webkit-transform": "translateZ(-1000px) rotateY(-180deg) translateY(0px)"});
// 		$target.on('webkitTransitionEnd', function(e){
// 			console.log("test");
// 			$target.css({"-webkit-transition-duration" : "0.5s","-webkit-transform": "translateZ(0px)"});
// 		});
// 	});
// });


// function storeView(target){
	
// 	var s_no = $(target).parent().parent().parent().parent().attr("id");	
			
// 	$('#popup iframe').remove();
// 	$('#popup').append("<iframe src='/img/view?s_no="+s_no+"' style='width:100%; height:97%;margin-top:0%; background-color: white;'></iframe>");
	
// } 




// 함수 실행시 하단에 게시판 생성..
function gosearch(keyword,e_no,page){
	
	var hei = $(document.body).height();
	
	$(".wrap").css({"position":"static" });
	
	$("#searchList").remove();
	$(document.body).append("<div id='searchList'></div>");
	
	if(bbsList == false){
		vp_GoTo(hei);
	}else{
		vp_GoListView();
	}
	
	$.ajax({
		url:"/img/storeList?keyword="+keyword+"&e_no="+e_no+"&page="+page,
		type:"get",
		
		success:function(data){
			
			$("#searchList").append(data);
			
			
// 			if(bbsList == false){
// 				$(document.body).append(""
// 						+"<div id='searchList'><div id='container'></div></div>");
// 				bbslist = true;
// 			}
			
// 			var len = data.length;
// 			// 작업중2
// 			for(var i =0; i<len; i++){
				
// 				$("#container").append("<div class='grid' id='"+data[i].s_no+"'>"
				
// 				+"<div class='first' ><ul>"
// 				+"<li class='num'><h1>글번호</h1></li>"
// 				+"<li class='mainImg'><img src='/file/view?path="+data[i].s_img+".jpg'></li>"
// 				+"<li class='title'><h1>"+data[i].s_name+"</h1></li>"
// 				+"<li class='content'><h1>${cri}</h1></li></ul></div>"
// 			+"</div>");
						
// 			}// end for
			
			
// 			$(document.body).append("<script>$('.mainImg img').on('click',function(e){"
// 				+"var target = e.target;"
// 				+"if($(target).parent().parent().parent().parent().attr('id') == 'last_3'){"
// 				+"return true;"
// 				+"}"
// 				+"$('#popup').css({'display': 'inherit', 'z-index' : '100'}  );"
// 				+"  storeView(target);   });"
// 				+" <\/script> "
// 			);
			
// 			$(document.body).append("<script>$('.mainImg img').on('click',function(e){"
// 					+"var target = e.target;"
// 					+"$('#popup').css({'display': 'inherit', 'z-index' : '100'}  );"
// 					+"  storeView(target);   });"
// 					+" <\/script> "
// 				);

		
			
			
			
		}// end success
	});// end ajax
	
	
}// end function

var page=1;
// //무한스크롤
// $(window).scroll(function(){
  
// 	if($(document).height() < $(window).scrollTop() + $(window).height()+1){

// 		var keyword = $("[name=keyword]").val();
// 		var e_no = $("[name=e_no]").val()
		
// 		$.ajax({
// 			url:"/img/list2?keyword="+keyword+"&e_no="+e_no+"&page="+ ++page,
// 			type:"get",
// 			success : function(data){
				
// 				var container = document.getElementById("container");
				
				
// 				$(data).each(function(index,vo){
				
// 					$(container).append("<div class='grid' id='"+vo.s_no+"'>"
// 										+"<span class='first'><img src='/resources/images/etc/10.jpg'></span>"
// 										+"<span class='last'>"
// 										+"<div class='last_1'>"+vo.s_name+"</div>"
		
// 										+"</span></div>");		
// 				});//end each
				
// 			}// end success
			
// 		});// end ajax
//     }// end if
// });// end function




</script>


<script>
function goPage(page){
	
	location.href="/img/main?keyword="+$("[name=keyword]").val()
					+"&e_no="+$("[name=e_no]").val()
					+"&page="+page;
	
// 	gosearch('${cri.keyword}','${cri.e_no}',page);
	
	
}

</script>	

<link href="/resources/defualtFont.css"	rel="stylesheet" type="text/css" />
</body>
</html>


