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
.block{
	display:block;
}
.none{
	display:none;
}
</style>

</head>
<body>
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
						<div class="row-fluid">
							<div class="span6">
								<div id="DataTables_Table_0_length" class="dataTables_length">
								<table>
								<tr>
								<td>
								<!-- 연예인 파이 데이터 차트 -->
								<div id="canvas-holder">
									<canvas id="chart-keyword" width="300" height="300"/>
								</div>
								</td>
								<td>
								<!-- 키워드 파이 데이터 차트 -->
								<div id="canvas-holder">
									<canvas id="chart-ent" width="300" height="300"/>
								</div>
								</td>
								</tr>
								</table>
							
							
								<p>많이 검색 한 연예인, 많이 검색 한 키워드</p>
									<label>
									<select size="1" name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" onchange="logSelect(this.value);">
										<option value="userLog" selected="selected" >회원 로그</option>
										<option value="searchLog" >검색 로그</option></select> 
										records per page</label>
								</div>
							</div>
							<div class="span6">
								<div class="dataTables_filter" id="DataTables_Table_0_filter">
									<label>Search: <input type="text"
										aria-controls="DataTables_Table_0"></label>
								</div>
							</div>
						</div>
<!-- 						회원 로그 -->
						<div class="widget-body block" style="padding: 10px 0 0;" id="userLogList">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">번호</th>
										<th class="center">회원 아이디</th>
										<th>로그인 날짜</th>
										<th>로그아웃 날짜</th>
										
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${!empty userLogList[0].u_id }">
											<c:forEach var="list" items='${userLogList }'>
												<tr>
													<td class="center">${list.l_no }</td>
													<td class="center">${list.u_id }</td>
													<td><fmt:formatDate type="both"  pattern="yyyy-MM-dd HH:mm:ss" value="${list.l_logindate}" /> </td>
													<td><fmt:formatDate type="both"  pattern="yyyy-MM-dd HH:mm:ss" value="${list.l_logoutdate}" /> </td>
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
							<div class="span8" >
								<div class="dataTables_paginate paging_bootstrap pagination " >
									<ul >
										<c:if test='${cri.prePage eq true}'>
										 <li class="prev"><a href="list?page=${cri.startPage-1}">← Previous</a></li>
										</c:if>
										
										<c:forEach varStatus="pageList" begin='${cri.startPage}' end='${cri.lastPage}'>
										<c:choose>
											<c:when test="${cri.page eq pageList.index }"><li class="active">
												<a href="list?page=${pageList.index }">${pageList.index }</a></li>
											</c:when>
											<c:otherwise>
											<li><a href="list?page=${pageList.index }">${pageList.index }</a></li>
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
						
<!-- 						end 회원 로그 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>

		var entData = [
				{
					value: 300,
					color:"#F7464A",
					highlight: "#FF5A5E",
					label: "Red"
				},
				{
					value: 50,
					color: "#46BFBD",
					highlight: "#5AD3D1",
					label: "Green"
				},
				{
					value: 100,
					color: "#FDB45C",
					highlight: "#FFC870",
					label: "Yellow"
				},
				{
					value: 40,
					color: "#949FB1",
					highlight: "#A8B3C5",
					label: "Grey"
				},
				{
					value: 120,
					color: "#4D5360",
					highlight: "#616774",
					label: "Dark Grey"
				}

			];

			
			var keyData = [
							{
								value: 50,
								color:"#F7464A",
								highlight: "#FF5A5E",
								label: "Red"
							},
							{
								value: 50,
								color: "#46BFBD",
								highlight: "#5AD3D1",
								label: "Green"
							},
							{
								value: 50,
								color: "#FDB45C",
								highlight: "#FFC870",
								label: "Yellow"
							},
							{
								value: 50,
								color: "#949FB1",
								highlight: "#A8B3C5",
								label: "Grey"
							},
							{
								value: 50,
								color: "#4D5360",
								highlight: "#616774",
								label: "Dark Grey"
							}

						];

			window.onload = function(){
				var ctx = document.getElementById("chart-ent").getContext("2d");
				window.myPie = new Chart(ctx).Pie(entData);
				
				ctx = document.getElementById("chart-keyword").getContext("2d");
				window.myPie = new Chart(ctx).Pie(keyData);
			};



	</script>

	
</body>
</html>