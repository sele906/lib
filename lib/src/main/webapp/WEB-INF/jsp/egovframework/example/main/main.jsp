<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LiBLIO - 메인화면</title>
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
        
       	<style type="text/css">
       	
       	#bgImg {
		    background-position: center center;
		    background-repeat: no-repeat;
		    background-attachment: fixed;
		    background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
		                url('/images/egovframework/lib/main/library_main.jpg');
		}
		.linkStyle {
			color: black;
			text-decoration: none;
			cursor: pointer;
		}
		.imgStyle {
		    width: 100%;
    		height: 100%;
		}
		.imgBox {
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			border-bottom: 1px solid #e2e2e2;
		}
		.imgBoxSize {
		    width: 147px;
    		height: 226px;
		}
		.titleStyle {
			overflow: hidden;
    		height: 24px;
		}
		.infoStyle {
			overflow: hidden;
    		height: 24px;
		}
		
			/* 기능 */
			.selectBox {
				display: flex;
			    flex-direction: row;
			    align-items: center;
			    justify-content: start;
			    margin: 10px 0 0 0;
			}
			
			/* 대출가능 */
			.loanBtn {
				color: var(--bs-body-bg);
				background-color: var(--bs-primary);
				font-weight: bold;
			}
			.loanBtn:hover, .loanBtn:active {
				color: var(--bs-body-bg);
				background-color: var(--bs-link-hover-color);
			}
		       	
       	</style>
        
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
            
            <!-- Header-->
            <header class="bg-white">
            	<div id="bgImg">
                <div class="container px-5" style="height: 400px; display: flex; justify-content: center;">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6" style="display: flex; justify-content: center;">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">LiBLIO</h1>
                                <p class="lead fw-normal text-white-50 mb-4" style="font-size: 1em; width: 540px;">손쉽게 도서를 관리하고, 대출과 반납을 효율적으로 처리하는 도서 관리 시스템 LiBLO와 함께하세요.</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <!-- <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">Get Started</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#!">Learn More</a> -->
                                </div>
                            </div>
                        </div>
                        <!-- <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div> -->
                    </div>
                </div>
                </div>
            </header>
            
            <!-- Blog preview section-->
            <section class="py-5">
            
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">인기도서</h2>
                                <p class="lead fw-normal text-muted mb-5">가장 인기 있는 도서들을 한눈에 확인하고, 바로 대출해 보세요!</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row gx-5 ">
                    
                    <c:forEach var="row" items="${list}">
                    	<div class="col-lg-4 mb-5 rowBox">
                            <div class="card h-70 shadow border-0">
                            <div class="card-img-top imgBox">
	                            <div class="imgBoxSize">
	                            	<img class="card-img-top imgStyle" src="/bookfile/${row.fileName}" alt="..."/>
	                            </div>
                            </div>
                            <div class="card-body p-4">
                                <div class="badge bg-primary bg-gradient rounded-pill mb-2">${row.ctgNm}</div>
                                <h5 class="card-title titleStyle"><b>${row.title}</b></h5>
                                <p class="card-text mb-0 infoStyle">${row.author} | ${row.publisher}</p>
                                <div class="selectBox">
								      	
							      	<input type="hidden" id="bookId" name="bookId" value="${row.bookId}">
							      	
						      		<button type="button" class="btn loanBtn">대출하기</button>
							     </div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                    </div>
                </div>
            </section>
            
            
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0" style="text-align: center; font-size: 2.3em;">내서재</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-book"></i></div>
                                    <h2 class="h5"><b><a class="linkStyle" href="/mypage/loanList.do">대출조회/연기</a></b></h2>
                                    <p class="mb-0">대출 중인 도서를 쉽게 확인하고,<br>반납 기한을 연장할 수 있습니다.</p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-clock-history"></i></div>
                                    <h2 class="h5"><b><a class="linkStyle" href="/mypage/loanHistory.do">대출이력</a></b></h2>
                                    <p class="mb-0">대출한 도서들의 내역을 한눈에 볼 수 있습니다.</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-bookmark"></i></div>
                                    <h2 class="h5"><b><a class="linkStyle" href="/mypage/resvList.do">예약도서 조회</a></b></h2>
                                    <p class="mb-0">예약한 도서의 상태를 확인하고,<br>대출 가능 여부를 알아보세요.</p>
                                </div>
                                <div class="col h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-display"></i></div>
                                    <h2 class="h5"><b><a class="linkStyle" href="/mypage/seatList.do">좌석 예약 조회</a></b></h2>
                                    <p class="mb-0">도서관 좌석 예약 현황을 확인하고,<br>편리하게 이용하세요.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            

        </main>
        
        <script>
        $('.loanBtn').on('click', function(event){
            console.log('hello');
            
            var row = $(this).closest('.rowBox');
            var bookId = row.find('input[name="bookId"]').val();
            var userid = "${sessionScope.userid}";
            
            if (userid != "") {
	            $.ajax({
					type: 'get',
					url: '/books/loan.do',
					data: {
					    bookId: bookId,
					    userid: userid
					}, 
					dataType : 'json',
					success: function (response) {
						console.log(response);
						
						if (response.status === 'overdue') {
				            alert('연체 중입니다. ' + response.dueCount + '일 동안 대여할 수 없습니다.');
				            location.href = '/main.do';
				        } else if (response.status === 'toomuchbook') {
				            alert('총 14권을 초과하여 대여할 수 없습니다.');
				            location.href = '/main.do';
				        } else if (response.status === 'success') {
						    alert('대출되었습니다.');
						    location.href = '/main.do';
	                    }
				    }
				});
	        } else {
	            alert('로그인 후 이용해주세요.');
	            location.href = '/member/login.do';
	        }
        });
        </script>
        
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; LiBLIO 2024</div></div>
                    <!-- <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div> -->
                </div>
            </div>
        </footer>
        
        <c:if test="${msg eq 'error'}">
			<script>alert('접근 권한이 없습니다.')</script>
		</c:if>
        
        <c:if test="${msg eq 'logout'}">
			<script>alert('로그아웃되었습니다.')</script>
		</c:if>
        
        <c:if test="${msg eq 'updateMemSuccess'}">
			<script>alert('회원정보 수정이 완료되었습니다.')</script>
		</c:if>
		
		<c:if test="${msg eq 'deleteMem'}">
			<script>alert('탈퇴 완료되었습니다.')</script>
		</c:if>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>