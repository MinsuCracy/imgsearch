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
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">

/*  fileupload */

function viewphoto(){
	
	
	
	
		var fileName ="${ivolist[0].si_img}";
	 		
		
	
		$("#main").attr("src", "/admin/store/file/view/"+fileName);
		
			
		}
		
		
		
		


/* 				$("#main").attr("src", "/admin/store/file/view/"+data.fileName);
				
				
				var nameparsing = data.fileName;
				nameparsing = nameparsing.substring(nameparsing.indexOf("_") + 1);
				
				
				$(".photolist").append('<a href="#" onclick="func('+"'"+data.fileName+"'"+');">'+nameparsing+'</a><br>');
 */


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

</style>




</head>
<body onload="viewphoto()">
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="3" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					가게 상세<span>| Action is the foundational key to success</span>
				</h2>a
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="row-fluid gallery">
							<table class="masonry uploadUL tb" style="position: relative; height: 400px;" >
							<tr>
								<td height="auto">
								
								<img id='main' class='thumb' src="/resources/imgs/plzphoto.jpg" height="400px">
								</td>
								<td class="photolist">
								<c:forEach items="${ivolist}"  var = "list"  >
										
											<a href="#" onclick="func('${list.si_img}');">${list.si_img}</a>
									
								
								</c:forEach>
								</td>
								
								</tr>
						<script>
					        function func(data){
					            var changeImg = document.getElementById("main");
					            changeImg.src ="/admin/store/file/view/"+data;
					
					        }
					    </script>
							
							
							
							
							
							</table>
						</div>

						<form>
							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>
										<tr>
											<th>상호</th>
											<th>홈페이지</th>
											<th>주소</th>
											<th>위도</th>
											<th>경도</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${vo.s_name}</td>
											<td>${vo.s_homepage}</td>
											<td>${vo.s_address}</td>
											<td>${vo.s_lat}</td>
											<td>${vo.s_lng}</td>
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
											<th>검색 포인트</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach items="${evolist}"  var = "list"  >
											<td>${list.e_name}</td>
											</c:forEach>
											<td>${matchpoint}</td>
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
											
 											<td>${scvop2.c_category}</td>
 											<td>${scvop1.c_category}</td>
 											<td>${scvo.c_category}</td>
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
								<table class="table table-bordered table-primary">
									<thead>

										<tr>
											<th width="25%">메       뉴</th>
											<th width="25%">가       격</th>
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${mvolist[0].sm_menu}</td>
											<td>${mvolist[0].sm_price}</td>
											
										</tr>
									</tbody>
								</table>
							</div>
							
							
							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary" id="reviewtable">
									<thead>

										<tr>
											<th width="20%">아이디</th>
											<th width="65%">댓글</th>
											<th width="15%">날짜</th>
											
										</tr>
									</thead>
									
								</table>
							</div>
							
							<ul class="reviewlist">
							</ul>
							
							
						</form>
						<div class="row-fluid">
									<div class="span2">
										<button class="btn btn-block btn-primary update" >수정</button>
									</div>
									<div class="span2">
										<button class="btn btn-block btn-primary delete">삭제</button>
									</div>
									<div class="span2">
										<button class="btn btn-block btn-primary">목록</button>
									</div>
							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(".update").click(function(){
		console.log("클릭");
		location.href="/admin/store/modify?s_no=${vo.s_no}";
	});
	$(".delete").click(function(){
		console.log("클릭");
		location.href="/admin/store/remove?s_no=${vo.s_no}";
	});
	
	
	
</script>


<script>


 $( document ).ready(function() {
	

	 
	 
	 
	 /* review */
	 
	 
	 var s_no= ${vo.s_no};
	 
	 $.ajax({
			url:"/admin/store/review",
			type:"GET",
			contentType:"application/json; charset=UTF-8",
		    dataType:"json",
		    data:{"s_no":s_no},
		 	success: function(data){
		 		
		 		if(data != null){
				for(i=0 ; i < data.length ; i++) {
					
					
					
					var newtbody = document.createElement("tbody"), 
					newtr = document.createElement("tr"),
					newtdid = document.createElement("td"),
					newtdcom = document.createElement("td"),
					newtdreg = document.createElement("td"),
					tdidtext = document.createTextNode(data[i].u_id),
					tdcomtext = document.createTextNode(data[i].r_comment),
					tdregtext = document.createTextNode(data[i].r_regdate);
						
						newtdid.appendChild(tdidtext);
						newtdcom.appendChild(tdcomtext);
						newtdreg.appendChild(tdregtext);
						
						newtr.appendChild(newtdid);
						newtr.appendChild(newtdcom);
						newtr.appendChild(newtdreg);
					
					newtbody.appendChild(newtr);
					
					$("#reviewtable").append(newtbody);
				
				}}else 
				{
					$(".reviewlist").append("<li>댓글이 없습니다.</li>");
				}	
		 		
		 	
		 	}
			
			
	});  
	 
 });	
</script>

	







</body>
</html>