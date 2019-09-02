<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page = "/WEB-INF/views/common/header.jsp"/> 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/info.css"/>
<script src="${path }/resources/js/info/info.js"></script>
<script type="text/javascript">
        $(function() {
            $("#seatImgFile").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#preSeatImg').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
        
        
</script>
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
<br><br><br>
<div class="container" style="width:60%;">
    <br>
    <h3 style="text-align: center">공연등록</h3>
    <hr>
    <div class="form-group">
    <form method="post" action="insertEnd" name="insertSeat" enctype="multipart/form-data">
             <legend>공연 좌석 입력폼</legend>    
            <table class="table info_table" style=" text-align: center;">
                
                    <tr>
                        <th colspan="1" rowspan="2">
                            <br><br><br><br><br>
                            좌석 이미지
                        </th>
                        <td colspan="3" rowspan="2" width="400px" height="200px">
                           <img id="preSeatImg"  style="width:200px;height:250px;">
                        </td>
                        <td colspan="2" rowspan="1" >
                            <br><br>
                            	<input type="file" name="seatImg_0" id="seatImgFile" class="form-control" style="width:100%;" accept="image/gif, image/jpeg, image/png, image/jpg" >
                        </td>
                    </tr>
                    
                    <tr>
                       	<td>
                       	<br>
                       		<input type="text" name="seatContent_0" class="form-control" placeholder="이미지 설명 추가 (예: 1층 좌석 배치도)"> 
                       		
                       	</td>
                       	<!-- <td>
                    		<input type="button" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="startDate()">
                    	</td> -->
                    </tr>
                    <tr>
                    	
                    </tr>                 
                 </table>
                 
                 <!-- 추가이미지 생성 -->
                 <div id="seatImgDiv">
                 	<input type="hidden" name="seatImgCount" value="1">                 
                 </div>
                 
                
                 <br>
                 <table class="table info_table" style="text-align:center;">
                    <tr>
                        <th colspan="1">좌석층</th>									
                        <td colspan="1" style="width:300px">
                            <input type="number" name="seatFloor_0" class="form-control">
                        </td>
                        <th colspan="1">좌석등급</th>
                        <td colspan="1">
                            <input type="text" name="seatLevel_0" class="form-control" placeholder="ex : VIP석">
                        </td>
                        <td colspan="2" rowspan="3">
                        <br><br>
                        	<input type="button" class="btn btn-sm btn-danger" style="margin-top: 35px" value="삭제" onclick="seatInfo_0()">
                        </td>
                    </tr>
                    <tr>
                        <th colspan="1">좌석명</th>									
                        <td colspan="1">
                            <input type="text" name="seatName_0" class="form-control" placeholder="ex : A열">
                        </td>
                        <th>좌석가격</th>									
                        <td>
                            <input type="number" name="seatPrice_0" class="form-control">
                        </td>
                        
                    </tr>  
                    <tr>
                        <th colspan="1">좌석정보</th>
                        <td colspan="1">
                        <p style="font-size: 16px">
                            <input type="radio" name="notReserved_0" value="N" checked>지정석 &ensp;
                            <input type="radio" name="notReserved_0" value="Y" disabled>비지정석                        
                        </p>
                        </td>
                        <th>좌석번호</th>									
                        <td>
                            <div class="input-group" style="width: 250px">
                                <div class="col-5">
                                <input type="number" name="seatStartNum_0" class="form-control" placeholder="시작">
                                </div>    
                                <h5>~</h5>
                                <div class="col-5">
                                <input type="number" name="seatEndNum_0" class="form-control" placeholder="끝">      
                                
                                </div>
                                
                            </div>
                        </td>
                                                             
                    </tr>	
                    </tbody>
            		</table>
            		<!-- 추가좌석 생성 -->
                    <div id="seatInfoDiv">
                    	<input type="hidden" name="seatInfoCount" value="1">
                    </div>
                   
		        <input type="button" class="btn btn-sm btn-warning" value="좌석 배치도 추가" onclick="addSeatImg()">                
		        <input type="button" class='btn btn-sm btn-warning' value="좌석정보 추가" onclick="addSeatInfo()"/>	
			<div class="float-right">
				<input type="submit" class="btn btn-sm btn-primary" value="작성완료">		
			</div>         
            </form>
            </div>
            

    </div>
    <br><br><br>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
