
   function disconnect(){
	   var id = $("[name=myid]").val();
	   console.log("id" + id);
	   socket.emit("disconnect2", id);
	   friMarker.setMap(null);
	   infowindow.open(null);
	   location.reload();
   }

    

   
    var socket = io.connect('192.168.3.103:5555');     
//   61.72.15.156
    navigator.geolocation.getCurrentPosition(firstLocation, handleLocationError, {enableHighAccuracy:true});
    navigator.geolocation.watchPosition(updateLocation, handleLocationError, {enableHighAccuracy:true});

    var crruntMap;
    var points=[];
    var myMarker;
    var lng;
    var lat;
    var acc;
    function firstLocation(position){
        lng = position.coords.longitude;
        lat = position.coords.latitude;
        acc = position.coords.accuracy;

        var container = document.getElementById('map');
        var options = {
            center: new daum.maps.LatLng(lat, lng),
            level: 3
        };
        crruntMap = new daum.maps.Map(container, options);
        
        // 마커가 표시될 위치입니다
        var markerPosition = new daum.maps.LatLng(lat, lng);
        points.push(markerPosition);

        // 마커를 생성합니다
        myMarker = new daum.maps.Marker({
            position: markerPosition
        });
        
        var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
        var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
        var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
        var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
        var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
        
        daum.maps.event.addListener(crruntMap, 'click', function(mouseEvent) {

            // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
            if (!drawingFlag) {

                // 상태를 true로, 선이 그리고있는 상태로 변경합니다
                drawingFlag = true;
                
                // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
                deleteClickLine();
                
                // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
                deleteDistnce();

                // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
                deleteCircleDot();
            
                // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
                clickLine = new daum.maps.Polyline({
                    map: crruntMap, // 선을 표시할 지도입니다
                    path: [mouseEvent.latLng], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                    strokeWeight: 3, // 선의 두께입니다 
                    strokeColor: '#db4040', // 선의 색깔입니다
                    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid' // 선의 스타일입니다
                });
                
                // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
                moveLine = new daum.maps.Polyline({
                    strokeWeight: 3, // 선의 두께입니다 
                    strokeColor: '#db4040', // 선의 색깔입니다
                    strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid' // 선의 스타일입니다    
                });
            
                // 클릭한 지점에 대한 정보를 지도에 표시합니다
                displayCircleDot(mouseEvent.latLng, 0);

                    
            } else { // 선이 그려지고 있는 상태이면

                // 그려지고 있는 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();
            
                // 좌표 배열에 클릭한 위치를 추가하고
                path.push(mouseEvent.latLng);
                
                // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
                clickLine.setPath(path);

                var distance = Math.round(clickLine.getLength());
                displayCircleDot(mouseEvent.latLng, distance);
            }
        });
            
        // 지도에 마우스무브 이벤트를 등록합니다
        // 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
        daum.maps.event.addListener(crruntMap, 'mousemove', function (event) {

            // 지도 마우스무브 발생했는데 선을 그리고있는 상태이면
            if (drawingFlag){
                
                // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();
                
                // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
                var movepath = [path[path.length-1], event.latLng];
                moveLine.setPath(movepath);    
                moveLine.setMap(crruntMap);
                
                var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
                    content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
                
                // 거리정보를 지도에 표시합니다
                showDistance(content, event.latLng);   
            }             
        });                 

        // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
        // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
        daum.maps.event.addListener(crruntMap, 'rightclick', function (event) {

            // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
            if (drawingFlag) {
                
                // 마우스무브로 그려진 선은 지도에서 제거합니다
                moveLine.setMap(null);
                moveLine = null;  
                
                // 마우스 클릭으로 선의 좌표 배열을 얻어옵니다
                var path = clickLine.getPath();
            
                // 선을 구성하는 좌표의 개수가 2개 이상이면
                if (path.length > 1) {

                    // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
                    if (dots[dots.length-1].distance) {
                        dots[dots.length-1].distance.setMap(null);
                        dots[dots.length-1].distance = null;    
                    }

                    var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                        content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
                        
                    // 그려진 선의 거리정보를 지도에 표시합니다
                    showDistance(content, path[path.length-1]);  
                     
                } else {

                    // 선을 구성하는 좌표의 개수가 1개 이하이면 
                    // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
                    deleteClickLine();
                    deleteCircleDot(); 
                    deleteDistnce();

                }
                
                // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
                drawingFlag = false;          
            }  
        });    

            // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
        function deleteClickLine() {
            if (clickLine) {
                clickLine.setMap(null);    
                clickLine = null;        
            }
        }

        // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
        // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
        function showDistance(content, position) {
            
            if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
                
                // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
                distanceOverlay.setPosition(position);
                distanceOverlay.setContent(content);
                
            } else { // 커스텀 오버레이가 생성되지 않은 상태이면
                
                // 커스텀 오버레이를 생성하고 지도에 표시합니다
                distanceOverlay = new daum.maps.CustomOverlay({
                    map: crruntMap, // 커스텀오버레이를 표시할 지도입니다
                    content: content,  // 커스텀오버레이에 표시할 내용입니다
                    position: position, // 커스텀오버레이를 표시할 위치입니다.
                    xAnchor: 0,
                    yAnchor: 0,
                    zIndex: 3  
                });      
            }
        }

        // 그려지고 있는 선의 총거리 정보와 
        // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
        function deleteDistnce () {
            if (distanceOverlay) {
                distanceOverlay.setMap(null);
                distanceOverlay = null;
            }
        }

        // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
        // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
        function displayCircleDot(position, distance) {

            // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
            var circleOverlay = new daum.maps.CustomOverlay({
                content: '<span class="dot"></span>',
                position: position,
                zIndex: 1
            });

            // 지도에 표시합니다
            circleOverlay.setMap(crruntMap);

            if (distance > 0) {
                // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
                var distanceOverlay = new daum.maps.CustomOverlay({
                    content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
                    position: position,
                    yAnchor: 1,
                    zIndex: 2
                });

                // 지도에 표시합니다
                distanceOverlay.setMap(crruntMap);
            }

            // 배열에 추가합니다
            dots.push({circle:circleOverlay, distance: distanceOverlay});
        }

        // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
        function deleteCircleDot() {
            var i;

            for ( i = 0; i < dots.length; i++ ){
                if (dots[i].circle) { 
                    dots[i].circle.setMap(null);
                }

                if (dots[i].distance) {
                    dots[i].distance.setMap(null);
                }
            }

            dots = [];
        }

        // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
        // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
        // HTML Content를 만들어 리턴하는 함수입니다
        function getTimeHTML(distance) {

            // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
            var walkkTime = distance / 67 | 0;
            var walkHour = '', walkMin = '';

            // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
            if (walkkTime > 60) {
                walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
            }
            walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

            // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
            var bycicleTime = distance / 227 | 0;
            var bycicleHour = '', bycicleMin = '';

            // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
            if (bycicleTime > 60) {
                bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
            }
            bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

            // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
            var content = '<ul class="dotOverlay distanceInfo">';
            content += '    <li>';
            content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
            content += '    </li>';
            content += '    <li>';
            content += '        <span class="label">도보</span>' + walkHour + walkMin;
            content += '    </li>';
            content += '    <li>';
            content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
            content += '    </li>';
            content += '</ul>'

            return content;
        }
        
        
        boundsSet();
        	
        // 마커가 지도 위에 표시되도록 설정합니다
        
    }
    function updateLocation(position){
        var levelcnt = 0;
        lng = position.coords.longitude;
        lat = position.coords.latitude;
        acc = position.coords.accuracy;

//        document.getElementById("lat").innerHTML=lat;
//        document.getElementById("lng").innerHTML=lng;
//        document.getElementById("acc").innerHTML=acc;
        var container = document.getElementById('map');

        var userid = $("[name=myid]").val();
        console.log(userid);
        socket.emit("id",userid);

        myMarker.setPosition(new daum.maps.LatLng(lat, lng));
        myMarker.setMap(crruntMap);
        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);



//         $("#msg").html("드루와");

        socket.emit("latlng", {lat: lat, lng: lng, id:userid});



    }
    function handleLocationError(error) {
        switch (error.code) {
            case 0:
                console.log("위치정보 검색에 문제가 있습니다." + error.message);
                break;
            case 1:
                console.log("현재 페이지에서 사용자가 위치 정보 검색을 거부했습니다." + error.message);
                break;
            case 2:
                console.log("브라우저가 위치 정보를 검색하지 못했습니다." + error.message);
                break;
            case 3:
                console.log("브라우저의 위치 정보 검색 시간이 초과됐습니다." + error.message);
                break;
        }
    }
    var friMarker;
    var markerCnt = 0;
    var infowindow;
//    var userid = $("[name=id]").val();
    socket.on("change", function(data){
	        for (var i in data) {
	
	            var json = JSON.stringify(data[i]);
	
	            var json2 = JSON.parse(data[i]);
	        
	            if(json2.connected == true) {
	
	                var imageSrc = '/resources/testImg/frimarker-48.png'; // 마커이미지의 주소입니다
	
	                var markerPosition2 = new daum.maps.LatLng(json2.lat, json2.lng);
	                points.push(markerPosition2);
	
	                var imageSize = new daum.maps.Size(44, 49) // 마커이미지의 크기입니다
	                var imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	                var markerImage2 = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	                var iwContent = "<div align='center' class='username'>" + json2.name + "</div>",
	                // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                    iwPosition = new daum.maps.LatLng(json2.lat, json2.lng); //인포윈도우 표시 위치입니다
	                points.push(iwPosition);
	
	                // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	
	                // 마커를 생성합니다
	                if(markerCnt==0) {
	                    friMarker = new daum.maps.Marker({
	                        position: markerPosition2,
	                        image: markerImage2 // 마커이미지 설정
	                    });
	                    infowindow = new daum.maps.InfoWindow({
	                        position: iwPosition,
	                        content: iwContent
	                    });
	                    markerCnt=1;
	                }else{
	                    //friMarker.setMap(null);
	                    friMarker.setPosition(markerPosition2);
	                    infowindow.setPosition(markerPosition2);
	                }
	                friMarker.setMap(crruntMap);
	                infowindow.open(crruntMap, friMarker);
	                
	                $(".username").parent().css("width","100%");
	            }
	        }
        boundsSet();
    });
    
    var bounds = new daum.maps.LatLngBounds();
    function boundsSet(){
        for (var i = 0; i < points.length; i++) {
            bounds.extend(points[i]);
        }
    }
    function setBounds() {
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다

        crruntMap.setBounds(bounds);
    }
    
    
    //친구 관련
    function addFriend(){
    	var $f_uid = $("[name=f_uid]").val();
    	socket.emit("fri_id", $f_uid);
    }
    socket.on("requestReady",function(data){
    	var div = "<div class='rfd' id='ready'><h5>친구 요청 대기 중</h5><button onclick='divHide(ready)' class='btn'>확인</button></div>";
		$("body").append(div);
		$('#ready').animate({ bottom:'0px'},1000);
    });
    socket.on("alreadyExist",function(data){
    	if(data){
    		var div = "<div class='rfd' id='exist'><h5>이미 등록 된 친구입니다.</h5><button onclick='divHide(exist)' class='btn'>확인</button></div>";
			$("body").append(div);
			$('#exist').animate({ bottom:'0px'},1000);
    	}
    });
    socket.on("notFound", function(data){
    	if(data){
    		var div = "<div class='rfd' id='notFound'><h5>존재하지 않는 회원입니다.</h5><button onclick='divHide(notFound)' class='btn'>확인</button></div>";
			$("body").append(div);
			$('#notFound').animate({ bottom:'0px'},1000);
    	}
    });
    socket.on("requestFriend", function(result){
    	requestFriend(result.name,result.state);
    	var div = "<div class='rfd' id='"+name+"'><h5>"+name+"님이<br/> 친구 요청을 하셨습니다.</h5><button class='btn' style='margin-right:10px'>거절</button><button id='agree' onclick='javascript:accept("+name+");' class='btn'>수락</button></div>";
		$("body").append(div);
		$('#'+name).animate({ bottom:'0px'},1000);
    });
    function accept(name){
    	var $id = $(name).prop("id")
    	socket.emit("agree",$id);
    	$('#'+$id).hide('slow');
    	$('#'+$id).remove();
    }
    socket.on("addFriendSuccess", function(name){
    	friendListAjax();
    	var div = "<div class='rfd' id='"+name+"success'><h5>"+name+"님이 추가 되었습니다.</h5><button onclick='divHide("+name+"success)' class='btn'>확인</button></div>";
    	$("body").append(div);
    	$('#'+name+'success').animate({ bottom:'0px'},1000);
    });
    function divHide(target){
    	var $id = $(target).prop("id")
    	$('#'+$id).hide("slow");
    	$('#'+$id).remove();
    }
    function reject(target){
    	var $id = $(target).prop("id");
    	socket.emit("reject", $id);
    	$('#'+$id).hide("slow");
    	$('#'+$id).remove();
    }
    
    //위치 공유 하기
    function locationShare(){
    	var $checked = $('[data-check="checked"]');
    	for(var i =0; i<$checked.length; i++){
    		var $id = $($checked[i]).attr("data-id");
    		socket.emit("requestLocation", $id);
    	}
    }
    function storeShare(){
    	var $checked = $('[data-check="checked"]');
    	for(var i =0; i<$checked.length; i++){
    		var $store = $($checked[i]).attr("data-store");
    		var $lat = $($checked[i]).attr("data-lat");
    		var $lng = $($checked[i]).attr("data-lng");
    		socket.emit("requestStore", {store:$store,lat:$lat,lng:$lng});
    	}
    }
    //위치 공유 요청중
    socket.on("requestLocationing",function(data){
    	var div = "<div class='rfd' id='locationReady'><h5>위치 공유 동의 확인 중</h5><button onclick='divHide(locationReady)' class='btn'>확인</button></div>";
		$("body").append(div);
		$('#locationReady').animate({ bottom:'0px'},1000);
    });
    //위치 공유 동의 확인
    socket.on("requestFriendLocationing", function(data){
    	var div = "<div class='rfd' id='"+data.name+"'><h5>"+data.name+"님이<br/> 위치공유를 신청하였습니다.</h5><button class='btn' onclick='locaReject("+data.name+")' style='margin-right:10px'>거절</button><button id='la' onclick='javascript:locationAgree("+data.name+");' class='btn'>수락</button></div>";
		$("body").append(div);
		$('#'+data.name).animate({ bottom:'0px'},1000);
    });
    function locationAgree(name){
    	var $id = $(name).prop("id");
    	socket.emit("locationAgree",{name:$id,lat:lat,lng:lng});
    	$('#'+$id).hide('slow');
    	$('#'+$id).remove();
    }
    function locaReject(target){
    	var $id = $(target).prop("id");
    	socket.emit("locaReject", $id);
    	$('#'+$id).hide('slow');
    	$('#'+$id).remove();
    }
    socket.on("requestLatLng", function(data){
    	var id = $("[name=myid]").val();
    	socket.emit("firstLocation", {sendC:data,name:id,lat:lat,lng:lng});
    });
    socket.on("sharefail", function(msg){
    	var div = "<div class='rfd' id='storeLocationFail'><h5>공유 된 친구가 없습니다.</h5><button onclick='divHide(storeLocationFail)' class='btn'>확인</button></div>";
		$("body").append(div);
		$('#storeLocationFail').animate({ bottom:'0px'},1000);
    });
    socket.on("store", function(data){
    	var positions = [];
    	
//        var json = JSON.stringify(data);
        var json2 = JSON.parse(data);
        console.log("json2 : " + json2.store);
        var imageSrc = '/resources/testImg/storemarker-48.png', // 마커이미지의 주소입니다    
   	    imageSize = new daum.maps.Size(44, 49), // 마커이미지의 크기입니다
   	    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
   	      
        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
   	
        var markerPosition  = new daum.maps.LatLng(json2.lat, json2.lng); 
        points.push(markerPosition);
        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            position: markerPosition,
            image: markerImage
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(crruntMap);
        
        var iwContent = "<div align='center' class='username' style='padding:5px;'>'"+json2.store+"'</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new daum.maps.LatLng(json2.lat, json2.lng); //인포윈도우 표시 위치입니다
        
   		 // 인포윈도우를 생성하고 지도에 표시합니다
   		 var infowindow = new daum.maps.InfoWindow({
   		     position : iwPosition,
   		     content : iwContent,
   		 });
   		 infowindow.open(crruntMap, marker);
   		 
         boundsSet();
         $(".username").parent().css("width","100%");
    });
    
    
