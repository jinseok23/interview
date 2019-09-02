<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<c:set var="path" value="<%=request.getContextPath()%>"/>

<script>
	if("${msg}" != "로그인 성공"){
		alert("${msg}");
	}
	if("${userChk}" == "C"){
		self.close();
		opener.location.href="${path}/user/consumerMyPage";
	}else if("${userChk}" == "S"){
		self.close();
		opener.location.href="${path}/user/sellerStatus";
	}else if("${userChk}" == "A"){
		self.close();
		opener.location.href="${path}/user/consumerList";
	}
	
	if("${deleteChk}" == "1"){
		self.close();
		opener.location.href="${path}${loc}";
	}

	location.href="${path}${loc}";
	
	
</script>