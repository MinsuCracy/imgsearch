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

<script>
	function reviewForm(){
		location.href="/admin/store/view?s_no=${vo.s_no}";
	}
</script>



</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="3" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					가게 수정<span>| Action is the foundational key to success</span>
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="row-fluid gallery">
							<ul class="masonry" style="position: relative; height: 400px;">
								<li class="span4 masonry-brick"
									style="position: absolute; top: 0px; left: 0px;"><span
									class="thumb view"> <img src="/resources/testImg/IU.jpg"
										alt="Album">
								</span> <span class="name"></span></li>
							</ul>
							<div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden" value="" name="">
			  	<div class="input-append">
			    	<div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" name=""></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
			  	</div>
			</div>
						</div>

						<form action="" method="post" id="modifyform">
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
											<td><input type="text" class="span2" style="border: 0" name="s_name" value="${vo.s_name}"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_homepage" value="${vo.s_homepage}"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_address" value="${vo.s_address}"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_lat" value="${vo.s_lat}"></td>
											<td><input type="text" class="span2" style="border: 0" name="s_lng" value="${vo.s_lng}"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>

										<tr>
											<th>가게 카테고리</th>
											<th>매치 연예인</th>
											<th>매치 키워드</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="text" class="span3" style="border: 0"></td>
											<td><input type="text" class="span3" style="border: 0"></td>
											<td><input type="text" class="span3" style="border: 0"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>
						<div class="row-fluid">
									<div class="span2">
										<button class="btn btn-block btn-primary" type="submit" form="modifyform" value="submit">수정완료</button>
									</div>
									<div class="span2">
										<button class="btn btn-block btn-primary" onclick="javascript:reviewForm()">취소</button>
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



