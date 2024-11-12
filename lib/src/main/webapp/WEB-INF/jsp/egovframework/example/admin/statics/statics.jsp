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
        <title>관리자 - 통계관리</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/template/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    	<style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
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
                        <h1 class="mt-4">통계관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item">통계관리</li>
                            <li class="breadcrumb-item">통계관리</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                통계를 이용해 이용현황을 한눈에 볼 수 있습니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                <b>대출/반납 현황</b>
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        <b>로그인 현황</b>
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        <b>도서 보유 현황</b>
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/template/admin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        
        <script>
        
        	dateArr = [];
        	loanArr = [];
        	returnArr = [];
        	userArr = [];
        	adminArr = [];
        	bkLabelArr = [];
        	bkArr = [];
        
	        $.ajax({
	            async: false,
	            type: 'post',
	            url: '/admin/statics/statData.do',
	            dataType: 'json',
	            success: function(data) {
					dateArr = data[0];
					loanArr = data[1];
					returnArr = data[2];
					userArr = data[3];
					adminArr = data[4];
					bkLabelArr = data[5];
					bkArr = data[6];
	            }
	        });
        
        	//chart
	        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	        Chart.defaults.global.defaultFontColor = '#292b2c';
	        
	     // Area Chart Example
	        var ctx = document.getElementById("myAreaChart");
	        var myLineChart = new Chart(ctx, {
	          type: 'line',
	          data: {
	            labels: dateArr,
	            datasets: [{
	              label: "대출",
	              lineTension: 0.3,
	              backgroundColor: "rgba(2,117,216,0.2)",
	              borderColor: "rgba(2,117,216,1)",
	              pointRadius: 5,
	              pointBackgroundColor: "rgba(2,117,216,1)",
	              pointBorderColor: "rgba(255,255,255,0.8)",
	              pointHoverRadius: 5,
	              pointHoverBackgroundColor: "rgba(2,117,216,1)",
	              pointHitRadius: 50,
	              pointBorderWidth: 2,
	              data: loanArr,
	            }, 
	            {
	                label: "반납",
	                lineTension: 0.3,
	                backgroundColor: "rgba(220,53,69,0.2)", 
	                borderColor: "rgba(220,53,69,1)",      
	                pointRadius: 5,
	                pointBackgroundColor: "rgba(220,53,69,1)",
	                pointBorderColor: "rgba(255,255,255,0.8)",
	                pointHoverRadius: 5,
	                pointHoverBackgroundColor: "rgba(220,53,69,1)",
	                pointHitRadius: 50,
	                pointBorderWidth: 2,
	                data: returnArr,
	              }
	            ],
	          },
	          options: {
	            scales: {
	              xAxes: [{
	                time: {
	                  unit: 'date'
	                },
	                gridLines: {
	                  display: false
	                },
	                ticks: {
	                  maxTicksLimit: 7
	                }
	              }],
	              yAxes: [{
	                ticks: {
	                  min: 0,
	                  max: 60,
	                  maxTicksLimit: 5
	                },
	                gridLines: {
	                  color: "rgba(0, 0, 0, .125)",
	                }
	              }],
	            },
	            legend: {
	                position: 'bottom'
	            }
	          }
	        });
	        
	     // Bar Chart Example
	        var ctx = document.getElementById("myBarChart");
	        var myLineChart = new Chart(ctx, {
	          type: 'bar',
	          data: {
	            labels: dateArr,
	            datasets: [{
	              label: "사용자",
	              backgroundColor: "rgba(2,117,216,1)",
	              borderColor: "rgba(2,117,216,1)",
	              data: userArr,
	            },
	            {
	              label: "관리자",
	              backgroundColor: "rgba(220,53,69,1)",
	              borderColor: "rgba(220,53,69,1)",
	              data: adminArr,
	            }],
	          },
	          options: {
	            scales: {
	              xAxes: [{
	                time: {
	                  unit: 'month'
	                },
	                gridLines: {
	                  display: false
	                },
	                ticks: {
	                  maxTicksLimit: 6
	                }
	              }],
	              yAxes: [{
	                ticks: {
	                  min: 0,
	                  max: 20,
	                  maxTicksLimit: 5
	                },
	                gridLines: {
	                  display: true
	                }
	              }],
	            },
	            legend: {
	                position: 'bottom'
	            }
	          }
	        });
	        
	        function generateColors(numColors) {
	            const colors = [];
	            for (let i = 0; i < numColors; i++) {
	              const hue = (i * 360 / numColors); 
	              colors.push('hsl(' + hue + ', 70%, 50%)');
	            }
	            return colors;
	          }
	        
	        var colors = generateColors(20);
	        
	     // Pie Chart Example
	        var ctx = document.getElementById("myPieChart");
	        var myPieChart = new Chart(ctx, {
	          type: 'pie',
	          data: {
	            labels: bkLabelArr,
	            datasets: [{
	              data: bkArr,
	              backgroundColor: colors,
	            }],
	          },
	          options: {
	              legend: {
	                position: 'bottom' 
	              }
	            }
	        });
        </script>
        
    </body>
</html>