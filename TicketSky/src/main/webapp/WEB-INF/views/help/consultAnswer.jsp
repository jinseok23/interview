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
<h2 style="text-align: center">관리자 답변</h2>
<hr>
<br>
<br>
<br>
<div role="main" class="container">
	<div class="row row-offcanvas row-offcanvas-right">
		<div class="col-12 col-md-9">

<!-- 			<button class="btn btn-outline-success"
				onclick="location.href='consult.do'" style="margin: 5% 0 0 0">상담내역</button>
			<button class="btn btn-outline-success" 
				style="margin: 5% 0 0 0">상담하기</button> -->
			<section id="container" style="margin: 5% 0 0 0">
				<hr>
				<div name="hongkiat" id="hongkiat-form" method="get">
				
					<div id="wrapping" class="clearfix" style="margin: 0 0 0 0%">
						<input type="text" name="name" id="name" placeholder="이름을 입력하세요."
							autocomplete="off" tabindex="1" class="txtinput"
							style="width: 100%" value="${answer.USERNAME}" required readonly> 
							
							<input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요."
							autocomplete="off" tabindex="1" class="txtinput"
							style="width: 100%" value="${answer.USERID}" required readonly>
							
							
						<input type="email"
							name="email" id="email"
							placeholder="ex) abc@naver.com" autocomplete="off"
							tabindex="2" class="txtinput" style="width: 100%" value="${answer.EMAIL}" readonly>
					</div>
					<div>
						<textarea name="title" id="title"
							placeholder="제목을 작성해주세요."
							tabindex="5" class="txtblock" style="width:100%; resize:none" readonly>${answer.TITLE}</textarea>
							
<%-- 						<input type="text" name="title" id="title"
							placeholder="제목을 입력하세요." tabindex="5" class="txtinput"
							style="width: 100%" value="${answer.TITLE}" readonly> --%>
						
						<textarea name="message" id="content"
							placeholder="내용을 작성해주세요."
							tabindex="5" class="txtblock" style="width:100%; resize:vertical" readonly>${answer.CONTENT}</textarea>
						
						<hr>							
						<textarea name="message" id="answer"
							placeholder="답변을 작성해주세요"
							tabindex="5" class="txtblock" style="width: 100%; resize: vertical" 
							required></textarea>
												
	 				<!--		<input type="text" name="answer" id="answer"
							placeholder="답변을 입력해주세요." tabindex="5" class="txtinput"
							style="width: 100%" required> -->
							
					</div>
					<button class="btn btn-outline-success my-2 my-sm-0"
					style="margin:0 0 0 42%" onclick="fn_answerInsert(${answer.CONSULT_NO})">답변하기</button>
			</section>
		</div>
	</div>
</div>
				<script>
					function adminAnswer()
					{
						location.href='/help/adminAnswer.do';
					}
					
					function fn_answerInsert(consult_no)
					{
						
						var answer =$('#answer').val();
						
						location.href='${path}/help/answerInsert.do?consult_no='+consult_no+'&answer='+answer;
					}
					
				</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />