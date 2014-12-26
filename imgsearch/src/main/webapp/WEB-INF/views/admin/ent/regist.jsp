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

<style type="text/css">
	
	@font-face {font-family:'NanumGothic'; src: url('images/NanumGothic.eot');}

	body {
		font-family:'맑은고딕' 'NanumGothic', 'MalgunGothic';
	}
	
	.table td.center,
	.table th.center {
		vertical-align: middle;
	}

</style>

<!-- LESS 2 CSS -->
<script src="/resources/admin/theme/scripts/less-1.3.3.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>

<script>

	$(document).ready(function(){
		scoreForm();
	});
	
	// 항목별 score 라디오 버튼 생성
	function scoreForm(){
		for(var i = 1; i < 10; i++) {
			$(".trAge").append("<td class=\"center\"><input type=\"radio\" name=\"e_age\" value=\""+ i +"\"></td>");
			$(".trView").append("<td class=\"center\"><input type=\"radio\" name=\"e_view\" value=\""+ i +"\"></td>");
			$(".trKind").append("<td class=\"center\"><input type=\"radio\" name=\"e_kind\" value=\""+ i +"\"></td>");
			$(".trIntell").append("<td class=\"center\"><input type=\"radio\" name=\"e_intell\" value=\""+ i +"\"></td>");
			$(".trFace").append("<td class=\"center\"><input type=\"radio\" name=\"e_face\" value=\""+ i +"\"></td>");
			$(".trTrouble").append("<td class=\"center\"><input type=\"radio\" name=\"e_trouble\" value=\""+ i +"\"></td>");
			$(".trRumor").append("<td class=\"center\"><input type=\"radio\" name=\"e_rumor\" value=\""+ i +"\"></td>");
		}
	}
	
	// 사진 등록
	function updateResult(data){
		var fName = data.fileName;
		if(data.suffix == '.jpg' || data.suffix == '.png' || data.suffix == '.gif'){
			$(".viewImg").attr("src", "/file/view?path=" + fName);
		}

		$("#inputImg").val(fName);
	}
	
	// 등록 버튼
	function goRegist() {
		document.entRegist.e_name.value=$(".entName").val();
		document.entRegist.method="POST";
		document.entRegist.action="/admin/ent/regist";
		document.entRegist.submit();
	}
	
	// 취소 버튼
	function cancelRegist() {
		location.href="/admin/ent/list";
	}

</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/topmenu.jsp" flush="true">
		<jsp:param name="selected" value="4" />
	</jsp:include>
	<div class="container-fluid fixed">

		<div id="content">
			<div class="heading-buttons">
				<h2>
					연예인 등록<span>| Action is the foundational key to success</span>
				</h2>
			</div>
			
			<br>
			
			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid">

							<table class="table table-primary">
								<thead>
									<tr>
										<td class="center span5 table-td" rowspan="2"><img class="viewImg" src="/file/view?path=default.jpg"></td>
										<th class="center table-th">name<br></th>
										<td class="center table-td"><input type="text" class="entName"></td>
									</tr>
									<tr>
										<th class="center table-th">image</th>
										<td class="center table-td">
											<form target="zero" action="/file/upload" method="post" enctype="multipart/form-data" style="display:inline;">
												<input type='file' name="file"> <input type='submit' value="UPLOAD" style="display:inline;">
											</form>
										</td>
									</tr>
								</thead>
							</table>
						</div>
						
						<iframe name="zero" width="0" height="0"></iframe>
						
						<br>
						
						<form name="entRegist">
						
							<input type="hidden" name="e_name"> <input type="hidden" id="inputImg" name="e_img">

							<div class="widget-body" style="padding: 10px 0 0;">
								<table class="table table-bordered table-primary">
									<thead>
										<tr>
											<th class="center">score</th>
											<th class="center">1</th>
											<th class="center">2</th>
											<th class="center">3</th>
											<th class="center">4</th>
											<th class="center">5</th>
											<th class="center">6</th>
											<th class="center">7</th>
											<th class="center">8</th>
											<th class="center">9</th>
										</tr>
									</thead>
										<tbody>
											<tr class="trAge">
												<th class="center">age</th>
											</tr>
											<tr class="trView">
												<th class="center">view</th>
											</tr>
											<tr class="trKind">
												<th class="center">kind</th>
											</tr>
											<tr class="trIntell">
												<th class="center">intell</th>
											</tr>
											<tr class="trFace">
												<th class="center">face</th>
											</tr>
											<tr class="trTrouble">
												<th class="center">trouble</th>
											</tr>
											<tr class="trRumor">
												<th class="center">rumor</th>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
							
							<div class="row-fluid">
								<div class="span2">
									<button class="btn btn-block btn-primary" onclick="goRegist()">등록</button>
								</div>
								<div class="span2">
									<button class="btn btn-block btn-primary" onclick="cancelRegist()">취소</button>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
</body>
</html>