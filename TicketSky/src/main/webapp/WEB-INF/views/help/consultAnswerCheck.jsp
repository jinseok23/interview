<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/help/helpBar.jsp" />
<link rel="stylesheet" href="${path}/resources/help/form.css" />
<link rel="stylesheet" href="${path}/resources/help/responsive.css" />
<br>
<br>
<br>
<hr>
<h2 style="text-align: center">관리자 답변 확인</h2>
<hr>
<br>
<br>
<br>
<div role="main" class="container">
	<div class="row row-offcanvas row-offcanvas-right">
		<div class="col-12 col-md-9">
			<section id="container" style="margin: 5% 0 0 0">
				<hr>
				<div name="hongkiat" id="hongkiat-form">
					<div id="wrapping" class="clearfix" style="margin: 0 0 0 0%">
						<input type="text" name="name" id="name" placeholder="이름을 입력하세요."
							autocomplete="off" tabindex="1" class="txtinput"
							style="width: 100%" value="${answerCheck.USERNAME}" readonly> 
						<input type="email"
							name="email" id="email"
							placeholder="ex) abc@naver.com" autocomplete="off"
							tabindex="2" class="txtinput" style="width: 100%" value="${answerCheck.EMAIL}" readonly>
					</div> 
					<div>
					<textarea name="title" id="title" tabindex="5" class="txtinput" style="width:100%; height:20%; resize:none" required>${answerCheck.TITLE}</textarea>
	<%-- 					<input type="text" name="title" id="title"
							 tabindex="5" class="txtinput"
							style="width: 100%" value="${answerCheck.TITLE}" > --%>

						<textarea name="message" id="content"
							tabindex="5" class="txtblock" style="width: 100%; height: 200px; resize:vertical" required>${answerCheck.CONTENT}</textarea>
<%-- 						<input type="text" class="txtinput" style="width: 100%" name="reply" id="reply" value="${answerCheck.CONSULT_CONTENT}">
 --%>						
						<textarea name="reply" id="reply"
							tabindex="5" class="txtblock" style="width: 100%; height: 200px; resize: vertical" 
							required>${answerCheck.CONSULT_CONTENT}</textarea>
						<hr>
					</div>
					<button class="btn btn-outline-success my-2 my-sm-0"
						style="margin: 0 0 0 45%" onclick="fn_answerCheck()">확인</button>
				</div>
			</section>
		</div>
	</div>
</div>
				<script>
				function fn_answerCheck(){
					location.href='${path}/help/consult.do';
				}

				
				</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />