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
	width: 100%;
	height: 28%;
	margin-top: 3%;
}

.grid .first {
	position: inherit;
	width: 100%;
	height: 100%;
	/* 	background-color: red; */
}

.grid .first ul {
	list-style: none;
	position: inherit;
	width: 100%;
	height: 100%;
}

.grid .first .num {
	float: left;
	width: 15%;
	height: 100%;
}

.grid .first .mainImg {
	float: left;
	width: 20%;
	height: 100%;
}

.grid .first .title {
	float: left;
	width: 65%;
	height: 35%; /* 40%; */
	border-bottom: 0.15em solid #7cd6a9; /* 0.2em solid rgb(0, 205, 205); */
}

.grid .first .content {
	float: left;
	width: 65%;
	height: 65%; /* 60%; */
}

.grid .first .mainImg img {
	/* 	position: inherit; */
	height: 80%;
	width: 80%;
	top: 10%;
	left: 10%;
	border-radius: 5%; /* 15%; */
}

#paging{
	list-style: none; 
	width:60%; 
	height:10%;
	margin-left:20%;
	margin-top:40px;
}

#paging li{
	float:left;
	width:8%;
}
#paging li a{
	color:black;
}

.storeInfo{
	color: gray; 
}

.storeName{
	color: #3d9167;
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
							<li class='num'><h1 align="center">${cri.dbLimit+status.count}</h1></li>
							<li class='mainImg'>
									<img id="${store.s_no }" src='/file/view?path=${imgList[status.index].si_img}.jpg' ></a></li>
							<li class='title storeName'><h1>${store.s_name }</h1></li>
							<li class='content'>
								<ul>
									<li class="storeInfo"><img src='/file/view?path=address.png'> ${store.s_address}</li>
									<li class="storeInfo"><img src='/file/view?path=homepage.png'> ${store.s_homepage}</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach>
			
				<ul id="paging">
						<c:if test="${cri.prePage == 'false' }">
							<li id="${cri.startPage-1 }"><a href="javascript:goPage(${cri.startPage-1 });" style="font-color:black">pre</a></li>
						</c:if>
					<c:forEach var="page" begin="${cri.startPage }" end="${cri.lastPage }">
						
						<li  id="${page }"><a href="javascript:goPage(${page });">${page}</a></li>
				
					</c:forEach>
						
						<c:if test="${cri.nextPage == 'false' }">
							<li id="${cri.lastPage+1 }"><a href="javascript:goPage(${cri.lastPage+1 });">next</a></li>
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
	
// 	$(document).ready(function(){
// 		document.MainForm.keyword.value="${cri.keyword}";
// 		document.MainForm.e_no.value="${cri.e_no}";
// 		document.MainForm.page.value="${cri.page}";

// 	});
	
	$(".mainImg").on("click",function(e){
// 		document.MainForm.keyword.value="${cri.keyword}";
// 		document.MainForm.e_no.value="${cri.e_no}";
// 		document.MainForm.page.value="${cri.page}";
		var target = $(e.target).attr("id");
		goView(target);
	});

</script>


</body>
</html>