<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"/>
<jsp:include page="/WEB-INF/views/common/reserveHeader.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/info.css"/>
<style>
a{
 color: #747474;
}
</style>
<script>
$(function(){
	var performNo= $("input[name=performNo]").val();
	var performDateNo= $("input[name=dateNo]").val();
	var performName= $("input[name=performName]").val();
		
	$.ajax({
		url:"${pageContext.request.contextPath}/reserve/getSeatInfo",
		data:{"performDateNo":performDateNo},
		dataType:"json",		
		success:function(result)
		{    
						
			for(var i=0; i<result.list.length; i++)
			{       						
				var str='<li>';    	
				str+='<a href="javascript:;" style="cursor:pointer" onclick="selectSeat('+i+')">';
				str+='<input type="hidden" name="seatInfoNo_'+i+'" value="'+result.list[i].seatInfoNo+'">';
	   		    str+='<span class="seat_color" style="background:#ffc000">　</span>&ensp;';        
	            str+='<span class="seat_floor">'+result.list[i].seatFloor+'층</span>';
	   		    str+='<span class="">&ensp;'+decodeURIComponent(result.list[i].seatLevel)+'&ensp;</span>';	            
	            str+='<span class="seat_level">&ensp;'+decodeURIComponent(result.list[i].seatName)+'&ensp;</span>';
	   		    str+='<span class="seat_price">'+result.list[i].seatPrice+'원&ensp;</span>';
	            str+='<span class="seats"><em style="color:blue; font-weight: bold;">'+result.list[i].seatCount+' </em>석</span>';        
		  		str+='</a>';
				str+='</li>';
				
				$(".seat_list").append(str);
			}       					   
		}
	}); 	
	$.ajax({
		url:"${pageContext.request.contextPath}/reserve/getSeatImg",
		data:{"performNo":performNo},
		dataType:"json",
		success:function(result)
		{    			
			for(var i=0; i<result.list.length; i++)
			{       						
				 if(i==0){ 					
					var str ='<div class="carousel-item active" >';
				    str+='<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/upload/info/'+performName+'/'+result.list[i].reSeatImg+'" title="'+decodeURIComponent(result.list[i].seatContent)+'">';
				    str+='</div>';
				    $("#seat_img").append(str);
				 }
				else{
					var str ='<div class="carousel-item">';
					str+='<img class="d-block w-100" src="${pageContext.request.contextPath}/resources/upload/info/'+performName+'/'+result.list[i].reSeatImg+'" title="'+decodeURIComponent(result.list[i].seatContent)+'">';
				    str+='</div>';
				    $("#seat_img").append(str);
				} 			    	
			}       					   
		}
	}); 
});		
	function selectSeat(i)
	{
		var seatInfoNo = $("input[name=seatInfoNo_"+i+"]").val();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/reserve/getAvailableSeat",
			data:{"seatInfoNo":seatInfoNo},
			dataType:"json",		
			success:function(result)
			{  								
				if(result.seatInfo.notReserved=="Y")
				{
					var select='<select name="selectSeat" id="selectSeat" class="form-control w-75" style="text-align:center;  margin-left: 30px" disabled>';
					$("#selectDiv").html(select);
					var option='<option value="-1" selected>비지정석</option>';
					$("#selectSeat").append(option);
				}
				else
				{				
					
					var select = '<select name="selectSeat" id="selectSeat" class="custom-select" style="text-align:center; margin-left: 10px" onchange="selectedSeat()">';
			    	select+='<option value="0" >좌석번호</option>';
					$("#selectDiv").html(select);
					
					for(var i=0; i<result.sdList.length; i++)
					{						
						var option='<option value="'+result.sdList[i].seatDataNo+','+result.sdList[i].seatNum+','+result.sdList[i].seatInfoNo+'">'+result.sdList[i].seatNum+'번 </option>';
						$("#selectSeat").append(option);							
					}	
				}				       					   
			}
		}); 
	}
	
	var seatCount = 0;
	
	function selectedSeat()
	{
		
		var selected = $("#selectSeat option:selected").val();
		
		if(selected==0)
		{			
		}
		else if(seatCount >= 4)
		{
			alert("한번의 예매에 최대 4매까지만 선택가능합니다.")
		}
		else
		{
			var splitData = selected.split(",");
			var seatDataNo = splitData[0];
			var seatNum= splitData[1];
			var seatInfoNo = splitData[2];
			$.ajax({
				url:"${pageContext.request.contextPath}/reserve/selectSeatInfo",
				data:{"seatInfoNo":seatInfoNo},
				dataType:"json",				
				success:function(result)
				{  								
					var purchaseSeat=decodeURIComponent(result.seatInfo.seatLevel)+' '+result.seatInfo.seatFloor+'층 '+decodeURIComponent(result.seatInfo.seatName)+' '+seatNum+'번';
					
					/* var seat='<span style="font-size=10pt">'+$("input[name=performDate]").val()+'</span>'; */
					var seat = '<span style="color:blue; font-size:10pt; word-spacing:2px">'+purchaseSeat+'</span><br>';
					seat+='<input type="hidden" name="seatDataNo_'+seatCount+'" value="'+seatDataNo+'">';
					seat+='<input type="hidden" name="purchaseSeat_'+seatCount+'" value="'+purchaseSeat+'">';
					seat+='<input type="hidden" name="seatPrice_'+seatCount+'" value="'+result.seatInfo.seatPrice+'">';
					console.log(result.seatInfo.seatPrice);
					$("#selectedSeat").append(seat);
					
					console.log($("input[name=seatPrice_0]").val());
					
					var idx = document.selectSeats.selectSeat.selectedIndex;
					document.selectSeats.selectSeat.options[idx] = null;
					
					seatCount++;
					
					$("input[name=selectCount]").val(seatCount);	
					/* console.log("카운트 값 : "+$("input[name=selectCount]").val());	 */       					   
				}
			});	
		}
	}
	
	function removeSelectedSeat()
	{
		$("#selectedSeat").empty();
		$("#selectDiv").empty();
		seatCount = 0;
	}
	
	function seatCheck(){
		if(seatCount==0)
		{			
			alert("좌석을 선택해주세요.");	
		}
		else
		{
			$('#selectSeatFrm').submit();		
		}		
	};
</script>
	<form action="selectPurchase" id="selectSeatFrm" name="selectSeats" method="post" >
		<input type="hidden" name="performNo" value="${performNo }">
		<input type="hidden" name="dateNo" value="${performDateNo}">
		<input type="hidden" name="performName" value="${pi.performName }">
		<input type="hidden" name="rePosterImg" value="${pi.rePosterImg }">
		<input type="hidden" name="performDate" value="${performDate }">
		<input type="hidden" name="selectCount" value="0">
        <div class="reserve_content" style="text-align: center">
            <div class="reserve_left">
            <br>
                <div class="white_box tblbx" >
                	<div>
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
						  <div class="carousel-inner" id="seat_img">
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
                    </div>
            	</div>
            	<br>
		</div>
	<div class="reserve_right" style="text-align: center;">    
	   	<div class="reserve_artbx">    
		    <div class="bx_tit">
		        <h4 class="reserve_tit seat_select">등급 선택</h4>        
		    </div>
		    <ul id="select_seat_grade" class="seat_list" style="height:100px">
		    </ul>	    
		</div>
		<hr>
		    <div class="reserve_artbx">
			    <div class="bx_tit">
			        <h4 class="reserve_tit">좌석 선택</h4>			        
			    </div>   
			    <div class="input-group-prepend" id="selectDiv" style="height:100px">			    	
			    	</select>
			    	<!-- <input type="radio" id="seat_select_passive" name="seat_select" value="1" checked="checked">				    
			        <label for="seat_select_passive">직접선택</label>
			      	<input type="radio" id="seat_select_auto" name="seat_select" value="0">				    
				    <label for="seat_select_auto" >자동배정</label>		
				    <div>
			        </div> -->			        	        	    
			    </div>
			    <hr>
			    <div class="bx_tit">
			        <h4 class="reserve_tit">선택 좌석</h4>				    	        
				</div>				 
			    <div id="selectedSeat" style="height: 100px">
			    </div>
			    <hr>
			</div>   
				<br>
				<input type="button" class="btn btn-secondary btn-sm"  value="선택 초기화" onclick="removeSelectedSeat()">
				<br><br>
				<input type="button" class="btn btn-warning btn-sm" onclick="location.href ='${path}/reserve/selectSchedule?performNo=${performNo }'" value="이전단계">
				&ensp;
				<input type="button" class="btn btn-primary btn-sm" onclick="seatCheck();" value="다음 단계">		    
			</div>              
           </div>        
		</form>


