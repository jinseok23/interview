<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<br><br><br><hr>
<h2 style="text-align:center">환불안내</h2>
<hr><br><br><br>
  <main role="main" class="container">

        <button class="btn btn-outline-success" onclick="location.href='ticketCancel.do'" style="margin:5% 0 0 0">예매 취소 안내</button>
        <button class="btn btn-outline-success" style="margin:5% 0 0 0">환불안내</button>
        <br><br><br><br>
        <div id="tabs-2">
                <div class="info_memlist_block dotline">
                    <strong>[무통장 입금으로 결제하신 경우]</strong>
                    <p>수수료(예매수수료, 취소수수료, 송금수수료 500원)를 제외한 나머지 금액이 고객 환불 계좌에 입금됩니다.</p>
                    <p>온라인 취소 시, <a href="/my/memberInfo/refundAccount" target="_blank">마이페이지 &gt; 환불계좌관리</a>에서 환불계좌 정보(본인 명의)를 정확히 입력해 주시기 바랍니다
                        .</p>
                    <ul class="inner_lst type2">
                        <li>- 타인의 계좌를 이용하거나 명의를 도용했을 경우 서비스 이용이 제한될 수 있습니다.</li>
                        <li>- 취소 처리를 접수한 날로부터 <span class="color_green">영업일 기준 3~5일 이내</span>에 환불받으실 수 있습니다.</li>
                    </ul>
                </div>
                <div class="info_memlist_block dotline">
                    <strong>[카드로 결제하신 경우]</strong>
                    <p>배송료 및 취소시점에 따른 취소수수료, 예매수수료를 제외한 금액이 부분 취소 처리 됩니다.</p>
                    <ul class="inner_lst type2">
                        <li>- 취소일로부터 <span class="color_green">영업일 기준 3~5일 정도 후</span> (평일 기준, 토/일/공휴일 제외) 카드사에서 확인 가능합니다.</li>
                        <li>- 카드사 관련 문의는 개인 정보 확인 절차로 인해 티켓링크에서 대신 확인해드릴 수 없습니다.</li>
                    </ul>

        <div>
            <table class="table table-striped table-bordered table-hover">
                            <caption>카드 결제 안내</caption>
                            <colgroup><col><col><col><col></colgroup>
                            <thead>
                            <tr>
                                <th scope="col">카드사 명</th>
                                <th scope="col">연락처</th>
                                <th scope="col">카드사 명</th>
                                <th scope="col">연락처</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row" class="color_gray">신한</th>
                                <td class="color_black">1544-7000</td>
                                <th scope="row" class="color_gray">하나SK</th>
                                <td class="color_black">1599-1155</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">비씨</th>
                                <td class="color_black">1588-4000</td>
                                <th scope="row" class="color_gray">우리</th>
                                <td class="color_black">1588-9955</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">삼성</th>
                                <td class="color_black">1588-8700</td>
                                <th scope="row" class="color_gray">광주</th>
                                <td class="color_black">1588-3388</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">현대</th>
                                <td class="color_black">1577-6000</td>
                                <th scope="row" class="color_gray">수협</th>
                                <td class="color_black">1588-1515</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">국민</th>
                                <td class="color_black">1588-1688</td>
                                <th scope="row" class="color_gray">전북</th>
                                <td class="color_black">1588-4477</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">외환</th>
                                <td class="color_black">1588-3200</td>
                                <th scope="row" class="color_gray">롯데</th>
                                <td class="color_black">1588-8100</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">농협</th>
                                <td class="color_black">1588-1600</td>
                                <th scope="row" class="color_gray">제주</th>
                                <td class="color_black">1588-0079</td>
                            </tr>
                            <tr>
                                <th scope="row" class="color_gray">씨티</th>
                                <td class="color_black">1566-1000</td>
                                <th scope="row" class="color_gray">신협체크</th>
                                <td class="color_black">042-720-1000</td>
                            </tr>
                            </tbody>
                        </table>
            </div>
            <hr>
            <div class="info_memlist_block dotline">
                    <strong>[휴대폰으로 결제하신 경우]</strong>
                    <p>배송료 및 취소시점에 따른 취소수수료 재결제 요청 후, 기존 승인금액은 전체 취소 처리 됩니다.</p>
                    <ul class="inner_lst type2">
                        <li>- 원천사(통신사)의 익월 취소불가 정책으로 인해 휴대폰 소액결제의 승인 취소는 예매 당월까지만 가능합니다.<br>익월로 넘어가는 경우 승인 취소가 아닌 환불 처리를 해드립니다.</li>
                        <li>- 통신사 변경, 월 결제 한도 초과로 인한 취소수수료 재결제 불가 등의 경우 환불 처리를 해드립니다.</li>
                        <li>- 원활한 환불 처리를 위하여 <a href="/my/memberInfo/refundAccount" target="_blank">마이페이지 &gt; 환불계좌관리</a>에서
                            환불계좌 정보(본인 명의)를 정확히 입력해 주시기 바랍니다. </li>
                    </ul>
                    <p>타인의 계좌를 이용하거나 명의를 도용했을 경우 서비스 이용이 제한될 수 있습니다.</p>
                    <p>예매 취소 하실 경우 <span class="color_green">휴대폰 결제 수수료도 취소(또는 환불)</span> 됩니다.</p>
                </div>
                <div class="info_memlist_block dotline">
                    <strong>[계좌이체로 결제하신 경우]</strong>
                    <p>취소 처리를 접수한 날로부터 <span class="color_green">영업일 기준 1~3일 이내</span>에 고객 환불 계좌로 환불받으실 수 있습니다.</p>
                </div>
                <div class="info_memlist_block dotline">
                    <strong>[PAYCO 포인트로 결제하신 경우]</strong>
                    <p>예매 취소 시, 사용하신 계정으로 즉시 환불됩니다.</p>
                </div>
                <div class="info_memlist_block dotline">
                    <strong>[예매권으로 결제하신 경우]</strong>
                    <p>사용했던 예매권은 복구됩니다. 단, 유효기간이 만료되었을 경우 환불이 불가합니다.<br>일괄 취소로 인해 복구된 예매권의 유효기간이 이미 만료되었을 경우, 일괄 취소일로부터 1주일의 기간 연장이 제공됩니다. </p>
                </div>
                <div class="info_memlist_block">
                    <strong>[상품권으로 결제하신 경우]</strong>
                    <p>사용하신 금액이 다시 상품권으로 환급됩니다. 단, 유효기간이 만료된 상품권의 경우 환불이 불가합니다.</p>
                </div>
            </div>
        </div>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>