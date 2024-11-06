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
        <title>관리자 - FAQ 조회</title>
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
		#addContent {
			background-color: white;
		    color: #0d6efd;
		    border: 2px solid #0d6efd;
		    padding: 3px 10px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    border-radius: 0;
		}
		#addContent:hover, #addContent:active {
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
		.modalWidth {
			width: 700px;
		}
		.content {
			height: 150px;
		}
		
		.bt.down {
			background-color: white;
		    border: 1px solid #6c6c6c;
		    font-size: 0.9em;
		    padding: 3px 10px;
		    color: #666666;
		}
		.m_file_info {
			margin: 5px 0;
		}
		.m_file_info span {
			color: #0d6efd;
	    	margin: 0 10px 0 0;
		}
		.hidden {
			display: none;
		}
		.trash {
		    margin: 0 8px;
		    font-size: 1.1em;
		    color: gray;	
		}
		
		</style>
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin/main/main.do">LIBLIO</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <!-- <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> 
                </div> -->
            </div>
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
            	<%@ include file="../main/menu.jsp" %></div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">FAQ 조회</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">도서관관리</li>
                            <li class="breadcrumb-item">FAQ 조회</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                FAQ 목록을 관리할 수 있습니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                        
                            <div class="card-header">
								<i class="fas fa-table me-1"></i>
								<b>FAQ</b>
                                <!-- <b>대출/반납 관리</b>
								|
                                <a href="/admin/loan/overdueList.do" class="linkButton">연체 관리</a> -->
                            </div>
                            
                            <div class="card-body">
                            
                            <div id="infoBar">
                            	<div>
                            		<button class="btn btn-primary" id="deleteBtn">삭제하기</button>
	                            	<button class="btn btn-primary" id="addContent">등록하기</button>	
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
                            <!-- <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div> -->
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
        <!-- 모달창 -->
		
		<div class="modal fade" id="bookModal" tabindex="-1" aria-labelledby="bookModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg"> <!-- Apply custom class here -->
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="bookModalLabel">FAQ 상세정보</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
				            <div class="modal-body mx-5">
				            
				            <form id="faqForm" method="post" enctype="multipart/form-data">    	
				            <input type="hidden" id="m_faq_id" name="faqId">
		                	
		                	
		                	<!-- 제목 -->
		                    <div class="mb-3 row">
		                        <label for="m_title" class="col-sm-2 col-form-label">제목</label>
		                        <div class="col-sm-10">
		                            <input type="text" class="form-control" id="m_title" name="title" placeholder="제목을 입력하세요">
		                        </div>
		                    </div>
		
		                    <!-- 내용 -->
		                    <div class="mb-3 row">
		                        <label for="m_cnt" class="col-sm-2 col-form-label">내용</label>
		                        <div class="col-sm-10">
		                            <textarea type="text" class="form-control content" id="m_cnt" name="cnt" placeholder="내용을 입력하세요" id="summernote"></textarea>
		                        </div>
		                    </div>
		                    
		                    
		                	 <!-- 파일 업로드 -->
		                    <div class="mb-3 row">
			                    <label for="m_file" class="col-sm-2 col-form-label">파일 첨부</label>
			                        <div class="col-sm-10">
			                           <input type="file" type="text" class="form-control" id="m_file" name="multifile" placeholder="파일을 선택하세요" multiple="multiple">
		                    	</div>
		                    </div>
		                    </form>
		                    
		                    <div class="mb-3 row fileBox">
			                    <label for="m_file_area" class="col-sm-2 col-form-label">다운로드</label>
		                        <div class="col-sm-10">
		                        	<div id="m_file_area">
									</div>
	                    		</div>
		                    </div>
		                    
				            </div>
				        
		            <div class="modal-footer">
		            	
		                <button type="button" id="saveButton" class="btn btn-primary" onclick="saveBtn(param)">저장</button>
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		            </div>
		        </div>
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
                this.bindAddCntEvent();
                /* this.bindUpdateCntEvent(); */
                this.bindSearchEvent();
            },

            fetchData: function(pagenum, kwdData) {
                
                let _this = this;
                $.ajax({
                    async: false,
                    type: 'post',
                    url: '/admin/faq/faqData.do',
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
                            name: 'faqId',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 50
                        },
                        {
                            header: '아이디',
                            name: 'userid',
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
                            header: '내용',
                            name: 'cnt',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 200,
                            formatter: function(value) {
                                let result = "";
                                let content = value.value.toString();
                                formattedCnt = content.substring(0, 20) + "...";
                                result = formattedCnt;
                                return result;
                            }
                        },
                        {
                            header: '작성일자',
                            name: 'writeDate',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 180
                        },
                        {
                            header: '파일이름',
                            name: 'fileNames',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 100,
                            formatter: function(value) {
                                let result = "";
                                
                                let fileNames = [];
                                fileNames = JSON.parse(value.value.value);
                                
                                fileNames.forEach(function(f) {
                                    result += f + "<br>";
                                });
                                
                                return result;
                            }
                        },
                        {
                            header: '파일원본',
                            name: 'fileOriNames',
                            align: "center",
                            whiteSpace: 'normal',
                            width: 60,
                            formatter: function(value) {
                                let fileOriNames = [];
                                fileOriNames = JSON.parse(value.value.value);
                                
                                let result = "";
                                if (fileOriNames.length > 0) {
                                    result = "<i class='fa-solid fa-download fa-lg fileIcon'></i></div>";
                                }

                                return result;
                            }
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
            
            //정보 수정
            openModal: function (rowData) {
                
              	//초기화
                $('#m_faq_id').val('');
                $('#m_userid').val('');
                $('#m_title').val('');
                $('#m_cnt').val(''); 
                $('#m_file').val(''); 
                $('#m_file_area').html('');
                
                $('#m_faq_id').val(rowData.faqId || '');
                $('#m_userid').val(rowData.userid || '');
                $('#m_title').val(rowData.title || '');
                $('#m_cnt').val(rowData.cnt || ''); 
                
                let fileOriNames = [];
                fileOriNames = JSON.parse(rowData.fileOriNames.value);
                
                let fileNames = [];
                fileNames = JSON.parse(rowData.fileNames.value);
                
                let divText = "";
                
                if (fileNames.length > 0) {
                    $('.fileBox').removeClass('hidden');
                    for (i=0; i<fileNames.length; i++) {
                        divText += '<form method="post">' +
                            '<div class="m_file_info">' +
                        '<span class="m_file_name">' + fileNames[i] + '</span>' +
                        '<input class="m_file_ori_name" value="' + fileOriNames[i] + '" name="fileName" type="hidden">' + 
                        '<button type="button" class="bt down downloadBtn">다운로드</button>' +
                        '<i class="fa-solid fa-trash-can trash"></i>' +
                        '</div>' +
                        '</form>';
                    }
                    
                    $('#m_file_area').html(divText);
                } else {
                    $('.fileBox').addClass('hidden'); 
                }
                
                let bookModal = new bootstrap.Modal(document.getElementById('bookModal'), {
                    backdrop: 'static', 
                    keyboard: false 
                });
                
                document.getElementById('saveButton').setAttribute('onclick', "saveBtn('update')");
                
                bookModal.show();
            },
            
            //데이터 읽어오기
            readData: function(params) {
                let _this = this; 
                
                return $.ajax({
                    type: 'post',
                    url: '/admin/faq/faqData.do',
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
                    alert('데이터를 가져오는데 실패했습니다.');
                });
            },
            
            //데이터 삭제
            bindDeleteBook: function() {
                $('#deleteBtn').on('click', function() {
                    let checkedRows = bookGrid.grid.getCheckedRows();

                    if (checkedRows.length === 0) {
                        alert('선택된 목록이 없습니다.');
                        return;
                    }

                    let bookList = checkedRows.map(function(row)  {
                        return {
                            id: row.faqId ? row.faqId.toString() : ""
                        };
                    });

                    $.ajax({
                        type: 'post',
                        url: '/admin/faq/faqDelete.do',
                        data: JSON.stringify(bookList), 
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'text',
                        success: function(data) {
                            if (data === 'success') {
                                alert('선택된 게시물이 삭제되었습니다.');
                                bookGrid.fetchData(bookGrid.currentPage, bookGrid.kwd);
                            } else {
                                alert('오류가 발생했습니다. 관리자에게 문의하세요.');
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
            bindAddCntEvent: function() {
                $('#addContent').on('click', function() {
                    
                  	//초기화
                    $('#m_faq_id').val('');
	                $('#m_userid').val('');
	                $('#m_title').val('');
	                $('#m_cnt').val(''); 
	                $('#m_file').val(''); 
	                $('#m_file_area').html('');
                    
                    let bookModal = new bootstrap.Modal(document.getElementById('bookModal'), {
                        backdrop: 'static', 
                        keyboard: false 
                    });
                    
                    bookModal.show();
                    
                    document.getElementById('saveButton').setAttribute('onclick', "saveBtn('add')");
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
        
        function saveBtn(action) {
            
            if (action == 'add') {
                
                var userid = "${sessionScope.userid}";
                
                if (userid == '') {
                    alert('로그인이 필요합니다.');
                    return; 
                } else if ($('#m_title').val() === '') {
                    alert('제목을 입력하세요');
                    return; 
                } else if ($('#m_cnt').val() === '') {
                    alert('내용을 입력하세요');
                    return; 
                } 
                
                
                var formData = new FormData(document.getElementById('faqForm'));
                
               $.ajax({
                   type: 'POST',
                   url: '/admin/faq/insertFaq.do',
                   data: formData,
                   processData: false,
                   contentType: false,
                   success: function(response) {
                       
                       if (response === 'success') {
                           alert('정보가 저장되었습니다.');
                           bookGrid.fetchData(bookGrid.currentPage, bookGrid.kwd);

                           var bookModal = bootstrap.Modal.getInstance(document.getElementById('bookModal'));
                           bookModal.hide();
                       } else {
                           alert('에러가 발생했습니다.');
                       }
                   },
                   error: function() {
                       alert('에러가 발생했습니다.');
                   }
               });
                
            }
            
            if (action == 'update') {
                
				var userid = "${sessionScope.userid}";
                
                if (userid == '') {
                    alert('로그인이 필요합니다.');
                    return; 
                } else if ($('#m_title').val() === '') {
                    alert('제목을 입력하세요');
                    return; 
                } else if ($('#m_cnt').val() === '') {
                    alert('내용을 입력하세요');
                    return; 
                } 
                
                var formData = new FormData(document.getElementById('faqForm'));
                
                $.ajax({
                    type: 'post',
                    url: '/admin/faq/updateFaq.do',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        
                        if (response === 'success') {
                            alert('정보가 저장되었습니다.');
                            bookGrid.fetchData(bookGrid.currentPage, bookGrid.kwd);

                            var bookModal = bootstrap.Modal.getInstance(document.getElementById('bookModal'));
                            bookModal.hide();
                        } else {
                            alert('에러가 발생했습니다.');
                        }
                    },
                    error: function() {
                        alert('에러가 발생했습니다.');
                    }
                });
            }
        }
        
        $(document).on('click', '.trash', function(event) {
            event.preventDefault(); 
		    let info = $(this).closest('.m_file_info');
		    let fileName = info.find('.m_file_ori_name').val();
		    
		    $.ajax({
                type: 'post',
                url: '/admin/faq/fileDeleteOne.do',
                data: {
                    fileName : fileName
                },
                success: function(response) {
                    
                    if (response === 'success') {
                        alert('해당 파일이 삭제되었습니다.');
                        info.addClass('hidden'); 
                        bookGrid.fetchData(bookGrid.currentPage, bookGrid.kwd);
                    } else {
                        alert('에러가 발생했습니다.');
                    }
                },
                error: function() {
                    alert('에러가 발생했습니다.');
                }
            });
        });
        
        $(document).on('click', '.downloadBtn', function(event) {
		    event.preventDefault(); 
		    let form = $(this).closest('form');
		    form.attr('action', '/admin/faq/fileDownload.do'); 
		    form.submit();
        });
        
        </script>
    </body>
</html>