<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url value="/template/web/static" var="url"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <!-- css -->    
    
    <link rel="stylesheet" href="${url}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${url}/css/animate.css">
    
    <link rel="stylesheet" href="${url}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${url}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${url}/css/magnific-popup.css">

    <link rel="stylesheet" href="${url}/css/aos.css">

    <link rel="stylesheet" href="${url}/css/ionicons.min.css">

    <link rel="stylesheet" href="${url}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${url}/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${url}/css/flaticon.css">
    <link rel="stylesheet" href="${url}/css/icomoon.css">
    <link rel="stylesheet" href="${url}/css/style.css">
    
</head>
<body>
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <div>
    	<dec:body/>
    </div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->		
    
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${url}/js/jquery.min.js"></script>
  <script src="${url}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${url}/js/popper.min.js"></script>
  <script src="${url}/js/bootstrap.min.js"></script>
  <script src="${url}/js/jquery.easing.1.3.js"></script>
  <script src="${url}/js/jquery.waypoints.min.js"></script>
  <script src="${url}/js/jquery.stellar.min.js"></script>
  <script src="${url}/js/owl.carousel.min.js"></script>
  <script src="${url}/js/jquery.magnific-popup.min.js"></script>
  <script src="${url}/js/aos.js"></script>
  <script src="${url}/js/jquery.animateNumber.min.js"></script>
  <script src="${url}/js/bootstrap-datepicker.js"></script>
  <script src="${url}/js/scrollax.min.js"></script>
  <script src="${url}/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${url}/js/google-map.js"></script>
  <script src="${url}/js/main.js"></script>
	
</body>
</html>