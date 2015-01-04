<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style>

html,body{
	margin:0;
	padding:0;
	border:0;
	width: 100%;
	height: 100%;
	
	color: #71c39a;
	
 	background-color: rgb(247, 245, 240); 
}

*{
	margin:0;
	padding:0;
	border:0;
}

#container {
	position: absolute;
	list-style: none;
	height: 80%;
	width: 80%;
	margin: 5% 10% 0 10%;
}

.grid {
	border-bottom: 0.2em solid white;
	width: 80%;
	height: 28%;
	margin: 3% auto auto auto;
}

.grid .first {
	position: inherit;
	width: 100%;
	height: 100%;
}

.grid .first ul {
	list-style: none;
	position: inherit;
	width: 100%;
	height: 100%;
}

.grid .first .num {
	float: left;
	width: 7%;
	height: 100%;
	text-align: left;
}

.grid .first .mainImg {
	float: left;
	width: 25%;
	height: 100%;
}

.grid .first .title {
	float: left;
	width: 65%;
	height: 40%;
	border-bottom: 0.15em dashed #7cd6a9;
}

.grid .first .content {
	float: left;
	width: 65%;
	height: 60%;
}

.grid .first .mainImg img {
	height: 80%;
	width: 80%;
	top: 10%;
	left: 10%;
	border-radius: 5%;
}

.pagination { 
	text-align: center; 
	margin: 20px 0; 
/* 	word-spacing: -1em;  */
}

.pagination li { 
	display: inline-block; 
	list-style: none; 
	font: bold 12px/13px Arial, Helvetica, sans-serif; 
	padding: 5px 9px; 
	color: #999; 
	background: #eee; 
	word-spacing: normal; 
	margin: 0 1% 1px 1%; 
}

.pagination li a { 
	display: inline-block; 
	padding: 5px 9px; 
	margin: -5px -9px; 
	text-decoration: none;
}

.pagination li a,
.pagination li a:link,
.pagination li a:visited,
.pagination li a:active { 
	background: #8E8E8E; 
	color: #fff; 
}

.pagination li a:hover,
.pagination li a:focus { 
	background: #333; 
} 

.pagination li,
.pagination li a {
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

.pagination li a.current { 
	background: #069956; 
	color: #fff; 
}

.storeInfo{
	color: gray; 
}

.storeName{
	color: #3d9167;
}

#container h3 {
	margin: 0;
	color: #71c39a;
}

</style>

</head>
<body>

	<form name="listForm">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<input type="hidden" name="e_no" value="${cri.e_no}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="s_no" value="">
	</form>


	<div id='container'>
		<c:forEach var="store" items="${storeList}"  begin="0" varStatus="status" end="10">
			<div class='grid' id='${store.s_no }'>
					
				<div class='first'>
					<ul>
						<li class='num'><h1 style="color: #71c39a;">${cri.dbLimit+status.count}</h1></li>
						<li class='mainImg'>
							<img id="${store.s_no}" src='/file/view?path=${imgList[status.index].si_img}.jpg' ></a></li>
						<li class='title storeName'><h1 style="color: #3d9167;">${store.s_name}</h1></li>
						<li class='content'>
							<table style="margin-top: 1%;">
								<tr>
									<td style="width: 35%;"><h3>ADDRESS</h3></td>
									<td><h3 style="color: #7b7b7b;">${store.s_address}</h3></td>
								</tr>
								<tr>
									<td style="width: 35%;"><h3>TEL</h3></td>
									<td><h3 style="color: #7b7b7b;">${store.s_tel}</h3></td>
								</tr>
							</table>
						</li>
					</ul>						
				</div>
			</div>
		</c:forEach>
		
		<ul class="pagination">
			<c:if test="${cri.prePage eq true}">
				<li class="prev" id="${cri.startPage-1}"> <a href="javascript:goPage(${cri.startPage-1});">&lsaquo; Prev</a></li>
			</c:if>
			
			<c:forEach var="page" step="1" begin="${cri.startPage}" end="${cri.lastPage}">
				<li id="${page}">
					<a <c:if test="${cri.page eq page}">class="current"</c:if> href="javascript:goPage(${page});">${page}</a></li>
			</c:forEach>
			
			<c:if test="${cri.nextPage eq true}">
				<li class="next" id="${cri.lastPage+1}"> <a href="javascript:goPage(${cri.lastPage+1});">Next &rsaquo;</a></li>
			</c:if>
		</ul>

	</div>

<script>
	
	function goView(sno){
		document.listForm.action="/img/view";
		document.listForm.method="get";
		document.listForm.s_no.value=sno;
		document.listForm.submit();
	}
	
	$(".mainImg").on("click",function(e){
		var target = $(e.target).attr("id");
		goView(target);
	});

</script>

 <link href="/resources/defualtFont.css" rel="stylesheet"
 type="text/css" />

</body>
</html>