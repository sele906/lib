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
        <title>LiBLIO - 아이디/비밀번호 찾기</title>
		<!-- Favicon-->
        <link rel="icon" href="/template/favicon.ico">
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
	        .menuLink {
	        	color: gray;
	        }
	        .findBtn {
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
				        <h1 class="fw-bolder">아이디/비밀번호 찾기</h1>
				    </div>
				
				    <div class="row gx-5 justify-content-center">
				        <div class="col-lg-8 col-xl-6">
				
				            <ul class="nav nav-tabs">
				                <li class="nav-item" style="width: 50%;">
				                    <a class="nav-link active text-center menuLink" href="#tab1" data-bs-toggle="tab">아이디 찾기</a>
				                </li>
				                <li class="nav-item" style="width: 50%;">
				                    <a class="nav-link text-center menuLink" href="#tab2" data-bs-toggle="tab">비밀번호 찾기</a>
				                </li>
				            </ul>
				
				            <div class="tab-content">
				            
				            	<!-- 아이디 찾기 -->
				                <div class="tab-pane fade show active" id="tab1">
				                    <div class="row gx-5 justify-content-center">
				                        <div class="col-lg-8 col-xl-9">
				                        
				                        	<div class="form-floating mt-5 mb-2">
				                                <input type="text" class="form-control" id="name" placeholder="전화번호를 입력하세요">
				                            	<label for="name">이름</label>
				                            </div>
				                            
				                            <div class="form-floating my-2">
				                                <input type="text" class="form-control" id="phone" placeholder="전화번호를 입력하세요">
				                            	<label for="phone">전화번호</label>
				                            </div>
				                            <button class="btn btn-primary w-100 mb-5 btn-lg findBtn" id="findId">인증하기</button>
				                        </div>
				                    </div>
				                </div>
				                
				                <!-- 비밀번호 찾기 -->
				                <div class="tab-pane fade" id="tab2">
				                    <div class="row gx-5 justify-content-center">
				                        <div class="col-lg-8 col-xl-9">
				                            <div class="form-floating mt-5 mb-2">
				                                <input type="text" class="form-control" id="userid" placeholder="아이디를 입력하세요">
				                                <label for="userid">아이디</label>
				                            </div>
				                            <button class="btn btn-primary w-100 mb-5 btn-lg findBtn" id="findPwd">인증하기</button>
				                        </div>
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
        
        <%@ include file="../common/Alert.jsp" %> 
        
        <!-- script -->
		<script>
			$(document).ready(function() {
			    
			    //아이디 찾기
			    $('#findId').on('click', function(event){
			        
			        if ($("#name").val() == '') {
			            sweet.warningAlert('', '이름을 입력하세요');
			            $("#name").focus();
			            return;
			        } else if ($("#phone").val() == '') {
			            sweet.warningAlert('', '전화번호를 입력하세요');
			            $("#phone").focus();
			            return;
			        } 
			        
			        $.ajax({
						type: 'post',
						url: '/member/infoFind.do',
						data: {
						    name: $("#name").val(),
						    phone: $("#phone").val(),
						    type: 'findId'
						}, 
						dataType: 'json',
						success: function (response) {
						    
						    if (response.userid != null) {
						        sweet.infoAlert('', '회원님의 아이디는 ' + response.userid + '입니다.');
						    } else if (response == 'error') {
						        sweet.errorAlert('','잘못된 아이디 또는 비밀번호 입니다.');
						    } else {
						        sweet.errorAlert('',('잘못된 아이디 또는 비밀번호 입니다.');
						    }
					    },
					    error: function(error) {
					        sweet.errorAlert('','잘못된 아이디 또는 비밀번호 입니다.');
						}
					});
			    });
			    
			    //비밀번호 찾기
			    $('#findPwd').on('click', function(event){
	
			        if ($("#userid").val() == '') {
			            sweet.warningAlert('','아이디를 입력하세요.');
			            $("#userid").focus();
			            return;
			        } 
			        
			        $.ajax({
						type: 'post',
						url: '/member/infoFind.do',
						data: {
						    userid: $("#userid").val(),
						    type: 'findEmail'
						}, 
						dataType: 'json',
						success: function (response) {
						    
						    const toast1 = sweet.toast('메일을 보내는 중입니다. 잠시만 기다려주세요...', 5000);
						    
						    if (response.email != null) {
						        $.ajax({
									type: 'post',
									url: '/member/mailSend.do',
									data: {
									    email: response.email,
									    userid: $("#userid").val(),
									    msgType: 'pwdChk'
									}, 
									success: function (response) {
									    
									    toast1.close();
									    
									    if (response == 'success') {
									        sweet.successAlert('메일이 발송되었습니다.', '임시 비밀번호로 로그인 해주세요.');
									    } else {
									        sweet.errorAlert('메일발송이 실패했습니다.', '관리자에게 문의하세요');
					                    }
								    },
								    error: function(error) {
								        sweet.errorAlert('메일발송이 실패했습니다.', '관리자에게 문의하세요');
									}
								});
						    } else if (response == 'error') {
						        sweet.errorAlert('','아이디를 확인해주세요.');
						    } else {
						        sweet.errorAlert('','아이디를 확인해주세요.');
						    }
				            
					    },
					    error: function(error) {
					        sweet.errorAlert('','아이디를 확인해주세요.');
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