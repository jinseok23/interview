<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page = "/WEB-INF/views/common/header.jsp"/> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${path }/resources/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${path }/resources/dist/js/datepicker.js"></script>
<!-- Include English language -->
<script src="${path }/resources/dist/js/i18n/datepicker.en.js"></script>
<script src="${path }/resources/js/info/info.js"></script>
<link href="stylesheet" href="${path }/resources/css/info.css"/>
<style>
.info_table th{
      background: #FCFCFC;
      border:1px solid #DEE2E6;
      
  }
  
  .info_table td{
      border:1px solid #DEE2E6;
  }
  
  .line{
	overflow:hidden;
	width:100%;
	height:0;
	margin:0;
	padding:0;
	border-top:1px solid #DEE2E6;
	font-size:0;
	line-height:0;
	}
</style>
<br><br>
    <div class="container" style="width:60%;">
    <br>
    <h3 style="text-align: center">공연등록</h3>
    <hr>
    <legend>공연 일정 입력폼</legend>   
     <div class="form-group">
	<form method="post" action="insertSeat" name="insertDate">
		<input type=hidden value="${startDate }" name="startDate">
		<input type=hidden value="${endDate }" name="endDate">
		<table class="table info_table" style="border-collapse: collapse; text-align: center;">
                <thead>                    
                </thead>
                <tbody>
                    <tr>
                        <th colspan="1">공연일</th>									
                        <td colspan="2">
                        	 <input type="text" class='datepicker-here form-control' name="performDate_start" value="${startDate }" readonly>
                        </td>
                        <td rowspan="2">                        	
                        	<input type="button" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="startDate()">
                        </td>                       
                    </tr>
                    <tr>
					    <th colspan="1">공연 시간</th>
					    <td colspan="2">
					    	<input type="time" name="performTime_start" class="form-control">
					    </td>
					</tr>
					</tbody>
					</table>
		<!-- DIV 생성 -->
		<div id="dateDiv">	
			<input type="hidden" class="form-control" name="dateCount" value="0">		
		</div>
		<!--  종료위치  -->		
		 <c:if test="${startDate != endDate}"> 
			<table class="table info_table" style="border-collapse: collapse; text-align: center;">
                <thead>                    
                </thead>
                <tbody>
                    <tr>
                        <th colspan="1">공연일</th>									
                        <td colspan="2">
                        	 <input type="text" class='datepicker-here form-control' name="performDate_end" value="${endDate }" readonly>
                        </td>
                        <td rowspan="2">                        	
                        	<input type="button" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="startDate()">
                        </td>                       
                    </tr>
                    <tr>
					    <th colspan="1">공연 시간</th>
					    <td colspan="2">
					    	<input type="time" name="performTime_end" class="form-control">
					    </td>
					</tr>
					</tbody>
					</table>		
			 </c:if> 
		
			<input type="button" class='btn btn-sm btn-warning' value="공연일정 추가" onclick="addDate()"/>	
		<div class="float-right">
			<input type="submit" class="btn btn-sm btn-primary" value="다음단계로">		
		</div>
	</form>
    </div>
    </div>
    
    <br><br><br><br><br>

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
