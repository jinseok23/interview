<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"/>
<jsp:include page="/WEB-INF/views/common/reserveHeader.jsp"/>
 <link rel="stylesheet" href="${path }/resources/css/info.css"/>
 <script>
function goToReserveList(){
	window.opener.top.location.href="${path }/user/reserveList";
	/* opener.location.href */
	window.close();
};
 
 </script>
 <div class="reserve_content" >
        
	<div class="reserve_left" style="height:620px; width:100%; text-align: center;" >
	<div style="margin-top: 150px; height:120px;">
		<span style="font-size: 20pt">결제에 성공했습니다.</span>
			
	
	</div>
	
	<input type="button" onclick="goToReserveList();" class="btn btn-info btn-sm" value="구매내역">
		&ensp;
		<input type="button" class="btn btn-warning btn-sm"  onclick="window.close();" value="　닫기　">
	</div>
 </div>