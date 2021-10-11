<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><dec:title default="Login"/></title>
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<script src="https://apis.google.com/js/api:client.js"></script>
<meta name="google-signin-client_id" content="10240492001-hbkj142i2pb79pfjl2d1vllje5fr4ict.apps.googleusercontent.com">
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<c:url value="/template/login/images/icons/favicon.ico"/>"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/login/vendor/bootstrap/css/bootstrap.min.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/login/fonts/iconic/css/material-design-iconic-font.min.css"/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/login/css/util.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/template/login/css/main.css"/>">
<!--===============================================================================================-->

</head>
<body>

	<dec:body/>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<c:url value="/template/register/js/main.js"/>"></script>	
</body>
</html>