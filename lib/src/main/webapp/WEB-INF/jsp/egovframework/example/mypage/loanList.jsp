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
        <title>LiBLIO - 대출이력</title>
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
                        <h1 class="fw-bolder">대출 조회</h1>
                        <p class="lead fw-normal text-muted mb-0">${sessionScope.userid}님의 대출 현황입니다.</p>
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
					                  대출내역이 없습니다.
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
								      			<div class="selectBtn">
								      			
									      			<c:if test="${row.dueDate >= 28}">
									      			<button class="btn btn-outline-primary extendsBtn disabled">연장불가</button>
									      			</c:if>
									      			
									      			<c:if test="${row.dueDate < 28}">
									      			<button class="btn btn-outline-primary extendsBtn">대출연장</button>
									      			</c:if>
								      			
								      				<button class="btn btn-outline-danger returnBtn">반납하기</button>
								      				<input type="hidden" class="loanId" value="${row.loanId}"/>
								      				<input type="hidden" class="dateVal" value="${row.returnDate}">
								      				<!-- <button class="btn btn-outline-danger disabled">연장불가</button> -->
								      				
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
								    	<li class="page-item"><a class="page-link" href="/mypage/loanList.do?page=${pageInfo.currentPageNo-1}">이전</a></li>
								    </c:otherwise>
								    </c:choose>
								    
								    <c:forEach begin="${pageInfo.firstPageNoOnPageList}" end="${pageInfo.lastPageNoOnPageList}" var="i" step="1">
									    <c:choose>
									        <c:when test="${i eq pageInfo.currentPageNo}">
									            <li class="page-item"><a class="page-link select">${i}</a></li>
									        </c:when>
									
									        <c:otherwise>
									        	<li class="page-item"><a class="page-link" href="/mypage/loanList.do?page=${i}">${i}</a></li>
									        </c:otherwise>
									
										</c:choose>
									</c:forEach>
									
									<c:choose>
							            <c:when test="${pageInfo.currentPageNo>=pageInfo.totalPageCount}">
							            </c:when>
							            <c:otherwise>
							            	<li class="page-item"><a class="page-link" href="/mypage/loanList.do?page=${pageInfo.currentPageNo+1}">다음</a></li>
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
		    
		    $('.extendsBtn').on('click', function(event){
		        
		        var row = $(this).closest('tr');
		        const loanId = $(this).closest('.bookSelect').find('.loanId').val();
		        const dateElmt = $(this).closest('.bookSelect').find('.dateVal');
		        const returnDateSpan = $(this).closest('.bookSelect').find('.returnDateVal');
		        
		        $.ajax({
					type: 'get',
					url: '/mypage/extendsDate.do',
					data: {
					    loanId: loanId
					}, 
					success: function (response) {
					    console.log(response);
					    if (response === 'success') {
					        
					        alert('대출연장 되었습니다.');
					        
					        const currentDate = new Date(dateElmt.val());
					        currentDate.setDate(currentDate.getDate() + 7);
					        const newReturnDate = currentDate.toISOString().split('T')[0];
					        
					        dateElmt.val(newReturnDate);
					        returnDateSpan.text(newReturnDate);
	                    } else {
	                        alert('연장이 불가능합니다.');
	                        
	                        row.find('.extendsBtn')
	                           .addClass('disabled')
	                           .text('연장불가');
	                    }
				    }
				});
		        
		    });
		    
		    $('.returnBtn').on('click', function(event){
		        
		        const loanId = $(this).closest('.bookSelect').find('.loanId').val();
		        
		        $.ajax({
					type: 'get',
					url: '/mypage/returnState.do',
					data: {
					    loanId: loanId
					}, 
					success: function (response) {
					    console.log(response);
					    if (response === 'success') {
					        
					        alert('반납 되었습니다.');
					        
					        $(event.target).closest('tr').hide();
	                    }
				    }
				});
		    });
        });
        
        </script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
    </body>
</html>