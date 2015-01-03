<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>MENU</title>

<link rel="stylesheet" type="text/css"
	href="/resources/main/menuView/css/style.css" />

<script type="text/javascript"
	src="/resources/main/menuView/js/modernizr.custom.79639.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css'
	rel='stylesheet' type='text/css'>

<style>
body {
	font-family: 'Nanum Barun Gothic', sans-serif;
}

.rm-store-name {
	font-size: 1.5em;
	margin-top: 30%;
}
</style>

</head>

<body>

	<section class="main">
		<div id="rm-container" class="rm-container">
			<div class="rm-wrapper">
				<div class="rm-cover">
					<div class="rm-front">
						<div class="rm-content">

							<div class="rm-logo">
								<i style="color: #fff; margin-top: 25px;"
									class="fa fa-cutlery fa-4x"></i>
							</div>
							
							<div class="rm-store-name">${store}</div>

							<a href="#" class="rm-button-open" style="margin-top: 30%;">View the Menu</a>

						</div> <!-- /rm-content -->
					</div> <!-- /rm-front -->

					<div class="rm-back">
						<div class="rm-content section1">
							<h4>MENU</h4>
							<dl></dl>
						</div> <!-- /rm-content -->
						<div class="rm-overlay"></div>
					</div> <!-- /rm-back -->
					
				</div> <!-- /rm-cover -->

				<div class="rm-middle">
					<div class="rm-inner">
						<div class="rm-content section2">
							<h4>MENU</h4>
							<dl></dl>
						</div> <!-- /rm-content -->
						<div class="rm-overlay"></div>
					</div> <!-- /rm-inner -->
				</div> <!-- /rm-middle -->

				<div class="rm-right">
					<div class="rm-front"></div>
					<div class="rm-back">
						<span class="rm-close">Close</span>
						<div class="rm-content section3">
							<h4>MENU</h4>
							<dl></dl>
							<div class="rm-order">
<!-- 								<p><strong>Would you like us to cater your event?</strong> Call us &amp; we'll help you find a venue and organize the event: <strong>626.511.1170</strong></p> -->
							</div>
						</div> <!-- /rm-content -->
					</div> <!-- /rm-back -->
				</div> <!-- /rm-right -->
				
			</div> <!-- /rm-wrapper -->
		</div> <!-- /rm-container -->
	</section>

	<!-- jQuery if needed -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/main/menuView/js/menu.js"></script>
	
	<script type="text/javascript">
	
		$(function() {
			Menu.init();
			menuAppend();
		});
		
		function menuAppend(){
			
			var size = ${menuList.size()};
			
			console.log(size);
			
			var len = Math.ceil(size / 3);
			var num = 1;

			<c:forEach var="menu" items="${menuList}" varStatus="status">
				$(".section" + num).append("<dt style=\"font-weight: bolder;\">${menu.sm_menu}</dt><dd>${menu.sm_price}원</dd>");
				if('${status.count}' % len == 0){ num++; }
			</c:forEach>
		}
		
	</script>
	
</body>
</html>
