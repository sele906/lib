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
        <title>LiBLIO - 로그인</title>
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
		    .info-link {
		        text-decoration: none; 
		    }
		
		    .info-link:hover {
		        text-decoration: underline; 
		    }
		    
		    .btnStyle {
				font-weight: bold;
			}
		</style>
        
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
        
            <!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
            
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">로그인</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form id="loginForm" action="/login" method="post">
                                    
                                    <!-- Userid input-->
                                    <div class="form-floating mb-1">
                                        <input class="form-control" id="userid" name="userid" type="text" placeholder="아이디를 입력하세요" required/>
                                        <label for="userid">아이디</label>
                                    </div>
                                    
                                    <!-- Passwd  input-->
									<div class="form-floating mb-3">
									    <input class="form-control" id="passwd" name="passwd" type="password" placeholder="비밀번호를 입력하세요" required />
									    <label for="passwd">비밀번호</label>
									</div>

                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg btnStyle" id="submitButton" type="submit">로그인</button></div>
                                </form>
                                
                                <div class="d-flex justify-content-between mt-3">
						            <a href="/member/findInfo.do" class="info-link text-muted">아이디/비밀번호 찾기</a>
						            <a href="/member/join.do" class="info-link text-muted">회원가입</a>
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
        
        <%@ include file="../common/Alert.jsp" %> 
        
        <c:if test="${msg eq 'notmatch'}">
			<script>sweet.warningAlert('', '아이디 혹은 비밀번호가 맞지 않습니다.')</script>
		</c:if>
		
		<c:if test="${msg eq 'success'}">
			<script>sweet.successAlert('가입되었습니다','아이디와 비밀번호를 입력해주세요.')</script>
		</c:if>
		
		<c:if test="${msg eq 'logout'}">
			<script>sweet.successAlert('로그아웃 되었습니다.')</script>
		</c:if>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
        
        
    </body>
</html>