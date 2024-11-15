<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>ERROR - 404</title>

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
	    max-width: 550px;
}
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
	
	
	</style>

</head>

<body>

<div id="pageWrap">
	<div id="infoBox">
			<div class="errorMsg">
				<h1>404</h1>
			</div>
			<h2>요청하신 페이지를 찾을 수 없습니다.</h2>
			<p>찾으시려는 페이지의 주소가 잘못 입력되었거나, 페이지 주소의 변경 혹은 삭제로 인해 현재 사용하실 수 없습니다.<br>입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시길 부탁드립니다.</p>
			<a href="/main.do">확인</a>
	</div>
	
	<div id="iconError">
		<div id="iconImg">
			<img src="/images/egovframework/lib/error/404.png">
		</div>
	</div>
</div>

	
</body>
</html>
