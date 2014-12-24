<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
                    <jsp:param name="selected" value="2"/>
    </jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					<a href="list" style="text-decoration: none; color:#606060;">회원 관리</a><span>| Action is the foundational key to success</span>
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">
						<div class="row-fluid">
							<div class="span6">
								<div id="DataTables_Table_0_length" class="dataTables_length">
								</div>
							</div>
							<div class="span6">
								<div class="dataTables_filter" id="DataTables_Table_0_filter">
								
									<form action="inquiry" method="get">
									<label>Search:
									<input type="text" aria-controls="DataTables_Table_0" name="inputData" id="inputData">
									<input type="submit" value="검색" class="btn btn-primary"></label></form>
								</div>
							</div>
						</div>
						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">번호</th>
										<th>아이디</th>
										<th>성별</th>
										<th>나이</th>
										<th>직업</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
								<ul>
								
		
								<c:forEach var="list" items='${userList }'>
									<tr>
										<td class="center">${list.u_no}</td>
										<td><a href="view?u_no=${list.u_no}">${list.u_id}</a></td>
										<td>${list.u_gender }</td>
										<td>${list.u_age } </td>
										<td>${list.u_job } </td>
										<td> ${list.u_email }</td>
									</tr>
										</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row-fluid">
							'<div class ="span2">
								<button class="btn btn-block btn-primary" onclick="location.href='regist'">회원 등록</button>
							</div>
						</div>
						<div class="row-fluid">
<!-- 							<div class="span8"> -->
								<div class="pagination pagination-centered pagination-small">
									<ul>
										<c:if test='${cri.prePage eq true}'>
										 <li class="prev"><a href="list?page=${cri.startPage-1}">← Previous</a></li>
										</c:if>
										<c:forEach varStatus="pageList" begin='${cri.startPage}' end='${cri.lastPage}'>
										<c:choose>
									
											<c:when test="${cri.page eq pageList.index }"><li class="active">
												<a href="list?page=${pageList.index }">${pageList.index }</a></li></c:when>
									
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
<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty inputData  }">
		<script>
			document.getElementById("inputData").defaultValue = "${inputData}";
		</script>
	</c:if>
</body>
</html>