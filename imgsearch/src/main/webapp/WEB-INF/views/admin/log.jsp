<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
	function goInsertForm(){
		location.href="/admin/store/insert";
	}
</script>
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
									<label><select size="1"
										name="DataTables_Table_0_length"
										aria-controls="DataTables_Table_0"><option value="10"
												selected="selected">회원 로그</option>
											<option value="25">검색 로그</option></select> records per page</label>
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
						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">번호</th>
										<th>회원 아이디</th>
										<th>로그인 날짜</th>
										<th>로그아웃 날짜</th>
										
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center">1</td>
										<td>Lorem ipsum dolor</td>
										<td>Lorem ipsum dolor</td>
										<td>Lorem ipsum dolor</td>
									</tr>
									
								</tbody>
							</table>
						</div>
<!-- 						end 회원 로그 -->


<!-- 						검색 로그 -->
						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">번호</th>
										<th>회원 아이디</th>
										<th>연예인 이름</th>
										<th>검색 날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center">1</td>
										<td>Lorem ipsum dolor</td>
										<td>Lorem ipsum dolor</td>
										<td>Lorem ipsum dolor</td>
									</tr>
									
								</tbody>
							</table>
						</div>
<!-- 						end 검색 로그 -->
						<div class="row-fluid">
							<div class="span8">
								<div class="dataTables_paginate paging_bootstrap pagination">
									<ul>
										<li class="prev disabled"><a href="#">← Previous</a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li class="next"><a href="#">Next → </a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>