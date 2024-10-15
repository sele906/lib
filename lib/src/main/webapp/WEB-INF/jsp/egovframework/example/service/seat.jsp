<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-light">
                <div class="container px-5">
                    <a class="navbar-brand" href="/">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        
                            <li class="nav-item"><a class="nav-link" href="/info/about.do">도서관안내</a></li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownJoin" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">자료찾기</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownJoin">
                                    <li><a class="dropdown-item" href="/books/search.do">통합검색</a></li>
                                    <li><a class="dropdown-item" href="/books/newBooks.do">신착자료</a></li>
                                    <li><a class="dropdown-item" href="/books/bestBooks.do">베스트자료</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item"><a class="nav-link" href="/info/guidlines.do">이용안내</a></li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownJoin" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">신청/참여</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownJoin">
                                    <li><a class="dropdown-item" href="/service/wishBooks.do">희망도서 신청</a></li>
                                    <li><a class="dropdown-item" href="/service/programs.do">프로그램 신청</a></li>
                                    <li><a class="dropdown-item" href="/service/multiSeats.do">멀티미디어 좌석예약</a></li>
                                    <li><a class="dropdown-item" href="/service/qna.do">QNA</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMyPage" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">내서재</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMyPage">
                                    <li><a class="dropdown-item" href="/mypage/loanList.do">대출 조회/연기</a></li>
                                    <li><a class="dropdown-item" href="/mypage/loanHistory.do">대출이력</a></li>
                                    <li><a class="dropdown-item" href="/mypage/resvList.do">예약도서조회</a></li>
                                    <li><a class="dropdown-item" href="/mypage/wishList.do">희망도서 신청내역</a></li>
                                    <li><a class="dropdown-item" href="/mypage/programList.do">프로그램 신청 내역</a></li>
                                    <li><a class="dropdown-item" href="/mypage/seatList.do">좌석 예약 조회</a></li>
                                    <li><a class="dropdown-item" href="/mypage/likedList.do">관심도서 조회</a></li>
                                </ul>
                            </li>
                            
                            <!-- 로그인/회원가입 -->
                            <li class="nav-item"><a class="nav-link" href="/member/login.do">로그인</a></li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mb-5">
                                <h1 class="fw-bolder">Project Title</h1>
                                <p class="lead fw-normal text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab similique, ducimus ut alias sit accusamus illum, asperiores deserunt dolorum quaerat qui! Ab, quisquam explicabo magni dolores unde beatae quam a.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-12"><img class="img-fluid rounded-3 mb-5" src="https://dummyimage.com/1300x700/343a40/6c757d" alt="..." /></div>
                        <div class="col-lg-6"><img class="img-fluid rounded-3 mb-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                        <div class="col-lg-6"><img class="img-fluid rounded-3 mb-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mb-5">
                                <p class="lead fw-normal text-muted">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Totam deserunt architecto enim eos accusantium fugit recusandae illo iste dignissimos possimus facere ducimus odit voluptatibus exercitationem, ex laudantium illum voluptatum corporis.</p>
                                <a class="text-decoration-none" href="#!">
                                    View project
                                    <i class="bi-arrow-right"></i>
                                </a>
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
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>