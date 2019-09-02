<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<div id='questionList'>
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
							<a id='fuck' href="javascript:fn_questionReview(${q.QUESTIONNO })">댓글보기</a>
							
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