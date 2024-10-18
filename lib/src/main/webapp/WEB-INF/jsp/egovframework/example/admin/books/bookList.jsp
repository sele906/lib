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
        <title>관리자 - 자료관리</title>
        <!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
        <link href="/template/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <!-- grid -->
        <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
        <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
        <script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
		<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
		
		<style>
		
		/* 개인설정 */
		#infoBar {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			align-items: center;
			margin: 0 0 15px 0;
		}
		#addBook {
			background-color: white;
		    color: #0d6efd;
		    border: 2px solid #0d6efd;
		    padding: 3px 10px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    border-radius: 0;
		}
		#addBook:hover, #addBook:active {
		  background-color: #0d6efd;
		  color: white;
		}
		#searchBar {
			width: 300px;
		}
		
		
		.toastWord {
			word-break: break-word;
			word-wrap: break-word;
			white-space: normal;
		}
		.tui-grid-table {
    	    font-family: 'Nanum Gothic';
	    }
	    
	    /* 이미지 크기 */
	    .imgSize {
	        width: 50px;
    		height: 70px;
    		border: 1px solid #aaaaaa;
	    }
	    .imgFakeBox {
	        height: 70px; 
	        display: flex; 
	        align-items: center; 
	        justify-content: center;
	    }
	    .imgBlank {
	    	border: 1px solid #aaaaaa; 
	    	width: 50px;
    		height: 70px;
    		display: flex; 
	        align-items: center; 
	        justify-content: center;
	    }
	    
	    /* linkButton */
	    .linkButton {
	    	color: #424549;
		    font-size: 0.9em;
		    cursor: pointer;
		    text-decoration: none;
	    }
		
		.linkButton:hover, .linkButton:active {
			color: #424549;
		  	text-decoration: underline;
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
                        <h1 class="mt-4">자료관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">관리자</li>
                            <li class="breadcrumb-item active">자료관리</li>
                            <li class="breadcrumb-item active">자료관리</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                자료를 한곳에서 관리하세요
                            </div>
                        </div>
                        <div class="card mb-4">
                        
                            <div class="card-header">
								<i class="fas fa-table me-1"></i>
                                <a href="/admin/books/wishList.do" class="linkButton">희망도서등록</a>
								|
                                <a href="/admin/books/addBook.do" class="linkButton">자료등록</a>
                                |
                                 <b>자료관리</b>
                            </div>
                            
                            <div class="card-body">
                            
                            <div id="infoBar">
                            	<div><button class="btn btn-primary" id="addBook">등록하기</button></div>
								
                            	<!-- 검색창 -->
                            	<div class="input-group" id="searchBar">
								  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" id="searchInput" value=""/>
								  <button type="button" class="btn btn-outline-primary" id="searchButton" data-mdb-ripple-init>search</button>
								</div>
                            </div>
                            
                            <!-- 그리드 -->
                            <div id="grid"></div>
                            <div id="pagination" class="tui-pagination"></div>

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
        
        $(function() {
            bookGrid.init();
        });

        let bookGrid = {
            bookData: {},
            paramData: {}, 
            currentPage: 1,
            kwd: '토지',
            grid: null,

            init: function() {
                this.fetchData();
                this.applyGridTheme();
                this.drawGrid();
                /* this.bindSearchEvent();
                this.bindAddBookEvent();  */
            },

            fetchData: function() {
                
                let _this = this;
                $.ajax({
                    async: false,
                    type: 'get',
                    url: '/admin/books/bookData.do',
                    data: {
                    },
                    dataType: 'json',
                    success: function(data) {
                        console.log(data);
                        
                        _this.bookData = data;
                        _this.currentPage = pagenum;
                        _this.updateGrid();
                        _this.updatePagination();
                    }
                });
            },

            applyGridTheme: function() {
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
                            showVerticalBorder: true
                        },
                        header: {
                            background: '#f9f9f9',
                            border: '#e0e0e0'
                        },
                        rowHeader: {
                            border: '#e0e0e0',
                            showVerticalBorder: true
                        }
                    }
                });
            },

            drawGrid: function() {
                let _this = this;

                if (this.grid) {
                    this.grid.destroy();
                    $("#grid").empty();
                }

                this.grid = new tui.Grid({
                    el: document.getElementById('grid'),
                    data: _this.bookData,
                    rowHeaders: ['checkbox'],
                    scrollX: true,
                    scrollY: false,
                    bodyHeight: 'auto',
                    rowHeight: 'auto',
                    columns: [
                        {
                            header: '표지',
                            name: 'image_url',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 70,
                            formatter: function(value) {
                                let result = "";
                                let src = value.value.toString();
                                if (src.includes('.jpg')) {
                                    result = "<img class='imgSize' src='" + src + "'/>";
                                } else {
                                    result = "<div class='imgFakeBox'><div class='imgBlank'><i class='fa-regular fa-image'></i></div></div>";
                                }
                                return result;
                            }
                        },
                        {
                            header: '표지',
                            name: 'image_url',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 70,
                            formatter: function(value) {
                                let result = "";
                                let src = value.value.toString();
                                if (src.includes('.jpg')) {
                                    result = "<img class='imgSize' src='" + src + "'/>";
                                } else {
                                    result = "<div class='imgFakeBox'><div class='imgBlank'><i class='fa-regular fa-image'></i></div></div>";
                                }
                                return result;
                            }
                        },
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
                                let detailUrl = value.row.detail_link ? value.row.detail_link.toString() : "";
                                return "<a href=https://www.nl.go.kr/" + detailUrl + " target='_blank'>" + value.value + "</a>";
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
                        }
                    ],
                    
                 	// 데이터 소스 설정
                    dataSource: {
                        readData: this.readData
                        }
                    }
                );
                
                // 페이지네이션 초기화
                this.updatePagination();
            },
            
            //데이터 읽어오기
            readData: function(params) {
                let _this = this; 
                
                return $.ajax({
                    type: 'get',
                    url: '/admin/books/bookData.do',
                    data: {
                    },
                    dataType: 'json'
                }).done(function(data) {
                    console.log(data);
                    _this.bookData = data;
                    _this.currentPage = params.page; 
                    _this.updateGrid();
                    _this.updatePagination();
                }).fail(function() {
                    console.error('데이터를 가져오는 데 실패했습니다.');
                });
            },
            
            //검색
            /* bindSearchEvent: function() {
                let _this = this;
                $('#searchButton').on('click', function() {
                    let kwdData = $('#searchInput').val().trim();
                    _this.kwd = kwdData; 
                    _this.currentPage = 1; 
                    _this.fetchData(_this.currentPage, _this.kwd); 
                });

                $('#searchInput').on('keypress', function(event) {
                    if (event.key === 'Enter') {
                        $('#searchButton').click();
                    }
                });
            }, */
            
            //db에 등록
            /* bindAddBookEvent: function() {
                $('#addBook').on('click', function() {
                    let checkedRows = bookGrid.grid.getCheckedRows();

                    if (checkedRows.length === 0) {
                        alert('선택된 책이 없습니다.');
                        return;
                    }

                    let bookList = checkedRows.map(function(row)  {
                        return {
                            title: row.title_info ? row.title_info.toString().replace(/'/g, "&#39;") : "",
                            author: row.author_info ? row.author_info.toString() : "",
                            ctg: row.type_name ? row.type_name.toString() : "",
                            publisher: row.pub_info ? row.pub_info.toString() : "",
                            cheonggu: row.call_no ? row.call_no.toString() : "",
                            isbn: row.isbn ? row.isbn.toString() : ""
                        };
                    });

                    $.ajax({
                        type: 'post',
                        url: '/admin/books/insertBook.do',
                        data: JSON.stringify(bookList), 
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'text',
                        success: function(data) {
                            if (data === 'success') {
                                alert('책이 등록되었습니다.');
                            } else {
                                alert('오류가 발생했습니다. 관리자에게 문의하세요.');
                            }
                        }
                    });
                });
            }, */
            
            updateGrid: function() {
                if (this.grid && this.bookData) {
                    this.grid.resetData(this.bookData);
                }
            },

            updatePagination: function() {
                let _this = this;

                this.pagination = new tui.Pagination(document.getElementById('pagination'), {
                    visiblePages: 10,
                    totalItems: _this.paramData.total || 0, 
                    itemsPerPage: 10, 
                    centerAlign: true,
                    page: _this.currentPage
                });

                // 페이지 이동 이벤트 처리
                this.pagination.on('afterMove', function(ev) {
                    _this.currentPage = ev.page;
                    _this.fetchData(ev.page, _this.kwd); 
                });
            }
        };
        
        </script>
    </body>
</html>