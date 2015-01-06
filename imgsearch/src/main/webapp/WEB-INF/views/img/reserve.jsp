<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="/resources/user/location/img/bootstrap.css">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.8/angular.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<!-- 예약화면  -->

        <script>
            angular.module('reservForm', [])
                    .controller('reservController', ['$scope', function($scope) {
                        $scope.sr = {};
                        $scope.submit = function(   ) {
                            if ($scope.sr) {
                                $scope.sr = $scope.sr;
                                console.log($scope.sr);
                                var msg = $scope.sr;
                                var socket = io.connect('localhost:3000/');
                                socket.emit('msg', msg);
                                msg = '';
                                $scope.sr = '';
                            }
                        };
                    }]);
        </script>
     <div class="span6">
        <form ng-submit="submit()" ng-controller="reservController" class="form-horizontal">
       
        <!--<h2 class="form-signin-heading" style="color:black;"> 찜하기</h2><br/>-->
        <h3 style="color:white">${vo.s_name} </h3>
        <br/>
        <table><tr>
        <input id="s_no" ng-model="sr.s_no" value="${vo.s_no}" type="hidden">
        <c:if test="${!empty id }">
        <input id="u_id" ng-model="sr.u_id" value="${id }" type="hidden"></p>
        </c:if>
            <td>닉네임  </td><td><input type="text" ng-model="sr.sr_nick"></td></tr>
            <tr><td>전화번호 </td><td><input type="text" ng-model="sr.sr_tel"></td></tr>
            <tr><td>인원수 </td><td><input type="number" ng-model="sr.sr_person"></td></tr>
            <tr><td>날짜 </td><td><input type="datetime-local" ng-model="sr.sr_date"></td></tr>
            <input ng-model="sr.sr_state" type="hidden" value="book">
            </table>
            <input class="btn btn-primary" type="submit" id="submit" value="찜 완료" />
        </form>
	</div>
    
	
</body>
</html>