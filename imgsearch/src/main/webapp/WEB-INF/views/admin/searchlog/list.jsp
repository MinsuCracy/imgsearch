<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- ChartJS -->
<script src="/resources/js/Chart.js"></script>


<!-- 게시판 보여주기 위한 스타일 -->
<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
    font-family: 'Nanum Gothic', serif;
}

.block{
	display:block;
}
.none{
	display:none;
}
</style>

</head>
<body>
<script>
var ulPage = 1;
</script>




</script>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
                    <jsp:param name="selected" value="5"/>
    </jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					로그 관리<span>| Action is the foundational key to success</span>
					
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">
						<table width=100%>
								<tr>
								<td>
								<table class="table table-bordered ">
								<tr>
								<td colspan="2">선호 연예인</td>
								</tr>
								<c:forEach var="tblEnt" items="${favoriteEntList }">
								<tr>
								<td>${tblEnt.e_name } </td>
								<td>${tblEnt.cnt }</td>
								</tr>
								</c:forEach>
								</table>
								</td>
								<td >
								<!-- 연예인 파이 데이터 차트 -->
								<div id="canvas-holder">
									<canvas id="chart-ent" width="250" height="250"/>
								</div>
								</td>
								<td>
								<table class="table table-bordered ">
								<tr>
								<td colspan="2">선호 키워드</td>
								</tr>
									<c:forEach var="tblKey" items="${favoriteKeyList }">
								<tr>
								<td>${tblKey.sl_keyword } </td>
								<td>${tblKey.cnt }</td>
								</tr>
								</c:forEach>
								</table>
								</td>
								
								<td>
								<!-- 키워드 파이 데이터 차트 -->
								<div id="canvas-holder">
									<canvas id="chart-keyword" width="250" height="250"/>
								</div>
								</td>
								</tr>
								</table>
						<div class="row-fluid">
							<div class="span6">
								<div id="DataTables_Table_0_length" class="dataTables_length">
								
							
							
									<label>
									
									<select style="width=50px;" size="1" id=real  name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" onchange="logSelect(this.value, ulPage);">
										<option value="searchLog"  selected="selected" >검색 로그</option>
										<option value="userLog">회원 로그</option></select> 
										</label>
								</div>
							</div>
							<div class="span6">
								<div class="dataTables_filter" id="DataTables_Table_0_filter">
								
								</div>
							</div>
						</div>
						<!-- 	서치 로그 -->
						<div class="widget-body block" style="padding: 10px 0 0;" id="searchLog">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">번호</th>
										<th class="center">검색 연예인</th>
										<th>검색 키워드</th>
										<th>검색 날짜</th>
										
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${!empty searchLogList[0].u_no }">
											<c:forEach var="list" items='${searchLogList }'>
												<tr>
													<td class="center">${list.sl_no }</td>
													<td class="center">${list.e_name }</td>
													<td>${list.sl_keyword} </td>
													<td><fmt:formatDate type="both"  pattern="yyyy-MM-dd HH:mm:ss" value="${list.sl_searchdate}" /> </td>
												</tr>
											</c:forEach>
										</c:when>

										<c:otherwise>
											<tr>
												<td class="center" colspan="4">결과 값이 없습니다.</td>
												
											</tr>
										</c:otherwise>
									</c:choose>
																		
								</tbody>
							</table>
							<div class="row-fluid" >
							<div class="" >
								<div class="paging_bootstrap pagination "  style="text-align:center;">
									<ul >
										<c:if test='${cri.prePage eq true}'>
										 <li class="prev"><a  href="list?page=${cri.startPage-1}">← Previous</a></li>
										</c:if>
										
										<c:forEach varStatus="pageList" begin='${cri.startPage}' end='${cri.lastPage}'>
										<c:choose>
											<c:when test="${cri.page eq pageList.index }"><li class="active">
												<a href="list?page=${pageList.index }">${pageList.index }</a></li>
											</c:when>
											<c:otherwise>
											<li><a  href= "list?page=${pageList.index }">${pageList.index }</a></li>
											</c:otherwise>
											</c:choose>
										</c:forEach>
										
										
										<c:if test="${cri.nextPage eq true }">
										<li class="next"><a href="list?page=${cri.lastPage+1}">Next → </a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						</div>
						
<!-- 						end 서치 로그 -->

<!-- 	유저 로그 -->
						<div class="widget-body none" style="padding: 10px 0 0;" id="userLog">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">번호</th>
										<th class="center">유저ID</th>
										<th>로그인 날짜</th>
										<th>로그아웃 날짜</th>
										
									</tr>
								</thead>
								<tbody id=listArea>
									<c:if test="${empty userLogList[0] }">
										<tr>
											<td class="center" colspan="4">결과 값이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<div class="row-fluid" >
							<div class="" >
								<div class="paging_bootstrap pagination "  style="text-align:center;">
									<ul id="ulpage">
									
										
									</ul>
								</div>
							</div>
						</div>
						</div>
						
<!-- 						end 회원 로그 -->



					</div>
				</div>
			</div>
		</div>
	</div>
	<script>

		var data = {};
		var entData=[];
		var i=0;
		var color =[ "#bcebd3", "#70c299", "#575757", "#8a8a8a", "#c9c9c9",];
		var highlight=["#a2e0df","#5AD3D1", "#4f9e9d", "#32a8a6","#166e6c"];
		<c:forEach var="favoEnt" items="${favoriteEntList}" >
			data.value = ${favoEnt.cnt};
			data.color = color[i];
			data.highlight = highlight[i];
			data.label = "${favoEnt.e_name}";
			var recive = data;
			data={"yes":1};
			entData[i] = recive;
			i++;
		</c:forEach>
		
	
	
	
				

				data = {};
				var keyData=[];
				i=0;
				color =["#bcebd3", "#70c299", "#575757",  "#8a8a8a", "#c9c9c9",];
				highlight=["#a2e0df","#5AD3D1", "#4f9e9d", "#32a8a6","#166e6c"];
				<c:forEach var="test" items="${favoriteKeyList}" >
					data.value = ${test.cnt};
					data.color = color[i];
					data.highlight = highlight[i];
					data.label = "${test.sl_keyword}";
					var recive = data;
					data={"yes":1};
					keyData[i] = recive;
					i++;
				</c:forEach>
				console.log(entData);
				console.log(keyData);
		
			window.onload = function(){
				var ctx = document.getElementById("chart-keyword").getContext("2d");
				window.myPie = new Chart(ctx).Pie(keyData);
				
				ctx = document.getElementById("chart-ent").getContext("2d");
				window.myPie = new Chart(ctx).Pie(entData);
			};
			
			
		
			function logSelect(data, userLogPage){
				
				if(data=="userLog"){
					ulPage = userLogPage;
					console.log("userLog 진입");
					$.ajax({
						url: "/admin/userlog/test",
						type: "post",
						data: {page: userLogPage},
						success: function(result){
							var str="";
							console.log("성공 진입");
							var i = result.startPage;
							console.log(result.prePage);
							if(result.prePage){
								str+="<li class='prev'><a onclick=logSelect('userLog',"+(result.startPage-1)+")>← Previous</a></li>";
							}
							for(i; i <= result.lastPage; i++){
								 
								if(i == result.page){
									str+="<li class='active'><a onclick=logSelect('userLog',"+i+")>"+i+"</a></li>";
								}else{
								str+="<li><a onclick=logSelect('userLog',"+i+")>"+i+"</a></li>";
								}
							}
							console.log(result.nextPage);
							if(result.nextPage){
								str+="<li class='next'><a onclick=logSelect('userLog',"+(result.lastPage+1)+")>Next </a></li>";
							}
							console.log(str);
							$("#ulpage").empty();
							$("#ulpage").append(str);
						}
					
					});
					
					
					$.ajax({
						
						url: "/admin/userlog/list",
						type: "post",
						data: { page: userLogPage},
						success :  function(result){
							var str="";
							var year;
							var month;
							var day;
							var hour;
							var min;
							for(var i in result){
								var date = new Date(result[i].l_logindate);
								console.log(typeof date);
								year = date.getFullYear();
								month = date.getMonth();
								day = date.getDay();
								hour = date.getHours();
								min = date.getMinutes();
								str += "<tr><td class='center'>";
								str += result[i].l_no;
								str += "</td><td class='center'>";
								str += result[i].u_id;
								str += "</td><td>";
								str += year+"-"+month+"-"+day+" "+hour+":"+min;
								str += "</td>";
								var date = new Date(result[i].l_logoutdate);
								year = date.getFullYear();
								month = date.getMonth();
								day = date.getDay();
								hour = date.getHours();
								min = date.getMinutes();
								str += "</td><td>";
								str += year+"-"+month+"-"+day+" "+hour+":"+min;
								str += "</td></tr>";
								
							}
							console.log(result);
							$("#listArea").empty();
							$("#listArea").append(str);
						}
					});
					
					$("#userLog").removeClass("none");
					$("#userLog").addClass("block");
					$("#searchLog").removeClass("block");
					$("#searchLog").addClass("none");
				}else{
					console.log("그 외 지역 진입");
					$("#searchLog").removeClass("none");
					$("#searchLog").addClass("block");
					$("#userLog").removeClass("block");
					$("#userLog").addClass("none");
					
				}
			}



	</script>
	
</body>
</html>