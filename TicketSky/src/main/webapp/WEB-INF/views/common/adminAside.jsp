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
                              <h6 class="widget-title mb-30">회원 관리</h6>
                              <!--  예매관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/sellerList">공연주 관리</a>
                                          <a href="${path }/user/consumerList">회원 관리</a>
<%--                                           <a href="${path }/user/consumerRatingSetting">회원 등급 관리</a>
 --%>                                      </li>
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
                                          <a href="${path }/user/adminPlayConfirm">공연 컨펌</a>
                                          <a href="${path }/user/adminPlayManage">공연 관리</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                           
                          <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">게시물 관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/adminReportBoard">신고 게시물</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">문의 관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/help/consult.do">문의 관리</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">내 정보</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/sellerUpdate">내 정보 수정</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>

                      </div>
                  </div>