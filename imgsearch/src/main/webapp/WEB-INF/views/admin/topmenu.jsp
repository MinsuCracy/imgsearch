<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		var firstEnter = $("#first").val();
		console.log("처음 들어올때 : " + firstEnter);
		if(firstEnter==1){
			location.href = "/admin/user";
		}
		
	});
</script>
</head>
<body>
	<input type="hidden" id="first" value="${param.firstEnter}">
	<div class="navbar main">
		<div class="container">
			<div class="row">
				<div class="span12 relativeWrap">
					<button type="button" class="btn btn-navbar visible-phone">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<ul id="menu" class="hidden-phone">
						<li <c:if test="${param.selected == 2}">class='active'</c:if>><a href="/admin/user" class="menuToggle">회원관리</a></li>
						<li <c:if test="${param.selected == 3}">class='active'</c:if>><a href="/admin/store" class="menuToggle">가게관리</a></li> 
						<li <c:if test="${param.selected == 4}">class='active'</c:if>><a href="/admin/ent/" class="menuToggle">연예인관리</a></li> 
						<li <c:if test="${param.selected == 5}">class='active'</c:if>><a href="/admin/log" class="menuToggle">로그관리</a></li>
					</ul> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>