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
	
	@font-face {font-family:'NanumGothic'; src: url('images/NanumGothic.eot');}

	body {
		font-family:'맑은고딕' 'NanumGothic', 'MalgunGothic';
	}

</style>

<!-- Rader chart 사용하기 위한 js -->
<script src="/resources/js/Chart.js"></script>

<!-- LESS 2 CSS -->
<script src="/resources/admin/theme/scripts/less-1.3.3.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="4" />
	</jsp:include>
	
	<c:if test="${ent.e_no eq null}">
		 <script>
			 (function(){
			 	location.replace("list");
			 })();
		 </script>
	 </c:if>
	
	
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					연예인 상세<span>| ${ent.e_name}</span>
				</h2>
			</div>
			
			<br>
			
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">이름</th>
										<th class="center">A 타입</th>
										<th class="center">B 타입</th>
										<th class="center">C 타입</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center">${ent.e_name}</td>
										<td class="center">${ent.e_Atype}</td>
										<td class="center">${ent.e_Btype}</td>
										<td class="center">${ent.e_Ctype}</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">Image</th>
										<th class="center">Rader Chart</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center entImg" width="40%" style="vertical-align: middle;"></td>
										<td class="center" width="60%"> <div style="width: 100%;"> <canvas id="canvas"></canvas> </div> </td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">age</th>
										<th class="center">view</th>
										<th class="center">kind</th>
										<th class="center">intell</th>
										<th class="center">face</th>
										<th class="center">trouble</th>
										<th class="center">rumor</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center span2">${ent.e_age}</td>
										<td class="center span2">${ent.e_view}</td>
										<td class="center span2">${ent.e_kind}</td>
										<td class="center span2">${ent.e_intell}</td>
										<td class="center span2">${ent.e_face}</td>
										<td class="center span2">${ent.e_trouble}</td>
										<td class="center span2">${ent.e_rumor}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th class="center">#</th>
										<th class="center">상호</th>
										<th class="center">주소</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${entStore.isEmpty() eq true}">
											<tr> 
												<td colspan="3"> <h4 align="center">해당 연예인과 매칭 되는 가게가 없습니다.</h4> </td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="store" items="${entStore}">
												<tr>
													<td class="center">${store.s_no}</td>
													<td class="center">${store.s_name}</td>
													<td class="center">${store.s_address}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						
						<form name="entView">
							<input type="hidden" name="page" value="${cri.page}">
							<input type="hidden" name="type" value="${cri.type}">
							<input type="hidden" name="keyword" value="${cri.keyword}">
							<input type="hidden" name="e_no" value="${ent.e_no}">
						</form>
							
						<div class="row-fluid" align="center">
							<div class="span2">
								<button class="btn btn-block btn-primary" onclick="goModify()">수정</button>
							</div>
							<div class="span2">
								<button class="btn btn-block btn-primary" onclick="goList()">목록</button>
							</div>
							<div class="span2">
								<button class="btn btn-block btn-primary" onclick="goRemove()">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>
	
	function goModify() {
		location.href='/admin/ent/modify?e_no=' + ${ent.e_no};
	}
	
	function goList() {
		document.entView.method="GET";
		document.entView.action="/admin/ent/list";
		document.entView.submit();
	}
	
	function goRemove() {
		document.entView.method="POST";
		document.entView.action="/admin/ent/remove";
		document.entView.submit();
	}
		
	var age = ${ent.e_age};
	var view = ${ent.e_view};
	var kind = ${ent.e_kind};
	var intell = ${ent.e_intell};
	var face = ${ent.e_face};
	var trouble = ${ent.e_trouble};
	var rumor = ${ent.e_rumor};
	
	var radarChartData = {
		labels: ["연령", "외모", "친근함", "지적성향", "외모", "사건사고", "루머"],
		datasets: [
			{
				label: "My First dataset",
				fillColor: "rgba(220,220,220,0.2)",
				strokeColor: "rgba(220,220,220,1)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)",
				data: [age, view, kind, intell, face, trouble, rumor]
			},
			
		]
	};
	
	// 사진 출력하기
	function readFile(){
		var str = '${ent.e_img}';
		$(".entImg").append("<img class=\"img-responsive\" src=\"/file/view?path=" + str + "\">");
	}

	window.onload = function(){
		window.myRadar = new Chart(document.getElementById("canvas").getContext("2d")).Radar(radarChartData, {
			responsive: true
		});
		readFile();
	}
		
</script>
	
</body>
</html>