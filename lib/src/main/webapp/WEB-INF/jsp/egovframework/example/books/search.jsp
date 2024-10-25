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
        <title>LIBLIO - 통합검색</title>
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
        
        <style>
			.hightlight {
				color:var(--bs-link-hover-color);
				font-weight: bold;
			}
			.hidden {
				display: none;
			}
			
			/* 카테고리 */
			.ctgTable {
			    margin: 0 10%;
			    max-width: 190px;
			    display: grid;
			    grid-template-rows: repeat(50, 40px);
			    color: #2d2d2d;
			}
			.ctgTableItem {
				border-top: 1px #b3b3b3 solid;
			    border-bottom: 1px #b3b3b3 solid;
			}
			
			/* 검색 */
			.searchBar {
				border: 2px solid #0d6efd;
			    display: flex;
			    align-items: center;
			    justify-content: space-between;
			    border-radius: 10px;
			    height: 60px;
			}
			.insertSearch {
				border: none;
			    margin: 0 10px;
			    height: 50px;
			    width: 100%;
			}
			.searchIcon {
			    margin: 0 12px;
			}
			
			#searchBar {

			}
			#searchBtn {
				cursor: pointer;
				width: 50px;
				height: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
				border-radius: 10px;
				color: var(--bs-blue);
				padding: 0 10px;
    			font-size: 1.3em;
			}
			#searchBtn:hover {
				color: var(--bs-link-hover-color);
				background-color: rgb(130 191 252 / 10%);
			}
			#searchBtn:focus {
				color: var(--bs-link-hover-color);
				background-color: rgb(130 191 252 / 10%);
			}
			
			/* 검색조건 */
			.searchInfo {
				border-bottom: 1px solid gray;
			    width: 100%;
			    display: flex;
			    justify-content: space-between;
			    align-items: center;
			    padding: 10px 5px 5px 5px;
			    
			}
			.searchCount {
			}
			.searchOption {
				display: flex;
    			align-items: center;
    			cursor: pointer;
			}
			.searchOption a {
				padding: 0 5px;
			}
			
			
			
			/* table */
			.rowNum {
				width: 10px;
			}
			.bookCover {
				width: 100px;
				height: 100%;
			}
			.imgBox {
				width: 70px;
				height: 100px;
				border: 1px solid gray;
			}
			.imgBox img {
				width: 100%;
				height: 100%;
			}
			.ctgName {
				border: 1px solid #a3a3a3;
			    padding: 0 5px;
			    margin: 0 3px 0 0;
			    border-radius: 0px;
			    color: #5b5b5b;
			    display: inline-block;
			    font-size: 0.8em;
			}
			
			.bookInfo .info {
				padding: 3px 0;
			}
			.info.Related span {
				padding: 0 2px;
				color: var(--bs-gray);
			}
			.info.Idx {
				color:var(--bs-link-hover-color);
			}
			.bookSelect {
				width: 100px;
			}
			.selectBtn {
				font-size: 0.9em;
				font-weight: bold;
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
			}
			
			.loanBtn {
				color: var(--bs-body-bg);
				background-color: var(--bs-primary);
			}
			.loanBtn:hover {
				color: var(--bs-body-bg);
				background-color: var(--bs-link-hover-color);
			}
			.loanBtn:active {
				color: var(--bs-body-bg);
				background-color: var(--bs-link-hover-color);
			}
			.loanTrue {
				color: var(--bs-link-hover-color);
			}
			
			
			/* 페이징 */
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
			
		</style>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
            
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row">
                        <div class="col-lg-3 ">
                        	<div class="ctgTable">
                        	
                        	  <div class="hidden">
                        	  <form id="ctgForm" action="/books/search.do" method="get" style="display:none;">
							    <select name="ctgId">
							        <c:forEach var="c" items="${ctgList}">
							            <option value="${c.sclsCd}">${c.sclsNm}</option>
							        </c:forEach>
							    </select>
								</form>
                        	  </div>   
							
						    <!-- Sidebar -->
						    <nav id="sidebar" class="bg-light border-end">
						        <div class="p-3">
						            <h4 class="fw-bold">카테고리</h4>
						            <ul class="nav flex-column">
						                <c:forEach var="c" items="${ctgList}">
						                    <li class="nav-item">
						                        <a href="#" class="nav-link category-link" data-ctgid="${c.sclsCd}">${c.sclsNm}</a>
						                    </li>
						                </c:forEach>
						            </ul>
						        </div>
						    </nav>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1">통합자료 검색</h1>
                                    
                                    <hr>
                                    
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-3">
                                <form id="searchForm" action="/books/search.do" method="get">
                                    <div class="d-flex searchBar">
                                    
                                    	<input class="insertSearch" id="searchBar" name="sKey" type="text" placeholder="제목 혹은 저자를 검색하세요" value="${map.sKey}">
                                    	<div id="searchBtn">
                                    		<i class="fa-solid fa-magnifying-glass searchIcon"></i>
                                    	</div>
							        </div>
                                </form>
                                </figure>
                                <!-- Post content-->
                                <section class="d-flex flex-column align-items-center justify-items-center mb-5">
                                <div class="d-flex align-items-center justify-content-between searchInfo">
	                                <div class="searchCount">
	                                	<span>총 <span class="hightlight">${count}</span>건이 검색되었습니다.</span>
	                                </div>
	                                <div class="searchOption">
	                                	<a>정확도순</a>
		                                 <a>인기순</a>
		                                 <a>최신순</a>
	                                </div>
                               </div>
                               
                               <table class="table">
								  <tbody>
								    <c:forEach var="row" items="${list}">
								    
								    <tr>
								    	<th scope="row" class="rowNum align-middle">${row.idx}</th>
								      	<td class="bookCover align-middle">
								      	
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
								      </td>
								      <td class="bookInfo align-middle">
								      
								      <div class="info Box">
								      	<div class="info Title">
								      	
								      	<div class="ctgName">
								      		${row.ctgNm}
								      	</div>
								      	
								      	<b><a>${row.title}</a></b></div>
								      	<div class="info Related">
								      		<span>${row.author}</span>
								      		<span>|</span>
								      		<span>${row.publisher}</span>
								      	</div>
								      	<div class="info Idx"><b>청구기호 : ${row.cheonggu}</b></div>
								      </div>
								      </td>
								      <td class="bookSelect align-middle">
								      	<div class="selectBox">
									      	<button class="btn selectBtn loanBtn">대출하기</button>
									      	<input type="hidden" id="bookId" name="bookId" value="${row.bookId}">
									      	<div class="selectInfo">
									      		<div class="loanState loanTrue">대출가능</div>
									      		<div class="resvState">예약현황: 0/5</div>
									      	</div>
									      	
								      	</div>
								      </td>
								    </tr>
								    
								    </c:forEach>
								  </tbody>
								</table>
								
								<!-- 페이징 -->
								
								<ul class="pagination">
									
						 			<c:choose>
								        <c:when test="${pageInfo.currentPageNo<=1}">
								        </c:when>
								
								    <c:otherwise>
								    	<li class="page-item"><a class="page-link" href="/books/search.do?sKey=${pinfo.sKey}&page=${pageInfo.currentPageNo-1}&ctgId=${map.ctgId}">이전</a></li>
								    </c:otherwise>
								    </c:choose>
								    
								    <c:forEach begin="${pageInfo.firstPageNoOnPageList}" end="${pageInfo.lastPageNoOnPageList}" var="i" step="1">
									    <c:choose>
									        <c:when test="${i eq pageInfo.currentPageNo}">
									            <li class="page-item"><a class="page-link select">${i}</a></li>
									        </c:when>
									
									        <c:otherwise>
									        	<li class="page-item"><a class="page-link" href="/books/search.do?sKey=${pinfo.sKey}&page=${i}&ctgId=${map.ctgId}">${i}</a></li>
									        </c:otherwise>
									
										</c:choose>
									</c:forEach>
									
									<c:choose>
							            <c:when test="${pageInfo.currentPageNo>=pageInfo.totalPageCount}">
							            </c:when>
							            <c:otherwise>
							            	<li class="page-item"><a class="page-link" href="/books/search.do?sKey=${pinfo.sKey}&page=${pageInfo.currentPageNo+1}&ctgId=${map.ctgId}">다음</a></li>
							            </c:otherwise>
							        </c:choose>
							        
							        </ul> 
                                
                                </section>
                            </article>
                            
                            
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
        
        <!-- script -->
		<script>
			$(document).ready(function() {
			    $('#searchBtn').on('click', function(event){
			        $('#searchForm').submit();
			    });
			    
			    $('.selectBtn').on('click', function(event){
			        
			        var row = $(this).closest('tr');
			        var bookId = row.find('input[name="bookId"]').val();
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
								success: function (response) {
								    console.log(response);
								    if (response === 'success') {
								        
								        alert('대출되었습니다.');
								        
								        //대출 버튼 예약하기로 바꾸기
								        row.find('.loanBtn')
				                           .removeClass('loanBtn')
				                           .addClass('resvBtn')
				                           .text('예약하기');  
				                        
				                        row.find('.loanState')
				                           .removeClass('loanTrue')
				                           .addClass('loanFalse')
				                           .text('대출중');
				                        
				                    } else {
				                        alert('문제가 발생했습니다. 관리자에게 문의하세요');
				                    }
							    }
							});
				        } else {
				            alert('로그인 후 이용해주세요.');
				            //로그인 화면
				        }
			            
			        } else if ($(this).hasClass('resvBtn')) {
			            
			        }
			        
			    });
			});
			
	        const categoryLinks = document.querySelectorAll('.category-link');
	        
	        categoryLinks.forEach(link => {
	            link.addEventListener('click', function(e) {
	                e.preventDefault();
	                
	                const ctgId = this.getAttribute('data-ctgid');
	                
	                // Submit the form with the selected category (optional if using form submission)
	                const form = document.getElementById('ctgForm');
	                form.querySelector('select[name="ctgId"]').value = ctgId;
	                form.submit(); // Submits form to filter results on the server
	            });
	        });
			
		</script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>