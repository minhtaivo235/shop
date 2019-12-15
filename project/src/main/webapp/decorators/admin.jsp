<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value='/template/admin/css/sb-admin-2.min.css'/>" rel="stylesheet">
  	<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js'/>"></script>

</head>
<body id="page-top">
	<div id="wrapper">
		<!-- menu -->
    	<%@ include file="/common/admin/menu.jsp" %>
    	<!-- menu -->
    	
    	<!-- Content Wrapper -->
    	<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
    	
				<!-- header -->
			    <%@ include file="/common/admin/header.jsp" %>
			    <!-- header -->
			
		
			<div>
	    	<dec:body/>
	    	</div>
	    	</div>
			
		<!-- footer -->
    	<%@ include file="/common/admin/footer.jsp" %>
    	<!-- footer -->
    	</div>
  	</div>
    	
    	
	

  <script src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/template/admin/js/sb-admin-2.min.js'/>"></script>
	
	
</body>
</html>