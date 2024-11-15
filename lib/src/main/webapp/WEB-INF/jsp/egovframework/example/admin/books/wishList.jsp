<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 - 희망도서 등록</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/template/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    	<style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		</style>
		
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
		#deleteBtn {
			background-color: white;
		    color: #dc3545;
		    border: 2px solid #dc3545;
		    padding: 3px 10px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    border-radius: 0;
		}
		#deleteBtn:hover, #deleteBtn:active {
		  background-color: #dc3545;
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
		
		/* 모달 이미지 크기 */
		.modalImg {
	        width: 50px;
    		height: 70px;
    		border: 1px solid #aaaaaa;
	    }
	    
	    /* 모달 */
		#m-cnt {
			display: flex;
		}
		#m-left {
			width: 40%;
			padding: 0 15px 0 0;
			align-content: center;
			border-right: 1px solid #dee2e6;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		#m-left #m-imgBox {
			width: 70%;
    		height: 75%;
		}
		#m-left #m-imgBox img {
			width: 100%;
  			height: 100%;
		}
		#m-right {
			width: 60%;
			padding: 0 0 0 15px ;
		}
		
		</style>
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin/main/main.do">LiBLIO</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    	<li><a class="dropdown-item" href="/main.do">홈페이지</a></li>
                        <li><a class="dropdown-item" href="/logout">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
        	<div id="layoutSidenav_nav">
        	
            	<!-- Navigation-->
            	<%@ include file="../main/menu.jsp" %>
            	
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">희망도서등록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">자료</li>
                            <li class="breadcrumb-item">자료관리</li>
                            <li class="breadcrumb-item">희망도서등록</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                이용자들이 희망하는 책을 편리하게 등록할 수 있습니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                        
                            <div class="card-header">
								<i class="fas fa-table me-1"></i>
                                <b>희망도서등록</b>
								|
                                <a href="/admin/books/addBook.do" class="linkButton">자료등록</a>
                                |
                                 <a href="/admin/books/bookList.do" class="linkButton">자료관리</a>
                            </div>
                            
                            <div class="card-body">
                            
                            <div id="infoBar">
                            	<div>
	                            	<button class="btn btn-primary" id="addBook">등록하기</button>
	                            	<button class="btn btn-primary" id="deleteBtn">삭제하기</button>
                            	</div>
								
                            	<!-- 검색창 -->
                            	<div class="input-group" id="searchBar">
								  <input type="search" class="form-control rounded" placeholder="검색어를 입력하세요" aria-label="Search" aria-describedby="search-addon" id="searchInput" value=""/>
								  <button type="button" class="btn btn-outline-primary" id="searchButton" data-mdb-ripple-init><i class="fa-solid fa-magnifying-glass"></i></button>
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
                            <div class="text-muted">Copyright &copy; LIBLO 2024</div>
                       	</div>
                    </div>
                </footer>
            </div>
        </div>
        
        <!-- 모달창 -->
		<div class="modal fade" id="bookModal" tabindex="-1" aria-labelledby="bookModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="bookModalLabel">도서 상세정보</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <form id="bookForm" action="/admin/books/wishUpdateData.do" method="post" enctype="multipart/form-data">
		            <div class="modal-body" id="m-cnt">
		                
		                	<!-- 좌측 -->
		                	<div id="m-left">
		                	
		                	<input type="hidden" id="m_wishId" name="wishId">
		                    
		                    <!-- 도서 이미지 -->
		                    <div class="text-center mb-4" id="m-imgBox">
		                        <img id="m_img" src='' class="img-fluid shadow-sm" alt="도서 표지">
		                    </div>
		                	
		                	 <!-- 파일 업로드 -->
		                    <div class="mb-3 row">
		                        <div class="col-sm-12">
		                            <input type="file" class="form-control" id="m_file" name="multifile">
		                        </div>
		                    </div>
		                	
		                	</div>
		                	
		                	<!-- 우측 -->
		                	<div id="m-right" class="d-flex flex-column justify-content-center">
		                	
		                	<!-- 제목 -->
		                    <div class="mb-3 row">
		                        <label for="m_title" class="col-sm-3 col-form-label">제목</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="m_title" name="title" placeholder="제목을 입력하세요">
		                        </div>
		                    </div>
		
		                    <!-- 저자 -->
		                    <div class="mb-3 row">
		                        <label for="m_author" class="col-sm-3 col-form-label">저자</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="m_author" name="author" placeholder="저자를 입력하세요">
		                        </div>
		                    </div>
		
		                    <!-- 카테고리 -->
		                    <div class="mb-3 row">
		                        <label for="m_ctg" class="col-sm-3 col-form-label">카테고리</label>
		                        <div class="col-sm-9">
		                            <select class="form-select" id="m_ctg" name="ctgId">
		                            	<option value="" selected>카테고리를 선택하세요</option>
		                            	<c:forEach var="row" items="${ctgList}">
		                                    <option value="${row.sclsCd}">${row.sclsNm}</option>
		                                </c:forEach>
		                            </select>
		                        </div>
		                    </div>
		
		                    <!-- 출판사 -->
		                    <div class="mb-3 row">
		                        <label for="m_publisher" class="col-sm-3 col-form-label">출판사</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="m_publisher" name="publisher" placeholder="출판사를 입력하세요">
		                        </div>
		                    </div>
		
		                    <!-- 청구기호 -->
		                    <div class="mb-3 row">
		                        <label for="m_cheonggu" class="col-sm-3 col-form-label">청구기호</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="m_cheonggu" name="cheonggu" placeholder="청구기호를 입력하세요">
		                        </div>
		                    </div>
		
		                    <!-- ISBN -->
		                    <div class="mb-3 row">
		                        <label for="m_isbn" class="col-sm-3 col-form-label">ISBN</label>
		                        <div class="col-sm-9">
		                            <input type="text" class="form-control" id="m_isbn" name="isbn" placeholder="ISBN을 입력하세요">
		                        </div>
		                    </div>
		                	
		                	</div>
		            </div>
		            </form>
		            <div class="modal-footer">
		                <button type="button" id="saveBtn" class="btn btn-primary" onclick="updateInfo()">저장</button>
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
		        </div>
		    </div>
		</div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/template/admin/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        
        <%@ include file="../../common/Alert.jsp" %> 
        
		<script type="text/javascript">
        
        $(function() {
            bookGrid.init();
        });

        let bookGrid = {
            apiData: {},
            paramData: {}, 
            currentPage: 1,
            kwd: '',
            grid: null,

            init: function() {
                this.fetchData(this.currentPage, this.kwd);
                this.applyGridTheme();
                this.drawGrid();
                this.bindDeleteBook();
                this.bindAddBookEvent();  
                this.bindSearchEvent();
            },

            fetchData: function(pagenum, kwdData) {
                
                let _this = this;
                $.ajax({
                    async: false,
                    type: 'post',
                    url: '/admin/books/wishData.do',
                    data: {
                        kwd: kwdData,
                        page : pagenum
                    },
                    dataType: 'json',
                    success: function(data) {
                        
        				var paramData = data[0];
        				var items = data[1].items;
                        
                        _this.apiData = items;
                        _this.paramData = paramData;
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
                    data: _this.apiData,
                    rowHeaders: ['checkbox'],
                    scrollX: true,
                    scrollY: false,
                    bodyHeight: 'auto',
                    rowHeight: 'auto',
                    selectionUnit: 'row',
                    columns: [
                        {
                            header: 'No.',
                            name: 'wishId',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 50
                        },
                        {
                            header: '표지',
                            name: 'fileName',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 70,
                            formatter: function(value) {
                                let result = "";
                                let src = value.value.toString();
                                if (src.includes('.jpg') || src.includes('.png')) {
                                    result = "<img class='imgSize' src='/wishfile/" + src + "'/>";
                                } else {
                                    result = "<div class='imgFakeBox'><div class='imgBlank'><i class='fa-regular fa-image'></i></div></div>";
                                }
                                return result;
                            }
                        },
                        {
                            header: '자료구분',
                            name: 'ctgNm',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 100
                        },
                        {
                            header: '제목',
                            name: 'title',
                            align: "center",
                            whiteSpace: 'normal'
                        },
                        {
                            header: '저자',
                            name: 'author',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 120
                        },
                        {
                            header: '출판사',
                            name: 'publisher',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 120
                        },
                        {
                            header: '청구기호',
                            name: 'cheonggu',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 120
                        },
                        {
                            header: 'ISBN',
                            name: 'isbn',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 80
                        },
                        {
                            header: '아이디',
                            name: 'userid',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 80
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
                
             	// 행 클릭 이벤트 추가
                this.grid.on('click', function(ev) {
                    if (ev.columnName !== '_checked' && ev.columnName !== 'checkbox') { 
                        let rowKey = ev.rowKey;
                        let rowData = _this.grid.getRow(rowKey);
                        _this.openModal(rowData);
                    }
                });
            },
            
            //책정보 수정
            openModal: function (rowData) {
                
                $('#m_wishId').val(rowData.wishId || '');
                
                $('#m_img').attr('src', rowData.fileName ? '/wishfile/' + rowData.fileName : '/images/egovframework/lib/cmmn/blank.png');
                $('#m_file').val('');
                $('#m_title').val(rowData.title || '');
                $('#m_author').val(rowData.author || '');
                $('#m_ctg').val(rowData.ctgId || '');
                $('#m_publisher').val(rowData.publisher || '');
                $('#m_cheonggu').val(rowData.cheonggu || '');
                $('#m_isbn').val(rowData.isbn || '');

                let bookModal = new bootstrap.Modal(document.getElementById('bookModal'), {
                    backdrop: 'static', 
                    keyboard: false 
                });
                
                bookModal.show();
            },
            
            //데이터 읽어오기
            readData: function(params) {
                let _this = this; 
                
                return $.ajax({
                    type: 'post',
                    url: '/admin/books/wishData.do',
                    data: {
                        kwd: _this.kwd,
                        page: params.page 
                    },
                    dataType: 'json'
                }).done(function(data) {
                    var paramData = data[0];
                    var items = data[1].items;
                    _this.apiData = items;
                    _this.paramData = paramData;
                    _this.currentPage = params.page; 
                    _this.updateGrid();
                    _this.updatePagination();
                }).fail(function() {
                    sweet.errorAlert('','데이터를 가져오는데 실패했습니다.');
                });
            },
            
            //데이터 삭제
            bindDeleteBook: function() {
                $('#deleteBtn').on('click', function() {
                    let checkedRows = bookGrid.grid.getCheckedRows();

                    if (checkedRows.length === 0) {
                        sweet.warningAlert('','선택된 책이 없습니다.');
                        return;
                    }

                    let bookList = checkedRows.map(function(row)  {
                        return {
                            wishId: row.wishId ? row.wishId.toString() : ""
                        };
                    });

                    $.ajax({
                        type: 'post',
                        url: '/admin/books/wishDeleteBook.do',
                        data: JSON.stringify(bookList), 
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'text',
                        success: function(data) {
                            if (data === 'success') {
                                sweet.successAlert('','선택된 책이 삭제되었습니다.');
                                bookGrid.fetchData(bookGrid.currentPage, bookGrid.kwd);
                            } else {
                                sweet.errorAlert('오류가 발생했습니다.','관리자에게 문의하세요.');
                            }
                        }
                    });
                });
            },
            
            //검색
            bindSearchEvent: function() {
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
            },
            
          	//db에 등록
            bindAddBookEvent: function() {
                $('#addBook').on('click', function() {
                	let checkedRows = bookGrid.grid.getCheckedRows();

                    if (checkedRows.length === 0) {
                        sweet.warningAlert('','선택된 책이 없습니다.');
                        return;
                    }

                    let bookList = [];
                    for (let row of checkedRows) {
                    	
                        // 유효성 검사 
                        if (row.title.toString() === '') {
                            sweet.warningAlert('','제목을 입력하세요');
                            return; 
                        } else if (row.author.toString() === '') {
                            sweet.warningAlert('','저자를 입력하세요');
                            return; 
                        } else if (row.ctgNm.toString() === '') {
                            sweet.warningAlert('','카테고리를 선택하세요');
                            return; 
                        } else if (row.publisher.toString() === '') {
                            sweet.warningAlert('','출판사를 입력하세요');
                            return;
                        } else if (row.cheonggu.toString() === '') {
                            sweet.warningAlert('','청구기호를 입력하세요');
                            return;
                        }

                        bookList.push({
                            fileName: row.fileName ? row.fileName.toString() : "",
                            title: row.title ? row.title.toString().replace(/'/g, "&#39;") : "",
                            author: row.author ? row.author.toString() : "",
                            ctgNm: row.ctgNm ? row.ctgNm.toString() : "",
                            publisher: row.publisher ? row.publisher.toString() : "",
                            cheonggu: row.cheonggu ? row.cheonggu.toString() : "",
                            isbn: row.isbn ? row.isbn.toString().substring(0,13) : ""
                        });
                    }

                    if (bookList.length > 0) {
                        $.ajax({
                            type: 'post',
                            url: '/admin/books/insertWishBook.do',
                            data: JSON.stringify(bookList),
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'text',
                            success: function(data) {
                                if (data === 'success') {
                                    sweet.successAlert('','책이 등록되었습니다.');
                                } else {
                                    sweet.errorAlert('오류가 발생했습니다.','관리자에게 문의하세요.');
                                }
                            }
                        });
                    }
                });
            },
            
            updateGrid: function() {
                if (this.grid && this.apiData) {
                    this.grid.resetData(this.apiData);
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
        
        //저장
        function updateInfo() {
        	
        	//유효성 검사
            if ($('#m_wishId').val() == '') {
                sweet.warningAlert('','인덱스 값을 입력하세요');
            	$('#m_wishId').focus();
            	return;
            } else if ($('#m_title').val() == '') {
                sweet.warningAlert('','제목을 입력하세요');
            	$('#m_title').focus();
            	return;
            } else if ($('#m_author').val() == '') {
                sweet.warningAlert('','저자를 입력하세요');
            	$('#m_author').focus();
            	return;
            } else if ($('#m_ctg').val() === '' || $('#m_ctg').val() === null) {
                sweet.warningAlert('','카테고리를 선택하세요');
            	$('#m_ctg').focus();
            	return;
            } else if ($('#m_publisher').val() == '') {
                sweet.warningAlert('','출판사를 입력하세요');
            	$('#m_publisher').focus();
            	return;
            } else if ($('#m_cheonggu').val() == '') {
                sweet.warningAlert('','청구기호를 입력하세요');
            	$('#m_cheonggu').focus();
            	return;
            } 

            var formData = new FormData(document.getElementById('bookForm'));
            
            $.ajax({
                type: 'POST',
                url: '/admin/books/wishUpdateData.do',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    
                    if (response === 'success') {
                        sweet.successAlert('','책 정보가 저장되었습니다.');
                        bookGrid.fetchData(bookGrid.currentPage, bookGrid.kwd);

                        var bookModal = bootstrap.Modal.getInstance(document.getElementById('bookModal'));
                        bookModal.hide();
                    } else {
                        sweet.errorAlert('','에러가 발생했습니다.');
                    }
                },
                error: function() {
                    sweet.errorAlert('','에러가 발생했습니다.');
                }
            });
        }
        
        //파일 입력시
        document.getElementById('m_file').onchange = function (evt) {
		    var tgt = evt.target || window.event.srcElement,
		        files = tgt.files;
		    
		    if (FileReader && files && files.length) {
		        var fr = new FileReader();
		        fr.onload = function () {
		            document.getElementById('m_img').src = fr.result;
		        }
		        fr.readAsDataURL(files[0]);
		    }
		}
        
        </script>
    </body>
</html>