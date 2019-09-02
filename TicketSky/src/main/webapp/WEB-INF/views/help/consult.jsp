<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<style>
a{
	color:green;
}
</style>
<script>
	function fn_consultHome()
	{
		location.href='${pageContext.request.contextPath}/help/consult.do';
	}
	function fn_consultSubmit(userId)
	{
		location.href='${pageContext.request.contextPath}/help/consultInsert.do?userId='+userId;

	}
	$(function(){
		var userId = $("#userId").val();
		if(userId=='admin')
			consult_Admin();
		else
			consult_list();
	});
	
	function consult_list(){
		//helpbar에 hidden 에 넣어놓은 userId
		var userId = $("#userId").val();
		$.ajax({
			type : "get",
			url : "${path}/help/consultView.do",
			datatype : "json",
			data : {userId : userId},
			success : function(data) {
				console.log(data);
				var view="";
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						view+="<tr>"
						view+="<td>"+data[0][i].CATE_NAME+"</td>";
						view+="<td>"+data[0][i].USERID+"</td>";
						view+="<td>"+data[0][i].TITLE+"</td>";
						view+="<td>"+data[0][i].CONTENT+"</td>";
/* 						view+="<td>"+data[0][i].CDATE+"</td>";
 */						if(data[0][i].REPLY_NO==null)
							view+="<td>답변대기</td>";	
							else
								view+="<td><a href='${path}/help/consultAnswerCheck.do?consult_no="+data[0][i].CONSULT_NO+"'>답변완료</a></td>"; 
						view+="</tr>"
					}
				}
						$('#tt').html(view);
			},
			error : function(xhr, Status, error) {
				console.log("faq ajax 실패 : " + xhr + " " + Status + " "
						+ error);
			}
		});
	}
	
	function consult_Admin(){
		$.ajax({
			type : "get",
			url : "${path}/help/consultAdmin.do",
			datatype : "json",
			success : function(data) {
				console.log(data);
				var view="";
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						view+="<tr>"
						view+="<td>"+data[0][i].CATE_NAME+"</td>";
						view+="<td>"+data[0][i].USERID+"</td>";
						view+="<td>"+data[0][i].TITLE+"</td>";
						view+="<td>"+data[0][i].CONTENT+"</td>";
						/* view+="<td>"+data[0][i].CDATE+"</td>"; */
						 if(data[0][i].REPLY_NO==null)
							//답변대기일때 a태그 함수 생성후 consult_no를 가져가서 member랑 조인 후 쿼리스트링으로 보낼거 
							view+="<td><a href='${path}/help/consultAnswer.do?consult_no="+data[0][i].CONSULT_NO+"'>답변하기</a></td>";
						else
							view+="<td><a href='${path}/help/consultAnswerCheck.do?consult_no="+data[0][i].CONSULT_NO+"'>답변완료</a></td>"; 
						view+="</tr>"
					}
				}
						$('#tt').html(view);
			},
			error : function(xhr, Status, error) {
				console.log("faq ajax 실패 : " + xhr + " " + Status + " "
						+ error);
			}
		});
	}
</script>

<br><br><br><hr>
<h2 style="text-align:center">1:1문의</h2>
<hr><br><br><br>
<div role="main" class="container">
                <!--위까지 고정Header-->
            <button class="btn btn-outline-success" onclick="fn_consultHome()" style="margin:5% 0 0 0">상담내역</button>
            <button class="btn btn-outline-success" onclick="fn_consultSubmit('${memberLoggedIn.userId}')" style="margin:5% 0 0 0">상담하기</button>
            <table class="table table-striped table-bordered table-hover" style="margin:5% 0 0 0">
                    <thead>
                    <tr>
                        <td>문의유형</td>
                        <td>회원아이디</td>
                        <td>문의제목</td>
                        <td>문의내용</td>
                        <td>답변</td>
                    </tr>
                    </thead>
                    <tbody id="tt">
						
                    </tbody>
                </table>
<br>
            	 <p>서비스 이용 중 궁금한 내용이 있으시면, 언제든지 문의해주세요. 감사합니다.<br>
            </p>
              </div>
          <hr>
          <button class="btn btn-outline-success my-2 my-sm-0" onclick="fn_consultSubmit('${memberLoggedIn.userId}')" style="margin:0 0 0 40%">1:1 문의하기</button>
        <div class="row">
            <br>
        </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>