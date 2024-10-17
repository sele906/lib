<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 - 자료등록</title>
        <!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
        <link href="/template/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <!-- grid -->
        <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
		<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
		
		<style>
		
		/* 개인설정 */
		.toastWord {
			word-break: break-all;
			word-wrap: break-word;
			white-space: normal;
		}
		.tui-grid-table {
    	    font-family: 'Nanum Gothic';
	    }
		
		</style>
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin/main/main.do">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
        	<div id="layoutSidenav_nav">
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
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLoans" aria-expanded="false" aria-controls="collapseLoans">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                대출/반납 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLoans" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/loan/loanList.do">대출관리</a>
                                    <a class="nav-link" href="/admin/loan/resvList.do">예약관리</a>
                                    <a class="nav-link" href="/admin/loan/overdueList.do">연체관리</a>
                                </nav>
                            </div>
                            
                            
                            <div class="sb-sidenav-menu-heading">회원관리</div>
                            <a class="nav-link" href="/admin/member/list.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	회원조회
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">도서관 관리</div>
                            <a class="nav-link" href="/admin/program/list.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                	프로그램 조회
                            </a>
                            <a class="nav-link" href="/admin/seat/seatList.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                             	멀티미디어  좌석조회
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
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">자료등록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin/main/main.do">관리자</a></li>
                            <li class="breadcrumb-item active">자료등록</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                서지정보 API를 통해 필요한 책을 편리하게 등록할 수 있습니다.
                                <a target="_blank" href="https://www.nl.go.kr/NL/contents/N31101030700.do">서지정보 API 활용방법</a>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                            	<span>검색</span>
                                <span>희망도서 목록보기</span>
                            </div>
                            
                            <div class="card-body">
                            
                            <!-- 그리드 -->
                            <div id="grid"></div>

                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/template/admin/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <!-- <script src="/template/admin/js/datatables-simple-demo.js"></script> --> 
        
        <script type="text/javascript">
        
        $(document).ready(function() {
            
          //그리드 초기화
    	    tui.Grid.applyTheme('default', {
    	        row: {
                    hover: {
                      background: '#ecf7fc'
                    }
                  },
                  cell: {
                    normal: {
                      background: '#fff',
                      border: '#e0e0e0',
                      showVerticalBorder: true,
                      showVerticalBorder: true
                    },
                    header: {
                      background: '#f9f9f9',
                      border: '#e0e0e0'
    	            },
    	        }
    	    });
            //그리드
            drawGrid();
		});
        
    	//그리드
    	function drawGrid() {
    	
    	    //초기화
    		$("#grid").empty();
    	    
    	    apiData = {};
    		
    		$.ajax({
    		    async: false,
				type:'get',
				url:'/admin/books/apiData.do',
				data:{},
				dataType:'json',
				success : function(data){ 
				    console.log(data);
				    apiData = data;
				}
			});
    		
    		 const grid = new tui.Grid({
    		        el: document.getElementById('grid'),
    		        data: apiData,
    		        scrollX: false,
    		        scrollY: true,
    		        columns: [
    		          {
    		            header: '자료구분',
    		            name: 'type_name',
    		            align: "center",
    		            whiteSpace: 'normal',
    		            width: 100
    		          },
    		          {
      		            header: '주제구분',
      		            name: 'kdc_name_1s',
      		            align: "center",
      		          	whiteSpace: 'normal',
      		            width: 100
      		          },
    		          {
    		            header: '제목',
    		            name: 'title_info',
    		            align: "center",
    		            whiteSpace: 'normal',
    		            formatter: function(value) {
						    var detailUrl = value.row.detail_link.toString(); 
							return "<a href=https://www.nl.go.kr/" + detailUrl + ">" + value.value + "</a>";
						}
    		          },
    		          {
      		            header: '저자',
      		            name: 'author_info',
      		            align: "center",
      		          	whiteSpace: 'normal',
      		            width: 150
      		          },
    		          {
       		            header: '출판사',
       		            name: 'pub_info',
       		            align: "center",
       		         	whiteSpace: 'normal',
       		            width: 120
       		          },
    		          {
       		            header: '청구기호',
       		            name: 'call_no',
       		            align: "center",
						whiteSpace: 'normal',
       		            width: 120
       		          },
    		          {
       		            header: '등록',
       		            name: 'uniqueKey',
       		            align: "center",
						whiteSpace: 'normal',
       		            width: 60,
       		         	formatter: function(value) {
       		         	    var uniqueKey = value.value.toString().substring(8);
       		         		return "<button onclick='getBook()'>등록</button>";
						}
       		          },
    		       ]
    		  });
    	}
    	
    	/* function getBook() {
    	    alert('hello');
    	} */
        
        </script>
    </body>
</html>