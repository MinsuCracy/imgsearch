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

<!-- Rader Chart  -->
<script src="/resources/js/Chart.js"></script>

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
					회원 상세<span>| ${vo.u_id }</span>
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="row-fluid gallery">
						
							<table style="position: relative; height: 250px; width: 100%;">
								<tr>
									<td width="80%">

										<div>
											<canvas id="canvas"></canvas>
										</div></td>
									<td width="20%">
										<div>

													<table class="table table-bordered table-primary">
														<thead>
														<tr>
														<th class="span2 left">
															연령 : </th>
															<td class="span2 center"> ${vo.ug_age }</td>
															</tr>
															<tr>
														<th>
															미디어 노출: 
															</th>
															<td class="span2 center">${vo.ug_view }</td>
														</tr>
														<tr>
														<th>
															친근함: </th><td class="span2 center">${vo.ug_kind }</td></tr>
															
														
														<tr><th>
															지적성향: </th>
															<td class="span2 center">${vo.ug_intell }</td></tr>
														<tr><th>
															외모: </th><td class="span2 center">${vo.ug_face }</td></tr>
														
														<tr><th>
															사건사고: </th><td class="span2 center">${vo.ug_trouble }</td></tr>
														
														<tr><th>
															루머: </th><td class="span2 center">${vo.ug_rumor }</td></tr>
														
														</thead>
															</table>
										</div>
									</td>
									<span class="name"></span>
								</tr>
							</table>
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
											<th>유형</th>
										</tr>
									</thead>
									<tbody>
										<tr>


											<a href="modify?u_no=${vo.u_no }">수정</a>&nbsp;&nbsp;
											
											<form action="remove" method="post" id="re_form">
											<a href="#" onclick="document.getElementById('re_form').submit();">삭제</a>
											<input name="u_no" type="hidden" value="${vo.u_no }">
											</form>
											
											
										
											<td>${vo.u_id }</td>
											<td>${vo.u_gender }</td>
											<td>${vo.u_age }</td>
											<td>${vo.u_job }</td>
											<td>${vo.u_email }</td>
											<td>${vo.u_type }</td>
										</tr>

									</tbody>
								</table>
							</div>
						<div class="row-fluid">
									<div class="span2">
										<button class="btn btn-block btn-primary" onclick="location.href='list?page=${page}'">목록</button>
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:if test="${vo.u_id eq null}">
		<script>
		(function(){
			location.replace("list");
		})();
		</script>
	</c:if>
	

	<script>	
	var ug_age = ${vo.ug_age};
	var ug_view = ${vo.ug_view};
	var ug_kind = ${vo.ug_kind};
	var ug_intell = ${vo.ug_intell};
	var ug_face = ${vo.ug_face};
	var ug_trouble = ${vo.ug_trouble};
	var ug_rumor = ${vo.ug_rumor};
	
	var radarChartData = {
		labels: ["연령", "외모", "친근함", "지적성향", "얼굴", "사건사고", "루머"],
		datasets: [
			{
				label: "My First dataset",
				fillColor: "rgba(220,220,220,0.2)",
				strokeColor: "rgba(220,220,220,1)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)",
				/*여기에 각각의 점수를 넣으면 됩니다.*/
				data: [ug_age, ug_view, ug_kind, ug_intell, ug_face, ug_trouble, ug_rumor]
			},
			
		]
	};

	window.onload = function(){
		window.myRadar = new Chart(document.getElementById("canvas").getContext("2d")).Radar(radarChartData, {
			responsive: true
		});
	}

	</script>

</body>
</html>