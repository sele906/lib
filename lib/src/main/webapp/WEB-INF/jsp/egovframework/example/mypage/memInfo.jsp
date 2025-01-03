<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>LiBLIO - 회원정보 수정</title>
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
                            <h1 class="fw-bolder">회원정보 수정</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form id="updateForm" action="/mypage/updateMem.do" method="post">
                                
					                <input type="hidden" name = "level" value="${info.level}">
                                
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="name" name="name" type="text" placeholder="이름을 입력하세요" value="${info.name}"/>
                                        <label for="name">이름</label>
                                    </div>
                                    
                                    <!-- Userid input-->
                                    <input type="hidden" name = "userid" value="${info.userid}">
                                    
                                    <!-- Passwd  input-->
									<div class="form-floating mb-1">
									    <input class="form-control" id="passwd" name="passwd" type="password" placeholder="비밀번호를 입력하세요"/>
									    <label for="passwd">비밀번호</label>
									    <div id="regexCheck" style="color: red; font-size: 12px; padding: 3px 0 5px 0;"></div>
									</div>
									
									<!-- Password confirmation input-->
									<div class="form-floating mb-3">
									    <input class="form-control" id="passwd-chk" type="password" placeholder="다시 한번 입력하세요" />
									    <label for="passwd-chk">비밀번호 확인</label>
									    <div id="passwdCheck" style="color: red; font-size: 12px; padding: 3px 0 5px 0;"></div>
									</div>
                                    
                                    <!-- Birth input -->
									<div class="mb-3">
									    <label for="birth">생년월일</label>
									    
									    <!-- Extract year, month, and day from the birth date -->
									    <c:set var="birthYear" value="${fn:substring(info.birth, 0, 4)}" />
									    <c:set var="birthMonth" value="${fn:substring(info.birth, 5, 7)}" />
									    <c:set var="birthDay" value="${fn:substring(info.birth, 8, 10)}" />
									    
									    <div class="d-flex" style="gap: 10px;">
									        <!-- Year select box -->
									        <select class="form-select" id="year" name="year" required>
									            <option value="">년</option>
									            <c:forEach var="i" begin="0" end="${2024-1900}">
									                <c:set var="yearOption" value="${2024-i}" />
									                <option value="${yearOption}" ${yearOption == birthYear ? 'selected' : ''}>${yearOption}</option>
									            </c:forEach>
									        </select>
									
									        <!-- Month select box -->
									        <select class="form-select" id="month" name="month" required>
									            <option value="">월</option>
									            <c:forEach var="i" begin="1" end="12">
									                <option value="${i}" ${i == birthMonth ? 'selected' : ''}>${i}</option>
									            </c:forEach>
									        </select>
									
									        <!-- Day select box -->
									        <select class="form-select" id="day" name="day" required>
									            <option value="">일</option>
									            <c:forEach var="i" begin="1" end="31">
									                <option value="${i}" ${i == birthDay ? 'selected' : ''}>${i}</option>
									            </c:forEach>
									        </select>
									
									        <input type="hidden" id="birthdate" name="birthdate" value="">
									    </div>
									</div>
                                    
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="phone" name="phone" type="tel" placeholder="1234567890" value="${info.phone}"/>
                                        <label for="phone">전화번호</label>
                                    </div>
                                    
                                    <!-- Email address input-->
                                    <div class="mb-3 d-flex">
								    <div class="form-floating flex-grow-1 me-2">
								        <input class="form-control" id="email" name="email" type="email" placeholder="name" value="${info.email}"/>
								        <label for="email">이메일 주소</label>
								    </div>
								    <button type="button" class="btn btn-primary btnStyle" id="mailChk" >인증하기</button>
									</div>
                                    
                                    <!-- Address input-->
									<div class="mb-3 d-flex">
										<div class="form-floating flex-grow-1 me-2">
										    <input class="form-control" id="addr1" name="addr1" type="text" placeholder="주소를 입력하세요" value="${info.addr1}"/>
										    <label for="addr1">주소</label>
									    </div>
									    <button type="button" class="btn btn-primary btnStyle" id="findAddr" >주소찾기</button>
									</div>
									
									<!-- Detailed address input-->
									<div class="form-floating mb-3">
									    <input class="form-control" id="addr2" name="addr2" type="text" placeholder="상세주소를 입력하세요" value="${info.addr2}"/>
									    <label for="addr2">상세주소</label>
									</div>

                                    <!-- Submit Button-->
                                    <div class="d-grid">
                                    <button type="button" class="btn btn-primary btn-lg mb-2 btnStyle" id="submitButton" onclick="updateMem()" >수정하기</button>
                                    <button type="button" class="btn btn-danger btn-lg btnStyle" id="quitButton" onclick="quitMem()" >탈퇴하기</button></div>
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
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; LiBLIO 2024</div></div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/template/user/js/scripts.js"></script>
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <%@ include file="../common/Alert.jsp" %> 
        
        <!-- javascript -->
    	<script>
    	
    	var emailChk = true;
	    
		$(document).ready(function() {
		    
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
		            sweet.warningAlert('','이메일을 입력하세요');
		            $("#email").focus();
		        } else {
		            
		            const toast1 = sweet.toast('메일을 보내는 중입니다. 잠시만 기다려주세요...', 5000);
		            
		            $.ajax({
						type: 'post',
						url: '/member/mailSend.do',
						data: {
						    email: email,
						    msgType: 'emailChk'
						}, 
						success: function (response) {
						    if (response != null) {
						        
						        toast1.close();
						        
						        sweet.modal('메일을 발송했습니다.', '인증코드를 입력해주세요.',
						                function(inputCode){ 
								            if (inputCode == response) {
								                sweet.successAlert('','인증되었습니다.');
							                    emailChk = true;
							                } else {
							                    sweet.errorAlert('','인증 코드가 일치하지 않습니다.');
							                }
						            	});
		                    }
					    },
					    error: function(error) {
					        sweet.errorAlert('인증에 실패했습니다.', '다시 인증해주세요');
						}
					});
		        }
		    });
		    
		  //메일 수정 감지
		    $('#email').keyup(function() {
		        emailChk = false;
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
		    
		});
		
		//수정하기
		function updateMem() {
		    
		  	//날짜 생성
	        var birthdate = $("#year").val() + "-" + $("#month").val().padStart(2, '0') + "-" + $("#day").val().padStart(2, '0');
			$("#birthdate").val(birthdate);
			
			//유효성 검사
	        if ($("#name").val() == '') { //이름
	            sweet.warningAlert('', '이름을 입력하세요.');
	            $("#name").focus();
	        } else if ($("#name").val().length > 20) {
	            sweet.warningAlert('', '이름은 20자 이내로 입력해야 합니다.');
	            $("#name").focus();
	        } else if ($("#year").val() == '') { //연도
	            sweet.warningAlert('', '연도를 선택하세요.');
	            $("#year").focus();
	        } else if ($("#month").val() == '') { //월
	            sweet.warningAlert('', '월을 선택하세요.');
	            $("#month").focus();
	        } else if ($("#day").val() == '') { //일
	            sweet.warningAlert('', '일을 선택하세요.');
	            $("#day").focus();
	        } else if ($("#passwd").val() == '') { //비밀번호
	            sweet.warningAlert('', '비밀번호를 입력하세요.');
	            $("#passwd").focus();
	        } else if ($("#passwd").val().length < 8) {
	            sweet.warningAlert('', '비밀번호는 8자 이상 입력해야 합니다.');
	            $("#passwd").focus();
	        } else if ($("#passwd-chk").val() == '') { //비밀번호 확인
	            sweet.warningAlert('', '비밀번호를 확인하세요');
	            $("#passwd-chk").focus();
	        } else if ($("#phone").val() == '') { //전화번호
	            sweet.warningAlert('', '전화번호를 입력하세요');
	            $("#phone").focus();
	        } else if ($("#phone").val().length > 15) {
	            sweet.warningAlert('', '전화번호는 15자 이내로 입력해야 합니다.');
	            $("#phone").focus();
	        } else if ($("#email").val() == '') { //이메일
	            sweet.warningAlert('', '이메일을 입력하세요');
	            $("#email").focus();
	        } else if (emailChk == false) { //이메일
	            sweet.warningAlert('', '이메일 인증을 해주세요');
	            $("#email").focus();
	        } else if ($("#email").val().length > 320) {
	            sweet.warningAlert('', '이메일은 320자 이내로 입력해야 합니다.');
	            $("#email").focus();
	        } else if ($("#addr1").val() == '') { //주소
	            sweet.warningAlert('', '주소를 입력하세요');
	            $("#addr1").focus();
	        } else if ($("#addr2").val() == '') { //상세주소
	            sweet.warningAlert('', '상세주소를 입력하세요');
	            $("#addr2").focus();
	        } else {
	            sweet.confirm('', '회원정보를 수정하시겠습니까?', function() {
	                $('#updateForm').submit();
	            });
	        }
		}
		
		function quitMem() {
		    sweet.confirm('', '탈퇴하시겠습니까?', function() {
		        location.href = "/mypage/deleteMem.do";
            });
		}
		    
		</script>
        
    </body>
</html>