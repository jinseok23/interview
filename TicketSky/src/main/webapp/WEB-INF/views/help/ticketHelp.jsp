<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<style>
b{
	font-size:14px;
	color:green;
}
</style>
<br><br><br><hr>
<h2 style="text-align:center">예매 안내</h2>
<hr><br><br><br>
<div role="main" class="container" style="margin:0 0 0 10%">
<h4>1. 예매 오픈시간에 맞춰[예매하기]버튼을 클릭합니다.</h4>
<hr>
<p>1-2. 좌석배치도에서 원하는 등급을 먼저 클릭하고, 좌석선택 유형(자동배정/직접선택)을 클릭합니다.
[자동배정으로 구매할경우]
<b>매수</b>를 선택한후,<b>[다음단계]</b>를 클릭합니다.
[직접 선택하여 구매할 경우]
등급별 잔여석을 확인, 원하는 <b>구역,좌석</b>을 선택하고 <b>[다음단계]를 클릭합니다.</b>
<h4>2. 구매할 권종의 매수를 클릭합니다.</h4>
<hr>
<h4>3. 티켓을 배송으로 받는 경우 배송정보를 입력하고, 각종 예매에 필요한 동의 항목에 체크합니다.</h4>
<hr>
[예매정보를 확인해주세요!]
자리는 이미 선점되었으니, 예매정보를 꼼꼼히 확인하고 결제해주세요.<b>(좌석 선점시간:5분)</b>
<h4>4.간편결제로 결제하면, 예매가 완료됩니다.</h4>
<hr>
[예매확인은 필수!]
<b>[예매확인]</b>을 클릭하시면 마이페이지>예매확인/취소 페이지로 이동합니다.
</p>
<p>다른 궁금증이 있으신가요?&nbsp;<button class="btn btn-outline-success my-2 my-sm-0" onclick="fn_consultMove()">1:1 문의하기</button>
</p>
</div>
<script>
	function fn_consultMove()
	{
		var userId = $("#userId").val().trim();
		console.log(userId);
		
		if(userId==null)
		{
			alert("로그인 후 이용바랍니다.");
			return false;
		}
		else{
				location.href="${path}/help/consultInsert.do?userId="+userId;
			}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>