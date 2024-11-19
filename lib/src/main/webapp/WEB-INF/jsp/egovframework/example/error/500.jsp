<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>ERROR - 500</title>

	<style>
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	</style>

	<style>
	
	* {
	  -webkit-box-sizing: border-box;
      box-sizing: border-box;
      font-family: "Nanum Gothic", sans-serif;
	  font-weight: 400;
	  font-style: normal;
	}
	
	body {
	  padding: 0;
	  margin: 0;
	}
	
	#pageWrap {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    height: 100vh;
	    justify-content: space-evenly;
	}
	
	#infoBox {
	    display: flex;
	    align-items: start;
	    flex-direction: column;
	    justify-content: center;
	    margin: 5%;
	}
	
	#iconError {
		min-width: 300px;
		min-height: 200px;
		margin: 5%;
		display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	#infoBox h1 {
	  font-family: "Nanum Gothic", sans-serif;
	  font-size: 150px;
	  font-weight: 900;
	  margin: 0px;
	  text-transform: uppercase;
	}
	
	#infoBox h2 {
	  font-family: "Nanum Gothic", sans-serif;
	  font-size: 20px;
	  font-weight: bold;
	  margin: 0;
	}
	
	#infoBox p {
	  font-family: "Nanum Gothic", sans-serif;
	  font-size: 15px;
	  margin-bottom: 0px;
	  text-transform: uppercase;
	  line-height: 1.5;
	}
	
	#infoBox a {
	  font-family: "Nanum Gothic", sans-serif;
	  display: inline-block;
	  text-transform: uppercase;
	  color: #fff;
	  text-decoration: none;
	  border: none;
	  background: #084298;
	  padding: 10px 40px;
	  font-size: 14px;
	  font-weight: 700;
	  border-radius: 30px;
	  margin-top: 15px;
	  -webkit-transition: 0.2s all;
	  transition: 0.2s all;
	}
	
	#infoBox a:hover {
	  opacity: 0.8;
	} 
	
	#iconImg {
		width: 100%;
		height: 50%;
	}
	
	#iconImg img {
		width: 100%;
    	height: 100%;
	}
	
	@media only screen and (max-width: 767px) {
	  #pageWrap {
	  	flex-direction: column;
	  }
	  
	  #infoBox {
	  	align-items: center;
	  }
	  
	  #infoBox p {
	  	text-align: center;
	  	word-break: keep-all;
	  }
	  
	  #iconError {
	  	min-width: 80%;
	  	justify-content: center;
	  }
	  
	  #iconImg {
			width: 200px;
    		height: 200px;
		}
		
		#iconImg img {
		    width: 100%;
   			height: 100%;
		}
	} 
	
	#simGame {
		position: absolute;
	    z-index: 100;
	    width: 80%;
	    height: 120px;
	    top: 40px;
	    left: 10%;
	    display: none;
	    justify-content: center;
	}
	
	#gameCan {
		width: 400px;
		height: 120px;
		border-bottom: 3px solid gray;
		background-color: white;
	}
	
	#askGame {
		display: flex;
	    align-items: center;
	    justify-content: center;
	    margin: 10px 0;
	}
	
	#askGame p {
		margin: 0;
	    color: gray;
	    padding: 0 10px 0 0;
	    font-size: small;
	}
	
	#askGame button {
	    color: gray;
	    background: none;
	    border: gray 1px solid;
	    border-radius: 5px;
	    padding: 3px 5px;
	    font-size: small;
	}
	
	#askGame button:hover {
	    color: white;
	    background: gray;
	    cursor: pointer;
	}
	
	</style>

</head>

<body>

<div id="pageWrap">
	<div id="simGame">
		<canvas id="gameCan"></canvas>
	</div>
	<div id="infoBox">
			<div class="errorMsg">
				<h1>500</h1>
			</div>
			<h2>내부 서버 오류</h2>
			<p>접속이 원할하지 않습니다. 잠시후 다시 방문하거나, 새로고침해주세요.</p>
			<div id="askGame">
				<p>기다리는동안 게임을 하시겠습니까?</p>
				<button onclick="play()">시작</button>
			</div>
			<a href="/main.do">확인</a>
	</div>
	
	<div id="iconError">
		<div id="iconImg">
			<img src="/images/egovframework/lib/error/500.png">
		</div>
	</div>
</div>

<script src="/template/user/js/game.js"></script>
	
</body>
</html>