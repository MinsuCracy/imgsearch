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
@font-face {
	font-family: 'NanumGothic';
	src: url('images/NanumGothic.eot');
}

body {
	font-family: '맑은고딕' 'NanumGothic', 'MalgunGothic';
}

.table td.center,
.table th.center {
	vertical-align: middle;
}


</style>

<!-- LESS 2 CSS -->
<script src="/resources/admin/theme/scripts/less-1.3.3.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		scoreForm();
	});
	
	// 페이지 불러올 때 7가지 성향 체크
	function scoreForm(){
		
		var strAge, strView, strKind, strIntell, strFace, strTrouble, strRumor;
		
		for(var i = 1; i < 10; i++){
			strAge += "<td class=\"center\"><input type=\"radio\" name=\"e_age\" value=\""+ i +"\"></td>";
			strView += "<td class=\"center\"><input type=\"radio\" name=\"e_view\" value=\""+ i +"\"></td>";
			strKind += "<td class=\"center\"><input type=\"radio\" name=\"e_kind\" value=\""+ i +"\"></td>";
			strIntell += "<td class=\"center\"><input type=\"radio\" name=\"e_intell\" value=\""+ i +"\"></td>";
			strFace += "<td class=\"center\"><input type=\"radio\" name=\"e_face\" value=\""+ i +"\"></td>";
			strTrouble += "<td class=\"center\"><input type=\"radio\" name=\"e_trouble\" value=\""+ i +"\"></td>";
			strRumor += "<td class=\"center\"><input type=\"radio\" name=\"e_rumor\" value=\""+ i +"\"></td>";
		}
		
		$(".trAge").append(strAge);
		$(".trView").append(strView);
		$(".trKind").append(strKind);
		$(".trIntell").append(strIntell);
		$(".trFace").append(strFace);
		$(".trTrouble").append(strTrouble);
		$(".trRumor").append(strRumor);
		
		$('input:radio[name="e_age"]:input[value=${ent.e_age}]').attr("checked", "true");
		$('input:radio[name="e_view"]:input[value=${ent.e_view}]').attr("checked", "true");
		$('input:radio[name="e_kind"]:input[value=${ent.e_kind}]').attr("checked", "true");
		$('input:radio[name="e_intell"]:input[value=${ent.e_intell}]').attr("checked", "true");
		$('input:radio[name="e_face"]:input[value=${ent.e_face}]').attr("checked", "true");
		$('input:radio[name="e_trouble"]:input[value=${ent.e_trouble}]').attr("checked", "true");
		$('input:radio[name="e_rumor"]:input[value=${ent.e_rumor}]').attr("checked", "true");
		
	}
	
	// 사진 등록
	function updateResult(data){
		var fName = data.fileName;
		if(data.suffix == '.jpg' || data.suffix == '.png' || data.suffix == '.gif'){
			$(".viewImg").attr("src", "/file/view?path=" + fName);
		}

		$("#inputImg").val(fName);
	}
	
	// 수정 버튼
	function goModify() {
		document.entModify.e_name.value=$(".entName").val();
		document.entModify.method="POST";
		document.entModify.action="/admin/ent/modify";
		document.entModify.submit();
	}
	
	// 취소 버튼
	function cancelModify(e_no) {
		console.log("--------- " + e_no);
		location.href="/admin/ent/view?e_no=" + e_no;
	}
	
	//$(".e_age").onClick()

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
					연예인 수정<span>| Action is the foundational key to success</span>
				</h2>
			</div>
			
			<br>

			<div class="widget widget-4 widget-body-white">
				<div class="widget-body" style="padding: 10px 0 0;">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper form-inline" role="grid">
						
						<table class="table table-primary">
							<thead>
								<tr>
									<td class="center span5 table-td" rowspan="2"><img class="viewImg" src="/file/view?path=${ent.e_img}"></td>
									<th class="center table-th">name<br></th>
									<td class="center table-td"><input type="text" class="entName" value="${ent.e_name}"></td>
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
					
					<form name="entModify" method="post" action="/admin/ent/modify">
						
						<input type="hidden" name="e_no" value="${ent.e_no}"> 
						<input type="hidden" id="entName" name="e_name"> 
						<input type="hidden" id="inputImg" name="e_img" value="${ent.e_img}">

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
							
							<!-- cri 유지 -->
							<input type="hidden" name="page" value="${cri.page}">
							<input type="hidden" name="type" value="${cri.type}">
							<input type="hidden" name="keyword" value="${cri.keyword}">
					</form>

					<div class="row-fluid">
						<div class="span2">
							<button class="btn btn-block btn-primary" onclick="goModify()">수정하기</button>
						</div>
						<div class="span2">
							<button class="btn btn-block btn-primary" onclick="cancelModify(${ent.e_no})">취소</button>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>