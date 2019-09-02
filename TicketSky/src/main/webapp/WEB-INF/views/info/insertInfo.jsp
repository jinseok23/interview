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
<script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script>
<!-- Include English language -->
<script src="${path }/resources/dist/js/i18n/datepicker.en.js"></script>

<script src="${path }/resources/js/info/info.js"></script>


<!-- nicedit -->
<!-- <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script> -->

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
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function DaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수
    
                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;
    
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('info_postcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('info_address').value = fullAddr;
    
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('info_address2').focus();
                }
            }).open();
        }
    </script>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#preImg').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
        
        /* function changeCategory(){
         */	
         //}
        
        $(function(){ 
        $("#mCategory").change(function(){
        	
    		
    		var majorCategory = $("#mCategory").val();   	
    		console.log(majorCategory);
    		
    		$.ajax({
				url:"${pageContext.request.contextPath}/info/insertSubCategory",
				data:{"majorCategory":majorCategory},
				dataType:"json",
				success:function(result)
				{    		    			    				
					
					 
					$('#sCategory').empty();
					$("#sCategory").append("<option value='0'>소분류</option>"); 
					 for (var i = 0; i < result.list.length; i++)
					{		
						
						var str = '<option value="'+decodeURIComponent(result.list[i].subCategory)+'">'+decodeURIComponent(result.list[i].subCategory)+'</option>';
						console.log(str);
						
						$("#sCategory").append(str);					
					}    	
					 
					 /* $('.subCategory').children('.list').empty(); */
					 $(".subCategory").children(".current").html("소분류");
					 $(".subCategory").children(".list").html('<li data value class="option focus">소분류</li>');
					 $
					 for (var i = 0; i < result.list.length; i++)
						{		
						 
							var str = '<li data-value class="option">'+decodeURIComponent(result.list[i].subCategory)+'</li>';
													
							$(".subCategory").children(".list").append(str);	
							 
						}    			
    			}
    		}) 
    	})
         }); 
        
        function changeSubSelect()
        {
        	
        }
     
    </script>
    
    <script>
    function dataCheck(){
    	
    	
    }
    
    </script>
 
    
    <div class="container" style="width:60%;">
    <br>
    <h3 style="text-align: center">공연등록</h3>
    
    <hr>
    <div class="form-group">
    <!-- onsubmit="return insertcheck() -->
    <form method="post" action="insertDate" name="insertForm" onsubmit="dataCheck()" enctype="multipart/form-data">
               
            <legend>공연 정보 입력폼</legend>    
            <table class="table info_table" style="border-collapse: collapse; text-align: center;">
                <thead>
                    
                </thead>
                <tbody>
                    <tr>
                        <th colspan="2" rowspan="2">
                            <br><br><br><br><br><br>
                            	대표 이미지
                        </th>
                        
                        <td colspan="2" rowspan="2">    
							<img id="preImg"  style="width:200px;height:250px;">
                        </td>
                        <td colspan="2" rowspan="2">
                            <br><br><br><br><br>
                            <input type="file" name="poster" id="imgInp" class="form-control" style="width:70%;" accept="image/gif, image/jpeg, image/png, image/jpg"> 
                        	                        	
                        </td>
                    </tr>
                    <tr>
                        
                    </tr>     
                    
                    <tr>
                        <th colspan="2">공연제목</th>									
                        <td colspan="2">
                            <input type="text" name="performName" class="form-control" >
                        </td>
                        <th>카테고리</th>
                        <td>
                             <div class="input-group w-75" > 
                                <select name="majorCategory" class="form-control" id="mCategory" >
	                                <option value="0">대분류</option>
	                                <option value="뮤지컬">뮤지컬</option>
	                                <option value="연극">연극</option>
	                                <option value="콘서트">콘서트</option>
	                                <option value="클래식/무용">클래식/무용</option>
                                </select>
                                &ensp;
                                <select class="subCategory form-control" id="sCategory" name="subCategory">
                                
                                   	<option value="0">소분류</option>
                                   	
                                </select>
                                             
                            </div> 
                            
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">주최/기획</th>									
                        <td colspan="2">
                            <input type="text" name="companyName" class="form-control " >
                        </td>
                        <th>문의번호</th>
                        <td>                        
                            <input type="text" name="companyPhoneNum" class="form-control w-75" placeholder="ex : 01012341234" maxlength="11">                            
                        </td>
                    </tr>  
                    <tr>
                        <th colspan="2">관람시간</th>									
                        <td colspan="2">
                            <input type="text" name="performTime" class="form-control" placeholder="ex : 60분">
                        </td>
                        <th>관람등급</th>
                        <td>                            
                                <input type="text" name="performGrade" class="form-control w-75" placeholder="ex : 만 7세 이상">
                        </td>
                      
                    </tr>	              
                    						
                    <tr>
                        <th colspan="3">예매시작일</th>
                        <td colspan="3">                       
                            
                            <input type='text' name="ticketOpenDate" class='datepicker-here form-control w-50'  data-timepicker="true"  data-time-format='hh:ii'/>
                           
                        </td>
                    </tr>
                    <tr>
                        <th colspan="3">공연기간</th>
                        <td colspan="3">                    
	                          <input type="text" data-range="true" data-multiple-dates-separator=" ~ " name="performDuration" class="datepicker-here form-control w-50"/>
						</td>
                    </tr>
                    
                    <tr>
                        <th colspan="3">공연장 이름</th>
                        <td colspan="3">
                            <input type="text" name="placeName" class="form-control" style="width: 50%">
                        </td>
                    </tr>
                    <tr>
                        <th colspan="3" rowspan="2"><br><br><br>공연장 주소</th>
                        <td colspan="3">
                            <div class="input-group" style="width: 40%">
                                <input type="text" class="form-control" readonly id="info_postcode">&ensp;                       
                                <input type="button" onclick="DaumPostcode();" class="btn btn-default" value="주소찾기">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">                            
                            <input type="text" name="address1" class="form-control w-50" readonly id="info_address"><br>
                            <input type="text" name="address2" class="form-control w-75"  placeholder="상세주소를 입력하세요." id="info_address2">
                        </td>
                    </tr>
                    <tr>
                    	<th colspan="3" rowspan="2">
                    		<br>교통 편 및 주차정보
                    	</th>
                    	<td colspan="3">
                    		<textarea rows="3" class="form-control" name="placeRoute" placeholder="내용을 입력하세요."></textarea>
                    	</td>
                    </tr>
                    <tr>
                    </tr>  
                     <tr>
                        <td colspan="6">
                            <legend>공연 상세정보 입력</legend>
                        </td>  
                    </tr> 
						<!--contentDiv -->	
                     <tr>
                    	<td colspan="6">
	                        
	                    	<div id="contentDiv" >
	                    		<input type="hidden" name="contentCount" value="1"> 
	                    	
	                    		 <div class="input-group">
		                    		<div class="input-group-prepend">
		                    			<span class="input-group-text">상세정보 1</span>
	  								</div>
	                    			<br>
	                    			<textarea class="form-control" name="performContent_0" rows="3" placeholder="[공연 상세정보]에 보여질 내용을 입력하세요.  첨부된 이미지는 작성된 텍스트 아래 쪽에 배치됩니다."></textarea>
	                    		</div>
	                    		<br>
	                    			<div class="float-left">
	                    			<input type="file" name="contentImg_0"  class="form-control"  accept="image/gif, image/jpeg, image/png, image/jpg">
									</div>
									<div class="float-right" >
									<!-- <input type="button" onclick="" value="삭제하기" class="btn btn-danger btn-sm" style="vertical-align:super;" >&ensp;<br><br> -->
									</div>								
								<br><br>
								<div class="line"></div>  
							</div>         
	                    </td>	                    
                      </tr>                    

                    <tr>
                        <td colspan="6">                        
                        	<input type="button" name="addContentButton" class="btn btn-outline-secondary" onclick="addContent()" value="상세정보 추가하기">
                        </td>
                    </tr>
                 
                
                    <tr>
                        <td colspan="6">                         
                        <input type="submit" class="btn btn-primary" value="다음단계로">
                        <input type="reset" value="취소" class="btn btn-warning">                        
                        
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
            </div>
            

    </div>

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
