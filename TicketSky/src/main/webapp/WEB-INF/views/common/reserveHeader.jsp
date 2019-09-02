<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set value="<%=request.getContextPath()%>" var="path"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>TICKET SKY 예매</title>

<!-- Favicon  -->
<link rel="icon" href="${path }/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="${path }/resources/css/core-style.css"/>
<link rel="stylesheet" href="${path }/resources/css/classy-nav.min.css"/> 
<link rel="stylesheet" href="${path }/resources/css/info.css"/>
<link rel="stylesheet" href="${path }/resources/css/reserve.css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 


<script src="${path }/resources/js/reserve/jquery-ui.js"></script>
<%-- <script src="${path }/resources/js/reserve/reserve.js"></script>
 --%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Bootstrap js -->
<script src="${path }/resources/js/bootstrap.min.js"></script>
</head>

<body>
    <!-- ##### Header Area Start ##### -->
<header class="header_area">

    <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
        <!-- Classy Menu -->
       <nav class="classy-navbar" id="essenceNav">
           <!-- Logo -->
           <img src="${path }/resources/img/core-img/KakaoTalk_20180823_202728608.png" alt="">
           <!-- Navbar Toggler -->
           <div class="classy-navbar-toggler">
               <span class="navbarToggler"><span></span><span></span><span></span></span>
           </div>
		</nav>
	</div>
           
</header>


