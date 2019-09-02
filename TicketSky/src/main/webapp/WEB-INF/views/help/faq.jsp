<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/help/helpBar.jsp" />
<link rel="stylesheet" href="${path }/resources/help/tabform.css" />
<style>
.btn-secondary {
	background-color: black;
}

#faq {
	text-align: center;
}
/* a.hover
{
	background-color:black;
} */
a {
	font-size: 20px;
	color: skyblue;
}

a:hover {
	font-size: 20px;
	color: blue;
}

a:focus {
	font-size: 20px;
	color: navy;
}

.panel-title {
	background-color: white;
}
</style>
<script>
	$(document).ready(function() {
		fn_faq();
	});
	function fn_faq() {
		var cateNo = $('input[name="tabs"]:checked').val();
		$.ajax({
			type : "get",
			url : "${path}/help/faqView.do",
			datatype : "json",
			data : {cateNo : cateNo},
			success : function(data) {
				console.log(data);
				var view = "";
				if (data != null) {
					for (var i = 0; i < data[0].length; i++) {
						view += '<div class="panel panel-default">';
						view += '<div class="panel-heading" role="tab" id="'+data[0][i].FAQ_NO+'">';
						view += '<h4 class="panel-title">';
						view += '<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#c'+data[0][i].FAQ_NO+'" aria-expanded="false" aria-controls="c'+data[0][i].FAQ_NO+'">';
						view += 'Q. ' + data[0][i].FAQ_Q;
						view += '</a>';
						view += '</h4>';
						view += '</div>';
						view += '<div id="c'+data[0][i].FAQ_NO+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="'+data[0][i].FAQ_NO+'">';
						view += '<div class="panel-body">';
						view += data[0][i].FAQ_A;
						view += '</div></div></div>';
					}
				}
				$('#babo').html(view);
			},
			error : function(xhr, Status, error) {
				console.log("faq ajax 실패 : " + xhr + " " + Status + " "
						+ error);
			}
		});
	}
</script>
<br>
<br>
<br>
<hr>
<h2 style="text-align: center">FAQ</h2>
<hr>
<div class="main">
	<input id="tab1" type="radio" name="tabs" checked value="1"
		onclick="fn_faq();">
	<!--디폴트 메뉴-->
	<label for="tab1">예매/취소</label> 
	
	<input id="tab2" type="radio"
		name="tabs" value="2" onclick="fn_faq();"> <label for="tab2">결제</label>

	<input id="tab3" type="radio" name="tabs" value="3" onclick="fn_faq();">
	<label for="tab3">회원</label> 
	
	<input id="tab4" type="radio" name="tabs"
		value="4" onclick="fn_faq();"> <label for="tab4">기타</label>


	<div class="col-lg-6" style="margin: 5% 0 0 0">
		<div class="input-group">
		 	<!--  <input type="text" class="form-control" placeholder="검색어를 입력해주세요."
				width="30%px"> <span class="input-group-btn"> 
				<button class="btn btn-outline-success" type="button">Go!</button>-->
			</span>
		</div>
	</div>

		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin: 5% 0 0 0">
			<div id="babo">   </div>
		</div>
		
		
<%-- 			<c:forEach items="${list}" var="f">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="${f.FAQ_NO}">
						<h4 class="panel-title">
							<a class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#c${f.FAQ_NO}"
								aria-expanded="false" aria-controls="c${f.FAQ_NO}"> Q.
								${f.FAQ_Q} </a>
						</h4>
					</div>
					<div id="c${f.FAQ_NO}" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="${f.FAQ_NO}">
						<div class="panel-body">${f.FAQ_A}</div>
					</div>
				</div>
			</c:forEach> --%>

			<br> <br> <br> <br> <br> <br>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>