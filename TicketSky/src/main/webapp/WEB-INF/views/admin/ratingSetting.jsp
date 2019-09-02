<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/adminAside.jsp"></jsp:include>

<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>회원 등급 관리</h4>
                    </div>
                    <hr>
                    
                                       <div class="row" style="margin-top:3%;">
                      <table class="tableTL table table-striped"  style="text-align:center;">
                      <!-- <colgroup>
                         <col width="1%"/>
                            <col width="2%"/>
                            <col width="10%"/>
                            <col width="2%"/>
                            <col width="25%"/>
                            <col width="4%"/>
                            <col width="5%"/>
                            <col width="6%"/>
                      </colgroup> -->
                      <thead>
                          <tr>
                              <th scope="col">회원등급</th>
                              <th scope="col">할인율</th>
                              <th scope="col">등급 조건</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${list }" var="r">
      		               	<tr>
      			                <td>${r.RATINGNAME }</td>
      			                <td>${r.DISCOUNTRATE }%</td>
                            	<td><fmt:formatNumber value="${r.RATINGAMOUNT }" pattern="#,###"/>원 이상</td>
      			                <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="fn_rating('${r.RATINGCODE}','${r.RATINGNAME }','${r.DISCOUNTRATE }','${r.RATINGAMOUNT }');">수정</button></td>
      			            </tr>
      			        </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar }
                    </div>
                  </div>
              </div>
          </div>
          
          
			
			<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
			  <div class="modal-dialog">
			<form action="${path }/ticketsky/user/consumerRatingSettingEnd" method="post">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			      	<h4 class="modal-title">등급 수정</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      <div class="modal-body">
			      	<input type="hidden" id="ratingCode" name="ratingCode"/>
			        <span>회원등급</span>
			        <input id="ratingName" name="ratingName" type="text" class="form-control"/>
			        <br>
			        <span>할인율</span>
			        <input id="discountrate" name="discountrate" type="number" min="0" max="100" class="form-control"/>
			        <br>
			        <span>등급 조건</span>
			        <input id="ratingamount" name="ratingamount" step="100000" type="number" min="0"  class="form-control"/>
			      </div>
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-primary">수정</button>
			        <button type="submit" class="btn btn-default" data-dismiss="modal" >닫기</button>
			      </div>
			    </div>
			</form>
			
			  </div>
			</div>
			
			<script>
				function fn_rating(code,name,discount,amount){
					
					$('#ratingCode').val(code);
					$('#ratingName').val(name);
					$('#discountrate').val(discount);
					$('#ratingamount').val(amount);
				}
			</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>