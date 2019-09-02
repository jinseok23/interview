<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/sellerAside.jsp"></jsp:include>
<c:set value="${pageContext.request.contextPath}" var="path"/>
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
                      <h4>내 공연</h4>
                    </div>
                    <hr>
                    <div class="row">     
                    	<div class="col-md-4">전체 ${totalCount }</div>     
	                        <form class="form-inline col-md-8" action="${path }/user/sellerMyPlayList">
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="performName">공연제목</option>
                                <option value="placeName">공연장명</option>
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
                              <th scope="col">공연제목</th>
                              <th scope="col">공연장명</th>
                              <th scope="col">공연기간</th>
                              
                              <th scope="col">예매시작일</th>
                              <th scope="col">승인여부</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${list }" var="p">
      		               	<tr>
      		               	
      			                <td><a href="${path}/performance/performanceView.do?no=${p.PERFORMNO }"> ${p.PERFORMNAME }</a></td>
      			                <td>${p.PLACENAME }</td>
      			                <%-- <td><fmt:formatDate value="${p.STARTDATE}" pattern="yyyy-MM-dd"/></td>
      			                 <td><fmt:formatDate value="${p.ENDDATE}" pattern="yyyy-MM-dd"/></td> --%>      			             
      			                <td>${p.PERFORMDURATION }</td>
      			                <td><fmt:formatDate value="${p.TICKETOPENDATE}" pattern="yyyy-MM-dd  HH시 mm분"/></td> 
      			                	
      			                <td>
      			                
      			                <c:choose>
      			                	<c:when test="${p.PERFORMCONFIRM eq 'N'}">
									    승인대기
									 </c:when>	
								    <c:when test="${p.PERFORMCONFIRM eq 'Y'}">
								          승인완료
								    </c:when>
								    <c:otherwise>
									    수정요청
									</c:otherwise>
								</c:choose>
      			                </td>
      			                <!-- <td>
      			                	<button type="button" class="btn btn-sm btn-info" name="button">수정</button>
      			                </td> -->
      			                <td>
      			                	<button type="button" class="btn btn-sm btn-danger" name="button" onclick="fn_delete('${p.PERFORMNO}');">삭제</button>
      			                </td>
      			                <%-- <td>
      			                공연번호${p.PERFORMNO}
      			                </td> --%>
      			            </tr>
      			       </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar }

                    </div>
                  </div>
              </div>
          </div>
      </section>
      <!-- ##### Shop Grid Area End ##### -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>