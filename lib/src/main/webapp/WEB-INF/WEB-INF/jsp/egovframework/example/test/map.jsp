<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="map" style="width: 500px; height: 400px;"></div>

<div id="result"></div>
<div id="distanceResult"></div>
<div id="walk"></div>
<div id="bycle"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${mapApiKey}&libraries=services"></script>
<script type="text/javascript">

	//변수
	var address = '대구 중구 동성로 23';
	var kwd = '대구 도서관';

	//지도 생성
	var container = document.getElementById('map');
	var options = {
	    center: new kakao.maps.LatLng(35.91217620002664, 128.5429450606891),
	    level: 2
	};
	var map = new kakao.maps.Map(container, options);
	
	// 주소로 좌표 검색
	var coords = new kakao.maps.LatLng(35.91217620002664, 128.5429450606891);
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch(address, function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        var infoWindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리집</div>'
	        });
	        infoWindow.open(map, marker);
	
	        map.setCenter(coords); // 검색된 좌표로 지도 중심 이동
	    }
	});
	
	// 도서관 검색 및 마커 표시
	var ps = new kakao.maps.services.Places();
	ps.keywordSearch(kwd, placesSearchCB);
	
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        var bounds = new kakao.maps.LatLngBounds();
	
	        data.forEach(place => {
	            displayMarker(place);
	            bounds.extend(new kakao.maps.LatLng(place.y, place.x));
	        });
	
	        map.setBounds(bounds);
	    }
	}
	
	function displayMarker(place) {
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x)
	    });
	
	    kakao.maps.event.addListener(marker, 'click', function() {
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	
	// 지도 클릭 이벤트
	var destination = new kakao.maps.LatLng(35.91217620002664, 128.5429450606891); // 초기 목적지
	var infowindow = new kakao.maps.InfoWindow({zIndex: 1});
	var markers = []; // 마커 배열 추가
	
	// 마커 이미지 설정
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';
    var imageSize = new kakao.maps.Size(64, 69);
    var imageOption = { offset: new kakao.maps.Point(27, 69) };
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	
	// 선 그리기 함수
	var polyline = new kakao.maps.Polyline({
	    map: map,
	    path: [coords, destination], // 초기 선 경로 설정
	    strokeWeight: 3,
	    strokeColor: '#0e45a6',
	    strokeOpacity: 0.9,
	    strokeStyle: 'solid'
	});
	
	// 지도 클릭 시 선 업데이트 및 마커 제거
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    
	    // 이전 마커들 제거
	    markers.forEach(function(marker) {
	        marker.setMap(null); // 마커를 지도에서 제거
	    });
	    markers = []; // 배열 초기화
	
	    var latlng = mouseEvent.latLng;
	    destination = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()); // 목적지 업데이트
	    console.log("업데이트된 목적지:", destination);
	
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    document.getElementById('result').innerHTML = message;
	
	    // 선 경로 업데이트
	    polyline.setPath([coords, destination]);
	
	    // 선 길이 계산
	    var distance = polyline.getLength();
	    document.getElementById('distanceResult').innerHTML = "선의 길이: " + distance.toFixed(2) + "m";
	
	    // 자전거 시간 계산 (분속 227m)
	    var bycicleTime = Math.floor(distance / 227);
	    var bycicleHour = Math.floor(bycicleTime / 60);
	    var bycicleMin = bycicleTime % 60;
	    document.getElementById('bycle').innerHTML = (bycicleHour > 0 ? bycicleHour + '시간 ' : '') + bycicleMin + '분';
	    
	    // 자전거 5분마다 위치 계산 및 마커 표시
	    showBicyclePositions(coords, destination, distance);
	});
	
	// 자전거 5분마다 위치 계산 및 마커 표시
	function showBicyclePositions(start, end, totalDistance) {
	    var totalTime = Math.floor(totalDistance / 227);  // 전체 자전거 시간
	    var intervals = Math.ceil(totalTime / 5);  // 5분 간격으로 위치 계산
	
	    var positions = [];
	    for (var i = 1; i <= intervals; i++) {
	        var ratio = i / intervals;
	        var midLat = start.getLat() + ((end.getLat() - start.getLat()) * ratio);
	        var midLng = start.getLng() + ((end.getLng() - start.getLng()) * ratio);
	        positions.push(new kakao.maps.LatLng(midLat, midLng));
	    }
	
	    // 5분마다 자전거 이동 위치 콘솔 출력
	    console.log("5분마다 자전거 이동 위치:");
	    positions.forEach((position, index) => {
	        console.log('시간: ' + (index + 1) * 5 + '분 - 위치: 위도 ' + position.getLat() + ', 경도 ' + position.getLng());
	        
	        // 마커 생성
	        var marker = new kakao.maps.Marker({
	            position: position,
	            image: markerImage
	        });
	
	        // 생성된 마커를 markers 배열에 추가
	        markers.push(marker);
	        marker.setMap(map); // 지도에 마커 표시
	    });
	}

</script>
</body>
</html>