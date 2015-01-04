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
<script>
	function goInsertForm(){
		location.href="/admin/store/regist";
	}
</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
    font-family: 'Nanum Gothic', serif;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
                    <jsp:param name="selected" value="3"/>
    </jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					<a href="/admin/store/storelist">가게관리</a><span>| Action is the foundational key to success</span>
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">
						<div class="row-fluid">
							
						
								
							<div class="span6" style="float: right;">
								<div class="dataTables_filter" id="DataTables_Table_0_filter">
								
									 
									<form action="" method = "get">											<select class="span2" name= "type">
 												<option value="s_name" <c:if test="${cri.type eq 's_name'}">selected="selected"</c:if>>이름</option>	
 												<option value="s_homepage" <c:if test="${cri.type eq 's_homepage'}">selected="selected"</c:if>>홈페이지</option>
 												<option value="s_address" <c:if test="${cri.type eq 's_address'}">selected="selected"</c:if>>주소</option> 
											</select>
											<input class="span4" type="text" aria-controls="DataTables_Table_0" name="keyword" value= "${cri.keyword}">
										<input class="span2"  aria-controls="DataTables_Table_0" type="submit" value="검색" >
									</form>
									
									
									
									
								</div>
							</div>
							
						</div>
						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">＃</th>
										<th>이름</th>
										<th>홈페이지</th>
										<th>위도</th>
										<th>경도</th>
										<th>주소</th>
									</tr>
								</thead>
								
								<c:forEach  var = "vo" items = "${list}" >
								<tbody>
									<tr>
										<td class="center">${vo.s_no}</td>
										<td><a href="/admin/store/view?s_no=${vo.s_no}">${vo.s_name}</a></td>
										<td>${vo.s_homepage }</td>
										<td>${vo.s_lat }</td>
										<td> ${vo.s_lng}</td>
										<td>${vo.s_address}</td>
									</tr>
									
								</tbody>
								</c:forEach>
							</table>
						</div>
						<div class="row-fluid">
							<div class ="span2">
								<button class="btn btn-block btn-primary" onclick="javascript:goInsertForm()">가게 등록</button>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span8" style="width: 100%;">
								<div class="dataTables_paginate paging_bootstrap pagination" style="text-align: center;">
									<ul>
										<c:if test="${cri.prePage == true }"><li class="prev disabled"><a href="/admin/store/storelist?page=${cri.startPage - 10 }&type=${cri.type}&keyword=${cri.keyword}">← Previous</a></li></c:if>
										<c:forEach var = "p"  begin="${cri.startPage}" end="${cri.startPage + cri.lastPage -1}">
											<li><a href="/admin/store/storelist?page=${p}&type=${cri.type}&keyword=${cri.keyword}">${p}</a></li>
										</c:forEach>
										<c:if test="${cri.nextPage == true }"><li class="next"><a href="/admin/store/storelist?page=${cri.startPage + cri.lastPage + 1 }&type=${cri.type}&keyword=${cri.keyword}">Next → </a></li></c:if>
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