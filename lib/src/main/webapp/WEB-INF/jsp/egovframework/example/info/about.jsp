<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LiBLIO - 도서관안내</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
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
                                <h1 class="fw-bolder mb-3">시설안내</h1>
                                <p class="lead fw-normal text-muted mb-4" style="font-size: 1em;">도서관 내 다양한 시설을 소개합니다. 어린이실, 멀티미디어실, 동아리실 등 모든 이용자들이 만족할 수 있도록 준비되어 있습니다. 가상 공간에서 편안한 독서 공간과 학습을 위한 최적의 환경을 미리 확인해 보세요.</p> 
                                <a class="btn btn-primary btn-lg" href="/view.do"><b>둘러보기</b></a>
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
                            <p class="lead fw-normal text-muted mb-0" style="font-size: 1em;">어린이들이 독서와 학습을 즐길 수 있도록 마련된 특별한 공간입니다. 다양한 그림책과 교육 자료들이 구비되어 있어, 어린이들의 상상력을 키우고 책 읽는 즐거움을 선사합니다. 안전하고 쾌적한 환경을 제공하여 보호자와 함께 방문하기에도 안성맞춤입니다.<br>
                            <b>위치: 1층</b>
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
                            <p class="lead fw-normal text-muted mb-0" style="font-size: 1em;">다양한 주제와 장르의 도서들이 준비된 공간으로, 학습자와 연구자 모두에게 유용한 자료를 제공합니다. 자유롭게 열람과 대출이 가능하며, 독서 및 연구 활동을 위해 편안한 분위기를 조성하여 이용자들이 집중할 수 있도록 돕습니다.<br>
                            <b>위치: 2층</b>
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
                            <p class="lead fw-normal text-muted mb-0" style="font-size: 1em;">다양한 디지털 자료와 멀티미디어 콘텐츠를 이용할 수 있는 최첨단 공간입니다. 영상 학습, 온라인 자료 검색, 디지털 기기를 활용한 다양한 활동이 가능하여, 독서와 학습을 넘어서는 새로운 경험을 제공합니다. 편리하고 쾌적한 환경 속에서 기술과 지식을 함께 탐구해보세요.<br>
                           <b> 위치: 2층</b>
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Team members section-->
            <section class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="/images/egovframework/lib/info/창작공작실1.jpg" alt="..." />
                                <h5 class="fw-bolder">창작공작실</h5>
                                <div class="fst-italic text-muted">2층</div>
                            </div>
                        </div>
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="/images/egovframework/lib/info/미디어실1.jpg" alt="..." />
                                <h5 class="fw-bolder">미디어전시</h5>
                                <div class="fst-italic text-muted">2층</div>
                            </div>
                        </div>
                        <div class="col mb-5 mb-5 mb-sm-0">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="/images/egovframework/lib/info/동아리실1.jpg" alt="..." />
                                <h5 class="fw-bolder">동아리실</h5>
                                <div class="fst-italic text-muted">3층</div>
                            </div>
                        </div>
                        <div class="col mb-5">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="/images/egovframework/lib/info/보존서고1.jpg" alt="..." />
                                <h5 class="fw-bolder">보존서고</h5>
                                <div class="fst-italic text-muted">지하 1층</div>
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