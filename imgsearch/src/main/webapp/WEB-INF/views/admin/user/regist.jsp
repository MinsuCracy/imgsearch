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

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
    font-family: 'Nanum Gothic', serif;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="2" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					회원 등록<span>| Action is the foundational key to success</span>
				</h2>
			</div>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">

						<div class="row-fluid gallery">

							<table style="position: relative; height: 250px; width: 100%;">
								<tr>
									<td width="60%"><!— rader chart 공간 —>

										<div>
											<canvas id="canvas"></canvas>
										</div></td>
									<td width="40%">
										<div>
											<form align="right" id="userForm" action="regist" method="post">

												<p>
													연령: <input type="number" id="ug_age" name="ug_age" min="1"
														max="9" step="1" value="1" onchange="valueChange(this)">
												</p>
												<p>
													미디어 노출: <input type="number" id="ug_view" name="ug_view" min="1"
														max="9" step="1" value="1" onchange="valueChange(this)">
												</p>
												<p>
													친근함: <input type="number" id="ug_kind" name="ug_kind" min="1"
														max="9" step="1" value="1" onchange="valueChange(this)">
												</p>
												<p>
													지적성향: <input type="number" id="ug_intell" name="ug_intell"
														min="1" max="9" step="1" value="1"
														onchange="valueChange(this)">
												</p>
												<p>
													외모: <input type="number" id="ug_face" name="ug_face" min="1"
														max="9" step="1" value="1" onchange="valueChange(this)">
												</p>
												<p>
													사건사고: <input type="number" id="ug_trouble" name="ug_trouble"
														min="1" max="9" step="1" value="1"
														onchange="valueChange(this)">
												</p>
												<p>
													루머: <input type="number" id="ug_rumor" name="ug_rumor" min="1"
														max="9" step="1" value="1" onchange="valueChange(this)">
												</p>
											
										</div>
									</td>
									<span class="name"></span>
								</tr>
							</table>
						</div>

					</div>

						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>
									<tr>
										<th>아이디</th>
										<th>패스워드</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td><input type="text" name="u_id" class="span2"
											style="border: 0"READONLY"></td>
										<td><input type="password" name="u_pw" class="span2"
											style="border: 0"READONLY"></td>
										<td><input type="email" name="u_email" class="span2"
											style="border: 0"READONLY"></td>

									</tr>
								</tbody>
							</table>
						</div>

						<div class="widget-body" style="padding: 10px 0 0;">
							<table class="table table-bordered table-primary">
								<thead>

									<tr>
										<th>나이</th>
										<th>성별</th>
										<th>직업</th>
										<th>유형</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" name="u_age" class="span1"
											style="border: 0"READONLY"></td>
										<td><input type="radio" name="u_gender" value="f">여성
											<input type="radio" name="u_gender" value="m">남성</td>
										<td><input type="text" name="u_job" class="span1"
											style="border: 0"READONLY"></td>
										<td><input type="radio" name="u_type" value="n">일반사용자
											<input type="radio" name="u_type" value="s">가게관리자 <input
											type="radio" name="u_type" value="a">통합관리자</td>
									</tr>

								</tbody>
							</table>
						</div>
					</form>
					<div class="row-fluid">
						<div class="span2">
							<button onclick="regUser()" class="btn btn-block btn-primary">등록</button>
						</div>
						<div class="span2">
							<button onclick="location.href='list'"
								class="btn btn-block btn-primary">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script>
		var ug_age = document.getElementById("ug_age").value;
		var ug_view = document.getElementById("ug_view").value;
		var ug_kind = document.getElementById("ug_kind").value;
		var ug_intell = document.getElementById("ug_intell").value;
		var ug_face = document.getElementById("ug_face").value;
		var ug_trouble = document.getElementById("ug_trouble").value;
		var ug_rumor = document.getElementById("ug_rumor").value;

		function valueChange(data) {
			eval(data.name + "=" + data.value);
			
			var radarChartData = {
				labels : [ "연령", "외모", "친근함", "지적성향", "얼굴", "사건사고", "루머" ],
				datasets : [
						{
							label : "My First dataset",
							fillColor : "rgba(220,220,220,0.2)",
							strokeColor : "rgba(220,220,220,1)",
							pointColor : "rgba(220,220,220,1)",
							pointStrokeColor : "#fff",
							pointHighlightFill : "#fff",
							pointHighlightStroke : "rgba(220,220,220,1)",
							/*여기에 각각의 점수를 넣으면 됩니다.*/
							data : [ ug_age, ug_view, ug_kind, ug_intell,
									ug_face, ug_trouble, ug_rumor ]
						},

				]
			};
			window.myRadar = new Chart(document.getElementById("canvas")
					.getContext("2d")).Radar(radarChartData, {
				responsive : true
			});
			console.log(ug_age, ug_view, ug_kind, ug_intell, ug_face,
					ug_trouble, ug_rumor);
			console.log(radarChartData.datasets);

		}

		var radarChartData = {
			labels : [ "연령", "외모", "친근함", "지적성향", "얼굴", "사건사고", "루머" ],
			datasets : [
					{
						label : "My First dataset",
						fillColor : "rgba(220,220,220,0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						/*여기에 각각의 점수를 넣으면 됩니다.*/
						data : [ ug_age, ug_view, ug_kind, ug_intell, ug_face,
								ug_trouble, ug_rumor ]
					},

			]
		};

		window.onload = function() {
			window.myRadar = new Chart(document.getElementById("canvas")
					.getContext("2d")).Radar(radarChartData, {
				responsive : true
			});
		}

		function regUser() {
			document.getElementById("userForm").submit();
		}
	</script>
</body>
</html>