<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<style type="text/css">
@font-face {
	font-family: 'NanumGothic';
	src: url('images/NanumGothic.eot');
}

body {
	font-family: '맑은고딕' 'NanumGothic', 'MalgunGothic';
}
</style>

<!-- LESS 2 CSS -->
<script src="/resources/admin/theme/scripts/less-1.3.3.min.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="4" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					연예인 관리<span>| Action is the foundational key to success</span>
				</h2>
			</div>

			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">
						
						<form name="entList" action="/admin/ent/list">
							<input type="hidden" name="page" value="${cri.page}">
							<div class="row-fluid">
								<div class="span6"></div>
								<div class="span6">
									<div class="dataTables_filter" id="DataTables_Table_0_filter">
										<label>Search: <select class="span3" size="1"
											name="type" aria-controls="DataTables_Table_0">
												<option value="N"
													<c:if test="${cri.type eq 'N'}">selected="selected"</c:if>>이름</option>
												<option value="A"
													<c:if test="${cri.type eq 'A'}">selected="selected"</c:if>>A타입</option>
												<option value="B"
													<c:if test="${cri.type eq 'B'}">selected="selected"</c:if>>B타입</option>
												<option value="C"
													<c:if test="${cri.type eq 'C'}">selected="selected"</c:if>>C타입</option>
										</select> <input class="span4" type="text"
											aria-controls="DataTables_Table_0" name="keyword"
											value="${cri.keyword}">
											<button class="btn btn-primary" onclick="goSearch()">검색</button>
										</label>
									</div>
								</div>
							</div>
							<input type="hidden" name="e_no">
						</form>
						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">#</th>
										<th class="center">이름</th>
										<th class="center">A 타입</th>
										<th class="center">B 타입</th>
										<th class="center">C 타입</th>
										<!-- <th>지적</th> -->
									</tr>
								</thead>
								
								<tbody>
								<c:choose>
									<c:when test="${entList.isEmpty() eq true}">
										<tr>
										<td colspan="5"><h2 align="center">검색 결과가 없습니다.</h2></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="ent" items="${entList}">
											<tr>
												<td class="center">${ent.e_no}</td>
												<td class="center"><a href="javascript:goView(${ent.e_no})">${ent.e_name}</a></td>
												<td class="center">${ent.e_Atype}</td>
												<td class="center">${ent.e_Btype}</td>
												<td class="center">${ent.e_Ctype}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>									
						</div>
						<div class="row-fluid">
							<div class="span2">
								<button class="btn btn-block btn-primary" onclick="goRegist()">연예인
									등록</button>
							</div>
						</div>
						<!-- paging -->
						<div class="row-fluid">
								<!-- <div class="dataTables_paginate paging_bootstrap pagination"> -->
								<div class="pagination pagination-centered pagination-small" align="center">
									<ul>
										<c:if test="${cri.prePage eq true}">
											<li class="prev"><a
												href="javascript:goList(${cri.startPage-1})">← Previous</a></li>
										</c:if>

										<c:forEach var="pnum" step="1" begin="${cri.startPage}"
											end="${cri.lastPage}">
											<li <c:if test="${cri.page eq pnum}">class="active"</c:if>><a
												href="javascript:goList(${pnum})">${pnum}</a></li>
										</c:forEach>

										<c:if test="${cri.nextPage eq true}">
											<li class="next"><a
												href="javascript:goList(${cri.lastPage+1})">Next →</a></li>
										</c:if>

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<script type="text/javascript">
	
		function goView(eno){
			//location.href='/admin/ent/view?e_no=' + eno;
			document.entList.action="/admin/ent/view";
			document.entList.e_no.value=eno;
			document.entList.submit();
		}
		
		function goList(page){
			document.entList.page.value = page;
			document.entList.submit();
		}
		
		function goSearch(){
			document.entList.page.value=1;
			document.entList.submit();
		}
		
		function goRegist() {
			location.href='/admin/ent/regist';
		}
		
	</script>
</body>
</html>