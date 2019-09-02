<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<style>
#aa{
	color:green;
}
</style>
<br><br><br><hr>
<h2 style="text-align:center">예매 안내</h2>
<hr><br><br><br>
<div role="main" class="container" style="margin:0 0 0 22%">
<b>[우편 배송]</b>
<p>예매 완료(결제 완료)확인 후, 인편 배송으로 티켓을 배송해드립니다.<br>
- 배송비 : 2,500원 예매 시 결제<br>
- 배송기간 : <a id="aa">예매 완료 후 영업일 기준 7일 이내</a> 티켓을 수령하실 수 있습니다.<br>
(주말 및 공휴일 제외, 지역 또는 수령자 부재 등의 이유로 하루 정도 배송기간이 더 소요될 수 있습니다.)<br>
- 기획사/구단 정책 또는, 공연일/경기일에 따라 배송 수령 방법의 선택이 제한될 수 있습니다.<br>
- 배송 준비 중 이후의 상태에서는 배송지 변경이 불가합니다.<br>
(마이페이지>예매확인/취소 상세페이지에서 티켓수령 방법이 ‘배송준비중’으로 표시됩니다.)<br>
- 배송 현황은 마이페이지>예매확인/취소 상세페이지에서 조회할 수 있습니다.<br>
<b>[현장 수령]</b>
행사/경기 당일 현장 매표소(예매자 전용 창구)에서 예매 완료 SMS 또는, 예매번호를 제시하면 티켓을 수령할 수 있습니다.<br>
- <a id="aa">예매 완료 SMS를 받지 못하신 경우, 스팸메시지함을 확인해주세요.</a><br>
- 예매번호는 마이페이지 > 예매확인/취소에서 확인할 수 있습니다.<br>
스포츠 현장 수령 유의사항<br>
- 예매자 전용 무인발권기에서 예매번호, 생년월일(주민등록상)을 입력하면 빠르게 발권하실 수 있습니다.<br>
공연/전시 현장 수령 유의사항<br>
- <a id="aa">공연 시작 시간 1시간 전 ~ 30분 전</a>까지 행사장 매표소에서 티켓을 수령하실 수 있습니다.<br>
- 기획사 정책 또는, 행사일에 따라 현장 수령 방법의 선택이 제한될 수 있습니다.<br>
<b>[모바일 티켓 – 홈티켓]</b>
홈티켓 입장 바코드를 입구에서 제시하시면, 별도 발권 절차 없이 바로 입장하실 수 있습니다.<br>

- 티켓링크 APP > 메뉴 > 예매확인/취소 > 예매내역 상단에서 바코드를 확인할 수 있습니다.<br>
- 예매하신 티켓 매수의 인원이 한 번에 입장하셔야 합니다.<br>
- 상품에 따라, 홈티켓 바코드를 제공하지 않을 수 있습니다.<br>
- 증빙서류가 필요한 경우 홈티켓 바코드가 제공되지 않습니다. (유인 매표소에서 발권 필요)<br>
홈티켓 이미지<br>
[모바일 티켓 – 스마트티켓] 자세히보기<br>
모바일로 직접 발권하고, 별도 발권 절차 없이 입구에서 바코드 인식 후 바로 입장하실 수 있습니다.<br>

상품에 따라, 스마트티켓을 제공하지 않을 수 있습니다.<br>

스마트티켓 발권 가능 시간은 상품별로 상이합니다. (예매 취소 마감시간 이후 발권 가능하여 예매 취소 불가)<br>

- 스포츠 : 경기 당일 2~3시간 전부터 발권 가능<br>
- 공연전시 당일 관람권 : 관람일 당일 자정부터 발권 가능<br>
- 공연전시 기간권 : 관람일 기간 내 발권 가능<br>
이미 종이 티켓으로 발권 받으신 경우, 스마트티켓 발권이 불가합니다. (동시 사용 불가)<br>
</p>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>