    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <c:set var="path" value="<%=request.getContextPath()%>"/>

    <jsp:include page = "/WEB-INF/views/common/header.jsp"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    
    <style>
    
    div .container
    {
        padding-left : 50px;
        padding-right : 50px;  
        border: 2px solid red;
        background-color: black;
    }
    
    div .inner
    {
        padding-left : 60px;
        padding-right : 60px;
                padding-bottom: 50px;
        
    }
    
    td img
    {
        width : 100px;
        height : 150px;
    }
    table td.tdpadding
    {
        padding-top: 6%;
    }
    
    ul 
    {
        margin:0;
        padding:0;
        color : black;
    }

    li 
    {
        margin: 0 0 0 0;
        padding: 0 0 0 0;
        border : 0;
        display: inline-block;
        text-align: center;
    }
    
    </style>
    


    <div class="container" > 

                <nav class="classy-navbar" id="essenceNav" style="padding-left: 75px; ">
                    <!-- Logo -->
                    <a class="nav-brand" href="${path }"><img src="${path }/resources/img/core-img/KakaoTalk_20180823_202728608.png" alt=""></a>
                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler">
                    </div>
                    
                    <!-- Menu -->
                    <div class="classy-menu" >
                        <!-- close btn -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>
                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                        <li><a href="${path }/ranking/ranking.do" style ="width: 120px; height: 30px; color: gray; font-size: 16px;"> 전체 </a></li>
                        <li><a href="${path }/ranking/ranking.do?category=뮤지컬" style ="width: 120px; height: 30px; color: gray; font-size: 16px;"> 뮤지컬 </a></li>
                        <li><a href="${path }/ranking/ranking.do?category=연극" style ="width: 120px; height: 30px; color: gray; font-size: 16px;"> 연극 </a></li>
                        <li><a href="${path }/ranking/ranking.do?category=콘서트" style ="width: 120px; height: 30px; color: gray; font-size: 16px;"> 콘서트</a></li>
                        <li><a href="${path }/ranking/ranking.do?category=클래식/무용" style ="width: 120px; height: 30px; color: gray; font-size: 16px;"> 클래식/무용  </a></li>                            
                            </ul>
                        </div>
                        
                        <!-- Nav End -->
                    </div>
                </nav> <br><br>
                
        
        
        
    <div class="inner">   
    
    <table class="table" style="text-align: center;">
        <thead class="thead-dark">
        <tr>
            <th scope="col"> 순위 </th>
                <th scope="col">  </th>
            <th scope="col"> 공연명 </th>
            <th scope="col"> 평점 </th>
            <th scope="col"> 공연기간 </th>
            <th scope="col"> 장소 </th>
            <th scope="col"> 예매하기 </th>
        </tr>
        </thead>
        
        <tbody>
        <!-- 
        <tr>
            <th class="tdpadding" >1</th>
            <td><img src="http://image.toast.com/aaaaab/ticketlink/TKL_3/thanks_main0620.jpg"></td>
                <td class="tdpadding">Mark</td>
            <td class="tdpadding">9.62 %</td>
            <td class="tdpadding">2018.08.01 ~ 2018.10.28</td>
            <td class="tdpadding">대학로 아트원씨어터2관</td>         
            <td class="tdpadding"><button type="button" class="btn btn-success">Success</button></td>         
        </tr>
        
    -->
            <c:forEach items="${list }" var="p">
            <tr>
            
            <th scope="row"> <br><br><br> ${p.RNUM} </th>
            <td><img src="${path}/resources/upload/info/${p.PERFORMNAME }/${p.REPOSTERIMG}"></td>
                <td class="tdpadding">${p.MAJORCATEGORY } <br> ${p.PERFORMNAME} </td>
            <td class="tdpadding"><br>${p.SCORE }</td>
            <td class="tdpadding"><br> 공연기간 : ${p.PERFORMDURATION} </td>
            <td class="tdpadding"><br>${p.PLACENAME }</td>         
            <td class="tdpadding"><a href="${path}/performance/performanceView.do?no=${p.PERFORMNO}" style="color : black;"><br>상세보기 </a></td>         
        </tr>
            </c:forEach>
            
        </tbody>
    </table>
    </div> <!-- inner -->
    </div>

    <jsp:include page = "/WEB-INF/views/common/footer.jsp"/>