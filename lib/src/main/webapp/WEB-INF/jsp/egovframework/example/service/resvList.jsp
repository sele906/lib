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
        <title>LIBLIO - 예약도서 조회</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <link href="/template/user/css/bookself.css" rel="stylesheet" />
        
        <style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		</style>
		
		<style type="text/css">
			img {
				width: 150px;
				height: 180px;
			}
			.hidden {
				display: none;
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
                                <h1 class="fw-bolder mb-3">예약도서 조회</h1>
                                <p class="lead fw-normal text-muted mb-4">${sessionScope.userid}님의 예약도서입니다.</p>
                                
                                <!-- 검색 -->
                                <form id="searchForm" action="/mypage/resvList.do" method="get">
                                    <div class="searchBox">
                                    
                                    	<input class="insertSearch" id="searchBar" name="sKey" type="text" placeholder="제목 혹은 저자를 검색하세요" value="${map.sKey}">
                                    	<div class="searchBtn">
                                    		<i class="fa-solid fa-magnifying-glass searchIcon"></i>
                                    	</div>
							        </div>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            
            <!-- Team members section-->
            <section class="py-5 bg-light">
                <div class="container px-5 my-5 pageBox">
                    <div class="text-center">
                    </div>

                    <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                        
                        <c:forEach var="i" items="${list}">
                        
                        <div class="col mb-5 mb-5 mb-xl-5 item">
                            <div class="text-center">
                                
						      		<c:choose>
						            <c:when test="${not empty i.fileName}">
						                <img class="img-fluid mb-4 px-4"  src="/bookfile/${i.fileName}">
						            </c:when>
						            <c:otherwise>
						                <img  class="img-fluid mb-4 px-4"  src="/images/egovframework/lib/cmmn/blank.png">
						            </c:otherwise>
						        </c:choose>
										
								<input type="hidden" name="bookId" value="${i.bookId}"/>
                                <h5 class="fw-bolder">${i.title}</h5>
                                <div class="fst-italic text-muted">${i.author} <br> ${i.publisher}</div>
                                <button class="btn btn-danger resvBtn resv my-2">예약취소</button>
                            </div>
                        </div>
                        
                        </c:forEach>
                    </div>
                    
                    </div>
                    
                    <div class="pageBox">
                    
                    <!-- 페이징 -->
								
					<ul class="pagination">
						
			 			<c:choose>
					        <c:when test="${pageInfo.currentPageNo<=1}">
					        </c:when>
					
					    <c:otherwise>
					    	<li class="page-item"><a class="page-link" href="/mypage/resvList.do?sKey=${pinfo.sKey}&page=${pageInfo.currentPageNo-1}">이전</a></li>
					    </c:otherwise>
					    </c:choose>
					    
					    <c:forEach begin="${pageInfo.firstPageNoOnPageList}" end="${pageInfo.lastPageNoOnPageList}" var="i" step="1">
						    <c:choose>
						        <c:when test="${i eq pageInfo.currentPageNo}">
						            <li class="page-item"><a class="page-link select">${i}</a></li>
						        </c:when>
						
						        <c:otherwise>
						        	<li class="page-item"><a class="page-link" href="/mypage/resvList.do?sKey=${pinfo.sKey}&page=${i}">${i}</a></li>
						        </c:otherwise>
						
							</c:choose>
						</c:forEach>
						
						<c:choose>
				            <c:when test="${pageInfo.currentPageNo>=pageInfo.totalPageCount}">
				            </c:when>
				            <c:otherwise>
				            	<li class="page-item"><a class="page-link" href="/mypage/resvList.do?sKey=${pinfo.sKey}&page=${pageInfo.currentPageNo+1}">다음</a></li>
				            </c:otherwise>
				        </c:choose>
				        
				        </ul> 
                    
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
        
        <script>
        
        $('.searchBtn').on('click', function(event) {
	        $('#searchForm').submit();
	    });
        
        $('.resvBtn').on('click', function(event) {
	        var row = $(this).closest('.item');
	        var bookId = row.find('input[name="bookId"]').val();
	        var userid = "${sessionScope.userid}";
	        
	        if ($(this).hasClass('resv')) {
	            
	            if (userid != "") {
		            $.ajax({
						type: 'get',
						url: '/mypage/resvDelete.do',
						data: {
						    bookId: bookId,
						    userid: userid
						}, 
						success: function (response) {
						    console.log(response);
						    if (response === 'success') {
						        
						        alert('예약도서 목록에서 해제되었습니다.');
						        
						        //숨기기
						        row.addClass('hidden'); 
		                        
		                    } else {
		                        alert('문제가 발생했습니다. 관리자에게 문의하세요');
		                    }
					    }
					});
		        } else {
		            alert('로그인 후 이용해주세요.');
		            location.href = '/member/login.do';
		        }
	        }
	        
	    });
        
        </script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>