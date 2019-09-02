<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
	<!-- <script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script> -->
	<script src="${path}/resources/sebu/js/jquery-3.2.1.min.js"></script>
	<script src="${path}/resources/sebu/styles/bootstrap4/popper.js"></script>
	<script src="${path}/resources/sebu/styles/bootstrap4/bootstrap.min.js"></script>
	<script src="${path}/resources/sebu/plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="${path}/resources/sebu/plugins/easing/easing.js"></script>
	<script src="${path}/resources/sebu/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
	<script src="${path}/resources/sebu/js/single_custom.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/bootstrap4/bootstrap.min.css">
	<link href="${path}/resources/sebu/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/OwlCarousel2-2.2.1/animate.css">
	<link rel="stylesheet" href="${path}/resources/sebu/plugins/themify-icons/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/single_styles.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/sebu/styles/single_responsive.css">
	<style>
		#sebuimg{
			margin : auto;
			width: 300px;
			height: 380px;
		}
		
	</style>
	<script>
		$(function(){
			$('#star_score').children().on('click',function(){
				var starScore = $(this).children().attr('name');
				console.log($(this).children());
				$('#starScore').val(starScore);
				
			});
		});
		function fn_review_validate()
		{
			var review=$("#review_message");
			if(review.val().trim().length>=10)
			{
				return true;
			}
			else
			{
				alert("리뷰는 10글자 이상");
				review.val("");
				review.focus();
				return false;
			}
		} 
		function fn_question_validate()
		{
			var question=$("#question_message");
			if(question.val().trim().length>=10)
			{
				return true;
			}
			else
			{
				alert("문의사항은 10글자 이상");
				question.val("");
				question.focus();
				return false;
			}
		}
		function fn_questionReview_validate()
		{
			var questionReview = $("#questionReview_message");
			if(questionReview.val().trim().length>=10)
			{
				return true;
			}
			else
			{
				alert("댓글은 10글자 이상");
				questionReview.val("");
				questionReview.focus();
				return false;
			}
		}
		
		
		$(function(){

			var avgScore = ${avgScore};
			switch(avgScore)
			{
			case 1: break;
			case 2: 
				$('#avgScore').children().eq(1).children().attr('class','fa fa-star');
				break;
			case 3: 
				$('#avgScore').children().eq(1).children().attr('class','fa fa-star');
				$('#avgScore').children().eq(2).children().attr('class','fa fa-star');
				break;
			case 4: 
				$('#avgScore').children().eq(1).children().attr('class','fa fa-star');
				$('#avgScore').children().eq(2).children().attr('class','fa fa-star');
				$('#avgScore').children().eq(3).children().attr('class','fa fa-star');
				break;
			case 5: 
				$('#avgScore').children().eq(1).children().attr('class','fa fa-star');
				$('#avgScore').children().eq(2).children().attr('class','fa fa-star');
				$('#avgScore').children().eq(3).children().attr('class','fa fa-star');
				$('#avgScore').children().eq(4).children().attr('class','fa fa-star');
				break;
			default : break;
			}
		});
		
	</script>
	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="${path }/">Ticketsky</a></li>
						<li><a href="${path }/performance/performanceAllList.do?category=${MAJORCATEGORY}"><i class="fa fa-angle-right" aria-hidden="true"></i>${MAJORCATEGORY }</a></li>
						<li class="active"><a href=""><i class="fa fa-angle-right" aria-hidden="true"></i>${PERFORMNAME }</a></li>
						
					</ul>
				</div>

			</div>
		</div>

		<div class="row" >
			<div class="col-lg-5" style='margin:auto;'>
				<div class="single_product_pics">
					<div class="row" >
						<img id='sebuimg' src="${path}/resources/upload/info/${PERFORMNAME }/${REPOSTERIMG}" alt=""  />
					</div>
				</div>
			</div>
			<div class="col-lg-5" style='margin-right:2.3%;'>
				<div class="product_details">
					<div class="product_details_title">
						<span>
							<ul id='avgScore' class="star_rating" style='margin-left:5px;'>
								<li><i class="fa fa-star" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
							</ul>
						</span>
						<h3>
							${PERFORMNAME }
						</h3>
						<p><strong>장소</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PLACENAME }</p>
						<p><strong>기간</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PERFORMDURATION }</p>
						<p><strong>관람시간</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PERFORMTIME }</p>
						<p><strong>관람등급</strong>&nbsp;&nbsp;&nbsp;&nbsp;${PERFORMGRADE }</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center" style='margin-right:15%; margin-bottom:15px;'>
						<!-- <span class="ti-truck"></span> -->
						<span>
							가격
						</span>
					</div>
					<div class="product_price">
							<p><strong>VIP석</strong>&nbsp;&nbsp;&nbsp;&nbsp;20,000 원</p>
							<p><strong>S석</strong>&nbsp;&nbsp;&nbsp;&nbsp;15,000 원</p>
							<p><strong>R석</strong>&nbsp;&nbsp;&nbsp;&nbsp;10,000 원</p>
					</div>
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center" style='margin-top:10px;'>
						<div class="red_button add_to_cart_button" style='margin-left:0'>
							<c:if test="${empty memberLoggedIn }">
								<a href="#" onclick="window.open('${path}/user/login', '_blank', 'width=400 height=350');">예매하기</a>
							</c:if>
							<c:if test="${!empty memberLoggedIn }">
								<c:if test="${PERFORMCONFIRM eq 'N' }">
									<a href="#" onclick="alert('승인되지 않은 공연입니다.');">예매하기</a>
								</c:if>
								<c:if test="${PERFORMCONFIRM ne 'N' }">
									<a href="#" onclick="window.open('${path}/reserve/selectSchedule?performNo=${PERFORMNO }', 'TICKET SKY 예매', 'height=700px width=992px ');">예매하기</a>
								</c:if>
							</c:if>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Tabs -->

	<div class="tabs_section_container">

		<div class="container">
			<div class="row" style='margin:0 auto;'>
				<div class="col">
					<div class="tabs_container">
						<ul class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
							<li class="tab active" data-active-tab="tab_1"><span>상세정보</span></li>
							<li class="tab" data-active-tab="tab_2"><span>공연장정보</span></li>
							<li class="tab" data-active-tab="tab_3"><span>관람후기</span></li>
							<li class="tab" data-active-tab="tab_4"><span>Q&A</span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col" >

					<!-- Tab Description -->

					<div id="tab_1" class="tab_container active" style='margin:0 auto;'>
						<div class="row w-100" >
							<c:forEach items="${contentList}" var="c" varStatus="status">
								<div class="col-lg-5 desc_col" style='margin-left:15%;'>
 									<c:if test="${ status.index eq 0 }">
										<div class="tab_title" style='margin-bottom:14px;'>
											<h4>Description</h4>
										</div>
	 								</c:if>
									<div class="tab_text_block" style='margin-bottom:10px;'>
											<p>
												${c.PERFORMCONTENT }
											</p>
										<br>
									</div>
								</div>
								<div class="col-lg-9 " style='margin:0 auto;'>
									<div class="tab_image" style="margin-left:3%;">
										<img src="${path}/resources/upload/info/${PERFORMNAME }/${c.RECONTENTIMG}" alt="" style='width:100%; height: 100%;'/>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<!-- Tab Additional Info -->

					<div id="tab_2" class="tab_container">
						<div class="row w-100">
							<div class="col-lg-5 desc_col" style='margin-left:15%;'>
								<div class="tab_title" style='margin-bottom:14px;'>
									<h4>Information</h4>
								</div>
								<div class="tab_text_block" style='margin-bottom:10px;'>
									<p>[공연장 정보]</p>
									<p>장소 : ${PLACENAME }</p>
									<p>주소 : ${PLACEADDRESS }</p>
									<p>대표번호 : ${COMPANYPHONENUM}</p>
								</div>
								<br>
							</div>
							
							<div id="map" style="width:100%;height:350px; margin-left:16.5%; margin-right:11%"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ce19947ed179f0c460473a072a402ed&libraries=services"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };
								
								// 지도를 생성합니다
								
								var map = new daum.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();
								
								// 주소로 좌표를 검색합니다
								
								geocoder.addressSearch('${PLACEADDRESS}', function(result, status) {
								
								    // 정상적으로 검색이 완료됐으면 
								    
								     if (status === daum.maps.services.Status.OK) {
								
								        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
								
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        
								        var marker = new daum.maps.Marker({
								            map: map,
								            position: coords
								        });
								
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        
								        var infowindow = new daum.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:1px 0;">공연장</div>'
								        });
								        infowindow.open(map, marker);
								        
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        
								        map.setCenter(coords);
								    } 
								});    
								</script>
							</div>
						</div>						
					</div>

					<!-- Tab Reviews -->
					<script>
						var performNo = ${no};
						var userId='${USERID}';
						function fn_paging(cPage,numPerPage){
							$.ajax({
								url : "${path}/performance/performReviewPaging.do",
								data : {no : performNo,
									cPage : cPage},
								type : "POST",
								dataType : "html",
								success : function(data)
								{
									
									var reviewForm = $("#reviewList");
									reviewForm.html(data);
								}
							});
						};
						function fn_questionPaging(cPage,numPerPage)
						{
							$.ajax({
								url : "${path}/performance/performQuestionPaging.do",
								data : {no : performNo,
									cPage : cPage,
									USERID : userId},
								type : "POST",
								dataType : "html",
								success : function(data)
								{
									$('#questionList').empty();
									$('#questionList').html(data);
								}
							});
						}
						function fn_review_delete(a,b)
						{
							var bool = confirm("정말로 삭제하시겠습니까??");
							if(bool)
							{
								location.href='${path}/performance/performReviewDelete.do?no='+a+'&reviewNo='+b;
							}
							else
							{
								return;		
							}
						}
						function fn_review_update(no,pNo)
						{
							var re = {reviewNo : no,
									no : pNo};
							 $.ajax({
								url : "${path}/performance/performReviewUpdate.do",
								data : re,
								dataType : "html",
								success : function(data){
									
									$('#review_'+no).html(data);

									$('#review_cancel').on("click",function(){
										var up_reviewNo = $('#up_reviewNo').val();
										var canRe = {reviewNo : up_reviewNo,
												no : pNo};
										$.ajax({
											url : "${path}/performance/performReviewUpdateCancel.do",
											data : canRe,
											dataType : "html",
											success : function(data)
											{
												$('#review_'+no).html(data);
												
											}
										});
									});
									
									$('#review_update_submit').on("click",function(){
										
										var upBool = confirm("수정 하시겠습니까?");
										if(upBool)
										{  
											var review=$("#reviewUp_message");
											var bool=false;
											if(review.val().trim().length>=10)
											{															
												bool=true;
											}
											else
											{
												alert("리뷰는 10글자 이상");
												review.val("");
												review.focus();
												bool=false;
											}
											if(bool)
											{
												var upRe = {reviewNo : $('#up_reviewNo').val(),
														reviewUp_message : $('#reviewUp_message').val(),
														starUpdateScore : $('#starUpdateScore').val(),
														no : pNo
														};
												$.ajax({
													url : "${path}/performance/performReviewUpdateEnd.do",
													data : upRe,
													dataType : "html",
													success : function(data)
													{
														$('#review_'+no).html(data);
													}
												});
											}
											else{return}
										}else{return}
									});
								}
							});
						}
					</script>
					
					<div id="tab_3" class="tab_container" style='margin-left: 10%; margin-right: 10%;' >
						<div class="col w-100" >
							<!-- Add Review -->
							<div class="tab_title reviews_title" style='margin-bottom:-5%;' >
								<h4>Reviews</h4>
							</div>
							<div class=" add_review_col">
								<div class="add_review">
									<form id="review_form" action="${path }/performance/performReviewInsert.do" method="post" onsubmit="return fn_review_validate();">
										<input type='hidden' name='no' value='${PERFORMNO }'/>
										
										<c:if test="${empty memberLoggedIn}">
											<h1>로그인 후 댓글 등록 가능합니다.</h1>
											<br>
										</c:if>
										
										<c:if test="${memberLoggedIn.separator ne 'C' and !empty memberLoggedIn}">
											<h1>&nbsp;&nbsp; ID : ${memberLoggedIn.userId }</h1>
											<br>
										</c:if>
										
										<c:set var='review_check' value='0'/>
										<c:forEach items="${reviewCheckList}" var="r" varStatus="status">
											<c:if test="${review_check eq '0' }">
												<c:if test="${memberLoggedIn.userId eq r.USERID }">
													<c:set var='review_check' value='1'/>			
												</c:if>												
											</c:if>
										</c:forEach>
										
										<c:if test="${review_check eq '1' }">
											<h1>&nbsp;&nbsp; ID : ${memberLoggedIn.userId }</h1>
											<br>
										</c:if>
										
										<c:if test="${memberLoggedIn.separator eq 'C' and !empty memberLoggedIn and review_check eq '0'}">
											<div style='margin-top:30px;'>							
											<h1>&nbsp;&nbsp;
												ID : ${memberLoggedIn.userId } 
												<ul id='star_score' class="user_star_rating">
													<li><i class="fa fa-star" name='1' aria-hidden="true" ></i></li>
													<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
													<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
												</ul>
												<input type='hidden' id='starScore' name='starScore' value='1'/>
											</h1>
												<span></span>
												<textarea id="review_message" class="input_review" name="review"  placeholder="Your Review" rows="5" required data-error="Please, leave us a review."></textarea>
											</div>
											<div class="text-left text-sm-right">
												<button id="review_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">확인</button>
												<input type='hidden' name='userId' value='${memberLoggedIn.userId }'/>
											</div>
										</c:if>
										
									</form>
								</div>
							</div>
							<!-- User Reviews -->
							<script>
							
								function fn_like(no)
								{
									var like_check=$('#like_'+no+'_check');
									var userId = '${memberLoggedIn.userId}';
									var performNo = '${PERFORMNO}';
									if(like_check.val()=='0')
									{
										$("#like_"+no).children().attr("src","${path}/resources/img/product-img/like1.PNG");
										
										$.ajax({
											url : "${path}/performance/performReivewLikeInsert.do",
											data : {reviewNo : no,
												userId : userId,
												performNo : performNo},
											dataType : "json",
											success : function(data)
											{
												$("#review_"+no+"_likeCount").empty();
												var html ="";
												html+="좋아요 "+data.reviewLikeCount+"개 &nbsp;&nbsp;";
												$("#review_"+no+"_likeCount").html(html);
											}
										});
										like_check.val('1');
									}
									else
									{
										$("#like_"+no).children().attr("src","${path}/resources/img/product-img/like.PNG");
										
										$.ajax({
											url : "${path}/performance/performReivewLikeDelete.do",
											data : {reviewNo : no,
												userId : userId,
												performNo : performNo},
											dataType : "json",
											success : function(data)
											{
												$("#review_"+no+"_likeCount").empty();
												var html ="";
												html+="좋아요 "+data.reviewLikeCount+"개 &nbsp;&nbsp;";
												$("#review_"+no+"_likeCount").html(html);
											}
										});
										like_check.val('0');
									}
								}
							</script>
							<div id='reviewList'>
							
							<c:if test='${empty reviewList  }'>
								<h4 style='color:red; margin-left:30px;'>댓글이 없습니다.</h4>
							</c:if>
							
								<c:forEach items="${reviewList}" var="r" varStatus="status">
								<c:if test="${status.index==0 }">
									<hr>
								</c:if>
									<div id='review_${r.REVIEWNO }' class="user_review_container flex-column flex-sm-row">
										<div style='float:right;'>
										
											<c:if test="${memberLoggedIn.userId ne r.USERID and !empty memberLoggedIn }">
												<c:set var='likecheck' value='0' />
												<c:forEach items="${likeCheckList}" var="c" varStatus="status">
													<c:if test="${likecheck eq 0 }">
														<c:if test="${r.REVIEWNO eq c.REVIEWNO }">
															<c:if test="${memberLoggedIn.userId eq c.USERID }">
																<c:set var='likecheck' value='1' />		
															</c:if>
														</c:if>
													</c:if>
												</c:forEach>
												
												<c:set var='likecheck2' value='${likecheck }'/>											
												<input type='hidden' id='like_${r.REVIEWNO }_check' name='like_check' value='${likecheck }'/>
												
												<c:if test="${likecheck eq '1' }">
													<span class='like_cccc' style='margin-left :5px;'>
														<a id='like_${r.REVIEWNO }' href='javascript:fn_like(${r.REVIEWNO})'>
															<img id='like' src="${path}/resources/img/product-img/like1.PNG" style='width:21px; height:21px;'/>
														</a>
													</span>
												</c:if>
												
												<c:if test="${likecheck eq '0' }">
													<span class='like_cccc' style='margin-left :5px;'>
														<a id='like_${r.REVIEWNO }' href='javascript:fn_like(${r.REVIEWNO})'>
															<img id='like' src="${path}/resources/img/product-img/like.PNG" style='width:21px; height:21px;'/>
														</a>
													</span>
												</c:if>
											</c:if>
											
											<input type='hidden' id='like_${r.REVIEWNO }_check' name='like_check' value='${likecheck }'/>
											
											<span id='review_${r.REVIEWNO }_likeCount'>
												<span>좋아요 ${r.LIKECOUNT }개 &nbsp;&nbsp;</span>
											</span>
											 
											<c:if test="${memberLoggedIn.separator eq 'A' }">
												<button class='red_button review_submit_btn trans_30' onclick ='fn_review_update(${r.REVIEWNO},${r.PERFORMNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
												<button class='red_button review_submit_btn trans_30' onclick ='fn_review_delete(${r.PERFORMNO},${r.REVIEWNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
											</c:if>
											<c:if test="${memberLoggedIn.separator eq 'C' and memberLoggedIn.userId eq r.USERID }">
												<button class='red_button review_submit_btn trans_30' onclick ='fn_review_update(${r.REVIEWNO},${r.PERFORMNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
												<button class='red_button review_submit_btn trans_30' onclick ='fn_review_delete(${r.PERFORMNO},${r.REVIEWNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
											</c:if>
										</div>
										<div>
											<div class="review_date">
												<fmt:formatDate value="${r.REVIEWDATE }" pattern="yyyy-MM-dd "/><br>
											</div>
										
											<div class="user_name">
												${r.USERID }
												<script>
													$(function(){
														var score=${r.PERFORMSCORE};
														switch(score)
														{
														case 1: break;
														case 2: 
															$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
															break;
														case 3: 
															$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
															$('.re_${r.REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
															break;
														case 4: 
															$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
															$('.re_${r.REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
															$('.re_${r.REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
															break;
														case 5: 
															$('.re_${r.REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
															$('.re_${r.REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
															$('.re_${r.REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
															$('.re_${r.REVIEWNO}').children().eq(4).children().attr('class','fa fa-star');
															break;
														default : break;
														}
													});
												</script>
												<span>
													<ul class="star_rating re_${r.REVIEWNO}">
														<li><i class="fa fa-star" name='1' aria-hidden="true"></i></li>
														<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
														<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
														<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
														<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
													</ul>
												</span>
											</div>
										<div>
											<p>${r.REVIEWCONTENT }</p>
										</div>
									</div>
								</div>
								<c:if test='${!status.last }'>
									<hr>
								</c:if> 
								</c:forEach>
								<div id='pageBar1' align="center">
				         			${reviewPageBar }<br/>
				         		</div>
							</div>
						</div>
					</div>
					<script>
						function fn_questionReviewUpdate(no) //no = 대댓글의 번호
						{
							$("#questionReview_content_"+no).empty();
							var html="<textarea id='questionReviewUpdate_message' class='input_questionReview' style='margin-bottom: 10px;' name='message'  placeholder='Your Review' rows='5' cols='104' required data-error='Please, leave us a review.'></textarea>";
							html+="<div style='margin-left:396px;'>";
							html+="<button id='questionReview_Update_submit' type='submit' class='red_button review_submit_btn trans_300'>확인</button>&nbsp;";
							html+="<button id='questionReview_Update_cancel' type='button' class='red_button review_submit_btn trans_300'>뒤로</button>";
							html+="</div>";
							$("#questionReview_content_"+no).html(html);
							
							$('#questionReview_Update_cancel').on("click",function(){
								
								$.ajax({
									url : "${path}/performance/performQuestionReviewUpdateCancel.do",
									data : {questionNo : no},
									dataType : "json",
									success : function(data)
									{
										$("#questionReview_content_"+no).empty();
										var html1 ="<p id='questionReview_content_"+data.questionMap.QUESTIONNO+"' style='width:740px; margin-bottom:-5px;'>"+data.questionMap.QUESTIONCONTENT+"</p>";
										$("#questionReview_content_"+no).html(html1);
									}
								});
							});
							$('#questionReview_Update_submit').on("click",function(){
								var upBool = confirm("수정 하시겠습니까?");
								if(upBool)
								{  
									var questionReviewUpdate=$("#questionReviewUpdate_message");
									var bool=false;
									if(questionReviewUpdate.val().trim().length>=10)
									{														
										bool=true;
									}
									else
									{
										alert("리뷰는 10글자 이상");
										questionReviewUpdate.val("");
										questionReviewUpdate.focus();
										bool=false;
									}
									if(bool)
									{
										$.ajax({
											url : "${path}/performance/performQuestionReviewUpdateEnd.do",
											data : {questionNo : no,
												questionReviewUpdate_message : $('#questionReviewUpdate_message').val()},
											dataType : "json",
											success : function(data)
											{
												$("#questionReview_content_"+no).empty();
												var html1 ="<p id='questionReview_content_"+data.questionMap.QUESTIONNO+"' style='width:740px; margin-bottom:-5px;'>"+data.questionMap.QUESTIONCONTENT+"</p>";
												$("#questionReview_content_"+no).html(html1);
											}
										});
									}
									else{return;}
								}
								else{return;}
							});
						}
						
						function fn_questionReviewDelete(no)
						{
							if(confirm("삭제 하시겠습니까??")){
								$.ajax({
									url : "${path}/performance/performQuestionReviewDelete.do",
									data : {questionNo : no},
									dataType : "json",
									success : function(data)
									{
										$('#questionReview_'+data.questionMap.QUESTIONREF).empty();
										$("input[name=review_"+data.questionMap.QUESTIONREF+"]").val('0');
									}
								});
							}
							else{return;}
						}
						
						function fn_question_review(no,userId)
						{
							$.ajax({
								url : '${path}/performance/performQuestionReviewForm.do',
								data : {userId : userId,
									no : no},
								dataType : "json",
								success : function(data){
									$('#questionReview_'+no).empty();
									
									if(data.questionReviewList==""){
										var html = "";
										html+="<hr style=' margin-left:52px; width:830px;'/>";
										html+="<div class='user_review_container d-flex flex-column flex-sm-row' style=' margin-left:52px;'>";
										html+="<div style='margin:3.8% 0 0 0;'>";
										html+="<div><img src='${path}/resources/img/product-img/A.png' style='width:35px; height:30px;'></div></div>";
										html+="<div class='review' style='margin-left:-10px;'>";
										html+="<div class='review_date'>"+data.mTime+"</div>";
										html+="<div class='user_name'>"+data.userId+"</div>";
										html+="<textarea id='questionReview_message' class='input_questionReview' style='margin-bottom: 10px;' name='message'  placeholder='Your Review' rows='5' cols='105' required data-error='Please, leave us a review.'></textarea>";
										html+="<div class='text-left text-sm-right' >";
										html+="<button id='questionReview_submit' type='submit' class='red_button review_submit_btn trans_300'>등록</button>&nbsp;";
										html+="<button id='questionReview_cancel' type='button' class='red_button review_submit_btn trans_300'>취소</button>";
										html+="</div></div></div>";
										$('#questionReview_'+no).html(html);
									}
									else
									{
									 	if($("input[name=review_"+no+"]").val()==0){
											$.each(data.questionReviewList, function(i, item){
												var date=new Date(item.QUESTIONDATE);
												var html = "<hr style=' margin-left:52px; width:830px;'>";
												html +="<div class='user_review_container d-flex flex-column flex-sm-row' style=' margin-left:52px;'>";
												html +="<div style='margin:3.8% 0 0 0;'>";
												html +="<div><img src='${path}/resources/img/product-img/A.png' style='width:35px; height:30px;'/></div>";
												html +="</div>";
												html +="<div class='review'>";
												html +="<div class='review_date'>"+date.getFullYear()+"-"+(date.getMonth()<10?'0'+(date.getMonth()+1):(date.getMonth()+1))+"-"+date.getDate()+"</div>";
												html +="<div class='user_name'>";
												html +=item.USERID;
												html +="<div style='float:right;'>";
												html +="<button id='questionReviewUpdate' onclick='fn_questionReviewUpdate("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>&nbsp;";
												html +="<button id='questionReviewDelete' onclick='fn_questionReviewDelete("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>";
												html +="</div></div>";
												html +="<p id='questionReview_content_"+item.QUESTIONNO+"' style='width:740px; margin-bottom:-5px;'>"+item.QUESTIONCONTENT+"</p>";
												html +="</div></div>";
												$('#questionReview_'+no).append(html);
											});
											$("input[name=review_"+no+"]").val('1');
									 	}
									 	else
										{
											$('#questionReview_'+no).empty();
											$("input[name=review_"+no+"]").val('0');
										} 
									}
									
									$('#questionReview_submit').on("click",function(){
										var level = '2';
										var upBool = confirm("등록 하시겠습니까?");
										if(upBool)
										{  
											var questionReview=$("#questionReview_message");
											var bool=false;
											if(questionReview.val().trim().length>=10)
											{															
												bool=true;
											}
											else
											{
												alert("리뷰는 10글자 이상");
												questionReview.val("");
												questionReview.focus();
												bool=false;
											}
											if(bool)
											{
												var upRe = {no : no,
														questionReview_message : $('#questionReview_message').val(),
														level : level,
														userId : userId,
														performNo : ${PERFORMNO }
												};
												$.ajax({
													url : "${path}/performance/performQuestionReviewEnd.do",
													data : upRe,
													dataType : "json",
													success : function(data)
													{
														$('#questionReview_'+no).empty();
														$.each(data.questionReviewList, function(i, item){
															var date=new Date(item.QUESTIONDATE);
															var html = "<hr style=' margin-left:52px; width:830px;'>";
															html +="<div class='user_review_container d-flex flex-column flex-sm-row' style=' margin-left:52px;'>";
															html +="<div style='margin:3.8% 0 0 0;'>";
															html +="<div><img src='${path}/resources/img/product-img/A.png' style='width:35px; height:30px;'/></div>";
															html +="</div>";
															html +="<div class='review'>";
															html +="<div class='review_date'>"+date.getFullYear()+"-"+(date.getMonth()<10?'0'+(date.getMonth()+1):(date.getMonth()+1))+"-"+date.getDate()+"</div>";
															html +="<div class='user_name'>";
															html +=item.USERID;
															html +="<div style='float:right;'>";
															html +="<button id='questionReviewUpdate' onclick='fn_questionReviewUpdate("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>&nbsp;";
															html +="<button id='questionReviewDelete' onclick='fn_questionReviewDelete("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>";
															html +="</div></div>";
															html +="<p id='questionReview_content_"+item.QUESTIONNO+"' style='width:740px; margin-bottom:-5px;'>"+item.QUESTIONCONTENT+"</p>";
															html +="</div></div>";
															$('#questionReview_'+no).append(html);
														});
														$("input[name=review_"+no+"]").val('1');
													}
												});
											}
											else{
												return;
											}
										}else{
											return;
										}
									});
									$('#questionReview_cancel').on("click",function(){
										$('#questionReview_'+no).empty();	
									});
								}
							});
						}
					
						function fn_questionReview(no)
						{
							var bool = $("input[name=review_"+no+"]").val()==0;
							if(bool){
								$.ajax({
									url : '${path}/performance/performQuestionReview.do',
									data : {no : no},
									type : 'POST',
									contentType: "application/x-www-form-urlencoded; charset=UTF-8",
									dataType : 'json',
									success : function(data){
										console.log(typeof data);
										var questionReview = $('#questionReview_'+no);
										questionReview.empty();
										if(data.questionReviewList=="")
										{
											var html = "<hr style=' margin-left:52px; width:830px;'>";
											html +="<div class='user_review_container d-flex flex-column flex-sm-row' style=' margin-left:52px; margin-top:-11px;'>";
											html +="<div style='margin:3.8% 0 0 0;'>";
											html +="<div><img src='${path}/resources/img/product-img/A.png' style='width:35px; height:30px;'/></div>";
											html +="</div>";
											html +="<h5 style='width:740px; margin-top:38px; margin-left:15px;'>등록된 댓글이 없습니다.</h5>";
											html +="</div>";
											questionReview.append(html);
											$("input[name=review_"+no+"]").val('1');
										}
										else
										{
											$.each(data.questionReviewList, function(i, item){
												var date=new Date(item.QUESTIONDATE);
												var html = "<hr style=' margin-left:52px; width:830px;'>";
												html +="<div class='user_review_container d-flex flex-column flex-sm-row' style=' margin-left:50px;'>";
												html +="<div style='margin:3.8% 0 0 0;'>";
												html +="<div><img src='${path}/resources/img/product-img/A.png' style='width:35px; height:30px;'/></div>";
												html +="</div>";
												html +="<div class='review'>";
												html +="<div class='review_date'>"+date.getFullYear()+"-"+(date.getMonth()<10?'0'+(date.getMonth()+1):(date.getMonth()+1))+"-"+date.getDate()+"</div>";
												html +="<div class='user_name'>";
												html +=item.USERID;
												html +="<div style='float:right;'>";
												
												<c:if test="${memberLoggedIn.separator eq 'S' and memberLoggedIn.userId eq USERID}">
													html +="<button id='questionReviewUpdate' onclick='fn_questionReviewUpdate("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>&nbsp;";
													html +="<button id='questionReviewDelete' onclick='fn_questionReviewDelete("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>";
												</c:if>
												
												<c:if test="${memberLoggedIn.separator eq 'A'}">
													html +="<button id='questionReviewUpdate' onclick='fn_questionReviewUpdate("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>&nbsp;";
													html +="<button id='questionReviewDelete' onclick='fn_questionReviewDelete("+item.QUESTIONNO+")' class='red_button review_submit_btn trans_30' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>";
												</c:if>
												
												html +="</div></div>";
												html +="<p id='questionReview_content_"+item.QUESTIONNO+"' style='width:740px; margin-bottom:-5px;'>"+item.QUESTIONCONTENT+"</p>";
												html +="</div></div>";
												questionReview.append(html);
											});
											$("input[name=review_"+no+"]").val('1');
										}
									}
								});
							}
							else{
								var questionReview = $('#questionReview_'+no);
								questionReview.empty();
								$("input[name=review_"+no+"]").val('0');
							}
						} 
						
						function fn_question_update(no)
						{
							$("#question_content_"+no).empty();
							var html="<textarea id='questionUpdate_message' class='input_questionReview' style='margin-bottom: 10px;' name='message'  placeholder='Your Review' rows='5' cols='110' required data-error='Please, leave us a review.'></textarea>";
							html+="<div style='margin-left:445px;'>";
							html+="<button id='question_Update_submit' type='submit' class='red_button review_submit_btn trans_300'>확인</button>&nbsp;";
							html+="<button id='question_Update_cancel' type='button' class='red_button review_submit_btn trans_300'>뒤로</button>";
							html+="</div>";
							$("#question_content_"+no).html(html);
							
							$("#question_Update_cancel").on("click",function(){
								
								$("#question_content_"+no).empty();
								
								$.ajax({
									url : "${path}/performance/performQuestionUpdateCancel.do",
									data : {questionNo : no},
									type : "POST",
									contentType: "application/x-www-form-urlencoded; charset=UTF-8",
									dataType : 'json',
									success : function(data){
										var html ="";
										html+="<p id='question_content_"+data.questionMap.QUESTIONNO+"' style='width:800px; margin-bottom:-30px;'>"+data.questionMap.QUESTIONCONTENT+"</p>";
										$("#question_content_"+no).html(html);
									}
								});
							});
							$("#question_Update_submit").on("click",function(){
								var upBool = confirm("수정 하시겠습니까?");
								if(upBool)
								{  
									var questionUpdate=$("#questionUpdate_message");
									var bool=false;
									if(questionUpdate.val().trim().length>=10)
									{															
										bool=true;
									}
									else
									{
										alert("리뷰는 10글자 이상");
										questionUpdate.val("");
										questionUpdate.focus();
										bool=false;
									}
									if(bool)
									{
										var upRe = {questionNo : no,
											questionUpdate_message : $('#questionUpdate_message').val()};
										
										$.ajax({
											url : "${path}/performance/performQuestionUpdateEnd.do",
											data : upRe,
											dataType : "json",
											success : function(data)
											{
												$("#question_content_"+no).empty();
												var html ="";
												html+="<p id='question_content_"+data.questionMap.QUESTIONNO+"' style='width:800px; margin-bottom:-30px;'>"+data.questionMap.QUESTIONCONTENT+"</p>";
												$("#question_content_"+no).html(html);
											}
										});
									}
									else{return;}
								}else{return;}
							});
						}
						
						function fn_question_delete(no)
						{
							var deBool = confirm("삭제 하시겠습니까?");
							if(deBool){  
								location.href='${path}/performance/performQuestionDelete.do?questionNo='+no+'&performNo=${PERFORMNO}';
							}
							else
							{
								return;
							}
						}
					</script>
					<div id="tab_4" class="tab_container" style='margin-left: 10%; margin-right: 10%;' >
						<div class="col w-100" >
							<!-- Add Review -->
							<div class="tab_title reviews_title" style='margin-bottom:-5%;' >
								<h4>Q&A</h4>
							</div>
							<div class=" add_review_col">
								<div class="add_review">
									<form id="review_form" action="${path }/performance/performQuestionInsert.do" method="post" onsubmit="return fn_question_validate();">
										<input type='hidden' name='no' value='${PERFORMNO }'/>
										<input type='hidden' name='quest_level' value='1'/>
										<input type='hidden' name='userId' value='${memberLoggedIn.userId }'/>
										 
										 <c:if test="${empty memberLoggedIn}">
											<h1>로그인 후 댓글 등록 가능합니다.</h1>
										</c:if>
										
										<c:if test="${memberLoggedIn.separator ne 'C' and !empty memberLoggedIn}">
											<h1>&nbsp;&nbsp; ID : ${memberLoggedIn.userId }</h1>
										</c:if>
										
										<c:set var='question_check' value='0'/>
										<c:forEach items="${questionCheckList}" var="q" varStatus="status">
											<c:if test="${question_check eq '0' }">
												<c:if test="${memberLoggedIn.userId eq q.USERID }">
													<c:set var='question_check' value='1'/>			
												</c:if>												
											</c:if>
										</c:forEach>
										
										
										<c:if test="${question_check eq '1' }">
											<h1>&nbsp;&nbsp; ID : ${memberLoggedIn.userId }
											<br>
										</c:if>
										
										<c:if test="${memberLoggedIn.separator eq 'C' and !empty memberLoggedIn and question_check eq '0' }">
											<div style='margin-top:30px;'>
											<h1>&nbsp;&nbsp;
												ID : ${memberLoggedIn.userId } 
											</h1>
												<span></span>
												<textarea id="question_message" class="input_review" name="question"  placeholder="Your question" rows="5" required data-error="Please, leave us a review."></textarea>
											</div>
											<div class="text-left text-sm-right">
												<button id="question_submit" type="submit" class="red_button review_submit_btn trans_300" value="Submit">확인</button>
											</div>
										</c:if>
										
									</form>
								</div>
							</div>
							<br>
							<!-- User Reviews -->
							<div id='questionList'>
								<c:if test='${empty questionList  }'>
									<h4 style='color:red; margin-left:30px;'>댓글이 없습니다.</h4>
								</c:if>
								<c:forEach items="${questionList}" var="q" varStatus="status">
									<c:if test="${status.index==0 }">
										<hr>
									</c:if>
									<c:if test="${q.QUESTIONLEVEL eq 1 }">
										<div id='questionList_${q.QUESTIONNO }' class="user_review_container d-flex flex-column flex-sm-row">
											<div style='margin:3.8% 0 0 0;'>
												<div><img src="${path}/resources/img/product-img/Q.png"  style='width:35px; height:30px;'></div>
											</div>
											<div class="review" style='margin-left:-10px;'>
												<div class="review_date"><fmt:formatDate value="${q.QUESTIONDATE }" pattern="yyyy-MM-dd "/><br></div>
												<div class="user_name">
													${q.USERID }
													<div style='float:right'>
														<a id='re_view_view' href="javascript:fn_questionReview(${q.QUESTIONNO })">댓글보기</a>
														
														<c:if test="${memberLoggedIn.separator eq 'S' and memberLoggedIn.userId eq USERID }">
															<button class='red_button review_submit_btn trans_30' onclick="fn_question_review(${q.QUESTIONNO },'${USERID }')" style='width:50px; height:20px; background-color:#E4E4E4'>댓글</button>
														</c:if>
														
														<c:if test="${memberLoggedIn.separator eq 'C' and memberLoggedIn.userId eq q.USERID }">
															<button class='red_button review_submit_btn trans_30' onclick='fn_question_update(${q.QUESTIONNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
															<button class='red_button review_submit_btn trans_30' onclick='fn_question_delete(${q.QUESTIONNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
														</c:if>
														
														<c:if test="${memberLoggedIn.separator eq 'A'}">
															<button class='red_button review_submit_btn trans_30' onclick="fn_question_review(${q.QUESTIONNO },'${USERID }')" style='width:50px; height:20px; background-color:#E4E4E4'>댓글</button>
															<button class='red_button review_submit_btn trans_30' onclick='fn_question_update(${q.QUESTIONNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
															<button class='red_button review_submit_btn trans_30' onclick='fn_question_delete(${q.QUESTIONNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
														</c:if>
														
													</div>
												</div>
												<p id='question_content_${q.QUESTIONNO }' style='width:800px; margin-bottom:-30px;'>${q.QUESTIONCONTENT }</p>
											<br>
											</div>
										</div>
									</c:if>
									<div id='questionReview_${q.QUESTIONNO }'></div>
									<input type='hidden' name='review_${q.QUESTIONNO }' value='0'/>
									<c:if test='${!status.last }'>
										<hr>
									</c:if> 
									</c:forEach>
									<div id='pageBar2' align="center">
										<br>
					         			${questionPageBar }<br/>
					         		</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Benefit -->

	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>