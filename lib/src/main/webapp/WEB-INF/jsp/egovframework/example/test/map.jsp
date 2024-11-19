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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${mapApiKey}"></script>
<script type="text/javascript">
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
</script>
<script>

const socket = new WebSocket("ws://localhost:8080/echo-ws");
socket.onopen = function(event) {
    console.log("WebSocket connection established");
};
socket.onmessage = function(event) {
    console.log("Message from server: ", event.data);
};
socket.onerror = function(event) {
    console.error("WebSocket error: ", event);
};
socket.onclose = function(event) {
    console.log("WebSocket connection closed");
};

</script>
</body>
</html>