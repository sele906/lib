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
        <title>LiBLIO - 좌석 예약 조회</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/template/user/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <link href="/template/user/css/seat.css" rel="stylesheet" />
        
        <style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		</style>
		
		<style type="text/css">
			.hidden {
				display: none;
			}
			.seat.choose {
				cursor: pointer;
			}
		</style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
        	<!-- Navigation-->
            <%@ include file="../main/menu.jsp" %>
        
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mb-5">
                                <h1 class="fw-bolder">멀티미디어 좌석 예약</h1>
                                <p class="lead fw-normal text-muted mb-0">${sessionScope.userid}님의 멀티미디어 좌석 예약 현황입니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-12 col-12 d-flex justify-content-center">
                        <!-- <img class="img-fluid rounded-3 mb-5" src="https://dummyimage.com/1300x700/343a40/6c757d" alt="..." /> -->
                        
                        <div class="hidden">
                        	<c:forEach var="i" items="${list}">
                        		<input class="selectSeatNum" value="${i.seatNum}">
                        	</c:forEach>
                        </div>
                        
                        
                        <div class="seatBox">
                        
                        <div id="seats_wrap">
						<div id="seats">
						    <div class="row">
						        <div class="seat">1</div>
						        <div class="seat">2</div>
						        <div class="seat">3</div>
						        <div class="seat">4</div>
						        <div class="seat">5</div>
						        <div class="seat">6</div>
						        <div class="seat">7</div>
						        <div class="seat">8</div>
						        <div class="seat">9</div>
						        <div class="seat">10</div>
						        <div class="seat">11</div>
						        <div class="seat">12</div>
						    </div>
						
						    <div class="row">
						        <div class="seat">13</div>
						        <div class="seat">14</div>
						        <div class="seat">15</div>
						        <div class="seat">16</div>
						        <div class="seat">17</div>
						        <div class="seat">18</div>
						        <div class="seat">19</div>
						        <div class="seat">20</div>
						        <div class="seat">21</div>
						        <div class="seat">22</div>
						        <div class="seat">23</div>
						        <div class="seat">24</div>
						    </div>
						
						    <div class="row">
						        <div class="seat">25</div>
						        <div class="seat">26</div>
						        <div class="seat">27</div>
						        <div class="seat">28</div>
						        <div class="seat">29</div>
						        <div class="seat">30</div>
						        <div class="seat">31</div>
						        <div class="seat">32</div>
						        <div class="seat">33</div>
						        <div class="seat">34</div>
						        <div class="seat">35</div>
						        <div class="seat">36</div>
						    </div>
						
						    <div class="row">
						        <div class="seat">37</div>
						        <div class="seat">38</div>
						        <div class="seat">39</div>
						        <div class="seat">40</div>
						        <div class="seat">41</div>
						        <div class="seat">42</div>
						        <div class="seat">43</div>
						        <div class="seat">44</div>
						        <div class="seat">45</div>
						        <div class="seat">46</div>
						        <div class="seat">47</div>
						        <div class="seat">48</div>
						    </div>
						
						    <div class="row">
						        <div class="seat">49</div>
						        <div class="seat">50</div>
						        <div class="seat">51</div>
						        <div class="seat">52</div>
						        <div class="seat">53</div>
						        <div class="seat">54</div>
						        <div class="seat">55</div>
						        <div class="seat">56</div>
						        <div class="seat">57</div>
						        <div class="seat">58</div>
						        <div class="seat">59</div>
						        <div class="seat">60</div>
						    </div>
						</div>
					</div>
                        
                        </div>
                        
                        </div>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mb-1 mt-5">
                            	<form id="seatForm" method="post" action="/mypage/seatList.do">
                            	
                            	<input type="hidden" id="seat_position" name="seatNum">
                            	
                            	<button type="button" id="resvSeat" class="btn btn-primary btn-lg">예약하기</button>
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
        
        <c:if test="${msg eq 'success'}">
			<script>alert('좌석이 예약되었습니다.')</script>
		</c:if>
        
        <script>
        
        $(function() {
        	
        	let seatArea = document.getElementById('seats_wrap');
            let seats = document.querySelectorAll('#seats_wrap .seat');
            let seatMemory = [];

            let Savedseats = document.querySelectorAll('.selectSeatNum');
          	
            for (i=0; i<Savedseats.length; i++) {
            	let Savedseat = Savedseats[i].value.trim();
            	seats[Savedseat-1].className = "seat choose";
            }
            
          	//좌석 수 세기
            function updateSelectedCount() {
            	let selectedSeats = document.querySelectorAll('.row .seat.select');
            	console.log(selectedSeats);
            	
            	//좌석 위치
            	let seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));

            	for (i=0; i<seatsIndex.length; i++) {
            		
            		let num = seatsIndex[i] + 1;
            		seatMemory.push(num);
            		
            	}
            	
            	document.getElementById("seat_position").value = seatMemory.join(',');
            } 


            seatArea.addEventListener('click', e => {
            	if (e.target.classList.contains('seat') && !e.target.closest('.seat.choose')) {
            		
            		seatMemory.length = 0;
            		e.target.classList.toggle('select');
            		updateSelectedCount();
            	}
            });
            
            $('#resvSeat').on('click', function(event) {
            	
            	if ($("#seat_position").val() == '') {
            		alert('좌석을 선택해주세요');
            	} else {
            		$('#seatForm').submit();
            	}
            
    	    });
            
            $('.seat.choose').on('click', function(event) {
            	alert('좌석을 취소하시겠습니까?');
            	
            	var $seatElement = $(this);
            	var num = $seatElement.text();
            	
            	$.ajax({
					type: 'get',
					url: '/mypage/seatDelete.do',
					data: {
					    seatNum: num
					}, 
					success: function (response) {
					    console.log(response);
					    if (response === 'success') {
					        
					        alert('예약 취소 되었습니다.');
					        $seatElement.removeClass('choose');
	                        
	                    } else {
	                        alert('문제가 발생했습니다. 관리자에게 문의하세요');
	                    }
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