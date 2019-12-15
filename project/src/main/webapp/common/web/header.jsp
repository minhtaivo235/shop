<!-- Navigation -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
					    <c:if test="${not empty USERMODEL }">
					    	<span class="text icon-user">
						    	<a href="<c:url value=""/>" class="text mr-4">Welcom, ${USERMODEL.fullname}</a>
						    </span> 	
						    <span>					    
						    <a href="<c:url value="/thoat?action=logout"/>" class="text">Thoát</a>
						    </span>
					    </c:if>
					    <c:if test="${empty USERMODEL }">
						    <span class="text icon-user">
						    	<a href="<c:url value="/dang-nhap?action=login"/>" class="text"> SIGN UP</a>
						    </span>
						</c:if>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
	
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="index.html">Vegefoods</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="oi oi-menu"></span> Menu
     </button>

     <div class="collapse navbar-collapse" id="ftco-nav">
       <ul class="navbar-nav ml-auto">
         <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
         <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
            <div class="dropdown-menu" aria-labelledby="dropdown04">
            	<a class="dropdown-item" href="shop.html">Shop</a>
            	<a class="dropdown-item" href="wishlist.html">Wishlist</a>
              <a class="dropdown-item" href="product-single.html">Single Product</a>
              <a class="dropdown-item" href="cart.html">Cart</a>
              <a class="dropdown-item" href="checkout.html">Checkout</a>
            </div>
          </li>
         <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
         <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
         <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
         <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

       </ul>
     </div>
   </div>
 </nav>	
	
	
	
	
	
<%-- <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">Start Bootstrap</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>			
				<c:if test="${not empty USERMODEL }"> <!--kt đã đăng nhập -->					
					<li class="nav-item">
						<a class="nav-link" href='<c:url value=""/>'>Welcom, ${USERMODEL.fullName}</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href='<c:url value="/thoat?action=logout"/>'>Thoát</a>
					</li>
				</c:if>
				<c:if test="${empty USERMODEL }"> <!--kt chưa đăng nhập -->					
					<li class="nav-item">
						<a class="nav-link" href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập</a>
					</li>
				</c:if>

			</ul>
		</div>
	</div>
</nav> --%>