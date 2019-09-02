<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<c:set value="${pageContext.request.contextPath}" var="path"/>

<style media="screen">
      #enrollform{
        font-size: 1.1em;
      }
      #enrollform input::placeholder{
        font-size: 1.2em;
      }

      .shop_sidebar_area a{
        color : gray;
      }

      .myInfo{
        height: 400px;
      }

      .tableTL a{
        color:black;
      }
      .tableTL a:hover{
        color:gray;
      }

      .tableTL{
        width: 100%;
      }
      .tbodyrow{
        max-height: 400px;

        overflow: auto;
      }

    </style>
 <section class="new_arrivals_area clearfix" style="padding-top:80px;">
<!-- ##### Shop Grid Area Start ##### -->
          <div class="container">
              <div class="row">
                  <div class="col-12 col-md-4 col-lg-3">
                      <div class="shop_sidebar_area">
                          <!-- ##### Single Widget ##### -->
                          <div class="widget catagory mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">통계</h6>
                              <!--  예매관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/sellerStatus">판매 통계</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">공연 관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/sellerMyPlayList">내 공연</a>
                                          <a href="${path }/info/insertInfo">공연 등록</a>
                                          <!-- <a href="#">공연 삭제</a> -->
                                      </li>
                                  </ul>
                              </div>
                          </div>
                           <!-- ##### Single Widget ##### -->
                           <%-- <!-- 
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">문의 관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/sellerReviewManage">리뷰 관리</a>
                                          <a href="${path }/user/sellerInquiryManage">문의 관리</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          --> --%>
                          <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">회원정보관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/sellerUpdate">회원정보수정</a>
                                          <a href="${path }/user/userDelete">회원탈퇴</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>

                      </div>
                  </div>