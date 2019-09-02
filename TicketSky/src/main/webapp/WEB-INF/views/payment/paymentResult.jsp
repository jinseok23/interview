<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<div class="container" style="padding-top: 100px;">
  <br><br>
  <a class="nav-brand" href="${path }"><img src="${path }/resources/img/core-img/KakaoTalk_20180823_202728608.png" alt=""></a>
  <br><br>
  <h2 style="align : center;"> 결제가 완료되었습니다 </h2>
  <table class="table">
    <thead>
      <tr>
        <td style="text-align : left;"> 결제내역 </td>
        <td style="text-align : right;"></td>
      </tr>
    </thead>
   
    <tbody>
      <c:forEach items="${paymentList}" var="pay"> 
    
      <tr>
        <td style="text-align : left;">공연 이름 </td>
        
        <td style="text-align : right;">${pay.PERFORMNAME}</td>
       
      </tr>
      <tr>
        <td style="text-align : left;">금액</td>
        <td style="text-align : right;">금액</td>
      </tr>
      <tr>
        <td style="text-align : left;" >예매일자</td>
        <td style="text-align : right;">${pay.REGDATE }</td>
      </tr>
      <tr>
        <td style="text-align : left;" >공연장</td>
        <td style="text-align : right;">${pay.PLACENAME}</td>
      </tr>
       <tr>
        <td style="text-align : left;" >공연 장소</td>
        <td style="text-align : right;">${pay.PLACEADDRESS }</td>
      </tr>
      
      </c:forEach>
    </tbody>
    
  </table>
<button type="button" class="btn btn-dark" onclick="location.href='http://localhost:9090/ticketsky/'" style="float:right;"> 메인으로 </button>
</div>
