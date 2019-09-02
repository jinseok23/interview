

// 공연 등록 form
  
var cCount=1;

function addContent(){

	if(cCount>4)
	{
		alert("상세정보는 최대 5개까지만 입력할 수 있습니다.");
		e.preventdefault();
	}
	else
	{ 
		
	var str='<div id="addedContent_'+cCount+'">';
	str+='<br>';
	str+='<div class="input-group">';
	str+='<div class="input-group-prepend">';
	str+='<span class="input-group-text">상세정보 '+(cCount+1)+'</span>';
	str+='</div><br>';
	str+='<textarea class="form-control" name="performContent_'+cCount+'" rows="3" placeholder="[공연 상세정보]에 보여질 내용을 입력하세요.  첨부된 이미지는 작성된 텍스트 아래 쪽에 배치됩니다."></textarea>';
	str+='</div><br>';
	str+='<div class="float-left">';
	str+='<input type="file" name="contentImg_'+cCount+'" class="form-control"  accept="image/gif, image/jpeg, image/png, image/jpg">';
	str+='</div>'
	str+='<div class="float-right">'
	str+='<input type="Button" class="btn btn-sm btn-danger" value="삭제하기" onclick="delContent()">'+" ";
	str+='<br><br></div><br><br><div class="line"></div>';	
	
	$("#contentDiv").append(str);		
	
	cCount++;		
	
	document.insertForm.contentCount.value=cCount;
	
	}
} 	

function delContent(){

	var contentDiv = document.getElementById("contentDiv");
	if(cCount >1){
		var contentVal = document.getElementsByName("contentVal").value;
		
		var addedContent = document.getElementById("addedContent_"+(--cCount));
		
		contentDiv.removeChild(addedContent); 
		document.insertForm.contentCount.value=cCount;
	}else{
		document.baseForm.reset();
	}
}

// 일정 등록 form

var dateCount=0;

function startDate(){
	alert("공연 시작일, 종료일은 삭제할 수 없습니다.");
}


function addDate(){
	var  str='<div id="addedDate_'+dateCount+'">';
	str +='<table class="table info_table" style="border-collapse: collapse; text-align: center;">';	
	str +='<thead></thead><tbody>'
	str +='<tr>';
	str +='<th colspan="1">공연일</th>';
	str +='<td colspan="2">';
	str +='<input type="Date" class="form-control" name="performDate_'+dateCount+'" value="">';
	str +='</td>';
	str +='<td rowspan="2">';
	str +='<input type="button" name="" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="delDate()">';
	str +='</td>';	
	str +='<tr>';
    str +='<th colspan="1">공연 시간</th>';
    str +='<td colspan="2">'; 
    str +='<input type="time" name="performTime_'+dateCount+'" class="form-control">';
    str +='</td></tr></tbody></table></div>';
	$("#dateDiv").append(str);	
	
	dateCount++;	
	
	document.insertDate.dateCount.value= dateCount;
	
}
	function delDate(){
		var dateDiv = document.getElementById("dateDiv");
		if(dateCount >0){
			var addedDate = document.getElementById("addedDate_"+(--dateCount));
			dateDiv.removeChild(addedDate); 
			document.insertDate.dateCount.value= dateCount;
			
		}else{
			document.baseForm.reset();
		}
	}
	
//	좌석정보 입력 Form
	
	var siCount=1;

    function addSeatImg(){
    	
    	if(siCount>2)
    	{
    		alert("좌석 배치도는 최대 3개까지만 첨부할 수 있습니다.");
    		e.preventdefault();
    	}
    	else
    	{ 
    		var str='<div id="addedSeatImg_'+siCount+'">';
    		str+='<table class="table info_table" style=" text-align: center;">';
            str+='<tr><th colspan="1" rowspan="2">';
            str+='<br><br><br><br><br>';
            str+='좌석 이미지'+(siCount+1);
            str+='</th>';
            str+='<td colspan="3" rowspan="2" width="400px" height="200px">';
            str+='<img id="sImg_'+siCount+'"  style="width:200px;height:250px;">';
            str+='</td>';
            str+='<td colspan="2" rowspan="1" >';
            str+='<br><br>';
            str+='<input type="file" name="seatImg_'+siCount+'" id="imgInp_'+siCount+'" class="form-control" style="width:100%;" accept="image/gif, image/jpeg, image/png, image/jpg" >';
            str+='</td>';
            str+='</tr>';
            str+='<tr>';
            str+='<td>';
            str+='<br>';
            str+='<input type="text" name="seatContent_'+siCount+'" class="form-control" placeholder="이미지 설명 추가 (예: 1층 좌석 배치도)">'; 
            str+='</td>';
            str+='<td>';
          	str+='<input type="button" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="delSeatImg()">';
            str+='</td>'
            str+='</tr>';
            str+='<tr></tr></table></div>';   	
    	$("#seatImgDiv").append(str);		    	
    	siCount++;	    	
    	document.insertSeat.seatImgCount.value=siCount;

    	var name="#imgInp_"+(siCount-1);
    	$(name).on('change', function(){
    		readURL1(this,siCount);
    	});
    	}
    } 	
    
    function readURL1(input,siCount) {
	    if (input.files && input.files[0]) {
	       var reader1 = new FileReader();
	       reader1.onload = function (e) {
	    	   var name = "#sImg_"+(siCount-1);
	    	   console.log(name);
	          $(name).attr('src', e.target.result);
	       }
	       reader1.readAsDataURL(input.files[0]);
	    }
	}
	

    function delSeatImg(){

    	var seatImgDiv = document.getElementById("seatImgDiv");
    	if(siCount >1){
    		var addedSeatImg = document.getElementById("addedSeatImg_"+(--siCount));
    		
    		seatImgDiv.removeChild(addedSeatImg); 
    		document.insertSeat.seatImgCount.value=siCount;
    	}else{
    		document.baseForm.reset();
    	}
    }
    
    var sCount=1;

    function addSeatInfo(){

    	if(sCount>32)
    	{
    		alert("좌석 배치도는 최대 3개까지만 첨부할 수 있습니다.");
    		e.preventdefault();
    	}
    	else
    	{ 
    		var str='<div id="addedSeatInfo_'+sCount+'">';
    		str+='<table class="table info_table" style="text-align:center;">';
            str+='<tr><th colspan="1">좌석층</th>';									
            str+='<td colspan="1" style="width:300px">';
            str+='<input type="number" name="seatFloor_'+sCount+'" class="form-control">';
            str+='</td>';
            str+='<th colspan="1">좌석등급</th>';
            str+=' <td colspan="1">';
            str+='<input type="text" name="seatLevel_'+sCount+'" class="form-control" placeholder="ex : VIP석">';
            str+='</td>';
            str+='<td colspan="2" rowspan="3">';
            str+='<br><br>';
            str+='<input type="button" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="delSeatInfo()">';
            str+='</td>';
            str+='</tr>';
            str+='<tr>';
            str+='<th colspan="1">좌석명</th>';									
            str+='<td colspan="1">';
            str+='<input type="text" name="seatName_'+sCount+'" class="form-control" placeholder="ex : A열">';
            str+='</td>';
            str+='<th>좌석가격</th>';									
            str+='<td>';
            str+='<input type="number" name="seatPrice_'+sCount+'" class="form-control">';
            str+='</td>';
            str+='</tr>';  
            str+='<tr>';
            str+='<th colspan="1">좌석정보</th>';
            str+='<td colspan="1">';
            str+='<p style="font-size: 16px">';
            str+='<input type="radio" name="notReserved_'+sCount+'" value="N" checked>지정석 &ensp;';
            str+='<input type="radio" name="notReserved_'+sCount+'" value="Y" disabled>비지정석';                        
            str+='</p></td>';
            str+='<th>좌석번호</th>';									
            str+='<td><div class="input-group" style="width: 250px">';
            str+='<div class="col-5"><input type="number" name="seatStartNum_'+sCount+'" class="form-control" placeholder="시작"></div>';    
            str+='<h5>~</h5>';
            str+='<div class="col-5"><input type="number" name="seatEndNum_'+sCount+'" class="form-control" placeholder="끝">';      
            str+='</div></div></td><tr></table></div>';
    	
    	
    	$("#seatInfoDiv").append(str);		
    	
    	sCount++;		
    	
    	document.insertSeat.seatInfoCount.value=sCount;
    	
    	}
    } 	

    function delSeatInfo(){

    	var seatInfoDiv = document.getElementById("seatInfoDiv");
    	if(sCount >1){
    		var addedSeatInfo = document.getElementById("addedSeatInfo_"+(--sCount));
    		
    		seatInfoDiv.removeChild(addedSeatInfo); 
    		document.insertSeat.seatInfoCount.value=sCount;
    	}else{
    		document.baseForm.reset();
    	}
    }
    function seatInfo_0(){
    	alert("첫번째 좌석정보는 삭제할 수 없습니다.")
    }

