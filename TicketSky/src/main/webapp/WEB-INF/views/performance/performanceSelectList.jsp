<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
	
	

	<script>
	function fn_performSelect(a)
	{
		
		location.href = '${path}/performance/performanceSelectList.do?category=${category}&subCategory='+a;
	}
	
	function fn_performAll()
	{
		location.href='${path}/performance/performanceAllList.do?category=${category}';
	}
	</script>
	<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <section class="new_arrivals_area section-padding-80 clearfix">
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <br>
                        <h2> ${category }</h2>
                        <br>
                        <div class="btn-group" role="group" aria-label="...">
                         	<button type="button" class="btn btn-default" onclick="fn_performAll()" >전체</button>
                         	<c:forEach items="${categoryList}" var="c">
                            	<button type="button" class="btn btn-default" onclick="fn_performSelect('${c.SUBCATEGORY}')" >${c.SUBCATEGORY }</button>
                            </c:forEach>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
                <p class="location_path" id="d2_path">
                    <a>티켓스카이 홈</a> &#62;
                    <a>공연</a> &#62;
                    <a>${category }</a> &#62;
                    <a class="lastCategoryName">${subCategory }</a>
                </p>
            <br>
            <!-- Page Heading -->
            <div class="row">
              
              <c:forEach items="${selectList}" var="s">
                <div class="col-lg-3 col-sm-6 portfolio-item"style='padding-bottom:30px;'>
                    <div class="card h-100">
                      <a href="${path }/performance/performanceView.do?no=${s.PERFORMNO}" style='text-decoration:none;'>
                   		<img class="card-img-top" src="${path}/resources/upload/info/${s.PERFORMNAME }/${s.REPOSTERIMG}" alt="" style='height : 310px;'>
                      </a>
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="${path }/performance/performanceView.do?no=${s.PERFORMNO}">${s.PERFORMNAME }</a>
                            </strong>
                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                        	${s.PERFORMDURATION }
                            <br>
                            <strong style='font-size:15px;'>${s.PLACENAME }</strong>
                        </p>
                      </div>
                    </div>
                  </div>
                 </c:forEach>
                
            </div>            
        </div>
        <br><br>
        
        <script>
			function fn_paging(cPage,numPerPage){
				location.href="${path}/performance/performanceSelectList.do?cPage="+cPage+"&category=${category}&subCategory=${subCategory}";
			}
        </script>
        
        <div id='pageBar1' align="center">
         	${pageBar }<br/>
         </div>        
       </section>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>