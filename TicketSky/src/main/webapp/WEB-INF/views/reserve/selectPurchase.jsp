<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"/>
<jsp:include page="/WEB-INF/views/common/reserveHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/info.css"/>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <script>
function selectPurchase()
{
	if($("input[name=phone]").val()=="")
	{
		alert("전화번호를 입력하세요.");
		$("input[name=phone]").focus();
	}
	else if($("input[name=reserveEmail]").val()=="")
	{
		alert("이메일을 입력하세요.");
		$("input[name=reserveEmail]").focus();
	}
	else if($("#agreeTerms").prop("checked")==false)
	{
		alert("개인정보 수집 약관을 확인하세요.");
	}
	else if($("#card").prop("checked")==false && $("#phone").prop("checked")==false)
	{
		alert("결제 방법을 선택하세요.")	
	}
	else
	{	      
		      var performName = "${performName}";
		      var totalPrice = "${totalPrice }";		      
		      var email = $("input[name=reserveEmail]").val();
		      var name = $("input[name=userName]").val();
		      var phone = $("input[name=phone]").val();
		      
		      var payMethod = $("input[name=paymentMethod]:checked").val();
		      console.log("결제방법 "+ payMethod)
		      var pg="";		      
		      
		      if(payMethod=="card")
		      {
		    	 pg="inicis";
		      }
		      else if(payMethod=="phone")
	    	 {
	    	  	pg="danal";
	    	 }
		      
		      console.log(pg);
		      
		      IMP.init('imp22572513');
		      
		      IMP.request_pay({
		          pg : pg, // version 1.1.0부터 지원.
		          pay_method : payMethod,
		          merchant_uid : 'merchant_' + new Date().getTime(), //시간 
		          name : performName, // 상품명 
		          amount : totalPrice, //판매 가격
		          buyer_email : email, // 구매자 메일
		          buyer_name : name, // 구매자 이름
		          buyer_tel : phone, //구매자 폰번 
		          /* buyer_addr : '서울특별시 강남구 삼성동', // 구매자 주소
		          buyer_postcode : '123-456' // 구매자 우편번호 */
		      }, 
		      function(rsp) 
		      {
		          if (rsp.success) 
		          {		        	  
		        	   $("input[name=payMethod]").val(payMethod);
		        	  $('#selectPurchaseFrm').submit();	
		        	  
		               /* var msg = '결제가 완료되었습니다.'; 
		              
		               $.ajax
		             ({
		                url: "${path}/payment/payment.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		                type: 'GET',
		                dataType: 'html',
		                data: 
		                {
		                   "performName" : performName,
		                   "performNo" : performNo
		                   //기타 필요한 데이터가 있으면 추가 전달
		                },
		                 success : function(data)
		                 {
		                    console.log(data);
		                    
		                  var container = $(".single_product_container");
		                  container.html(data);
		                 },
		                 error : function(data)
		                 {
		                   msg = "ajax 실패";                 
		                 }
		                
		             }); 
		             
		              
	              msg += '고유ID : ' + rsp.imp_uid;
	              msg += '상점 거래ID : ' + rsp.merchant_uid;
	              msg += '결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;  */
		          }
		          else 
		          {
		              var msg = '결제에 실패하였습니다.';
		              msg += '\n에러내용 : '+ rsp.error_msg;
		              alert(msg);
		              
		              
		              //test용 
		              /* $("input[name=payMethod]").val(payMethod);
		        	  $('#selectPurchaseFrm').submit(); */
		        	  
		              /* $.ajax
		             ({
		                url: "${path}/payment/payment.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		                type: 'GET',
		                dataType: 'html',
		                data: 
		                {
		                   "performName" : performName,
		                   "performNo" : performNo
		                   //기타 필요한 데이터가 있으면 추가 전달
		                },
		                 success : function(data)
		                 {
		                	 console.log(data);
		                  var container = $(".single_product_container");
		                  container.html(data);
		                 },
		                 error : function(data)
		                 {
		                   msg = "ajax 실패";                 
		                 }
		                
		             });  */  
		          }
		           /* alert(msg); */ 
		      });	
        
		
	}
}
 
 </script>
 		<form action="reserveEnd" id="selectPurchaseFrm" method="post">
 		<input type="hidden" name="payMethod">
            <div class="reserve_content" >
            <div class="reserve_left" style="height:620px">
                <div class="reserve_step3 mgt0">
                    <br>
                    <div class="white_box choice_delivery">
                        <table class="table2">
                            <tbody>
                            <tr>
                                <th scope="row" class="th fbold">수령방법</th>
                                <td>
                                    <div class="custom-control custom-radio custom-control-inline">
									  <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input" checked>
									  <label class="custom-control-label" for="customRadioInline2" style="margin-top: 3px">현장수령</label>
									</div>
                                    <p class="tbl_dsc" >- 관람일 당일 현장에서 예매번호 및 본인확인 후 티켓을 수령할 수 있습니다.</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="reserve_step3">
                    <strong class="title ticket_delivery2"><span>주문자 확인</span></strong>
                    <div class="white_box">
                        <table class="table2 table2_v2">                            	
                            <tbody>                            
                            <tr>
                                <th scope="row" class="th fbold">이름 <span style="color:red">*</span></th>                                	
                                <td>
                                	${member.userName }
                                	<input type="hidden" name="userName" value="${member.userName }"/>
                                </td>
                                	                                
                            </tr>
                            <tr>
                            	<th scope="row" class="th fbold">전화번호<span style="color:red">*</span></th>
                                <td>
                                    <div class="input_block">
                                      <input type="text" name="phone" class="input" style="width:180px" maxlength="11" value="${member.phone }">
                                    </div>
                                </td>
                            <tr>
                                <th scope="row" class="th fbold">
                                	이메일 <span style="color:red;">*</span>                                                                           
                                </th>
                                <td colspan="3">
                                    <div class="input_block">
                                        <input type="text" name="reserveEmail" class="input" style="width:300px" title="이메일" required="required" value="${member.email }">                                               
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="reserve_step3 customer_check" style="width:90%; margin-left:30px">                    
                    <ul class="input_block_lst">
                        <li>
                        <div class="custom-control custom-checkbox">
						  <input type="checkbox" class="custom-control-input" id="agreeTerms">
						  <label class="custom-control-label" for="agreeTerms" style="margin-top: 3px">주문자 확인 및 예매처리를 위해 휴대폰번호, 이메일을 수집하며, 이용목적 달성 이후 파기합니다.</label>
						</div>                          
                        </li>
                    </ul>
                </div>
            </div>            
            <div class="reserve_right" style="height:620px; ">
 				<br><br>
                <div class="goods_info">              
                    <span class="goods_img"><img src="${path }/resources/upload/info/${performName}/${rePosterImg}" width="41" height="50"></span>
                    <strong class="goods_tit" id="productName" style="font-weight: bold; font-size: 15pt"> ${performName }</strong>
                </div>                	
                <div class="reserve_result" style="text-align: center;">                    
                    <span class="float-left">예매정보</span>
                    <table>
                    <tr>
                     <th style="text-align: center">                         
                        <ul class="seat_list" style="height:75px;">
                            <c:forEach var="p" items="${pcList}">                            
                            <li >
                                <span class="seat_level" style="font-weight: bold; color:blue">${p.purchaseSeat }</span> 
                            </li>
                            </c:forEach>
                        </ul>
                        </th>
                      </tr>
                      </table>
                      <table>                        
                        <tbody>
                        <tr>
                            <th scope="row">공연 일시</th>
                            <td>
                            ${performDate }                                
                            </td>
                        </tr>                        
                        
                        <tr>
                            <th scope="row">티켓 매수</th>
                            <td id="selected_number">
                            	<span>${fn:length(pcList)}매</span>
                            </td>
                        </tr>                        
                        </tbody>
                        <tfoot>
                        <tr>
                            <th scope="row" id="total_amount">결제 금액</th>
                            <td>
                            	<fmt:formatNumber value="${totalPrice }" pattern="#,###.##"/>원                           	
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                    
                    <br><br>
                    
                    <input type="radio" name="paymentMethod" id="card" value="card">
                    	<label for="card" style="font-size:9pt">카드결제</label>
                    &ensp;
                    <input type="radio" name="paymentMethod" id="phone" value="phone">
                    	<label for="phone" style="font-size:9pt">휴대폰 결제</label>
                                  
                    
                    <br><br>
                    <input type="button" class="btn btn-warning btn-sm" onclick="location.href ='${path}/reserve/selectSchedule?performNo=${performNo }'" value="이전단계">
                    &ensp;
                    <input type="button" class="btn btn-primary btn-sm" onclick="selectPurchase();" value="결제하기">
                </div>
            </div>
        </div>
	</form>

                