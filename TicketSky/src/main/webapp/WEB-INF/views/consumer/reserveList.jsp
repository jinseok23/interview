<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/consumerAside.jsp"></jsp:include>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<%@ page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%
Date CurrentDate = new Date();
%>

<%@ page import="java.text.SimpleDateFormat"%>
   <div class="col-12 col-md-8 col-lg-9">
                    <div class="row">
                      <h4>예매확인/취소</h4>
                    </div>
                    <hr>
                    <div class="row">   
                       <div class="col-md-5">전체 ${totalCount }</div>            
                           <form class="form-inline pull-right" action="${path }/user/reserveList">
                            <label for="">월 별 조회</label>
                            &nbsp;&nbsp;
                            <select id="searchSelectBox" name="searchType" class="form-control input-sm">
                                <option value="PURCHASEDATE">예매일</option>
                                <option value="WATCHDATE">관람일</option>
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
                              <th scope="col">예매번호</th>
                              <th scope="col">공연명</th>
                              <th scope="col">좌석명</th>
                              <th scope="col">관람일</th>
                              <th scope="col">구매일</th>
                              <th scope="col">가격</th>
                              <th scope="col">상태</th>
                              <th scope="col">비고</th>
                          </tr>
                      </thead>
                      <tbody>
               <c:forEach items="${list }" var="p">
                              <tr>
                               <td>${p.PURCHASECODE }</td>
                               <td>${p.PERFORMNAME }</td>
                               <td>${p.PURCHASESEAT }</td>
                               <td><fmt:formatDate value="${p.WATCHDATE }" pattern="yyyy-MM-dd hh시 mm분"/></td>
                               <td><fmt:formatDate value="${p.PURCHASEDATE }" pattern="yyyy-MM-dd"/></td>
                               <td>${p.ORIPRICE }</td>
                               <td>${p.STATUS }</td>
                               <fmt:formatDate value="<%=CurrentDate %>" pattern="yyyyMMddhhmm" var="nowDate" />             <%-- 오늘날짜 --%>
                               <fmt:formatDate value="${p.PURCHASEDATE}" pattern="yyyyMMddHHmm" var="openDate"/>       <%-- 시작날짜 --%>
                        <c:if test="${openDate <= nowDate}">
                        <td> <button type="button" class="btn btn-sm btn-danger" name="button" onclick="fn_deleteReserve('${p.PURCHASECODE}');">예매취소</button> </td>
                        </c:if>
                        <c:if test="${openDate > nowDate}">
                        <td> <button type="button" class="btn btn-sm btn-success" name="button" onclick="">취소불가</button> </td>
                        </c:if>
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
         $("#searchSelectBox2").val("${year}").prop("selected", true); 
         $("#searchSelectBox3").val("${month}").prop("selected", true); 
      });
      
      function fn_deleteReserve(purchasecode){
    	  var con = confirm("예매취소를 진행하시겠습니까?");
    		if(con == true){
         location.href="${path}/user/reserveDelete?purchasecode=" + purchasecode;
    		}
      }
      </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>