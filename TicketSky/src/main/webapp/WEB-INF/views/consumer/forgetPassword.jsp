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
        <form action="${pageContext.request.contextPath}/user/findId" method="post">
            <h4 class="text-left">아이디 찾기</h4>
            <hr>
            <div class="form-group">
               <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="userName" placeholder="이름 (ex. 홍길동)" required="required">
              </div>
            </div>
              <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                <input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요." required="required">
              </div>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary login-btn btn-block"> 아이디 찾기 </button>
            </div>
          </form>
          
          
          <br>
          
          
          <form class="" action="${path }/user/findPassword" method="post">
            <h4 class="text-left">비밀번호 찾기</h4>
            <hr>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="userId" placeholder="아이디" required="required">
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="userName" placeholder="이름" required="required">
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                <input type="email" class="form-control" name="email" placeholder="이메일을 입력하세요." required="required">
              </div>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-primary login-btn btn-block">인증번호 받기</button>
            </div>
          </form>
        </div>
  </div>

<script type="text/javascript">
  function fn_enroll(){
    window.open('enroll.html');
    window.close();
  }
</script>


</body>

</html>