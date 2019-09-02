<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"/>
<jsp:include page="/WEB-INF/views/common/reserveHeader.jsp"/>
 <link rel="stylesheet" href="${path }/resources/css/info.css"/>
<script>
        $(function() {
        	
        	var performNo = $("input[name=performNo]").val();
        	var dates=[];
        	
    		//선택가능 날짜 
    		$.ajax({
        				url:"${pageContext.request.contextPath}/reserve/getAvailableDates",
        				data:{"performNo":performNo},
        				dataType:"json",
        				async:false,
        				success:function(result)
        				{    
        					for(var i=0; i<result.list.length; i++)
       						{        						
        						dates.push(result.list[i].performDate);
       						}       					   
            			}
            		});            		            
    		
			var availableDates = dates;
   		    		
    		function available(date) {
    			var thismonth = date.getMonth()+1;
    			var thisday = date.getDate();   			

    			if(thismonth<10){
    				thismonth = "0"+thismonth;
    			}
    			if(thisday<10){
    				thisday = "0"+thisday;
    			}
    			
    		    var ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;

    		    if ($.inArray(ymd, availableDates) >= 0) {

    		        return [true,"",""];

    		    } else {

    		        return [false,"",""];

    		    }

    		}			
    		
    		$.datepicker.setDefaults({
                dateFormat: 'yyyy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
            	,beforeShowDay: available 
            	,onSelect: function(dateText, inst) { 
            		
            		$('.seats').empty();
            		var date = new Date($("#datepicker").datepicker("getDate"));            		
            		var thismonth = date.getMonth()+1;
        			var thisday = date.getDate();   			

        			if(thismonth<10){
        				thismonth = "0"+thismonth;
        			}
        			if(thisday<10){
        				thisday = "0"+thisday;
        			}
        		    
        			var ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;         	            		
            		
            		$.ajax({
        				url:"${pageContext.request.contextPath}/reserve/getTime",
        				data:{"ymd":ymd, "performNo":performNo},
        				dataType:"json",
        				success:function(result)
        				{    		    	   				        					 
        					$('.schedule').empty();
        					
        					 for (var i = 0; i < result.list.length; i++)
        					{		        
        						var date =result.list[i].performDate;
        						var time = date.substring(11,16);
        						var timeSplit = time.split(':');
								var timeKor = timeSplit[0]+"시 "+timeSplit[1]+"분";
        						var str ='<li>';
        						str+='<input type="hidden" name="performDateNo_'+i+'" value="'+result.list[i].performDateNo+'">';
								str+='<input type="hidden" name="performDate_'+i+'" value="'+date.substring(0,16)+'">'; 
        						str+='<a href="javascript:;" onclick="selectSchedule('+i+');">';
								str+='<span class="txt_left">'+(i+1)+'회</span>';
								str+='<span class="txt_right">'+timeKor+'</span>';
								str+='</a>';
								str+='</li>';                						
        						$(".schedule").append(str);	        						
        					}    	
        					
        					
        					  			
            			}
            		}) 
         	   }	
            });            
            $("#datepicker").datepicker();    
            
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            
        });
        
        function selectSchedule(i)
        {
        	var performDateNo = $("input[name=performDateNo_"+i+"]").val();
        	var performDate=$("input[name=performDate_"+i+"]").val();
        	
        	$("input[name=index]").val(i);
        	$("input[name=performDate]").val(performDate);
        	
        	$("#selected_date").html(performDate);
        	
        	 
        	$.ajax({
				url:"${pageContext.request.contextPath}/reserve/getSeatInfo",
				data:{"performDateNo":performDateNo},
				dataType:"json",
				success:function(result)
				{  
					  
					var allSeats = 0;
					
					$('.seats').empty();
					
					for(var i=0; i<result.list.length; i++)
					{
						allSeats+=result.list[i].seatCount;
					}
										
					var str = '<li>';
					str +='<span class="txt_left">전체</span>';
					str +='<span class="txt_right">';
					str +='<em style="color:blue; font-weight: bold;">'+allSeats+'</em>&ensp;석';
					str +='</span>';
					str +='</li>';
					$('.seats').append(str);
					
					

					 for (var i = 0; i < result.list.length; i++)
					{		        						 
						  var str2 = '<li>';
							str2 +='<span class="txt_left">'+decodeURIComponent(result.list[i].seatLevel)+'</span>';
							str2 +='<span class="txt_right">';
							str2 +='<em style="color:blue; font-weight: bold;">'+result.list[i].seatCount+'</em>&ensp;석';
							str2 +='</span>';
							str2 +='</li>';
							$('.seats').append(str2);		
					}    	 				
					 
					  			
    			}
    		}) 
        }
        
        function scheduleCheck()
        {
        	if($("input[name=index]").val()=="-1")
        	{
        		alert("회차를 선택해주세요.");
        	}
        	else
        	{
        		$('#selectScheduleFrm').submit();
        	}
        };
    </script> 
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

a{
 color: #747474;
}

</style>			

		<form action="selectSeats" id="selectScheduleFrm" method="post">
		<input type="hidden" name="performNo" value="${pi.performNo }">
		<input type="hidden" name="index" value="-1">
		<input type="hidden" name="performDate">
		
        <div class="reserve_content" >
        
            <div class="reserve_left" style="height:620px; text-align: center;" >
            <br>
                <div class="white_box tblbx">
                    <div class="step_select1" id="calendar">
                    	<br>
                    	  
                        <strong><span style="font-size: 10pt">날짜선택</span></strong>
						<hr>
						<br>
                        <div id="datepicker">
                           
                        </div>
                        <br>
                    </div>
                    <div class="step_select2">
                    	<br>
                        <strong><span style="font-size: 10pt">회차선택</span></strong>
                        <hr>
                        <br>
                        <ul id="roundSelect" class="schedule">
                        
                        
                        </ul>
                    </div>
                    <div class="step_select3">
                    	<br>
                        <strong><span style="font-size: 10pt">잔여석</span></strong>
                        <hr>
                        <br>
                        <ul id="seatingInfoPerRound" class="seats">
							
                        </ul>
                    </div>
                </div>
                <strong class="title_notice" >
                	<br><br>
                	<span style="font-weight: bold; font-size: 9pt">- 티켓예매시 참고사항</span>
                	<br><br>
					
					- 관람일 하루 전 오후5시까지 취소 가능합니다.<br>
					평일/주말/공유 일일 경우는 17시까지, 토요일일 경우는 11시까지 가능합니다.<br>
					<br>
					- 신용카드 단일 결제 시 부분 취소가 가능합니다.<br>
					단, 문화누리카드 및 일부 직불카드는 부분 취소가 불가능 합니다. <br>   	
                </strong>
            </div>
            <div class="reserve_right" style="height:620px">
 				<br><br>
                <div class="goods_info">              
                    <span class="goods_img"><img src="${path }/resources/upload/info/${pi.performName}/${pi.rePosterImg}" width="41" height="50"></span>
                    <strong class="goods_tit" id="productName" style="font-weight: bold; font-size: 15pt;">${pi.performName }</strong>
                </div>
                	
                <div class="reserve_result" style="text-align:center;">                    
                    <span class="float-left">예매정보</span>
                    <table>
                      
                        
                    <tr>
                    <!-- <th>                         
                        <ul class="seat_list" style="height:100px;">
                            <li >
                                <span class="seat_level"></span>
                                <span class="seat_price"></span>
                            </li>
                        </ul>
                        </th> -->
                      </tr>                        
                        <tbody>
                        <tr>
                            <th scope="row">공연 일시</th>
                            <td id="selected_date">                                
                            </td>
                        </tr>                        
                        <tr>
                            <th scope="row">선택 좌석</th>
                            <td id="selected_seat">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">티켓 매수</th>
                            <td id="selected_number">
                            </td>
                        </tr>                        
                        </tbody>
                        <tfoot>
                        <tr>
                            <th scope="row" id="total_amount">결제 금액</th>
                            <td></td><!--  -->
                        </tr>
                        </tfoot>
                    </table>
                    <br><br><br><br>
                    <input type="button" class="btn btn-primary btn-sm" onclick="scheduleCheck();" value="다음 단계">
                </div>
                
                
            </div>
        </div>
		</form>
