<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <div class="sb-sidenav-menu-heading">자료</div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBooks" aria-expanded="false" aria-controls="collapseBooks">
                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                자료 관리
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapseBooks" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                	<a class="nav-link" href="/admin/books/wishList.do">희망도서 등록</a>
                    <a class="nav-link" href="/admin/books/addBook.do">자료등록</a>
                    <a class="nav-link" href="/admin/books/bookList.do">자료관리</a>
                </nav>
            </div>
            
            <a class="nav-link" href="/admin/loan/loanList.do">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                	대출/반납/연체 관리
            </a>
            
            
            <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLoans" aria-expanded="false" aria-controls="collapseLoans">
                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                대출/반납/연체 관리
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapseLoans" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/admin/loan/loanList.do">대출/반납 관리</a>
                    <a class="nav-link" href="/admin/loan/overdueList.do">연체 관리</a>
                </nav>
            </div> -->
            
            
            <div class="sb-sidenav-menu-heading">회원관리</div>
            <a class="nav-link" href="/admin/member/list.do">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                	회원조회
            </a>
            
            <div class="sb-sidenav-menu-heading">도서관 관리</div>
            <a class="nav-link" href="/admin/seat/seatList.do">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
             	멀티미디어  좌석조회
            </a>
            <a class="nav-link" href="/admin/qna/list.do">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                	FAQ 조회
            </a>
            
            <div class="sb-sidenav-menu-heading">통계관리</div>
            <a class="nav-link" href="/admin/statics/statics.do">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                	통계관리
            </a>
        </div>
    </div>
    <div class="sb-sidenav-footer">
        <div class="small">Logged in as:</div>
        Start Bootstrap
    </div>
</nav>
</html>