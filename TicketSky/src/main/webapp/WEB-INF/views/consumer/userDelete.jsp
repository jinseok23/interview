<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<c:if test="${memberLoggedIn.separator eq 'C' }">
	<jsp:include page="/WEB-INF/views/common/consumerAside.jsp"></jsp:include>
</c:if>
<c:if test="${memberLoggedIn.separator eq 'S' }">
	<jsp:include page="/WEB-INF/views/common/sellerAside.jsp"></jsp:include>
</c:if>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<div class="col-12 col-md-8 col-lg-9">
                      <div class="shop_grid_product_area">
                        <div class="row">
                          <h3>회원탈퇴</h3>
                        </div>
                        <hr>
                        <div class="row">
                          <div class="col-12" style="text-align:center; background-color:#e5e5e5; margin:3% 0%; padding: 3.5%;">
                            <span style="font-size:1.3em">이용에 불편을 드려서 죄송합니다.<br>
                              회원 탈퇴시 혜택이 소멸되고, 정보가 복귀되지 않습니다.</span>
                          </div>
                          <div class="col-xs-12 checkbox">
                            <h5>탈퇴 전 유의사항</h5>
                            <textarea readonly class="form-control" name="name" rows="8" cols="110">  1.회원탈퇴 시 고객님의 회원정보는 영구 삭제되며, NHN티켓링크 서비스 관련 정보 역시 삭제됩니다.
      ① 예매권 : 등록된 모든 예매권 삭제 후 이용 불가
      ② 마일리지 : 현재 적립/전환된 모든 현금성 마일리지 삭제 후 환원 불가
      ③ 할인쿠폰 : 등록한 모든 할인쿠폰 삭제 후 재등록 불가
      ④ 티켓 : 구매한 티켓 복구 및 환원 불가
      ⑥ 기타 : 회원으로 활동하며 누적 사용한 정보
    2.전자상거래에서의 소비자 보호를 위해 고객님의 예매 관련정보는 5년간 보관하며, 이후 완전 파기됩니다.
    3.작성하신 게시물은 삭제되지 않으며, 삭제가 필요한 경우 게시물을 직접 삭제한 후 회원탈퇴를 하시기 바랍니다.
    4.회원탈퇴 후에도 다시 NHN티켓링크 회원으로 가입하실 수 있습니다. 그러나 탈퇴 전 회원 정보에 대한 이전이나 연결된 정보 저장 등은 불가능합니다.
    5.NHN티켓링크 메일은 예약발송이 되므로 회원탈퇴 후에도 약 5일 동안은 NHN티켓링크 관련 메일이 전송되니 이 점 양해 부탁 드립니다.</textarea>
                          </div>
                          <label>
                            <input id="agree" type="checkbox"> 위 내용을 모두 확인하였으며 동의합니다.
                          </label>
                        </div>
                        <div class="row" >
                            <button class="btn btn-danger" type="button" name="button" style="margin:auto" onclick="fn_deleteChk();">회원 탈퇴</button>
                        </div>


                      </div>
                  </div>
              </div>
          </div>
      </section>
      <br>
      <br>
      <br>
      <br>
      
      <!-- ##### Shop Grid Area End ##### -->
      
      <script>
      function fn_deleteChk(){
    	  if($("#agree").prop("checked") == true)
    		  window.open('${path}/user/userDeleteChk', '_blank', 'width=400 height=200');
    	  else{
    		  alert("약관을 읽고 동의해주세요.")
    		  $("#agree").focus();
    	  }
      }
      </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>