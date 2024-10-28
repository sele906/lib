<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LIBLIO - 대출이력</title>
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
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
            
            <!-- Pricing section-->
            <section class="bg-light py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">Pay as you grow</h1>
                    </div>
                    <div class="row gx-5 justify-content-center">
                    
                        <!-- Pricing card free-->
                        <div class="col-lg-6 col-xl-12">
                            <div class="card mb-5 mb-xl-0">
                                <div class="card-body p-5" style="
    min-height: 460px;">
							    <div class="cardBox">
							    
							    <div class="tableBox">
							    
							    <hr style="margin: 0;">
                                <table class="table">
								  <tbody>
								    <tr>
								      <th scope="row" class="align-middle">1</th>
								      <td class="bookCover align-middle" >
								     	<div class="imgContainer">
								     	<div class="imgBox">
								     		<img/>
								     	</div>
								     	</div>
								     </td>
								      <td class="bookInfo align-middle">
									      <div class="infoBox">
									      
									      <div class="t_title">
									      	<b>공개하지 아니한 회의내용의 공표에 관하여는 법률이 정하는 바에 의한다</b>
									      </div>
									      <div class="t-cnt">
									      	저자 아무개 | 출판사
									      </div>
									      <div class="t-idx">
									      	 <b>청구기호 : 재적의원 과반수의</b>
									      </div>
									      
									      </div>
								      </td>
								      <td class="bookSelect align-middle">
								      		<div class="selectBox">
								      			<div class="dateBox">
								      				반납일: 2019.02.10
								      			</div>
								      			<div class="selectBtn">
								      				<button class="btn btn-outline-primary extendsBtn">대출연장</button>
								      				
								      				<!-- <button class="btn btn-outline-danger disabled">연장불가</button> -->
								      				
								      			</div>
								      		</div>
								      </td>
								    </tr>
								    <tr>
								      <th scope="row">2</th>
								      <td>Jacob</td>
								      <td>Thornton</td>
								      <td>@fat</td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Larry</td>
								      <td>the Bird</td>
								      <td>@twitter</td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Larry</td>
								      <td>the Bird</td>
								      <td>@twitter</td>
								    </tr>
								    <tr>
								      <th scope="row">3</th>
								      <td>Larry</td>
								      <td>the Bird</td>
								      <td>@twitter</td>
								    </tr>
								    
								  </tbody>
								</table>
							    
							    </div>
							    <div class="pageBox">
							    
							    <ul class="pagination">
            
					            <li class="page-item"><a class="page-link">1</a></li>
					            <li class="page-item"><a class="page-link">2</a></li>
					            <li class="page-item"><a class="page-link">3</a></li>
					            <li class="page-item"><a class="page-link">4</a></li>
					            <li class="page-item"><a class="page-link">5</a></li>
					            <li class="page-item"><a class="page-link">6</a></li>
					            <li class="page-item"><a class="page-link">7</a></li>
					            <li class="page-item"><a class="page-link">8</a></li>
					            <li class="page-item"><a class="page-link">9</a></li>
					            <li class="page-item"><a class="page-link">10</a></li>
					            
					            </ul>
							    
							    </div>
							    
							    </div>
								
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </section>
            
            
            <!-- paging -->
            
            
									
 			<%-- 
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
	        </c:choose> --%>
	        
	        </ul> 
            
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