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
	
	var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
	var options = { // 지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 3 // 지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

	// 지도 클릭 이벤트
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		var latlng = mouseEvent.latLng;
		var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		message += '경도는 ' + latlng.getLng() + ' 입니다';
		document.getElementById('result').innerHTML = message;
	});

	// 주소-좌표 변환 객체 생성
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색
	geocoder.addressSearch('대구 중구 동성로 23', function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 마커와 인포윈도우
			var marker = new kakao.maps.Marker({ map: map, position: coords });
			var infowindow = new kakao.maps.InfoWindow({ content: '<div style="width:150px;text-align:center;padding:6px 0;">우리집</div>' });
			infowindow.open(map, marker);

			// 지도 중심을 검색된 좌표로 이동
			map.setCenter(coords);

			// 선(폴리라인) 그리기
			var polyline = new kakao.maps.Polyline({
				map: map,
				path: [coords, new kakao.maps.LatLng(35.8759296745373, 128.5955438295322)], // 시작점과 끝점
				strokeWeight: 3,
				strokeColor: '#0e45a6',
				strokeOpacity: 0.9,
				strokeStyle: 'solid'
			});

			// 선의 길이 계산
			var distance = polyline.getLength();
			document.getElementById('distanceResult').innerHTML = "선의 길이: " + distance.toFixed(2) + "m"; // 길이 표시

			// 도보 시간 계산 (분속 67m)
			var walkTime = Math.floor(distance / 67);
			var walkHour = Math.floor(walkTime / 60);
			var walkMin = walkTime % 60;
			document.getElementById('walk').innerHTML = (walkHour > 0 ? walkHour + '시간 ' : '') + walkMin + '분';

			// 자전거 시간 계산 (분속 227m)
			var bycicleTime = Math.floor(distance / 227);
			var bycicleHour = Math.floor(bycicleTime / 60);
			var bycicleMin = bycicleTime % 60;
			document.getElementById('bycle').innerHTML = (bycicleHour > 0 ? bycicleHour + '시간 ' : '') + bycicleMin + '분';

			// 마커 이미지 설정
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';
			var imageSize = new kakao.maps.Size(64, 69);
			var imageOption = { offset: new kakao.maps.Point(27, 69) };
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

			// 새 마커 생성
			var newMarkerPosition = new kakao.maps.LatLng(35.8759296745373, 128.5955438295322);
			var newMarker = new kakao.maps.Marker({
				position: newMarkerPosition,
				image: markerImage
			});
			newMarker.setMap(map);
		}
	});
</script>
</body>
</html>