<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/user/css/loginstyle2.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<body>
	<div class="container row">
		<form action="/check" method="post" class="form component-uff registration_form dispatched">
			<div data-step="" data-step-number="0">
				<div class="header col-xs-12">
					<h2 class="title sb-effect-displayed animated fadeInUp"
						data-sb="fadeInUp" style="opacity: 1;">로그인</h2>
				</div>
				<div class="content controls col-xs-12">
					<div class="form-group col-xs-12 p0 m0">
						<label data-sb="fadeInUp"
							class="sb-effect-displayed animated fadeInUp" style="opacity: 1;">아이디</label> <input type="email"
							class="form-control sb-effect-displayed animated fadeInUp"
							id="input-email" placeholder="아이디" data-sb="fadeInUp"
							data-validation-required="#error_user_information_email_required"
							data-validation-email="#error_user_information_email_invalid"
							style="opacity: 1;" name="username">
						<p id="error_user_information_email_required" class="alert-error"
							style="display: none;">아이디를 입력하세요</p>
						<p id="error_user_information_email_invalid" class="alert-error"
							style="display: none;">아이디가 없습니다.</p>
					</div>
					<div class="form-group col-xs-12 p0 pt12 m0">
						<label data-sb="fadeInUp"
							class="sb-effect-displayed animated fadeInUp" style="opacity: 1;" >비밀번호</label>
						<input type="password" class="form-control sb-effect-displayed animated fadeInUp" placeholder="Password" name="userpw">
						<p id="error_user_information_password_required"
							class="alert-error" style="display: none;">비밀번호를 입력하세요</p>
					</div>
				</div>
				<div class="footer col-xs-12 pt12">
					<div class="group">
						<a href="#"
							class="btn btn-info col-xs-5 fl sb-effect-displayed animated fadeInDown"
							data-sb="fadeInDown" style="opacity: 1;">회원가입</a> <a id="login"
							class="btn btn-primary col-xs-5 fr sb-effect-displayed animated fadeInDown"
							data-step-finish="" data-sb="fadeInDown" style="opacity: 1;">
							로그인</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$("#login").click(function(event){
			event.preventDefault();
			$(".form").submit();
			parent.$.fn.colorbox.close();
// 			parent.location.href= "/img/main";
		});
	</script>

 <link href="/resources/defualtFont.css" rel="stylesheet"
 type="text/css" />	

</body>
</html>