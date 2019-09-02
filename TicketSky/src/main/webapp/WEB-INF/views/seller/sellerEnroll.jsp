<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set value="${pageContext.request.contextPath}" var="path"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>



	<style media="screen">
      #enrollform{
        font-size: 1.1em;
      }
      #enrollform input::placeholder{
        font-size: 1.2em;
      }

	  span.guide {display:none;}

    </style>




    <section>
      <div class="container" style=" padding:0 10%;">
        <div class="row" style="padding-left: 3%; ">
          <h4>판매자 회원가입</h4>
        </div>
        <hr>
        <form class="form-horizontal" id="enrollform" action="${path }/user/sellerEnrollEnd" method="post" onsubmit="return fn_enroll_validate();">
          <div class="form-group" >
            <label for="inputEmail" class="col-xs-2 control-label">아이디</label>
            <div class="col-xs-9">
              <input type="text" name="userId" class="form-control" id="userId_" placeholder="아이디_4글자이상" required>
              <span class="guide ok" style="color:blue">이 아이디는 사용 가능합니다.</span>
              <span class="guide error" style="color:red">이 아이디는 사용 불가능합니다.</span>
              <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value='0'/>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword" class="col-xs-2 control-label">비밀번호</label>
            <div class="col-xs-9">
              <input type="password" name="password" class="form-control" id="password_" placeholder="비밀번호" required>
              <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
            </div>
          </div>
          <div class="form-group">
            <label for="inputPasswordCheck" class="col-xs-2 control-label">비밀번호 확인</label>
            <div class="col-xs-9">
              <input type="password" class="form-control" id="password2" placeholder="비밀번호 확인" required>
              <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
            </div>
          </div>
          <div class="form-group">
            <label for="inputRipple" class="col-xs-2 control-label">이메일</label>
            <div class="col-xs-9">
              <input type="email" name="email" class="form-control" id="inputRipple" placeholder="이메일" required>
            </div>
          </div>
          <div class="form-group">
            <label for="inputName" class="col-xs-2 control-label">이름</label>
            <div class="col-xs-9">
              <input type="text" name="userName" class="form-control" placeholder="이름" required>
            </div>
          </div>

          <div class="form-group">
            <label for="inputName" class="col-xs-2 control-label">주소</label>
            <div class="form-inline">
            <input type="text" class="form-control col-md-2" id="address3" name="address3" readonly/> &nbsp;&nbsp;<button type="button" class="btn" onclick="openAddr();">우편번호찾기</button>
            </div>
            <div class="col-xs-9" style="margin-top:3px;">
              <input id="address2" type="text" name="address2" class="form-control"  placeholder="" readonly>
              <input id="address" type="text" name="address" class="form-control"  placeholder="상세주소" style="margin-top:3px;" required>
            </div>
            
          </div>

            <div class="form-group">
              <label for="inputName" class="col-xs-2 control-label">생년월일</label>
              <div class="col-xs-9">
                <input id="birthdate" type="text" name="birthdate" class="form-control"  placeholder="생년월일" required>
                <p class="help-block">YYYYMMDD 형식으로 입력해주세요</p>
              </div>
            </div>
            <div class="form-group">
              <label for="inputNumber" class="col-xs-2 control-label">휴대폰번호</label>
              <div class="col-xs-9">
                <input type="text" name="phone" class="form-control"  placeholder="휴대폰번호" required>
                <p class="help-block">- 없이 적어주세요.</p>
              </div>

            </div>
            
            <div class="form-group">
              <label for="inputNumber" class="col-xs-2 control-label">성별</label>
              <div class="col-xs-9">
                <label class="radio-inline">
				  <input type="radio" name="gender"  value="M" required> 남자
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender"" value="F"> 여자
				</label>
              </div>
            </div>
            <div class="form-group" hidden>
              <label for="inputNumber" class="col-xs-2 control-label">관심카테고리</label>
              <div class="col-xs-9">
                <label class="radio-inline">
				  <input type="radio" name="categoryNo" value="1" checked> 뮤지컬
				</label>
				<label class="radio-inline">
				  <input type="radio" name="categoryNo" value="2"> 연극
				</label>
				<label class="radio-inline">
				  <input type="radio" name="categoryNo" value="3"> 콘서트
				</label>
				<label class="radio-inline">
				  <input type="radio" name="categoryNo"  value="4"> 클래식/무용
				</label>
              </div>
            </div>
            
            <div class="form-group">
              <label for="inputAgree" class="col-xs-2 control-label">약관 동의</label>
              <div class="col-xs-9 checkbox">
                
                <textarea readonly class="form-control" name="name" rows="8" cols="80">본 약관 중요사항 고지는 인터파크 이용약관에 포함된 인터파크,이용자,제공서비스,개인정보 보호정책, 회원탈퇴에 대한 정의를 요약한 것으로 이용약관에 따른 구체적인 권리관계 및 의무사항은 반드시 전문보기를 확인하고 동의를 진행 하여야 합니다.

[Ticket Sky]
Ticket Sky란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장(www.interpark.com 또는 www.interpark.co.kr)을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다. 단, 아이포인트몰, 마트/할인점, 도서, 공연/영화 및 쇼핑에 한하며 다른 탭의 영업장 및 www.playdb.co.kr은 제외합니다.

[제공 서비스]
1.쇼핑서비스(오픈마켓 서비스 포함)
2. 도서서비스(회사와 별도약정으로 한 공급자의 직접배송 서비스 포함)
3. 티켓예매서비스 또는 ENT서비스
4. 여행 서비스(개정 2009.09.01)
5. 기타 회사가 정하는 업무 등

[이용자]
"이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청하고, 회사는 회원으로 가입할 것을 신청한 이용자 중 약관에 따라 허용가능한 이용자는 회원으로 승낙합니다.

[개인정보 보호정책]
인터파크는 이용자의 정보수집 시 판·구매 계약 이행에 필요한 최소한의 정보를 수집하는 바
다음 사항을 필수사항으로 하며 그 외 사항은 관련법령 및 개인정보처리방침을 따릅니다.

가. 성명, 생년월일
나. 휴대전화번호
다. 아이디ID(회원의 경우)
라. 비밀번호(회원의 경우)
마. E-mail 주소(회원의 경우)

[회원 탈퇴]
(회원 탈퇴 및 자격 상실 등)
회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴를 처리합니다. 다만, 해지의사를 통지하기 전에 모든 상품의 판매 및 구매 절차를 완료, 철회 또는 취소해야만 합니다. 이 경우 판매 및 구매의 철회 또는 취소로 인한 불이익은 회원 본인이 부담하여야 하며 기타 법령에 위반되거나, 사회통념,공서양속에 위배되는 경우 회원 자격제한, 정지 조치될 수 있습니다.</textarea>
				<label>
                  <input id="agree" type="checkbox" required>이용약관에 동의합니다.
                </label>
              </div>
            </div>
            <div class="form-group">
              <label for="inputName" class="col-sm-2 control-label"></label>
              <div class="col-xs-9">
                <button  type="submit" class="btn btn-primary">회원가입</button>
              </div>
            </div>
          </form>
      </div> <!-- container -->
    </section>
    
    
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openAddr(){
		daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	$('#address3').val(data.zonecode);
	            	$('#address2').val(data.address);
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            }
	        }).open();
	    });
	}
</script>
    
    <script>
$(function(){
	$("#userId_").on("keyup",function(){
		var inputUserId=$(this).val().trim();
		if(inputUserId.length<4)
		{
			$('.guide').hide();
			$('#idDuplocateCheck').val(0);
			return;
		}
		/* var data1={userId:userId}; */ /* data에 넣어도됨!! */
		
		/* dataType : json이 없으면 autochoice : String으로 되어있음. */
		//dataType이 없을때는 JSON.parse로 data를 Object로 바꿔준 후 처리 하면 됨. 
		$.ajax({
			url:"${pageContext.request.contextPath}/user/checkDuplicate.do",
			data:{userId:inputUserId}, //키 밸류 값으로 보내서
			dataType:"json",
			success:function(data) // .flag는 jsonView방식?
			{
				//dataType : json으로 설정하면
				//알아서 객체로 반영
				console.log(data);
				console.log(data.flag);
				//dataType을 설정하지 않으면
				//스스로가 JSON.parse를 이용하여 
				//parsing처리 해줘야함
				
				/* for(i=0;i<data.list.length; i++)
				{	
					for(name in data.list[i]) //리스트에 있는 키값을 name이 받음.
					{	
						alert(decodeURIComponent(data.list[i][name]));
					}
					
				} */
				//자바에서 보낸 json이 javascript 형식에 맞게 보내짐 data.su, data.char 이렇게
				
				if(data.flag==false)
				{
					$('.guide.error').hide();
					$('.guide.ok').show();
					$('#idDuplicateCheck').val(1);
				}
				else
				{
					$('.guide.error').show();
					$('.guide.ok').hide();
					$('#idDuplicateCheck').val(0);
				}
			},
			error:function(xhr, status, errormsg)
			/* error:function(xhr) */
			{
				console.log(xhr);
				console.log(status);
				console.log(errormsg);
			}
		});
	});
});	

		
	</script>
	<script>
	$(function(){
		$("#password2").blur(function(){
			var p1=$("#password_").val();
			var p2=$("#password2").val();
			if(p1!=p2)
			{
				alert("비밀번호가 일치하지 않습니다.");
				$("#password_").val("");
				$("#password2").val("");
				$("#password_").focus();
			}
			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;

			if(!regex.test($("#password_").val())){
				alert('숫자, 영문, 특수문자 포함 8자 이상 16자 이하로 설정해주세요.');
				$("#password_").focus();
			}
		});
		$("#birthdate").blur(function(){
			var dayRegExp = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
			if($('#birthdate').val()!=''){
				if(!dayRegExp.test($("#birthdate").val())){
					alert('YYYYMMDD 형식으로 입력해주세요.');
					$("#birthdate").val("");
					$("#birthdate").focus();
				}
			}
		});
	});
		
		
		function fn_enroll_validate()
		{
			var address = $('#address2');

			var userId=$("#userId_");
			if(userId.val().trim().length>=4)
			{
				var address = $('#address2');
				if(address.val() == ""){
					alert('주소를 검색하여 입력해주세요.');
					$('#addrbtn').focus();
					return false;
				}else{
					return true;
				}
			}
			else
			{
				alert("아이디는 4글자 이상");
				userId.val("");
				userId.focus();
				return false
			}
			
			
		}
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>