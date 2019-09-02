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
					str2 +='<span class="txt_left">'+result.list[i].seatLevel+'</span>';
					str2 +='<span class="txt_right">';
					str2 +='<em style="color:blue; font-weight: bold;">'+result.list[i].seatCount+'</em>&ensp;석';
					str2 +='</span>';
					str2 +='</li>';
					$('.seats').append(str2);		
			}    	 
			 
			  			
		}
	}) 
}