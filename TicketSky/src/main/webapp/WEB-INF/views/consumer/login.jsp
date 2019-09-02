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
    <title>로그인</title>

    <!-- bootstrap -->
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


</head>




<body>
  <div class="container">
    <div class="login-form">
        <form id="loginForm" action="${path }/user/memberLogin.do" method="post">
        <input id="snsLoginChk" type="hidden" name="snsLoginChk">
            <h2 class="text-center">로그인</h2>
            <div class="form-group">
            	<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input id="userId" type="text" class="form-control" name="userId" placeholder="Username" required="required" value="${cookie.id.value }">
                </div>
            </div>
    		<div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input id="password" type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary login-btn btn-block">로그인</button>
            </div>
            <div class="clearfix">
                <label  class="pull-left checkbox-inline"><input id="saveId" type="checkbox" name="saveId" value="1"<c:if test="${cookie.saveId.value ne null }">checked</c:if>> 아이디 저장</label>
                <a herf="#" onclick="fn_forgetPassword();" class="pull-right">아이디/비밀번호 찾기</a>
            </div>
    		<!-- <div class="or-seperator"><i>or</i></div> -->
            <br>
            <!-- <p class="text-center">소셜 로그인</p> -->
            <div class="text-center social-btn">
    			<a id="kakao-login-btn"></a>
				<a href="http://developers.kakao.com/logout"></a>
            </div>
            <div style="text-align:center;" >
			<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true" onlogin="fbLogin();"></div>
			</div>
            <div id="fb-root"></div>
        </form>
        <form id="myForm" name="myForm" action="${path}/user/consumerEnroll" method="POST">
            	<input id="snsLogin" type="hidden" name="snsLogin" value=""/>
				<input id="snsUserId" type="hidden" name="userId" value="" />
				<input id="snsUserName" type="hidden" name="userName" value="" />
		</form>
        <p style="margin-top:3px;" class="text-center text-muted small">Ticket Sky 계정이 없으신가요? <a herf="#" onclick="fn_con_enroll();">구매자 회원가입</a></p>
        <p class="text-center text-muted small">Ticket Sky 계정이 없으신가요? <a herf="#" onclick="fn_sel_enroll();">판매자 회원가입</a></p>
        
    </div>
  </div>

<script type="text/javascript">
function a(){
	 FB.api('/me',function(response) {
	    console.log(JSON.stringify(response));
	});
}
  function fn_con_enroll(){
    window.open('${path}/user/consumerEnroll');
    window.close();
  }
  
  function fn_sel_enroll(){
	window.open('${path}/user/sellerEnroll');
	window.close();
  }

  function fn_forgetPassword(){
    window.open('${path}/user/forgetPassword', '_blank', 'width=400 height=480');
    window.close();
  }
</script>
<script>

function fbLogin() {
	// 로그인 여부 체크
	snslogin();
}
function snslogin(){
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
		        console.log("gd"+JSON.stringify(response));
		    });
			
			FB.api('/me', function(res) {
				// 제일 마지막에 실행
				console.log("Success Login : " + res.name);
				console.log("Success Login : " + res.id);
				// alert("Success Login : " + response.name);
				
				
				if(enrollchk(res.id) == true){ // 회원정보가 없음
					$('#snsLogin').val("1");
					$('#snsUserId').val(res.id);
					$('#snsUserName').val(res.name);
					window.opener.name = "parentPage"; // 부모창의 이름 설정
				    document.myForm.target = window.opener.name; // 타켓을 부모창으로 설정
				    document.myForm.action = "${path}/user/consumerEnroll";
				    $("#myForm").submit();
					self.close(); 
				}else{ // 회원정보가 있음
				 	
					$('#userId').val(res.id);
					$("#snsLoginChk").val('1');
					$('#saveId').prop("checked",false);
					$('#loginForm').submit(); 
				}
			});
		} else if (response.status === 'not_authorized') {
			// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
		} else {
			// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
		}
	}, true); // 중복실행방지
}

	
	window.fbAsyncInit = function() {
	    FB.init({
	        appId : '{258880038085261}',
	        cookie : true,
	        xfbml : true,
	        version : 'v3.1'
	    });
	
	    snslogin();
	};

	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.1&appId=258880038085261&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

			
			</script>
<!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${path }/resources/js/jquery/jquery-2.2.4.min.js"></script>


	<script>
	function enrollchk(id){ // TS 가입체크
		var inputUserId=id;
		var re;
		$.ajax({
			url:"${pageContext.request.contextPath}/user/checkDuplicate.do",
			data:{userId:inputUserId}, //키 밸류 값으로 보내서
			dataType:"json",
			async: false,
			success:function(data) // .flag는 jsonView방식?
			{
				
				if(data.flag==false) // 회원가입 가능
				{
					re = true;
				}
				else // 회원가입 불가
				{
					re= false;
				}
			},
			error:function(xhr, status, errormsg)
			{
				console.log(xhr);
				console.log(status);
				console.log(errormsg);
			}
		});
		return re;
	};
	</script>
</body>

</html>
