<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<link rel="stylesheet" href="${path}/resources/help/form.css"/>	
<c:set value="${pageContext.request.contextPath }" var="path"/> 

<script>

$(document).ready(function(){
	var cateNo = $('#cateNo').val();
	if(cateNo==1){
		$("#open").show();
	} else {
		$("#open").hide();
	}
});
// (no)
function fn_noticeModify(no)
{
	location.href="${path}/help/noticeModify.do?noticeNo="+no;
	//	location.href="${path}/help/noticeModify.do?noticeNo="+no;

}
function fn_noticeDelete(no)
{
		location.href="${path}/help/noticeDelete.do?noticeNo="+no;
}
</script>

<br><br><br><hr>
<h2 style="text-align:center">공지사항 보기</h2>
<hr><br><br><br>
<c:if test="${memberLoggedIn!=null && memberLoggedIn.userId=='admin'}">
<button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="fn_noticeModify(${notice.NOTICENO});" style="margin:0 0 0 72%">수정</button>
<button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="fn_noticeDelete(${notice.NOTICENO});">삭제</button>
</c:if>
<div role="main" class="container">
	<table class="table table-striped table-bordered table-hover" id="n_menu">
 <tr>
	 <td>카테고리</td>
	 <td>${notice.CATENAME}</td>
</tr>
<tr>
	<td>글제목</td>
	 <td>${notice.TITLE}
	 </td>
 </tr>
 <tr>
	 <td>내용</td>
	 <td height="300px"><textarea name="content" id="content" placeholder="내용을 입력하세요." style="width:600px; height:300px" readonly>${notice.CONTENT}</textarea>
	 </td>
 </tr>
<input type="hidden" value="${notice.CATENO}" id="cateNo"/>
  <tr id="open">
	 <td>예매오픈일</td>
	 <td><fmt:formatDate value="${notice.OPENDATE}" pattern="yyyy-MM-dd"/>
	 </td>
 </tr>
  <tr>
	 <td>조회수</td>
	 <td>${notice.COUNT}</td>
 </tr>
</table>
 </div>
<button class="btn btn-outline-success my-2 my-sm-0" onclick="location.href='${path}/help/noticeHome.do'" style="margin:0 0 0 45%">목록</button>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>