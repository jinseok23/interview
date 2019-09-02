<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/adminAside.jsp"></jsp:include>
<script>
          	function fn_delete(performNo){
          		
          		var con = confirm("공연을 삭제하시겠습니까?");
          		if(con == true){
          			location.href="${path}/info/deletePerform?performNo="+performNo;
          		}
          	}
</script>
<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>공연 관리</h4>
                    </div>
                    <hr>
                    
                    <div class="row">     
                    	<div class="col-md-5">전체 ${totalCount }</div>     
	                        <form class="form-inline col-md-7" action="${path }/user/consumerList">
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="userName">회원명</option>
                                <option value="userId">아이디</option>
                                <option value="ratingName">회원등급</option>
                            </select>
                            &nbsp;&nbsp;
                            <input type="text" class="form-control" name="searchTitle"/>
                            &nbsp;&nbsp;
                            <button type="submit" class="btn btn-primary floa">조회</button>
	                        </form>
                    </div>
                    <!-- /.content -->
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
                              <th scope="col">판매자</th>
                              <th scope="col">공연명</th>
                              <th scope="col">주최/기획</th>
                              <th scope="col">공연기간</th>
                              <th scope="col">승인여부</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${piList }" var="m">
      		               	<tr>
      			                <td>${m.userId }</td>
      			                <td><a href="${path}/performance/performanceView.do?no=${m.performNo }" style="font-weight: bold">${m.performName }</a></td>
                            	<td >${m.companyName }</td>
      			                
      			                <td>${m.performDuration }</td>
      			                <td>
      			                <c:choose>
      			                	<c:when test="${m.performConfirm eq 'N'}">
									    승인대기
									 </c:when>	
								    <c:when test="${m.performConfirm eq 'Y'}">
								          승인완료
								    </c:when>
								    <c:otherwise>
									    수정요청
									</c:otherwise>
								</c:choose>
      			                </td>
      			                <td> 
      			                	<button type="button" class="btn btn-sm btn-danger" name="button" onclick="fn_delete('${m.performNo}');">삭제</button>
      			                	
      			                </td>
      			            </tr>
      			        </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar }
                    </div>
                  </div>
              </div>
          </div>
          


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>