<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index.html">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			SB Admin <sup>2</sup>
		</div>
	</a>

	

	<!-- Nav Item - Charts -->
	<li class="nav-item">
		<a class="nav-link" href='<c:url value="/admin-category?type=list&page=1&maxPageItem=2&sortName=id&sortBy=desc"/>'> 
			<i class="fas fa-fw fa-chart-area"></i> <span>Category</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href='<c:url value="/admin-product?type=list&page=1&maxPageItem=2&sortName=id&sortBy=desc"/>'> 
			<i class="fas fa-fw fa-chart-area"></i> <span>Product</span>
		</a>
	</li>

	<!-- Nav Item - Tables -->
	<li class="nav-item active"><a class="nav-link" href="tables.html">
			<i class="fas fa-fw fa-table"></i> <span>Tables</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->
