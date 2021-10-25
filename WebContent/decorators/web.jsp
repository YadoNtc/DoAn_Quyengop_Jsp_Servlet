<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <base href="/com.doan.quyengop/" /> -->
<title><dec:title default="Trang chủ"/></title>
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/template/web/image/xfavicon.jpg"/>">

<link rel="stylesheet" href="<c:url value="/template/web/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/template/web/css/chitiet.css"/>">
<link rel="stylesheet" href="<c:url value="/template/web/css/donate.css"/>">
<link rel="stylesheet" href="<c:url value="/template/web/css/aboutus.css"/>">
<link rel="stylesheet" href="<c:url value="/template/web/css/profile.css"/>">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css"> 
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>

<%@ include file="/common/web/header.jsp" %>

<dec:body/>

<%@ include file="/common/web/footer.jsp" %>


	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script> -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
   	
 <script type="text/javascript">
        $('.carousel').carousel({
            interval: 1500
        });
        $(document).ready(function() {
            $("#news-slider").owlCarousel({
                items: 2,
                itemsDesktop: [1199, 2],
                itemsDesktopSmall: [980, 2],
                itemsMobile: [700, 1],
                pagination: false,
                navigation: true,
                navigationText: ["<i class='fal fa-arrow-alt-left'></i>", "<i class='fal fa-arrow-alt-right'></i>"],
                autoPlay: true
            });
        });
    </script>
</body>
</html>