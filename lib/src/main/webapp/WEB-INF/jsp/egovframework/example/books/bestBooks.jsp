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
        <title>LIBLIO - 베스트자료</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <link href="/template/user/css/table.css" rel="stylesheet" />
        
        <style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		</style>
		
		<style type="text/css">
			.bookSelect {
				width: 100px;
			}
			
			.selectInfo {
				font-size: 0.8em;
			    display: flex;
			    flex-direction: column;
			    justify-content: center;
			    align-items: center;
			    margin: 5px 0;
			    font-weight: bold;
			}
			
			.resvState {
			    color: var(--bs-orange);
			    flex-direction: row;
			}
			
			/* 기능 */
			.selectBtn {
				font-size: 0.9em;
				font-weight: bold;
				color: var(--bs-body-bg);
			}
			
			/* 예약 */
			.likeBtn {
				font-size: 0.9em;
				font-weight: bold;
				margin: 5px 0;
			}/* 
			.like {
				color: var(--bs-body-bg);
				background-color: var(--bs-danger);
				border: 1px solid var(--bs-danger);
			}
			.like:hover, .like:active {
				color: var(--bs-body-bg);
				background-color: var(--bs-danger);
			}
			.liked {
				color: var(--bs-body-bg);
				background-color: var(--bs-danger);
				margin: 5px 0;
			}
			.like:hover, .like:active {
				color: var(--bs-danger);
				border: 1px solid var(--bs-danger);
			} */
			
			/* 대출가능 */
			.loanBtn {
				color: var(--bs-body-bg);
				background-color: var(--bs-primary);
			}
			.loanBtn:hover, .loanBtn:active {
				color: var(--bs-body-bg);
				background-color: var(--bs-link-hover-color);
			}
			.loanTrue {
				color: var(--bs-link-hover-color);
			}
			
			/* 예약중 */
			.resvBtn {
				color: var(--bs-body-bg);
				background-color: var(--bs-orange);
			}
			.resvBtn:hover, .resvBtn:active {
				color: var(--bs-body-bg);
				background-color: #ee7612;
			}
			.loanFalse {
				color: var(--bs-danger);
			}
		</style>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
            
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5">
                    <h1 class="fw-bolder fs-5 mb-4">Company Blog</h1>
                    <div class="card border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row gx-0">
                                <div class="col-lg-6 col-xl-5 py-lg-5">
                                    <div class="p-4 p-md-5">
                                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                        <div class="h2 fw-bolder">Article heading goes here</div>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique delectus ab doloremque, qui doloribus ea officiis...</p>
                                        <a class="stretched-link text-decoration-none" href="#!">
                                            Read more
                                            <i class="bi bi-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xl-7"><div class="bg-featured-blog" style="background-image: url('https://dummyimage.com/700x350/343a40/6c757d')"></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
             
             <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5">
                    <h2 class="fw-bolder fs-5 mb-4">Featured Stories</h2>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">Blog post title</div></a>
                                    <p class="card-text mb-0">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">March 12, 2023 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">Another blog post title</div></a>
                                    <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Josiah Barclay</div>
                                                <div class="text-muted">March 23, 2023 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><div class="h5 card-title mb-3">The last blog post title is a little bit longer than the others</div></a>
                                    <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Evelyn Martinez</div>
                                                <div class="text-muted">April 2, 2023 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="text-end mb-5 mb-xl-0">
                        <a class="text-decoration-none" href="#!">
                            More stories
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div> -->
                </div>
            </section>
            
            <section class="py-5 bg-light">
                <div class="container px-5">
                    <div class="row gx-5 mx-3">
                    <h2>인기자료</h2>
                    <hr>
                    	<div class="mx-5 my-3">
						<table class="table">
							  <tbody>
							  
							  <c:forEach var="row" items="${list}">
							  
							    <tr>
							      <th scope="row" class="align-middle">${row.idx}</th>
							      <td class="bookCover align-middle" >
							     	<div class="imgContainer">
							     		<div class="imgBox">
								      		<c:choose>
								            <c:when test="${not empty row.fileName}">
								                <img alt="" src="/bookfile/${row.fileName}">
								            </c:when>
								            <c:otherwise>
								                <img alt="" src="/images/egovframework/lib/cmmn/blank.png">
								            </c:otherwise>
								        </c:choose>
								      	
								      	</div>
							     	</div>
							     </td>
							      <td class="bookInfo align-middle">
								      <div class="infoBox">
								      
								      <div class="t_title">
								      	<b>${row.title}</b>
								      </div>
								      <div class="t-cnt">
								      	${row.author} | ${row.publisher}
								      </div>
								      <div class="t-idx">
								      	 <b>청구기호 : ${row.cheonggu}</b>
								      </div>
								      
								      </div>
							      </td>
							      <td class="bookSelect align-middle">
							      	<div class="selectBox">
								      	
								      	<input type="hidden" id="bookId" name="bookId" value="${row.bookId}">
								      	<input type="hidden" id="loanId" name="loanId" value="${row.loanId}">
								      	
								      	<c:if test="${sessionScope.userid != null}">
								      	<c:choose>
								        <c:when test="${row.likedId eq row.bookId}">
								      		<button class="btn btn-danger likeBtn liked">관심해제</button>
								      	</c:when>
									
									    <c:otherwise>
									    	<button class="btn btn-danger likeBtn like">관심도서</button>
									    </c:otherwise>
									    </c:choose>
									    </c:if>
								      	
								      	<c:if test="${row.loanState eq 'Y'}">
								      		<c:choose>
									        <c:when test="${row.resvId eq row.bookId}">
									      		<button class="btn selectBtn resvBtn">예약취소</button>
									      	</c:when>
										
										    <c:otherwise>
										    	<button class="btn selectBtn resvBtn">예약하기</button>
										    </c:otherwise>
										    </c:choose>
										    
									      	<div class="selectInfo loanState loanFalse">대출중</div>
								      	</c:if>
								      	
								      	<c:if test="${row.loanState eq 'N'}">
								      		<button class="btn selectBtn loanBtn">대출하기</button>
								      		<div class="selectInfo loanState loanTrue">대출가능</div>
								      	</c:if>
								      	
									     <div class="selectInfo resvState">예약현황: <span class="spanClass resvCountShow">${row.resvCount}</span>/5</div>
									     <input type="hidden" name="resvCount" value="${row.resvCount}">
									      	
								      	</div>
							      </td>
							    </tr>
							    
							    </c:forEach>
							    
							  </tbody>
							</table>
							</div>
							
							<div class="text-end mb-5 mb-xl-0 my-2">
		                        <a class="text-decoration-none" href="/books/search.do?sort=best">
		                            더보기
		                            <i class="bi bi-arrow-right"></i>
		                        </a>
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
        
        <script type="text/javascript">
        $(document).ready(function() {
        
	        $('.likeBtn').on('click', function(event){
		        var row = $(this).closest('tr');
		        var bookId = row.find('input[name="bookId"]').val();
		        var userid = "${sessionScope.userid}";
		        
		        if ($(this).hasClass('like')) {
		            
		            if (userid != "") {
			            $.ajax({
							type: 'get',
							url: '/books/like.do',
							data: {
							    bookId: bookId,
							    userid: userid
							}, 
							success: function (response) {
							    console.log(response);
							    if (response === 'success') {
							        
							        alert('관심 도서로 등록되었습니다.');
							        
							        //관심버튼 관심 해제로 바꾸기
							        row.find('.likeBtn')
							        	.removeClass('like')
			                           	.addClass('liked')
			                           	.text('관심해제'); 
			                        
			                    } else {
			                        alert('문제가 발생했습니다. 관리자에게 문의하세요');
			                    }
						    }
						});
			        } else {
			            alert('로그인 후 이용해주세요.');
			            location.href = '/member/login.do';
			        }
		            
		        } else if ($(this).hasClass('liked')) {
		            
		            if (userid != "") {
			            $.ajax({
							type: 'get',
							url: '/books/liked.do',
							data: {
							    bookId: bookId,
							    userid: userid
							}, 
							success: function (response) {
							    console.log(response);
							    if (response === 'success') {
							        
							        alert('관심도서 목록에서 해제되었습니다.');
							        
							        //관심해제버튼 관심으로 바꾸기
							        row.find('.likeBtn')
							        	.removeClass('liked')
			                           	.addClass('like')
			                           	.text('관심도서'); 
			                        
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
	        
	        $('.selectBtn').on('click', function(event){
		        
		        var row = $(this).closest('tr');
		        var bookId = row.find('input[name="bookId"]').val();
		        var loanId = row.find('input[name="loanId"]');
		        var userid = "${sessionScope.userid}";
		        
		        if ($(this).hasClass('loanBtn')) {
		            
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
							    alert('대출되었습니다.');
							    console.log(response);
							    
							    row.find('input[name="resvCount"]').val(response.resvCnt); 
						        row.find('.resvCountShow').text(response.resvCnt);
							    
						    	loanId.val(response.idx);
						    	
						        //대출 버튼 예약하기로 바꾸기
						        row.find('.loanBtn')
		                           .removeClass('loanBtn')
		                           .addClass('resvBtn')
		                           .text('예약하기');  
		                        
		                        row.find('.loanState')
		                           .removeClass('loanTrue')
		                           .addClass('loanFalse')
		                           .text('대출중');
						    }
						});
			        } else {
			            alert('로그인 후 이용해주세요.');
			            location.href = '/member/login.do';
			        }
		            
		        } else if ($(this).hasClass('resvBtn')) {
		            
		            if (userid != "") {
		                
		                $.ajax({
							type: 'get',
							url: '/books/resv.do',
							data: {
							    bookId: bookId,
							    userid: userid,
							    loanId: loanId.val()
							}, 
							success: function (response) {
							    console.log(response);
							    if (response === 'success') {
							        
							        alert('예약되었습니다.');
							        
							      	//예약 버튼 예약취소로 바꾸기
							        row.find('.resvBtn')
			                           .text('예약취소');  
							        
							        //예약 숫자 업데이트
							        var cnt = parseInt(row.find('input[name="resvCount"]').val());
							        cnt += 1; 
							        if (cnt > 5) {
							            cnt = 5;
							        }

							        row.find('input[name="resvCount"]').val(cnt); 
							        row.find('.resvCountShow').text(cnt);
							        
			                    } else if (response === 'alreadyLoaned') {
			                        alert('이미 대출한 도서입니다.');
			                    } else if (response === 'alreadyReserved') {
			                        if (confirm('예약 취소하시겠습니까?')) {
			                            $.ajax({
											type: 'get',
											url: '/books/resvDelete.do',
											data: {
											    bookId: bookId,
											    userid: userid
											}, 
											success: function (response) {
											    console.log(response);
											    if (response == 'success') {
											        alert('예약 취소 되었습니다.');
											        
											      	//예약 버튼 예약으로 바꾸기
											        row.find('.resvBtn')
							                           .text('예약하기');  
											        
											      	//예약 숫자 업데이트
											        var cnt = parseInt(row.find('input[name="resvCount"]').val());
											        cnt -= 1; 
											        if (cnt < 0) {
											            cnt = 0;
											        }

											        row.find('input[name="resvCount"]').val(cnt); 
											        row.find('.resvCountShow').text(cnt);
							                    } 
										    }
										});
			                        }
			                    } else if (response === 'fullyReserved') {
			                        alert('예약이 불가능합니다.');
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
        
        });
        </script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>