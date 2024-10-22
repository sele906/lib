<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-light">
                <div class="container px-5">
                    <a class="navbar-brand" href="/">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        
                            <li class="nav-item"><a class="nav-link" href="/info/about.do">도서관안내</a></li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownJoin" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">자료찾기</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownJoin">
                                    <li><a class="dropdown-item" href="/books/search.do">통합검색</a></li>
                                    <li><a class="dropdown-item" href="/books/newBooks.do">신착자료</a></li>
                                    <li><a class="dropdown-item" href="/books/bestBooks.do">베스트자료</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item"><a class="nav-link" href="/info/guidlines.do">이용안내</a></li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownJoin" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">신청/참여</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownJoin">
                                    <li><a class="dropdown-item" href="/service/wishBooks.do">희망도서 신청</a></li>
                                    <li><a class="dropdown-item" href="/service/programs.do">프로그램 신청</a></li>
                                    <li><a class="dropdown-item" href="/service/multiSeats.do">멀티미디어 좌석예약</a></li>
                                    <li><a class="dropdown-item" href="/service/qna.do">QNA</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMyPage" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">내서재</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMyPage">
                                    <li><a class="dropdown-item" href="/mypage/loanList.do">대출 조회/연기</a></li>
                                    <li><a class="dropdown-item" href="/mypage/loanHistory.do">대출이력</a></li>
                                    <li><a class="dropdown-item" href="/mypage/resvList.do">예약도서조회</a></li>
                                    <li><a class="dropdown-item" href="/mypage/wishList.do">희망도서 신청내역</a></li>
                                    <li><a class="dropdown-item" href="/mypage/programList.do">프로그램 신청 내역</a></li>
                                    <li><a class="dropdown-item" href="/mypage/seatList.do">좌석 예약 조회</a></li>
                                    <li><a class="dropdown-item" href="/mypage/likedList.do">관심도서 조회</a></li>
                                </ul>
                            </li>
                            
                            <!-- 로그인/회원가입 -->
                            <li class="nav-item"><a class="nav-link" href="/member/login.do">로그인</a></li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">회원가입</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form id="joinForm" action="/member/join.do" method="post">
                                
	                                <!-- User Role Toggle-->
					                <div class="mb-3">
					                    <div class="d-flex align-items-center">
					                        <div class="form-check me-3">
					                            <input class="form-check-input" type="radio" id="roleUser" name="level" value="ROLE_USER" checked="checked" required>
					                            <label class="form-check-label" for="roleUser">사용자</label>
					                        </div>
					                        <div class="form-check">
					                            <input class="form-check-input" type="radio" id="roleAdmin" name="level" value="ROLE_ADMIN" required>
					                            <label class="form-check-label" for="roleAdmin">관리자</label>
					                        </div>
					                    </div>
					                </div>
                                
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="name" name="name" type="text" placeholder="이름을 입력하세요" required/>
                                        <label for="name">이름</label>
                                    </div>
                                    
                                    <!-- Userid input-->
                                    <div class="mb-3 d-flex">
										<div class="form-floating flex-grow-1 me-2">
										    <input class="form-control" id="userid" name="userid" type="text" placeholder="아이디를 입력하세요" required />
										    <label for="userid">아이디</label>
									    </div>
									    <button class="btn btn-primary" id="checkUserid" >중복확인</button>
									</div>
                                    
                                    <!-- Passwd  input-->
									<div class="form-floating mb-1">
									    <input class="form-control" id="passwd" name="passwd" type="password" placeholder="비밀번호를 입력하세요" required />
									    <label for="passwd">비밀번호</label>
									    <div id="regexCheck" style="color: red; font-size: 12px; padding: 3px 0 5px 0;"></div>
									</div>
									
									<!-- Password confirmation input-->
									<div class="form-floating mb-3">
									    <input class="form-control" id="passwd-chk" type="password" placeholder="다시 한번 입력하세요" required />
									    <label for="passwd-chk">비밀번호 확인</label>
									    <div id="passwdCheck" style="color: red; font-size: 12px; padding: 3px 0 5px 0;"></div>
									</div>
                                    
                                    <!-- Birth input -->
									<div class="mb-3">
									    <label for="birth">생년월일</label>
									    <div class="d-flex" style="gap: 10px;">
									        <select class="form-select" id="year" name="year" required>
									            <option value="">년</option>
									            <c:forEach var="i" begin="0" end="${2024-1900}">
									                <c:set var="yearOption" value="${2024-i}" />
									                <option value="${yearOption}">${yearOption}</option>
									            </c:forEach>
									        </select>
									
									        <select class="form-select" id="month" name="month" required>
									            <option value="">월</option>
									            <c:forEach var="i" begin="1" end="12">
									                <option value="${i}">${i}</option>
									            </c:forEach>
									        </select>
									
									        <select class="form-select" id="day" name="day" required>
									            <option value="">일</option>
									            <c:forEach var="i" begin="1" end="31">
									                <option value="${i}">${i}</option>
									            </c:forEach>
									        </select>
									        
									        <input type="hidden" id="birthdate" name="birthdate" value="">
									    </div>
									</div>
                                    
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="phone" name="phone" type="tel" placeholder="1234567890" required/>
                                        <label for="phone">전화번호</label>
                                    </div>
                                    
                                    <!-- Email address input-->
                                    <div class="mb-3 d-flex">
								    <div class="form-floating flex-grow-1 me-2">
								        <input class="form-control" id="email" name="email" type="email" placeholder="name" required />
								        <label for="email">이메일 주소</label>
								    </div>
								    <button class="btn btn-primary" id="mailChk" >인증하기</button>
									</div>
                                    
                                    <!-- Address input-->
									<div class="mb-3 d-flex">
										<div class="form-floating flex-grow-1 me-2">
										    <input class="form-control" id="addr1" name="addr1" type="text" placeholder="주소를 입력하세요" required />
										    <label for="addr1">주소</label>
									    </div>
									    <button class="btn btn-primary" id="findAddr" >주소 찾기</button>
									</div>
									
									<!-- Detailed address input-->
									<div class="form-floating mb-3">
									    <input class="form-control" id="addr2" name="addr2" type="text" placeholder="상세주소를 입력하세요" />
									    <label for="addr2">상세주소</label>
									</div>

                                    <!-- Submit Button-->
                                    <div class="d-grid"><button class="btn btn-primary btn-lg" id="submitButton" >가입하기</button></div>
                                </form>
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
        
        
        <!-- javascript -->
    	<script>
		$(document).ready(function() {
		    
		    var emailChk = false;
		    var idChk = false;
		    
		    //아이디 중복확인
		    $("#checkUserid").on('click', function(event){
		        
		        if ($("#userid").val().length > 20) {
		            alert('아이디는 20자 이내로 입력해야 합니다.');
		            $("#userid").focus();
		        } else {
		            $.ajax({
			            url: '/member/useridCheck.do',
			            method: 'post',
			            dataType : 'text',
			            data : {'userid' : $("#userid").val()},
			            success: function (data) {
			                if (data == 'unusable') {
			                    idChk = false;
			                    alert('이미 있는 아이디 입니다.');
			                } else if (data == 'usable') {
			                    idChk = true;
			                    alert('사용가능한 아이디 입니다.');
			                }
			            }
			        });
		        }
		    });
		    
		    //아이디 수정 감지
		    $('#userid').keyup(function() {
		        idChk = false;
		    });
		    
		    //비밀번호 확인
		    $('#passwd').keyup(function() {
		        
		        //정규식
		        var passwdRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;
		        
		       	if (!passwdRegex.test($('#passwd').val())) {
		       		$('#regexCheck').text("대문자, 숫자, 특수기호를 포함해주세요");
		       	} else if (passwdRegex.test($('#passwd').val())) {
		       	 $('#regexCheck').text("");
		       	}
		    });
		    
		    $('#passwd-chk').keyup(function() {
		        if ($('#passwd-chk').val() != $('#passwd').val()) {
		            $('#passwdCheck').text("비밀번호가 일치하지 않습니다.");
		        } else if ($('#passwd-chk').val() == $('#passwd').val()) {
		            $('#passwdCheck').text("");
		        }
		    });
		    
		    
		    
		    //메일 인증
		    $('#mailChk').on('click', function(event){
		        
		        var email = $('#email').val();
		        
		        if (email == '') { 
		            alert('이메일을 입력하세요');
		            $("#email").focus();
		        } else {
		            $.ajax({
						type: 'post',
						url: '/member/mailSend.do',
						data: {
						    email: email,
						    msgType: 'emailChk'
						}, 
						success: function (response) {
						    if (response != null) {
						        let checkBox = prompt('메일로 인증 코드를 발송했습니다. 인증코드를 입력해주세요');
						        if (checkBox == response) {
						            emailChk = true;
						            alert('인증되었습니다.');
						        }
		                    }
					    },
					    error: function(error) {
					        alert('인증에 실패했습니다. 메일을 다시 인증해주세요');
						}
					});
		        }
		    });
		    
		  //주소 찾기
		    $("#findAddr").on('click', function(event){
		        new daum.Postcode({
		            oncomplete: function(data) {
		                
		                var extraRoadAddr = "";
		                
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                
		                $('#addr1').val(data.roadAddress);
		                $('#addr2').val(extraRoadAddr);
		             }
		        }).open();
		    });
		    
		  //가입하기
		    $("#submitButton").on('click', function(event){
		        
		      //날짜 생성
		        var birthdate = $("#year").val() + "-" + $("#month").val().padStart(2, '0') + "-" + $("#day").val().padStart(2, '0');

		        $("#birthdate").val(birthdate);
		        
		        console.log($("#birthdate").val(birthdate));
		        
		        $('#joinForm').submit();
		    });
		    
		});
		    
		    
		</script>
        
    </body>
</html>