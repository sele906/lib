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
        <title>LiBLIO - FAQ</title>
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
			#pageBox {
				width: 100%;
				display: flex;
				align-items: center;
				justify-content: center;
			}
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
			
			.fileArea {
				display: flex;
			    flex-direction: column;
			    width: 100%;
			    margin: 10px 0;
			}
			.imgArea {
				display: flex;
			    width: 100%;
			    justify-content: start;
			}
			.notImgArea {
				display: flex;
			    width: 100%;
			    justify-content: start;
			    flex-direction: column;
			    margin: 10px 0 0 0;
			}
			.imgSize {
			    border: 1px solid #dadada;
			    padding: 10px;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			}
			.imgSize img {
				width: 100%;
			    height: 100%;
			}
			.downFileBox{
			    width: 100%;
			    border: 1px solid #dadada;
			    padding: 10px;
			    display: flex;
			    align-items: center;
			}
			.downFileBox:hover {
				cursor: pointer;
			}
			.downLinkStyle {
			    color: #2775e7;
			    text-decoration: none;
			}
			.downLinkStyle:hover {
				color: #1e5cb7;
			}
			.downIconStyle {
			    margin: 0 10px;
			    font-size: 1em;
			    color: #2775e7;
			}
			.downIconStyle:hover {
				color: #1e5cb7;
			}
			
		</style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
        
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
           
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">FAQ</h1>
                        <p class="lead fw-normal text-muted mb-0">자주 묻는 질문</p>
                    </div>
                    <div class="row gx-5">
                        <div class="col-xl-8">
                        
                            <!-- FAQ Accordion 1-->
                            <div class="accordion mb-5" id="accordionExample">
                            
	                            <c:forEach var="row" items="${list}" varStatus="status">
	                            
	                            	<c:choose>
		                            	<c:when test="${status.first}">
			                            	<div class="accordion-item">
			                                    <h3 class="accordion-header" id="heading${row.faqId}"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${row.faqId}" aria-expanded="true" aria-controls="collapse${row.faqId}">${row.title}</button></h3>
			                                    <div class="accordion-collapse collapse show" id="collapse${row.faqId}" aria-labelledby="heading${row.faqId}" data-bs-parent="#accordionExample">
			                                        <div class="accordion-body">
			                                            ${row.cnt}
			                                            <div class="fileArea"  data-faq-id="${row.faqId}"></div>
			                                        </div>
			                                    </div>
			                                </div>
		                            	</c:when>
		                            	
		                            	<c:otherwise>
			                            	<div class="accordion-item">
			                                    <h3 class="accordion-header" id="heading${row.faqId}"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${row.faqId}" aria-expanded="false" aria-controls="collapse${row.faqId}">${row.title}</button></h3>
			                                    <div class="accordion-collapse collapse" id="collapse${row.faqId}" aria-labelledby="heading${row.faqId}" data-bs-parent="#accordionExample">
			                                        <div class="accordion-body">
			                                            ${row.cnt}
			                                            <div class="fileArea"  data-faq-id="${row.faqId}"></div>
			                                        </div>
			                                    </div>
			                                </div>
		                            	</c:otherwise>
	                            	</c:choose>
	                            	
	           
	           					</c:forEach>
	           					
                            </div>
                            
                            <div id="pageBox">
                            
                            <ul class="pagination">
									
					 			<c:choose>
							        <c:when test="${pageInfo.currentPageNo<=1}">
							        </c:when>
							
							    <c:otherwise>
							    	<li class="page-item"><a class="page-link" href="/service/faq.do?page=${pageInfo.currentPageNo-1}">이전</a></li>
							    </c:otherwise>
							    </c:choose>
							    
							    <c:forEach begin="${pageInfo.firstPageNoOnPageList}" end="${pageInfo.lastPageNoOnPageList}" var="i" step="1">
								    <c:choose>
								        <c:when test="${i eq pageInfo.currentPageNo}">
								            <li class="page-item"><a class="page-link select">${i}</a></li>
								        </c:when>
								
								        <c:otherwise>
								        	<li class="page-item"><a class="page-link" href="/service/faq.do?page=${i}">${i}</a></li>
								        </c:otherwise>
								
									</c:choose>
								</c:forEach>
								
								<c:choose>
						            <c:when test="${pageInfo.currentPageNo>=pageInfo.totalPageCount}">
						            </c:when>
						            <c:otherwise>
						            	<li class="page-item"><a class="page-link" href="/service/faq.do?page=${pageInfo.currentPageNo+1}">다음</a></li>
						            </c:otherwise>
						        </c:choose>
						        
						        </ul> 
                            
                            </div>
                           
                        </div>
                        <div class="col-xl-4">
                            <div class="card border-0 bg-light mt-xl-5">
                                <div class="card-body p-4 py-lg-5">
                                    <div class="d-flex align-items-center justify-content-center">
                                        <div class="text-center">
                                            <div class="h6 fw-bolder">더 물어보고 싶은 것이 있다면?</div>
                                            <p class="text-muted mb-4">
                                                연락하세요
                                                <br />
                                                <a href="#!">seunga906@gmail.com</a>
                                            </p>
                                            <div class="h6 fw-bolder">구독하세요</div>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-twitter"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-facebook"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-linkedin"></i></a>
                                            <a class="fs-5 px-2 link-dark" href="#!"><i class="bi-youtube"></i></a>
                                        </div>
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
        
        <script>
		    $(document).ready(function() {
		        
		        function loadFileData(faqId, fileArea) {
		            $.ajax({
		                type: 'get',
		                url: '/service/faqFile.do',
		                data: { faqId: faqId },
		                dataType: 'json',
		                contentType : "application/json; charset:UTF-8",
		                success: function(data) {
		                	console.log(data);
		                    var imgFile = "";
		                    var downFile = "";
		                    
		                    data.forEach(function(row) {
		                        if (row.faqFileOriName.includes(".png") || row.faqFileOriName.includes(".jpg")) {
		                        	var path = "/faqfile/" + row.faqFileOriName;
		                        	imgFile += "<div class='imgSize' ><img src='" + path + "' alt='" + row.faqFileOriName + "' /></div>";
		                        } else {
		                        	var path = row.faqFileOriName;
		                        	downFile += "<div class='downFileBox'><form class='downloadFileForm' method='post'><input type='hidden' name='fileName' value='" + path + "'><a class='downLinkStyle'>" + row.faqFileName + "</a><i class='fa-solid fa-download fa-lg fileIcon downIconStyle'></i></form></div>";
		                        	
		                        }
		                    });
		                    fileArea.html("<div class='imgArea'>" + imgFile + "</div>");
		                    fileArea.append("<div class='notImgArea'>" + downFile + "</div>");
		                },
		                error: function() {
		                    console.error('Failed to load file data for faqId:', faqId);
		                }
		            });
		        }

		        $('.accordion-collapse.show').each(function() {
		            var fileArea = $(this).find('.fileArea');
		            var faqId = fileArea.data('faq-id');
		            loadFileData(faqId, fileArea);
		        });

		        $('.accordion-collapse').on('show.bs.collapse', function () {
		            var fileArea = $(this).find('.fileArea');
		            var faqId = fileArea.data('faq-id');
		            loadFileData(faqId, fileArea);
		        });
		        
		        $(document).on('click', '.downFileBox', function(event) {
		            event.preventDefault(); 

		            let form = $(this).find('form');  

		            form.attr('action', '/service/fileDownload.do'); 
	                form.submit();
		        });
		    });
		    
		    
		</script>
        
    </body>
</html>