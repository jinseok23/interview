<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>TICKET SKY </title>

    <!-- Favicon  -->
    <%-- <link rel="icon" href="${path }/resources/img/core-img/favicon.ico"> --%>

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="${path }/resources/css/core-style.css"/>
    <link rel="stylesheet" href="${path }/resources/style.css"/>
<%-- 	<link rel="stylesheet" href="${path }/resources/classy-nav.min.css"/>
 --%>	
	<!-- jQuery -->

    
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
	function snslogout(){
					location.href="${path }/user/userlogout.do";
	}
	
	window.fbAsyncInit = function() {
	    FB.init({
	        appId : '{258880038085261}',
	        cookie : true,
	        xfbml : true,
	        version : 'v3.1'
	    });
	};
 	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.1&appId=258880038085261&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
	
</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="${path }/"><img src="${path }/resources/img/core-img/KakaoTalk_20180823_202728608.png" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="${path }/performance/performanceAllList.do?category=뮤지컬"> 뮤지컬 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=뮤지컬"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=오리지날/내한공연"> 오리지날/내한공연 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=라이선스"> 라이선스 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=창작뮤지컬"> 창작뮤지컬 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=뮤지컬&subCategory=넌버별퍼포먼스"> 넌버별퍼포먼스 </a></li>
                                </ul>
                            </li>
                            <li><a href="${path }/performance/performanceAllList.do?category=연극"> 연극 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=연극"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=로맨틱">로맨틱 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=코미디"> 코미디 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=드라마"> 드라마 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=연극&subCategory=스릴러"> 스릴러 </a></li>
                                </ul>
                            </li>
                            <li><a href="${path }/performance/performanceAllList.do?category=콘서트"> 콘서트 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=콘서트"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=발라드"> 발라드 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=락/메탈"> 락/메탈 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=랩/힙합"> 랩/힙합 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=내한공연"> 내한공연 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=페스티벌"> 페스티벌 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=콘서트&subCategory=기타"> 기타 </a></li>                                    
                                </ul>
                            </li>
                            <li><a href="${path }/performance/performanceAllList.do?category=클래식/무용"> 클래식/무용 </a>
                                <ul class="dropdown">
                                    <li><a href="${path }/performance/performanceAllList.do?category=클래식/무용"> 전체 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=클래식"> 클래식 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=오페라"> 오페라 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=발레/무용"> 발레/무용 </a></li>
                                    <li><a href="${path }/performance/performanceSelectList.do?category=클래식/무용&subCategory=국악"> 국악 </a></li>
                                </ul>
                            </li>
							
                            <li><a href="${path }/ranking/ranking.do" > 랭킹  </span></a></li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
			<script>
				function fn_search_validate()
				{
            	 	var searchForm = $("#searchForm");
					var searchContent = $('#headerSearch').val();
					var bool =false;
            		 $.ajax({
	                    type: 'post',
	                    url: "${path}/performance/performNameList.do",
	                    async : false,
	                    dataType: "json",
	                    success:function(data) {
                    		$.each(data.performNameList, function(i,item){
	                       		if(searchContent==item.PERFORMNAME)
	                   			{
	                       			bool = true;
	                   			}
               			 	});
                    	}
               		});
            		if(bool)
           			{
            			searchForm.attr("action","${path}/performance/searchPerformName?performName="+searchContent);
            			return true;
           			}
            		else
           			{
            			alert("검색된 공연이 없습니다.");
            			return false;
           			}
            		return false;
				}
            
			</script>
            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form id='searchForm' action="#" method="post" onsubmit="return fn_search_validate()">
                        <input type="search" name="search" id="headerSearch" placeholder="검색">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <link href="http://cdn.jsdelivr.net/xeicon/1.0.4/xeicon.min.css" rel="stylesheet">
                <!-- User Login Info -->
                <div class="user-login-info">
                <c:if test="${memberLoggedIn eq null }">
                    <a href="#" onclick="window.open('${path}/user/login', '_blank', 'width=400 height=350');">로그인</a>
				</c:if>
				<c:if test="${memberLoggedIn ne null }">
                    <a href="#" onclick="snslogout();">로그아웃</a>
				</c:if>
                </div>
                <!-- User Login Info -->
                <div class="user-login-info">
                <c:if test="${memberLoggedIn.separator eq 'C' }">
                    <a href="${path }/user/consumerMyPage">마이 페이지</a>
                </c:if>
                <c:if test="${memberLoggedIn.separator eq 'S' }">
                    <a href="${path }/user/sellerStatus">마이 페이지</a>
                </c:if>
                <c:if test="${memberLoggedIn.separator eq 'A' }">
                    <a href="${path }/user/consumerList">마이 페이지</a>
                </c:if>
                <c:if test="${memberLoggedIn.separator eq null }">
                    <a href="" onclick="window.open('${path}/user/login', '_blank', 'width=400 height=350');">마이 페이지</a>
                </c:if>
                
                    
                </div>
                <div class="user-login-info">
                      <a href="${path }/help/helpHome.do"><!--<img src="img/core-img/user.svg" alt="">--> 고객 센터</a>
                </div>
            </div>

        </div>

    </header>
    <%--<script src="${path}/resources/js/jquery/jquery.js"></script>
	<script src="${path}/resources/js/jquery/jquery-ui.js"></script> --%>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
 	    $( "#headerSearch" ).autocomplete({
 	        source : function( request, response ) {
 	             $.ajax({
 	                    type: 'post',
 	                    url: "${path}/performance/performAutocomplete.do",
 	                    dataType: "json",
 	                    //request.term = $("#autocomplete").val()
 	                    data: { value : request.term },
 	                    success:function(data) {
 	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
 	                        response(
 	                            $.map(data, function(item) {
 	                                return {
 	                                   // label: item.data,
 	                                    value: item.data//==[값,값,값,값]
 	                                }
 	                            })
 	                        );
 	                    }
 	               });
 	            }, 
 	        //조회를 위한 최소글자수
 	        minLength: 2,
 	        select: function( event, ui ) {
 	            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
 	        }
 	    });
 	    
     </script>
    <!-- ##### Header Area End ##### -->
    
