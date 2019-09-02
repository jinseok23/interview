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
                              <h6 class="widget-title mb-30">예매관리</h6>
                              <!--  예매관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/reserveList">예매확인/취소</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                          <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">활동관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                          <a href="${path }/user/reviewManage">리뷰관리</a>
                                          <a href="${path }/help/consult.do">문의내역</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                           <!-- ##### Single Widget ##### -->
                          <div class="widget price mb-50">
                              <!-- Widget Title -->
                              <h6 class="widget-title mb-30">회원정보관리</h6>
                              <!--  활동관리  -->
                              <div class="catagories-menu">
                                  <ul id="menu-content2" class="menu-content collapse show">
                                      <!-- Single Item -->
                                      <li data-toggle="collapse" data-target="#clothing">
                                         <a href="${path }/user/consumerMyPage">회원정보수정</a>
                                          <a href="${path }/user/userDelete">회원탈퇴</a>
                                      </li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                  </div>