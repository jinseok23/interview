<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/adminAside.jsp"></jsp:include>

<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>신고 게시물</h4>
                    </div>
                    <hr>
                    
                    <div class="row">     
                    	<div class="col-md-5">전체 ${totalCount }</div>     
	                        <form class="form-inline col-md-7" action="${path }/ticketsky/user/consumerList">
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
                              <th scope="col">아이디</th>
                              <th scope="col">회원명</th>
                              <th scope="col">이메일</th>
                              <th scope="col">회원등급</th>
                              <th scope="col">가입일</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${list }" var="m">
      		               	<tr>
      			                <td><a href="${path }/ticketsky/user/adminUserUpdate?userId=${m.userId}">${m.userId }</a></td>
      			                <td>${m.userName }</td>
                            <td>${m.email }</td>
      			                <td>${m.ratingName }</td>
      			                <td><fmt:formatDate value="${m.enrollDate}" pattern="yyyy-MM-dd"/></td>
      			                <td> <button type="button" class="btn btn-sm btn-danger" name="button" onclick="fn_delete('${m.userId}');">삭제</button> </td>
      			            </tr>
      			        </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar }
                    </div>
                  </div>
              </div>
          </div>
          
          <script>
          	function fn_delete(userId){
          		var con = confirm(userId+"님을 탈퇴 시키겠습니까?");
          		if(con == true){
          			location.href="${path}/ticketsky/user/consumerDeleteOne?userId="+userId;
          		}
          	}
          </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>