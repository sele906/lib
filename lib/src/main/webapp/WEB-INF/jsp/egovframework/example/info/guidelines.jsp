<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LiBLIO - 이용안내</title>
		<!-- Favicon-->
        <link rel="icon" href="/template/favicon.ico">
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		</style>
		
		<style type="text/css">
		
		.infoBox {
			display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		}
		.infoCircle {
			border-radius: 50%;
		    width: 150px;
		    height: 150px;
		    box-shadow: 4px 6px 11px 1px rgb(140 140 141 / 20%);
		    display: flex;
		    align-content: center;
		    justify-content: center;
		    flex-wrap: wrap;
		}
		.iconStyle {
			font-size: 4em;
    		color: #4b4b4b;
		}
		.linkStyle {
			color: #6c757d;
			cursor: pointer;
		}
		
		</style>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
        
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
            
            <!-- Header-->
            <header class="py-5">
                <div class="container px-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-center my-5">
                                <h1 class="fw-bolder mb-3">이용안내</h1>
                                <p class="lead fw-normal text-muted mb-4" style="font-size: 1em;">운영 시간, 대출/반납 절차, 열람실 이용 방법 등 편리하고 원활한 이용을 위한<br>다양한 정보를 확인해 보세요.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- About section one-->
            <section class="py-5 bg-light" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="/images/egovframework/lib/info/어린이실.jpg" alt="..." /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder">어린이 자료실</h2>
                            <p class="lead fw-normal text-muted mb-0" style="font-size: 1em;"><br>
                            	<b>운영시간</b><br>
                            	평일: 09:00 ~ 18:00<br>
                            	주말: 09:00 ~ 18:00<br><br>
                            	<b>이용 가능 시설</b><br>
								자료검색PC(2대), 복사기(2대), 도서자동대출반납시스템(3대)<br>
								열람실 좌석 : 총25석(장애인좌석 4석)
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About section two-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6 order-first order-lg-last"><img class="img-fluid rounded mb-5 mb-lg-0" src="/images/egovframework/lib/info/종합자료실.jpg" alt="..." /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder">종합자료실</h2>
                            <p class="lead fw-normal text-muted mb-0" style="font-size: 1em;"><br>
                            	<b>운영시간</b><br>
                            	평일: 09:00 ~ 21:00<br>
                            	주말: 09:00 ~ 18:00<br><br>
                            	<b>이용 가능 시설</b><br>
								자료검색PC(5대), 복사기(2대), 도서자동대출반납시스템(3대)<br>
								열람실 좌석 : 총45석(장애인좌석 4석)
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About section one-->
            <section class="py-5 bg-light" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="/images/egovframework/lib/info/멀티미디어실.jpg" alt="..." /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder">멀티미디어실</h2>
                            <p class="lead fw-normal text-muted mb-0" style="font-size: 1em;"><br>
                            	<b>운영시간</b><br>
                            	평일: 09:00 ~ 21:00<br>
                            	주말: 09:00 ~ 18:00<br><br>
                            	<b>이용 가능 시설</b><br>
								PC(20대), 원문DB/스마트PC(20대), DVD좌석(20대), 프린트전용PC(8대)<br>
								열람실 좌석 : 총60석(장애인좌석 4석)
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Team members section-->
            <section class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="text-center">
                        <h2 class="fw-bolder">이용수칙</h2>
                        <p class="lead fw-normal text-muted mb-5"></p>
                    </div>
                    <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center infoBox">
                            	<div class="mb-4 px-4 infoCircle">
                            		<i class="fa-solid fa-calendar-days iconStyle"></i>
                            	</div>
                                <h5 class="fw-bolder">대출기간</h5>
                                <div class="fst-italic text-muted">14일(2번 연장가능)</div>
                            </div>
                        </div>
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center infoBox">
                            	<div class="mb-4 px-4 infoCircle">
                            		<i class="fa-solid fa-hourglass-half iconStyle"></i>
                            	</div>
                                <h5 class="fw-bolder">이용시간</h5>
                                <div class="fst-italic text-muted">09:00 ~ 21:00</div>
                            </div>
                        </div>
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center infoBox">
                            	<div class="mb-4 px-4 infoCircle">
                            		<i class="fa-solid fa-pause iconStyle"></i>
                            	</div>
                                <h5 class="fw-bolder">휴관일</h5>
                                <div class="fst-italic text-muted">월요일, 공휴일 휴관</div>
                            </div>
                        </div>
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center infoBox">
                            	<div class="mb-4 px-4 infoCircle">
                            		<i class="fa-solid fa-user-plus iconStyle"></i>
                            	</div>
                                <h5 class="fw-bolder">회원가입</h5>
                                <div class="fst-italic text-muted"><a class="linkStyle" href="/member/join.do">바로가기</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; LiBLIO 2024</div></div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>