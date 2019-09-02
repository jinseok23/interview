<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

 
<!-- 합쳐지고 최소화된 최신 CSS -->

<style>
	  
  	div .carousel-inner
  	{
  		height: 400px;
  	}
  
</style>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <section class="new_arrivals_area section-padding-0 clearfix">
        <div id="demo" class="carousel slide" data-ride="carousel" >

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    
  </ul>

  <!-- The slideshow -->
  <BR><BR><BR><BR>
  <div class="carousel-inner auto" style="height : 120%;">
    <div class="carousel-item active">
       <img src="${path}/resources/img/bg-img/gwanghwa.jpg" alt="Los Angeles" style = "width: 200%; height: 130%;">
    </div>
  <div class="carousel-item">
    <img src="${path}/resources/img/bg-img/munse.jpg" alt="Chicago" style = "width: 200%; height: 130%;">
  </div>

  <div class="carousel-item">
    <img src="${path}/resources/img/bg-img/matilda.jpg" alt="New York" style = "width: 200%; height: 130%;">
  </div>
  
  <div class="carousel-item">
    <img src="${path}/resources/img/bg-img/elizabeth.jpg" alt="New York" >
   
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
        
        
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center">
                        <br>
                        

                        <!-- <img src="${path}/resources/img/musical.jpg" align='center'/> -->

                    </div>
                </div>
            </div>
        </div>

     	   <div class="container">

            <h2 style="text-align: center">최신공연</h2>
            <div class="ticketTodayTitle"></div>
			
			
			<c:forEach items="${newestList }" var="n">
			
              <div class="col-lg-3 col-sm-6 portfolio-item" style="padding-bottom: 40px; padding-top: 30px;">
                <div class="card h-100">
                  <a href="${path }/performance/performanceView.do?no=${n.PERFORMNO}"><img class="card-img-top" src="${path}/resources/upload/info/${n.PERFORMNAME }/${n.REPOSTERIMG}" alt="" style='height : 310px;'></a>
                  <div class="card-body">
                    <h4 class="card-title">
                        <strong>
                                <a href="${path }/performance/performanceView.do?no=${n.PERFORMNO}"> 공연 이름 : ${n.PERFORMNAME }</a>
                        </strong>
                    </h4>
                    
                        <p class="card-text" style='font-size:12px;'> 
                           공연 기간 :  ${n.PERFORMDURATION } <br>
                            <strong style='font-size:15px;'>장소 이름 : ${n.PLACENAME }</strong>
                  </div>
                </div>
              </div>
              </c:forEach>



            </div>
 		
 			  <div class="container">

            <br><br> 
            <h2 style="text-align: center">추천공연</h2>
            <div class="ticketTodayTitle"></div>
			
			
			<c:forEach items="${recommendList }" var="p">
			
              <div class="col-lg-3 col-sm-6 portfolio-item" style="padding-bottom: 40px; padding-top: 30px;">
                <div class="card h-100">
                  <a href="${path }/performance/performanceView.do?no=${p.PERFORMNO}"><img class="card-img-top" src="${path}/resources/upload/info/${p.PERFORMNAME }/${p.REPOSTERIMG}" alt="" style='height : 310px;'></a>
                  <div class="card-body">
                    <h4 class="card-title">
                        <strong>
                             <a href="${path }/performance/performanceView.do?no=${p.PERFORMNO}"> 공연 이름 : ${p.PERFORMNAME }</a>
                        </strong>
                    </h4>
                    
                        <p class="card-text" style='font-size:12px;'> 
                           공연 기간 :  ${p.PERFORMDURATION } <br>
                            <strong style='font-size:15px;'>장소 이름 : ${p.PLACENAME }</strong>
                  </div>
                </div>
              </div>	
              </c:forEach>


            </div>
            

       </section>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>

