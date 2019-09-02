<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="<%=request.getContextPath()%>"/>

<style>
     ul li{
           list-style: none;
           display: inline-block;
           text-align: center;
       } 
   #quick_menu {
       background: url(/img/common/quick_bg1.png);
       background-repeat: no-repeat;
       background-size: 100% 544px;
       position: absolute;
       width: 95px;
       height: 544px;
       top: 105px;
       right: 10px;
       z-index: 9999;
   }
   .imgsize{
       width:80px;
       height:80px;
   
   }
   h3{
       text-align:justify;
   }
   .title{
       margin:0 0 0 15%;
   } 
   
   .btn-default
   {
       background-color: white;
       margin:2% 0 0 35%;
   }
   .btn-outline-success
   {
        /* border:none; */
   }
   .menuevt{
       color: black;
   }
   .menuevt:hover{
        opacity: 0.5;
    }
    .btn-default:hover{

    }
    .pagenum
    {
        font-size:30px;
    }
    .table-striped
    {
        font-size:14px;
    }
    .btn-outline-success
    {
        
    }
/*     h2{
        margin: 10% 0 0 25%;
    } */
    .headtitle
    {
     	margin: 10% 0 0 35%; 
  	}
  	.headtitleother
  	{
  		margin: 10% 0 0 30%;
  	}
   </style>
    <div class="row">
        <img src="${path}/resources/img/help-img/main.jpg" width="100%">
        </div>
    <div class="row">
            <div class="col-6 col-lg-4">
              <h2 class="headtitle" style="margin:10% 0 0 35%">공지사항</h2>
              <p class="title">사이트를 이용하시기전에 공지사항을 확인해보세요.</p>
              <a href="${path}/help/noticeHome.do"><button class="btn btn-default"><img src="${path}/resources/img/help-img/bullhorn-solid.svg" class="imgsize" style="margin:5% 0 0 0"/></a></button>              
            </div><!--/span-->
            <div class="col-6 col-lg-4">
              <h2 class="headtitle" style="margin:10% 0 0 39%">1:1 문의</h2>
            <p class="title" style="margin:0 0 0 23%">빠르고 간편한 온라인 1:1 문의를 이용해 보세요.
                </p>
            <a href="${path}/help/consult.do"><button class="btn btn-default"><img src="${path}/resources/img/help-img/assistive-listening-systems-solid.svg" class="imgsize" style="margin:0 0 0 20%"/></a></button>              
        </div><!--/span-->
            <div class="col-6 col-lg-4">
              <h2 class="headtitle">FAQ 보기</h2>
              <p class="title" style="margin:0 0 0 23%">궁금한 질문들을 쉽고 편하게 알아보세요.</p>
              <a href="${path}/help/faqHome.do"><button class="btn btn-default"><img src="${path}/resources/img/help-img/file-alt-solid.svg" class="imgsize" style="margin:0 0 0 25%"/></a></button>              
            </div><!--/span-->
            <div class="col-6 col-lg-4">
            <h2 class="headtitle">예매 도움</h2>
            <p class="title">예매 안내를 통해서 편리한 예매방법을 알아보세요.</p>
            <a href="${path}/help/ticketHelp.do"><button class="btn btn-default"><img src="${path }/resources/img/help-img/hands-helping-solid.svg" class="imgsize" style="margin:5% 0 0 0"/></a></button>              
        </div><!--/span-->
            <div class="col-6 col-lg-4">
              <h2 class="headtitle">취소 / 환불</h2>
              <p class="title" style="margin:0 0 0 23%">예매 취소 또는 환불 규정에 대해 알아보세요.</p>
              <a href="${path}/help/ticketCancel.do"><button class="btn btn-default"><img src="${path }/resources/img/help-img/redo-solid.svg" class="imgsize" style="margin:0 0 0 20%"/></a></button>              
            </div><!--/span-->
            <div class="col-6 col-lg-4">
              <h2 class="headtitleother">티켓 수령 안내</h2>
              <p class="title" style="margin:0 0 0 30%">티켓 수령 방법에 대해 알아보세요.</p>
              <a href="${path}/help/performInfo"><button class="btn btn-default"><img src="${path }/resources/img/help-img/plane-departure-solid.svg" class="imgsize" style="margin:0 0 0 20%"/></a></button>              
            </div><!--/span-->
          </div><!--/row-->
          
          <input type="hidden" value="${memberLoggedIn.userId}" id="userId"/>
<br>