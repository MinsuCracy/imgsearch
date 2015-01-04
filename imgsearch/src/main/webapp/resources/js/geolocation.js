
   function disconnect(){
	   var id = $("[name=myid]").val();
	   console.log("id" + id);
	   socket.emit("disconnect2", id);
	   friMarker.setMap(null);
	   infowindow.open(null);
	   location.reload();
   }

    

   
    var socket = io.connect('61.72.45.117:5555/');    
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
    socket.on("change2" , function(data){
    	console.log("수락한 사람 : " + data);
    }); 
    socket.on("change", function(data){
	        for (var i in data) {
	
	            var json = JSON.stringify(data[i]);
	
	            var json2 = JSON.parse(data[i]);
	        
	            if(json2.connected == true) {
	
	                var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png'; // 마커이미지의 주소입니다
	
	                var markerPosition2 = new daum.maps.LatLng(json2.lat, json2.lng);
	                points.push(markerPosition2);
	
	                var imageSize = new daum.maps.Size(50, 69) // 마커이미지의 크기입니다
	                var imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	                var markerImage2 = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
	                var iwContent = "<div align='center' class='username'>" + json2.name + "</div>",
	                // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                        iwPosition = new daum.maps.LatLng(json2.lat, json2.lng); //인포윈도우 표시 위치입니다
	
	
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
    		console.log($id);
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
    	console.log($(name).prop("id"));
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
    	console.log("보낸 클라이언트 : " + data);
    	var id = $("[name=myid]").val();
    	socket.emit("firstLocation", {sendC:data,name:id,lat:lat,lng:lng});
    	console.log({sendC:data,name:id,lat:lat,lng:lng});
    });
    
