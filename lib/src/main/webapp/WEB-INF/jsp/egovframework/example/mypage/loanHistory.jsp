<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LiBLIO - 대출이력</title>
		<!-- Favicon-->
        <link rel="icon" href="/template/favicon.ico">
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
			.pagination {
				cursor: pointer;
				font-weight: bold;
			}
			.page-link {
				color: #848484;
			}
			.page-link.select {
				background-color: var(--bs-pagination-active-bg);
	    		color: var(--bs-pagination-active-color);
			}
			
			.emtTable {
				min-height: 360px;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    font-size: 1.1em;
			}
			
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
                        <h1 class="fw-bolder">대출 이력</h1>
                        <p class="lead fw-normal text-muted mb-0">${sessionScope.userid}님의 대출 이력입니다.</p>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <!-- Pricing card free-->
                        <div class="col-lg-6 col-xl-12">
                            <div class="card mb-5 mb-xl-0">
                                <div class="card-body p-5" style="
    min-height: 460px;">
							    <div class="cardBox">
							    
							    <c:if test="${empty list}">
					                  <div class="emtTable">
					                  대출이력이 없습니다.
					                  </div> 		
				                </c:if>
							    
							    <c:if test="${not empty list}">
							    
							    <div class="tableBox">
							    
							    <hr style="margin: 0;">
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
								      			<div class="dateBox">
								      				반납일: <span class="returnDateVal">${row.returnDate}</span>
								      			</div>
								      		</div>
								      </td>
								    </tr>
								  
								  </c:forEach>
								    
								  </tbody>
								</table>
							    
							    </div>
							    
							    <div class="pageBox">
							    
							    <!-- 페이징 -->
								
								<ul class="pagination">
									
						 			<c:choose>
								        <c:when test="${pageInfo.currentPageNo<=1}">
								        </c:when>
								
								    <c:otherwise>
								    	<li class="page-item"><a class="page-link" href="/mypage/loanHistory.do?page=${pageInfo.currentPageNo-1}">이전</a></li>
								    </c:otherwise>
								    </c:choose>
								    
								    <c:forEach begin="${pageInfo.firstPageNoOnPageList}" end="${pageInfo.lastPageNoOnPageList}" var="i" step="1">
									    <c:choose>
									        <c:when test="${i eq pageInfo.currentPageNo}">
									            <li class="page-item"><a class="page-link select">${i}</a></li>
									        </c:when>
									
									        <c:otherwise>
									        	<li class="page-item"><a class="page-link" href="/mypage/loanHistory.do?page=${i}">${i}</a></li>
									        </c:otherwise>
									
										</c:choose>
									</c:forEach>
									
									<c:choose>
							            <c:when test="${pageInfo.currentPageNo>=pageInfo.totalPageCount}">
							            </c:when>
							            <c:otherwise>
							            	<li class="page-item"><a class="page-link" href="/mypage/loanHistory.do?page=${pageInfo.currentPageNo+1}">다음</a></li>
							            </c:otherwise>
							        </c:choose>
							        
							        </ul>
							    
							    </div>
							    
							    </c:if>
							    
							    </div>
								
                                </div>
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
        
        <%@ include file="../common/Alert.jsp" %> 
    </body>
</html>