<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/> 
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<!-- git -->
<style>
   
   div .card
   {
     display : inline-block;
     margin-right: 20px;
     margin-bottom: 10px;
   }
   div .ticketTitle
   {
         padding-bottom: 10px;
   }

</style>

<div id="demo" class="carousel slide" data-ride="carousel" style="margin-bottom: 50px; margin-left: 80px; margin-right: 80px;">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner auto" >
    <div class="carousel-item active">
      <img src="https://www.w3schools.com/bootstrap4/la.jpg" alt="Los Angeles" style = "width: 200%;">
    </div>
    <div class="carousel-item">
      <img src="https://www.w3schools.com/bootstrap4/la.jpg" alt="Chicago" style = "width: 200%;">
    </div>
    <div class="carousel-item">
      <img src="https://www.w3schools.com/bootstrap4/la.jpg" alt="New York" style = "width: 200%;">
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
   <div class="ticketTitle auto">
   	<h3 style="text-align: center;"> Best 공연 및 전시 </h3><hr>
   </div>
   
  <div class="card" style="width:228px; height: 400px; margin-left : 60px;">
    <a href="http://google.com"> <img class="card-img-top" src="http://img.tf.co.kr/article/home/2015/02/21/201523051424447106.jpg" alt="Card image" style="width:100%; "> </a>
    <div class="card-body">
      <p class="card-title" style="text-align: center; font-weight: bold;">공연 제목 </p>
     <p class="card-text" style="text-align: center"> 2018.09.03 ~ 2018.09.04</p>      
    </div>
  </div>
  
  <div class="card" style="width:228px; height: 400px;">
    <a><img class="card-img-top" src="http://img.tf.co.kr/article/home/2015/02/21/201523051424447106.jpg" alt="Card image" style="width:100%"></a>
    <div class="card-body">
      <p class="card-title" style="text-align: center; font-weight: bold;">공연 제목 </p>
      <p class="card-text" style="text-align: center"> 2018.09.03 ~ 2018.09.04</p>
    </div>
  </div>

  <div class="card" style="width:228px; height: 400px;">
    <a><img class="card-img-top" src="http://img.tf.co.kr/article/home/2015/02/21/201523051424447106.jpg" alt="Card image" style="width:100%"></a>
    <div class="card-body">
      <p class="card-title" style="text-align: center; font-weight: bold;">공연 제목 </p>
      <p class="card-text" style="text-align: center"> 2018.09.03 ~ 2018.09.04</p>
      
    </div>
  </div>

  <div class="card" style="width:228px; height: 400px;">
    <a><img class="card-img-top" src="http://img.tf.co.kr/article/home/2015/02/21/201523051424447106.jpg" alt="Card image" style="width:100%"></a>
    <div class="card-body">
      <p class="card-title" style="text-align: center; font-weight: bold;">공연 제목 </p>
      <p class="card-text" style="text-align: center"> 2018.09.03 ~ 2018.09.04</p>
      
    </div>
  </div>
  
  <div class="card" style="width:228px; height: 400px; margin-left : 60px;">
    <a><img class="card-img-top" src="http://img.tf.co.kr/article/home/2015/02/21/201523051424447106.jpg" alt="Card image" style="width:100%; "></a>
    <div class="card-body">
      <p class="card-title" style="text-align: center; font-weight: bold;">공연 제목 </p>
     <p class="card-text" style="text-align: center"> 2018.09.03 ~ 2018.09.04</p>      
    </div>
  </div>
  
</div>


<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>