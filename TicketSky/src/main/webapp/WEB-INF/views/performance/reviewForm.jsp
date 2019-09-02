<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

		<div style='float:right;'>
			<c:if test="${memberLoggedIn.userId ne USERID and !empty memberLoggedIn }">
				<c:set var='likecheck' value='0' />
				<c:forEach items="${likeCheckList}" var="c" varStatus="status">
					<c:if test="${likecheck eq 0 }">
						<c:if test="${REVIEWNO eq c.REVIEWNO }">
							<c:if test="${memberLoggedIn.userId eq c.USERID }">
								<c:set var='likecheck' value='1' />		
							</c:if>
						</c:if>
					</c:if>
				</c:forEach>
				
				<c:set var='likecheck2' value='${likecheck }'/>											
				<input type='hidden' id='like_${REVIEWNO }_check' name='like_check' value='${likecheck }'/>
				
				<c:if test="${likecheck eq '1' }">
					<span class='like_cccc' style='margin-left :5px;'>
						<a id='like_${REVIEWNO }' href='javascript:fn_like(${REVIEWNO})'>
							<img id='like' src="${path}/resources/img/product-img/like1.PNG" style='width:21px; height:21px;'/>
						</a>
					</span>
				</c:if>
				
				<c:if test="${likecheck eq '0' }">
					<span class='like_cccc' style='margin-left :5px;'>
						<a id='like_${REVIEWNO }' href='javascript:fn_like(${REVIEWNO})'>
							<img id='like' src="${path}/resources/img/product-img/like.PNG" style='width:21px; height:21px;'/>
						</a>
					</span>
				</c:if>
			</c:if>
			
			<input type='hidden' id='like_${REVIEWNO }_check' name='like_check' value='${likecheck }'/>
			
			<span id='review_${REVIEWNO }_likeCount'>
				<span>좋아요 ${LIKECOUNT }개 &nbsp;&nbsp;</span>
			</span>
			 
			<c:if test="${memberLoggedIn.separator eq 'A' }">
				<button class='red_button review_submit_btn trans_30' onclick ='fn_review_update(${REVIEWNO},${PERFORMNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
				<button class='red_button review_submit_btn trans_30' onclick ='fn_review_delete(${PERFORMNO},${REVIEWNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
			</c:if>
			<c:if test="${memberLoggedIn.separator eq 'C' and memberLoggedIn.userId eq USERID }">
				<button class='red_button review_submit_btn trans_30' onclick ='fn_review_update(${REVIEWNO},${PERFORMNO })' style='width:50px; height:20px; background-color:#E4E4E4'>수정</button>
				<button class='red_button review_submit_btn trans_30' onclick ='fn_review_delete(${PERFORMNO},${REVIEWNO })' style='width:50px; height:20px; background-color:#E4E4E4'>삭제</button>
			</c:if>
		</div>
		
		<div>
			<div class="review_date">
				<fmt:formatDate value="${REVIEWDATE }" pattern="yyyy-MM-dd"/><br>
			</div>
			<div class="user_name">
				${USERID }
				<script>
					$(function(){
						var score=${PERFORMSCORE};
						switch(score)
						{
						case 1: break;
						case 2: 
							$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
							break;
						case 3: 
							$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
							$('.re_${REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
							break;
						case 4: 
							$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
							$('.re_${REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
							$('.re_${REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
							break;
						case 5: 
							$('.re_${REVIEWNO}').children().eq(1).children().attr('class','fa fa-star');
							$('.re_${REVIEWNO}').children().eq(2).children().attr('class','fa fa-star');
							$('.re_${REVIEWNO}').children().eq(3).children().attr('class','fa fa-star');
							$('.re_${REVIEWNO}').children().eq(4).children().attr('class','fa fa-star');
							break;
						default : break;
						}
					});
				</script>
				<span>
					<ul class="star_rating re_${REVIEWNO}">
						<li><i class="fa fa-star" name='1' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='2' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='3' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='4' aria-hidden="true"></i></li>
						<li><i class="fa fa-star-o" name='5' aria-hidden="true"></i></li>
					</ul>
				</span>
			</div>
			<div>
				<p>${REVIEWCONTENT }</p>
			</div>
		</div>
