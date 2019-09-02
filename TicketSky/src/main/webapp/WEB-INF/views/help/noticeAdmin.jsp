<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/help/helpBar.jsp" />
<link rel="stylesheet" href="${path}/resources/help/form.css" />

<script language='javascript'>

function noEvent() {
if (event.keyCode == 116) {
event.keyCode= 2;
return false;
}
else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
{
return false;
}
}
document.onkeydown = noEvent;
</script>

<script>
	$(document).ready(function(){
		$('#cateNo').change(function(){
			if($('#cateNo option:selected').val()==1)
				$('#openDate').show();
			else
				$('#openDate').hide();
		});
	});
</script>

<br>
<br>
<br>
<hr>
<h2 style="text-align: center">공지사항 등록</h2>
<hr>
<br>
<br>
<br>
<div role="main" class="container">
	<form action="${path}/help/noticeEnroll.do">
		<table class="table table-striped table-bordered table-hover"
			id="n_menu">
			<tr>
				<td>카테고리</td>
				<td><select id="cateNo" name="cateNo">
						<option value="1" id="T">티켓오픈</option>
						<option value="2" id="C">변경/취소</option>
						<option value="3" id="O">기타</option>
				</select> <!--   <input type="text" name="catename" id="catename" placeholder="카테명들어갈곳">
 --></td>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="title" id="title"
					placeholder="글제목" style="width: 600px"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="300px"><textarea name="content"
					id="content" placeholder="내용을 입력하세요."
					style="width: 600px; height: 300px"></textarea></td>
			</tr>

						<tr id="openDate">
				<td>예매오픈일</td>
				<td><input type="date" name="date" id="date"
					placeholder="등록일을 입력하세요."></td>
			</tr>
		</table>
		<button id="btnEnroll" class="btn btn-outline-success my-2 my-sm-0"
			type="submit" style="margin: 0 0 0 45%">등록</button>
	</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />