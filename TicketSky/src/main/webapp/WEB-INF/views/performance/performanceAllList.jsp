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
                        <h2>${category } </h2>
                        <br>
                        <div class="btn-group" role="group" aria-label="...">
                         	<button type="button" class="btn btn-default" onclick="fn_performAll()" >전체</button>
                         	<c:forEach items="${categoryList}" var="c">
                            	<button type="button" class="btn btn-default" onclick="fn_performSelect('${c.SUBCATEGORY}')" >${c.SUBCATEGORY }</button>
                            </c:forEach>
                        </div>
                        <br>
                        <br><br>
                        <!-- <img src="${path}/resources/img/musical.jpg" align='center'/> -->
                        <div id="demo" class="carousel slide" data-ride="carousel">

	                        <!-- Indicators -->
	                        <ul class="carousel-indicators">
	                          <li data-target="#demo" data-slide-to="0" class="active"></li>
	                          <li data-target="#demo" data-slide-to="1"></li>
	                          <li data-target="#demo" data-slide-to="2"></li>
	                        </ul>
	                      
	                        <!-- The slideshow -->
	                        <div class="carousel-inner">
	                          <div class="carousel-item active">
                          	  	<img src="${path}/resources/img/bg-img/matilda.jpg" alt="New York" style='height:100%;' />
	                          </div>
	                          <div class="carousel-item">
	                            <img src="${path}/resources/img/bg-img/elizabeth.jpg" alt="New York" style='height:100%;' />
	                          </div>
	                          <div class="carousel-item">
	                            <img src="${path}/resources/img/bg-img/gwanghwa.jpg" alt="Los Angeles" style = "height: 100%;">
	                          </div>
	                        </div>
	                        <!-- Left and right controls -->
	                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	                          <span class="carousel-control-prev-icon"></span>
	                        </a>
	                        <a class="carousel-control-next" href="#demo" data-slide="next">
	                          <span class="carousel-control-next-icon"></span>
	                        </a>
                    	</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <h3>공연순위</h3>
            <br>
            <!-- Page Heading -->
            <div class="row">
            <c:if test="${!empty rankList }">
	            <c:forEach items="${rankList}" var="r">
	            	 <div class="col-lg-3 col-sm-6 portfolio-item">
	                    <div class="card h-100">
	                      	<a href="${path }/performance/performanceView.do?no=${r.PERFORMNO}" style='text-decoration:none;'>
	                      		<img class="card-img-top" src="${path}/resources/upload/info/${r.PERFORMNAME }/${r.REPOSTERIMG}" alt="" style='height : 310px;'>
                      		</a>
	                      <div class="card-body">
	                        <h4 class="card-title">
	                            <strong>
	                                <a href="${path }/performance/performanceView.do?no=${r.PERFORMNO}">${r.PERFORMNAME }</a>
	                            </strong>
	                            <span style='font-size : 13px; color:red;'>${r.AVGSCORE }점  <span style='font-size : 13px; color:black;'>/ 5점</span></span>
	                        </h4>
	                        <p class="card-text" style='font-size:12px;'> 
	                        	${r.PERFORMDURATION }
	                        <br>
	                            <strong style='font-size:15px;'>${r.PLACENAME }</strong>
	                        </p>
	                      </div>
	                    </div>
	                  </div>
	            </c:forEach>
            </c:if>
            <c:if test="${empty rankList }">
            	<c:forEach items="${allList}" var="l" begin='1' end='4'>
            	 <div class="col-lg-3 col-sm-6 portfolio-item">
                    <div class="card h-100">
                      <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}" style='text-decoration:none;'>
                      	<%-- <img class="card-img-top" src="${path}/resources/img/product-img/${l.ORICONTENTIMG}" alt="" style='height : 310px;'> --%>
                      	<img class="card-img-top" src="${path}/resources/upload/info/${l.PERFORMNAME }/${l.REPOSTERIMG}" alt="" style='height : 310px;'>
                      </a>
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}">${l.PERFORMNAME }</a>
                            </strong>
                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                            ${l.PERFORMDURATION }
                            <br>
                            <strong style='font-size:15px;'>${l.PLACENAME }</strong>
                        </p>
                      </div>
                    </div>
                  </div>
                  
            </c:forEach>
            </c:if>
            </div>
        </div>
        <div class="container">
            <br><br>
            <h3>전체</h3>
            <br>
            <!-- Page Heading -->
            <div class="row">
                <c:forEach items="${allList}" var="l">
            	 <div class="col-lg-3 col-sm-6 portfolio-item" style='padding-bottom:30px;'>
                    <div class="card h-100">
                      <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}" style='text-decoration:none;'>
                      	<img class="card-img-top" src="${path}/resources/upload/info/${l.PERFORMNAME }/${l.REPOSTERIMG}" alt="" style='height : 310px;'>
                   	  </a>
                      <div class="card-body">
                        <h4 class="card-title">
                            <strong>
                                <a href="${path }/performance/performanceView.do?no=${l.PERFORMNO}">${l.PERFORMNAME }</a>
                            </strong>
                        </h4>
                        <p class="card-text" style='font-size:12px;'> 
                            ${l.PERFORMDURATION }
                            <br>
                            <strong style='font-size:15px;'>${l.PLACENAME }</strong>
                        </p>
                      </div>
                    </div>
                  </div>
            </c:forEach>
            </div>
        </div>
        <br><br>
       </section>
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>