<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/consumerAside.jsp"></jsp:include>

<c:set value="${pageContext.request.contextPath}" var="path"/>
<%
Date CurrentDate = new Date();
%>

<div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>리뷰관리</h4>
                    </div>
                    <hr>
                    <div class="row">
                    
            						<div class="col-xs-12">
                          <div class="select-group">

                          </div>
                          
	                        <form class="form-inline float-right" action="${path }/user/reviewManage">
	                        
                            <label for="">전체 ${totalCount } </label>
                             &nbsp;&nbsp; &nbsp;&nbsp;
                            <div class="" style="margin-left:350px;">
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="REVIEWDATE">작성일</option>
                            </select>
                            &nbsp;&nbsp;
                            <select id="searchSelectBox2" name="year" class="form-control input-sm">
                             <%Calendar mon = Calendar.getInstance();
                                String year = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
                                mon.add(Calendar.YEAR , -1);
                                String year2 = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
                                mon.add(Calendar.YEAR , -1);
                                String year3 = new java.text.SimpleDateFormat("yyyy").format(mon.getTime());
                            	 %>
                                <option id="option1" value="<%=year %>"><%=year %></option>
                                <option id="option3" value="<%=year2 %>"><%=year2 %></option>
                                <option id="option3" value="<%=year3 %>"><%=year3 %></option>
                            </select>
                            &nbsp;&nbsp;
                            <select id="searchSelectBox3" name="month" class="form-control input-sm">
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            &nbsp;&nbsp;
                            <button type="submit" class="btn btn-primary floa">조회</button>
                            </div>
	                        </form>
                        </div>
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
                              <th scope="col">예매번호</th>
                              <th scope="col">티켓명</th>
                              <th scope="col">후기내용</th>
                              <th scope="col">작성일</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${list }" var="r">
      		               	<tr>
      			                <td>${r.ROWNUM }</td>
      			                <td>${r.PERFORMNAME }</td>
      			                <td>${r.REVIEWCONTENT }</td>
      			                <td>${r.REVIEWDATE }</td>
      			                <td> <button type="button" class="btn btn-sm btn-danger" name="button" onclick="fn_delete('${r.REVIEWNO}');">삭제</button> </td>
      			            </tr>
      			        </c:forEach>
      		             </tbody>
                      </table>
                      ${pageBar}
                    </div>
                  </div>
              </div>
          </div>
      </section>
      <br><br><br><br><br><br><br><br><br><br>
      <!-- ##### Shop Grid Area End ##### -->
      
      <script>
      $(function(){
    	  if("${searchType}" != ""){
      	$("#searchSelectBox").val("${searchType}").prop("selected", true);
    	  }
      	$("#searchSelectBox2").val("${year}").prop("selected", true); 
      	$("#searchSelectBox3").val("${month}").prop("selected", true); 
      });
      
      function fn_delete(reviewno){
    		var con = confirm("댓글을 삭제 시키겠습니까?");
    		if(con == true){
    			location.href="${path}/user/consumerReviewDelete?reviewno="+reviewno;
    		}
    	}
      </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>