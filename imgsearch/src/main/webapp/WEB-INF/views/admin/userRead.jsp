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
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="2" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					회원 상세<span>| Action is the foundational key to success</span>
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="row-fluid gallery">
							<ul class="masonry" style="position: relative; height: 250px;">
								<li class="span4 masonry-brick"
									style="position: absolute; top: 0px; left: 0px;"><span
									class="thumb view"> <img src="/resources/testImg/Radar-Chart.jpg"
										alt="Album">
								</span> <span class="name"></span></li>
							</ul>
						</div>


							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>

										<tr>
											<th>아이디</th>
											<th>성별</th>
											<th>나이</th>
											<th>직업</th>
											<th>이메일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
										</tr>

									</tbody>
								</table>
							</div>
						<div class="row-fluid">
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
</script>
</body>
</html>