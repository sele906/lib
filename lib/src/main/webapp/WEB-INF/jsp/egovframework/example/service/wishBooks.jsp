<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LiBLIO - 희망도서 신청</title>
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
			.pagination {
				cursor: pointer;
				font-weight: bold;
			}
			.page-item {
			
			}
			.page-link {
				color: #848484;
			}
			.page-link.select {
				background-color: var(--bs-pagination-active-bg);
	    		color: var(--bs-pagination-active-color);
			}
			.infoBox {
				max-width: 300px;
				    word-break: break-all;
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
                                
                                <h1 class="fw-bolder mb-3">희망도서 신청</h1>
                                <p class="lead fw-normal text-muted mb-4">원하는 희망도서를 선택하세요</p>
                                
                                <!-- 검색 -->
                                <form id="searchForm" action="/service/wishBooks.do" method="get">
                                    <div class="searchBox">
                                    
                                    	<input class="insertSearch" id="searchBar" name="kwd" type="text" placeholder="제목 혹은 저자를 검색하세요" value="">
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
                <div class="container px-5 my-5">
                    <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                    
                    <div id="gridBox">
                    
                    <c:forEach var="i" items="${list}">
                    
                    <div class="card h-100 gridItem">
                    	<div class="imgBox">
                    		<div>
                    		<c:choose>
                    			<c:when test="${fn:contains(i.image_url, 'null')}">
					                <img  class="card-img-top imgStyle" src="/images/egovframework/lib/cmmn/blank.png">
					            </c:when>
					            <c:when test="${fn:contains(i.image_url, '.jpg') || fn:contains(i.image_url, '.png')}">
					                <img class="card-img-top imgStyle" src="${i.image_url}">
					            </c:when>
					            <c:otherwise>
					                <img  class="card-img-top imgStyle" src="/images/egovframework/lib/cmmn/blank.png">
					            </c:otherwise>
					        </c:choose>
                    		
                    			
                    		</div>
                    	</div>
                    	
                    	<div class="card-body infoBox">
	                        <h5 class="card-title">
	                            <a class="titleStyle" href="https://www.nl.go.kr/${i.detail_link}" target="_blank"><b>${i.title_info}</b></a>
	                        </h5>
	                        <p class="card-text bookInfo">
	                            <span class="author"><b>저자</b> ${i.author_info}</span><br>
	                            <span class="pub"><b>출판사</b> ${i.pub_info}</span>
	                        </p>
	                    </div>
                    	
	                    <div class="card-footer btnBox">
	                        <form method="post" class="dataForm d-none">
	                            <input type="hidden" name="url" value="${i.image_url}">
	                            <input type="hidden" name="title" value="${i.title_info}">
	                            <input type="hidden" name="author" value="${i.author_info}">
	                            <input type="hidden" name="publisher" value="${i.pub_info}">
	                            <input type="hidden" name="ctgId" value="${i.type_code}">
	                            <input type="hidden" name="cheonggu" value="${i.call_no}">
	                            <input type="hidden" name="isbn" value="${i.isbn}">
	                        </form>
	                        <button class="btn btn-success wishBtn wish w-100">신청하기</button>
	                    </div>
                    
                    </div>
                    
                    </c:forEach>
                        
                        </div>
                        
                    </div>
                </div>
                
                	<div class="pageBox">
                    
                    <!-- 페이징 -->
								
					<ul class="pagination">
						
			 			<c:choose>
					        <c:when test="${pageInfo.currentPageNo<=1}">
					        </c:when>
					
					    <c:otherwise>
					    	<li class="page-item"><a class="page-link" href="/service/wishBooks.do?kwd=${pinfo.sKey}&page=${pageInfo.currentPageNo-1}">이전</a></li>
					    </c:otherwise>
					    </c:choose>
					    
					    <c:forEach begin="${pageInfo.firstPageNoOnPageList}" end="${pageInfo.lastPageNoOnPageList}" var="i" step="1">
						    <c:choose>
						        <c:when test="${i eq pageInfo.currentPageNo}">
						            <li class="page-item"><a class="page-link select">${i}</a></li>
						        </c:when>
						
						        <c:otherwise>
						        	<li class="page-item"><a class="page-link" href="/service/wishBooks.do?kwd=${pinfo.sKey}&page=${i}">${i}</a></li>
						        </c:otherwise>
						
							</c:choose>
						</c:forEach>
						
						<c:choose>
				            <c:when test="${pageInfo.currentPageNo>=pageInfo.totalPageCount}">
				            </c:when>
				            <c:otherwise>
				            	<li class="page-item"><a class="page-link" href="/service/wishBooks.do?kwd=${pinfo.sKey}&page=${i}">다음</a></li>
				            </c:otherwise>
				        </c:choose>
				        
				        </ul> 
                    
                	</div>
                
            </section>
        </main>
        
        <!-- script -->
        <script>
        
        $(function() {
            
            $('.searchBtn').on('click', function(event) {
    	        $('#searchForm').submit();
    	    });
            
            $('.wishBtn').on('click', function(event){
                
                var userid = "${sessionScope.userid}";
                if (userid == '') {
                    alert('로그인 후 이용가능합니다.');
                    location.href = "/member/login.do";
                } else {
                
                event.preventDefault();
                
                var row = $(this).closest('.item');
                var form = $(this).siblings('.dataForm'); 
                
                var formData = {
                    url: form.find('input[name="url"]').val(),
                    title: form.find('input[name="title"]').val(),
                    author: form.find('input[name="author"]').val(),
                    publisher: form.find('input[name="publisher"]').val(),
                    ctgId: form.find('input[name="ctgId"]').val(),
                    cheonggu: form.find('input[name="cheonggu"]').val(),
                    isbn: form.find('input[name="isbn"]').val().substring(0, 13)
                };
                
                $.ajax({
                    type: 'post',
                    url: '/service/addWishList.do',
                    data: JSON.stringify(formData),
                    contentType:"application/json; charset=UTF-8",
                    success: function(data) {
                        console.log(data);
                        if (data == 'success') {
                            alert('신청되었습니다.');
                        }
                    }
                });
                } 
            });
            
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>

</html>