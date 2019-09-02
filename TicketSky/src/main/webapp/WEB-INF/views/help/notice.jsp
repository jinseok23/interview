<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<link rel="stylesheet" href="${path }/resources/help/tabform.css"/>

<script>
function fn_noticeAdmin()
{	
	location.href='${pageContext.request.contextPath}/help/noticeAdmin.do';
}
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
</script>

<style>
	a{
		color:blue;
	}
section
{
	width:800px;
}
</style>
<br>
<br>
<br>
<hr>
<h2 style="text-align: center">공지사항</h2>
<hr>
<br>
<div>
<p style="margin:0 0 0 10%"><img src="${path}/resources/img/help-img/mark.png"/>총${totalContents}건의 게시물이 있습니다.</p>
</div>
<div class="main">
    <input id="tab1" type="radio" name="tabs" checked value="0" onclick="fn_notice();"> <!--디폴트 메뉴-->
    <label for="tab1">전체</label>

    <input id="tab2" type="radio" name="tabs" value="1" onclick="fn_notice();">
    <label for="tab2">티켓오픈</label>

    <input id="tab3" type="radio" name="tabs" value="2" onclick="fn_notice();">
    <label for="tab3">변경/취소</label>

    <input id="tab4" type="radio" name="tabs" value="3" onclick="fn_notice();">
    <label for="tab4">기타</label>

    <section id="content1" >
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>예매오픈일</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n0"></tbody>
        </table>
        <div id="page0"></div>
    </section>

    <section id="content2">
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>예매오픈일</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n1"></tbody>
        </table>
        <div id="page1"></div>
    </section>

    <section id="content3">
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n2"></tbody>
        </table>
        <div id="page2"></div>
    </section>

    <section id="content4">
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n3"></tbody>
        </table>
        <div id="page3"></div>
    </section>
<c:if test="${memberLoggedIn!=null && memberLoggedIn.userId=='admin'}">
<button class="btn btn-outline-success my-2 my-sm-0" type="button" style="margin:0 0 0 100%" onclick="fn_noticeAdmin()">글쓰기</button>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>

 	$(function(){
		fn_notice(1);
	});
	
	function fn_notice(cPage){
		// tab을 눌렀을때 값을 가져옴
		var cateNo = $('input[name="tabs"]:checked').val();
		$.ajax({
			type:"get",
			//데이터를 가져오게 될 맵핑주소
			url:"${path}/help/noticeView.do",
			datatype:"json",
			//위 맵핑주소에 cateNo와 cPage를 보내줌
			data:{cateNo:cateNo,cPage:cPage},
			//맵핑주소에서 jsonArr.add로 담아온 데이터(list,pageBar가 data로 담겨서 옴)
			success:function(data){
				console.log(data);
				//view 변수를 만들어서 하나씩 추가할 예정
				var view="";
				//console.log를 찍었을때 data[1]에 pagebar가 담겨있음
				var page=data[1];
				//조건 data가 null 아닐때의 조건(for문을 이용해서 data에 담긴 값을 불러옴)
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						view+="<tr>";
						view+="<td>"+data[0][i].CATENAME+"</td>";
						view+="<td><a href='${path}/help/noticeForm.do?no="+data[0][i].NOTICENO+"'>"+data[0][i].TITLE+"</a></td>";
						//cateNo가 0이면 전체, 1이면 티켓오픈
						if(cateNo==0 || cateNo==1) {
							//cateNo가 1이면 예메오픈일에 opendate(예매오픈일)을 불러옴
							if(data[0][i].CATENO==1)
								view+="<td>"+data[0][i].OPENDATE+"</td>";
							//cateNo가 1이 아니면 공백처리
							else
							view+="<td></td>";
						}
						view+="<td>"+data[0][i].NDATE+"</td>";
						view+="<td>"+data[0][i].COUNT+"</td>";
						view+="</tr>";
					}
				}
				//tbody에 html형식으로 위에 구문을 출력해줌
				if(cateNo==0) $('#n0').html(view);
				else if(cateNo==1) $('#n1').html(view);
				else if(cateNo==2) $('#n2').html(view);
				else if(cateNo==3) $('#n3').html(view);
				$('#page0').html(page);
				$('#page1').html(page);
				$('#page2').html(page);
				$('#page3').html(page);
			},
			error:function(xhr,Status,error){
	            console.log("notice ajax 실패 : "+xhr+" "+Status+" "+error);
			}
		});
	} 
</script>
