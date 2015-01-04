<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Meta -->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />

<!-- Bootstrap -->
<link href="/resources/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Bootstrap Extended -->
<link
	href="/resources/admin/bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap.min.css"
	rel="stylesheet" />
<link
	href="/resources/admin/bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="/resources/admin/bootstrap/extend/bootstrap-wysihtml5/css/bootstrap-wysihtml5-0.0.2.css"
	rel="stylesheet" />

<!-- JQueryUI v1.9.2 -->
<link rel="stylesheet"
	href="/resources/admin/theme/scripts/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.min.css" />

<!-- Glyphicons -->
<link rel="stylesheet" href="/resources/admin/theme/css/glyphicons.css" />

<!-- Bootstrap Extended -->
<link rel="stylesheet"
	href="/resources/admin/bootstrap/extend/bootstrap-select/bootstrap-select.css" />
<link rel="stylesheet"
	href="/resources/admin/bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />

<!-- Uniform -->
<link rel="stylesheet" media="screen"
	href="/resources/admin/theme/scripts/pixelmatrix-uniform/css/uniform.default.css" />

<!-- JQuery v1.8.2 -->
<script src="/resources/admin/theme/scripts/jquery-1.8.2.min.js"></script>

<!-- Modernizr -->
<script src="/resources/admin/theme/scripts/modernizr.custom.76094.js"></script>

<!-- MiniColors -->
<link rel="stylesheet" media="screen"
	href="/resources/admin/theme/scripts/jquery-miniColors/jquery.miniColors.css" />

<!-- Theme -->
<link rel="stylesheet" href="/resources/admin/theme/css/style.min.css" />

<!-- LESS 2 CSS -->
<script src="/resources/admin/theme/scripts/less-1.3.3.min.js"></script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
    font-family: 'Nanum Gothic', serif;
}
</style>


<!-- fileupload-->

<script>

function updateResult(data){

	
	 if(data.suffix == '.jpg' || data.suffix == '.png' || data.suffix == '.gif'){
		
		
		$("#main").attr("src", "/file/view?path="+data.fileName);
		
		var nameparsing = data.fileName;
		nameparsing = nameparsing.substring(nameparsing.indexOf("_") + 1);
		
		$(".photolist").append('<a onclick="func('+"'"+data.fileName+"'"+');">'+nameparsing+'</a>'
							 + '<input type="button" value = "삭제" onclick="removelist($(this))">'
							 + '<input type="text" name="siimg" style="display:none;" value='+"'"+data.fileName+"'"+'>');
		
		
		/* $(".photolist").append('<a onclick="func('+"'"+data.fileName+"'"+');">'+nameparsing+'</a>');
		$(".photolist").append('<input type="button" value = "삭제" onclick="removelist($(this))">');
		$(".photolist").append('<input type="text" name="siimg" style="display:none;" value='+"'"+data.fileName+"'"+'>'); */
		
	}else{
		$(".uploadUL").append("<li><a href='/admin/store/file/down?src=" + data.fileName + "'><image class='thumb' src='/resources/imgs/iDVD.png'/></a></li>");
	}
	
	
	var txt =""; 
		
		txt= data.fileName;
	
		console.log(txt);
		
		$(".filename").val(txt);
	
}

/* keyword*/	 
function keywordup() {

	if($("#keywordcontainer").is(":visible")){
         $("#keywordcontainer").css('display', 'none') ;
     }else{
         $("#keywordcontainer").css('display', 'block') ;
     }
	

	
	
} 




	 



</script>

<style>
    .tb tr td img{
        background-color: blue;
        margin:0px;
        border:0px;
        padding:0px;
        height: 400px;
        width: auto;
    }

	#keywordcontainer {
	position:fixed;
	top:0px;
	left:0px;
	background-color: #ffffff;
	color: #000000;
	width:100%;
	height:100%;
	display:none;
	z-index:10;
	overflow:auto;
	}

input {

padding-bottom: 0px; 
padding-top: 10px;

}

	

</style>



</head>
<body>



	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="3" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					가게 등록<span>| Action is the foundational key to success</span>
				</h2>
			</div>
			
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="row-fluid gallery">
							<table class="masonry uploadUL" style="position: relative; height: 400px;">
								<tr>
								<td height="auto">
								
								<img id='main' class='thumb' src="/file/view?path=default2.jpg" height="400px">
								</td>
								<td class="photolist">
								
								</td>
								
								</tr>
								
								
								
								
						
						<script>
					        function func(data){
					            var changeImg = document.getElementById("main");
					            changeImg.src ="/file/view?path="+data;
					
					        }
					    </script>
				</table>
			
		</div>
		
			<div class="widget-body" style="padding: 10px 0 0;" >
			<input type="txt" id="inputfilename">
			<button type="button" id="selectbutton">select</button>
			<button type="button" id="sendbutton">upload</button>	
			</div>
			
		
		
		
			<form id="fileform"  target="zero" action="/file/upload" method="post" enctype="multipart/form-data">
				<input type='file' style="display:none" onChange="inform()"  id="photofile" name="file"><input type='submit'  style="display:none" id="photosubmit" value="upload">
			</form>
			
			<iframe name="zero" frameborder="0" style="width:0px; height:0px; border:0px">
						</iframe>
			
						
					
						
						
						
						

								<form action="/admin/store/regist" method= "post" id="registform">
							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>
										<tr>
											<th>이름</th>
											<th>홈페이지</th>
											<th>주소</th>
											<th>위도</th>
											<th>경도</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" class="span2" style="border: 0" name="s_name"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_homepage"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_address"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_lat"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_lng"></td>
										</tr>
									</tbody>
								</table>
							</div>
						
							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>

										<tr>
											<th>매치 연예인 1</th>
											<th>매치 연예인 2</th>
											<th>매치 연예인 3</th>
										
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><select class="span2" name= "entfirst">
											<c:forEach items="${elist}"  var = "list"  >
												<option  value="${list.e_no}">${list.e_name}</option>
											</c:forEach>
 											</select></td>
											<td><select class="span2" name= "entsecond">
											<c:forEach items="${elist}"  var = "list"  >
												<option value="${list.e_no}">${list.e_name}</option>
											</c:forEach>
 											</select></td>
											<td><select class="span2" name= "entthird">
											<c:forEach items="${elist}"  var = "list"  >
												<option value="${list.e_no}">${list.e_name}</option>
											</c:forEach>
 											</select></td>
											
										</tr>
									</tbody>
								</table>
							</div>
							
						
			<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>

										<tr>
											<th>카테고리1분류</th>
											<th>카테고리2분류</th>
											<th>카테고리3분류</th>
											
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><select class="span2" name= "cno" onchange="catelist1(this.value)" id="selectcate0">
												<option></option>
											<c:forEach items="${cvolist}"  var = "list"  >
												<option value="${list.c_no}">${list.c_category}</option>
											</c:forEach>
 											</select></td>
											<td><select class="span2" name= "cno" id="selectcate1" onchange="catelist2(this.value)">
												<option></option>
											</select></td>
											
											
											
										
 											<td><select class="span2" name= "c_no" id="selectcate2">
												<option></option>
											</select></td>
										
											
											
										</tr>
									</tbody>
							
							</table>	
						</div>
						
						
						<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary" >
									<thead>

										<tr>
											
											<th>매치 키워드</th>
											
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="keyname"></td>
											
											
										</tr>
									</tbody>
								
								</table>
							</div>	
						
						
						
						
						
							
						<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary" id="traddline">
									<thead>

										<tr>
											<th>메     뉴</th>
											<th>가     격</th>
											
											
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" class="span2" style="border: 0 " name="smmenu"></td>
											<td><input type="text" class="span2" style="border: 0 " name="smprice"></td>
											
										</tr>
									</tbody>
									
									
								</table>
							</div>	
						
						<div style="display:none;" class="filename">
						
						
						</div>
						
					
						
						</form>
						<div class="row-fluid">
						<div class="span1">
							<input class="btn btn-block btn-primary" type="button"  onclick="javascript:addline()" value="추가">
						</div>	
						<div class="span1">
							<input class="btn btn-block btn-primary" type="button" onclick="javascript:deleteline()" value="삭제">
						</div>	
						</div><br><br>	
						<script>
						
						
						function addline(){
							
							var traddtd = $("#traddline").append('<tbody><tr></tr></tbody>');
							traddtd.append('<td><input type="text" class="span2" style="border: 0 " name="smmenu"></td><td><input type="text" class="span2" style="border: 0 " name="smprice"></td>');
						}
						function deleteline(){
							
							$("#traddline td:last").remove();
							$("#traddline td:last").remove();
							
						}
						
						</script>
						
						
						
						</div>
						
						
						<div class="row-fluid">
									<div class="span2">
										<input class="btn btn-block btn-primary" onclick="javascript:submitform()" value="등록">
									</div>
									
						<div class="span2">
										<input class="btn btn-block btn-primary" onclick="javascript:returnform()" value="취소">
						</div>
									<div class="span2">
										<input class="btn btn-block btn-primary" onclick="javascript:keywordup()" value="키워드 추가">                     
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="keywordcontainer">
	

	
	<div class="widget-body" style="padding: 10px 0 0; position:absolute; top:30%; left:40%;"  >
			<table><tr >
			<td style="padding-bottom: 0px; padding-top: 10px;"><input type="text" id="keywordsearch" placeholder="검색할 키워드"></td>
			<td><button type="button" onclick="keyworddiv()" >키워드 검색</button></td>
			<td><button type="button" onclick="keywordup()" >검색 취소</button></td>
			</tr>
			</table>
			<table id="keywordlist">
			
			
			</table>
			
			</div>
			
	</div>




	

	
<script type="text/javascript">
			
			$("#selectbutton").click(function(){
				$("#photofile").click();
				
			});
			
			
			
		
			$("#sendbutton").click(function(){
				$("#photosubmit").click();
				}); 
			
		
			
			
			function inform() {
				
			var inputname =	document.getElementById("photofile");
			var inputfile = document.getElementById("inputfilename");
			var parsingname = inputname.value;
			
			parsingname = parsingname.replace(/^.*[\\\/]/, ''); 
			
			inputfile.value = parsingname;
			
			}
			
			
</script>	
<script>


 function catelist1(cno) {
	

	 
	 
	 console.log(cno);
	 /* category */
	 
	 
	 $.ajax({
			url:"/admin/store/category",
			type:"GET",
			contentType:"application/json; charset=UTF-8",
		    dataType:"json",
		    data:{"cno":cno},
		 	success: function(data){
		 		
		 		$("#selectcate1 option").remove();
		 		$("#selectcate1").append("<option></option>");
		 	
		 		
		 		if(data != null){
				for(i=0 ; i < data.length ; i++) {
					
					
					
					var newoption = document.createElement("option"), 
					opttext = document.createTextNode(data[i].c_category);
					newoption.value = data[i].c_no;	
					newoption.appendChild(opttext);
					
		
					
					$("#selectcate1").append(newoption);
				
				}}else 
				{
					$("#selectcate1").append("<option>내용없음</option>");}	
		 		
		 	
		 	}
			
			
	 });
 }
	 function catelist2(cno) {
			
		console.log(cno);
		 
		 	 
		 
		 /* category */
		 
		 
		 $.ajax({
				url:"/admin/store/category",
				type:"GET",
				contentType:"application/json; charset=UTF-8",
			    dataType:"json",
			    data:{"cno":cno},
			 	success: function(data){
			 		
			 		$("#selectcate2 option").remove();
			 		$("#selectcate2").append("<option></option>");
			 		
			 		
			 		if(data != null){
					for(i=0 ; i < data.length ; i++) {
						
						
						
						var newoption = document.createElement("option"), 
						opttext = document.createTextNode(data[i].c_category);
						newoption.value = data[i].c_no;	
						newoption.appendChild(opttext);
						
						$("#selectcate2").append(newoption);
					
					}}else 
					{
						$("#selectcate2").append("<option>내용없음</option>");}	
			 		
			 	
			 	}
				
				
		 });
		 
	 }
		 


	 
	 /* keyword
	  */
	  

	 
	 
	  
function keywordadd(keyword){
	 		
	 		
	 		console.log(keyword);
	 		var keysearch = $("#keywordsearch");
	 		console.log(keysearch.val());
	 	} 

var keynumlist=[];

function keyworddiv() {
	 		
	 		var keysearch = $("#keywordsearch");
	 		 keysearch = keysearch.val();
	 		 console.log(keysearch);
	 		 
	 		 console.log("0----------------");
	 		 
	 		console.log(keynumlist);
	 			
	 	
	 		
	 	 $.ajax({
	 	         type: "GET",
	 	         url:"/admin/store/keyword",
	 	         contentType:"application/json; charset=UTF-8",
	 			 dataType:"json",
	 			 data:{k_keyword:keysearch,keynumlist:keynumlist},
	 	         success: function(data){

	 	        	$("#keywordlist tbody").remove();
	 	        	
	 			 		if(data != null){
	 					for(var i=0 ; i < data.length ; i++) {
	 						
	 						
	 						
	 						
	 					
	 						var newtbody = document.createElement("tbody");
	 						var newinput = document.createElement("button"),
	 						textinput = document.createTextNode("선택"),
	 						newinput1 = document.createElement("input");
	 						newinput.appendChild(textinput);
	 						newinput1.value = data[i].k_keyword;
	 						newinput.value = data[i].k_no;
	 						newinput.name = "k_no";
	 					
	 					$(newinput).on("click", function(){
	 							
	 							keychoice($(this).val(),$(this).prev().val());
	 						}); 
	 					
	 					 	newinput.setAttribute("type", "button");	
	 						newinput1.setAttribute("type", "text");
	 						newtbody.appendChild(newinput1);
	 						newtbody.appendChild(newinput);
	 						
	 						
	 						
	 						
	 					 	$("#keywordlist").append(newtbody);

	 						
	 						
	 					
	 					}}else 
	 					{
	 						$("#keywordlist").append("<input value='내용없음'>");}	
	 			 	
	 	        	 }
	 	    }); 
	 	}
	 		 
	 
	function keychoice(key, keyword) {
	 	
		
		 console.log("keychoice...." );
		 keynumlist.push(key);
		 console.log(keynumlist);
				
		 
		 
		 
		 
		 
		 
		 
		 
		 
			 			 
			 		 
			 		 
			 		 var newinput1 = document.createElement("input");
			 		 newinput1.value = keyword;
			 			
			 		 $("#keyname").append(newinput1);
			 	
			 		 var newinput2 = document.createElement("input");
			 		 newinput2.value = "삭제";
			 		 
			 		$(newinput2).on("click", function removeklist(){ $(this).prev().remove();
			 		$(this).next().remove();
			 		$(this).remove();});
			 		 newinput2.setAttribute("type", "button");
			 		 $("#keyname").append(newinput2); 

			 		var newinput = document.createElement("input");
			 		 newinput.value = key;
			 		 newinput.name = "kno";
			 		
			 		 newinput.setAttribute("type", "text");
			 		 $(newinput).css("display", "none");
			 			$("#keyname").append(newinput);
			
		
	 	
	 	 }

	/* submit
	 */
	function submitform() {
		
		console.log("1..................");
		
		$('#selectcate0').removeAttr('onchange');
		$('#selectcate1').removeAttr('onchange');
		$('.filename').append($('.photolist'))
		$('form').each(function(){
			
			$(this).submit();
			});
	
		
	}
	
	function removelist(rthis){
		
		
		
		rthis.prev().remove();
		rthis.next().remove();
		rthis.remove();
		
	}	
	
	
	
function returnform(){
		
	location.href = "/admin/store/storelist";
		
		
	} 
	
	

	
	</script>
		
		
		
	</body>
	</html>
