<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>비밀번호 찾기</title>

    <!-- bootstrap -->
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">



</head>




<body>
  <div class="container">
    <div class="login-form">
    <div class="row" style="padding-left: 3%; ">
          <h4 style="margin-bottom:0;">회원탈퇴</h4>
        </div>
        <hr>
        <form action="${path }/user/userDelete.do" method="post">
        <c:if test="${snsLoginChk eq '0' }">
  		      <div class="form-group">
              <div class="">
              	<label>비밀번호 확인</label>
                <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요." required="required" >
              </div>
            </div>
        </c:if>
        <c:if test="${snsLoginChk eq '1' }">
  		      <div class="form-group">
              <div class="">
              	<label>탈퇴를 하면 데이터가 삭제됩니다.</label>
              	<label>확인을 누르면 탈퇴가 완료됩니다.</label>
              </div>
            </div>
        </c:if>
            <div class="form-group">
              <button type="submit" class="btn btn-danger login-btn btn-block">확인</button>
            </div>
          </form>
        </div>
  </div>


</body>

</html>
