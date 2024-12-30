<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<style>
	nav {
	  border-bottom: 1px solid #efefef;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <div class="container px-5">
        <a class="navbar-brand" href="/main.do">
        	LiBLIO
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            
                <li class="nav-item"><a class="nav-link" href="/info/about.do"><b>도서관안내</b></a></li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownJoin" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><b>자료찾기</b></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownJoin">
                        <li><a class="dropdown-item" href="/books/search.do">통합검색</a></li>
                        <li><a class="dropdown-item" href="/books/newBooks.do">신착자료</a></li>
                        <li><a class="dropdown-item" href="/books/bestBooks.do">베스트자료</a></li>
                    </ul>
                </li>
                
                <li class="nav-item"><a class="nav-link" href="/info/guidlines.do"><b>이용안내</b></a></li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownJoin" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><b>신청/참여</b></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownJoin">
                        <li><a class="dropdown-item" href="/service/wishBooks.do">희망도서 신청</a></li>
                        <li><a class="dropdown-item" href="/service/multiSeats.do">멀티미디어 좌석예약</a></li>
                        <li><a class="dropdown-item" href="/service/faq.do">FAQ</a></li>
                    </ul>
                </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMyPage" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><b>내서재</b></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMyPage">
                        <li><a class="dropdown-item" href="/mypage/loanList.do">대출 조회/연기</a></li>
                        <li><a class="dropdown-item" href="/mypage/loanHistory.do">대출이력</a></li>
                        <li><a class="dropdown-item" href="/mypage/resvList.do">예약도서 조회</a></li>
                        <li><a class="dropdown-item" href="/mypage/wishList.do">희망도서 신청내역</a></li>
                        <li><a class="dropdown-item" href="/mypage/seatList.do">좌석 예약 조회</a></li>
                        <li><a class="dropdown-item" href="/mypage/likedList.do">관심도서 조회</a></li>
                        <li><a class="dropdown-item" href="/mypage/memIndex.do">회원정보 수정</a></li>
                    </ul>
                </li>
                
                <!-- 관리자 -->
                <c:if test="${sessionScope.level == 'ADMIN'}">
                	<li class="nav-item"><a class="nav-link" href="/admin/books/bookList.do"><b>관리자</b></a></li>
                </c:if>
                
                <!-- 로그인/회원가입 -->
                <c:if test="${sessionScope.userid != null}">
                	<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
                </c:if>
                <c:if test="${sessionScope.userid == null}">
                	<li class="nav-item"><a class="nav-link" href="/member/login.do">로그인</a></li>
                </c:if>
                
            </ul>
        </div>
    </div>
</nav>

</html>