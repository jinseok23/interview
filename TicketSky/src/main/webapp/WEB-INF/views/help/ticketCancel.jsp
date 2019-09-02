<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<br><br><br><hr>
<h2 style="text-align:center">티켓취소안내</h2>
<hr><br><br><br>
  <main role="main" class="container"> 
        <button class="btn btn-outline-success" onclick="location.href='ticketCancel.do'" style="margin:5% 0 0 0">예매 취소 안내</button>
        <button class="btn btn-outline-success" onclick="location.href='ticketRefund.do'" style="margin:5% 0 0 0"> 환불안내</button>
        <br><br><br><br><br>
        <h3>[예매 취소 마감시간]</h3>
        <p>구단/기획사 정책에 따라 특정 상품의 예매/취소 마감시간이 다를 수 있습니다. (예매 시 확인 가능)
            시즌 오픈 시 정책이 변경될 수 있습니다.</p>
            <Table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <td>구분</td>
                        <td>취소마감일</td>
                        <td colspan="2">취소 마감 시간</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="2">공연</td>
                        <td rowspan="2">티켓수령방법에 따라 상이</td>
                        <td>현장수령</td>
                        <td>행사일 1일 전, 17:00까지</td>
                    </tr>
                    <tr>
                        <td>인편배송</td>
                        <td>아래 마감일시까지 반송티켓 도착기준
                                - 행사일 1일 전, 17:00까지
                                - 행사일 1일 전이 토요일/일요일인 경우, 11:00 까지</td>
                    </tr>
                </tbody>
        </table>
        <div>
            <h3>[예매 취소시 유의사항]</h3>
            <p><img src="${path}/resources/img/help-img/mark.png">수수료 부과
                    - 상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다. (예매 시 확인 가능)
                    - 예매수수료는 예매 당일 밤 12시 이전까지만 환불됩니다.
                    - 취소수수료는 취소시점에 따라 다르게 부과됩니다. 자세한 내용은 고객센터 > 수수료 안내에서 확인하실 수 있습니다.</p>
            <p><img src="${path}/resources/img/help-img/mark.png">부분 취소
                    - 신용카드로 단일 결제하신 경우, 티켓의 부분 취소가 가능합니다.
                    - 기획사/구단의 정책으로 일부 상품의 경우 부분 취소가 불가할 수 있습니다.
                </p>
                <p><img src="${path}/resources/img/help-img/mark.png">예매 후 예매내역에 대한 변경 불가
                    - 예매된 건에 대한 일부 변경(날짜/시간/좌석/결제 등)은 불가하여, 기존 예매건을 취소하시고 다시 예매를 하셔야 합니다.
                    단, 취소 시점에 따라 예매수수료가 환불되지 않거나 취소수수료가 부과될 수 있습니다.
                    - 재예매를 하실 경우, 기존에 예매하셨던 좌석이 보장되지 않을 수 있습니다.
                    </p>
                    <p><img src="${path}/resources/img/help-img/mark.png">일괄 취소
                    - 일부 상품의 경우, 우천 취소 등의 상황에 따라 일괄 취소가 발생할 수 있으며 일괄 취소 시 취소수수료가 부과되지 않습니다.
                    단, 일괄 취소 공지 이전에 직접 예매를 취소하신 경우에는 취소수수료가 반환되지 않습니다.
                    - 행사 상의 문제로 인해 환불을 받으실 경우 별도의 수수료를 공제하지 않으며, 환불 주체가 티켓링크가 아닌 행사 주최사가
                    될 수 있습니다.
                    </p>
                    <p>- 티켓 반송 주소 : <b>  경기도 성남시 분당구 대왕판교로645번길 16 NHN엔터테인먼트 플레이뮤지엄 티켓링크 환불담당자 앞</b>
                    티켓이 발송된 이후부터는 온라인에서의 예매 취소가 불가합니다. (배송조회 : 마이페이지 > 예매확인/취소 상세페이지)
                    <b>취소마감시간 이전</b>에 티켓이 아래 주소로 반송되어야 하며, 취소수수료는 취소일자(영업일 포함) 기준으로 부과됩니다.
                    - 부분 취소 : 신용카드로 단독 결제하신 경우에만 가능하며, 취소하실 티켓을 위 주소로 보내주시면 부분 취소가 진행됩니다.
                    타 결제수단을 이용하신 경우 전체 취소만 가능하여, 받으신 티켓을 모두 반송해주셔야 취소가 가능합니다.
                    - 티켓 반송 시, 예약번호와 연락처를 기재해 주시면 보다 빠른 환불 처리가 가능합니다.
                    (무통장입금/계좌이체를 이용하셨을 경우, 환불받으실 계좌와 예금주를 적으셔서 티켓과 함께 동봉해주세요.)
                    - 취소 가능 시간이 행사일까지 3일 이상 남지 않았을 경우, 특급 우편을 이용하시거나 고객센터(☎1588-7890)로 문의해주시기
                    바랍니다.
                    - 티켓을 분실하셨거나, 티켓이 훼손되었을 경우 취소 및 변경이 절대 불가하오니 이점 유의하시기 바랍니다.
                    - 발송 시작된 티켓을 취소하실 경우, 배송료 2,500원은 환불되지 않습니다.</p>
        </div>
    </main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>