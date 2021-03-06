<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-category" />
<c:url var="CategoryURL" value="/admin-category" />


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value='/template/admin/css/sb-admin-2.min.css'/>"
	rel="stylesheet">



<title>Danh sách thể loại</title>
</head>

<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<div class="clearfix">
			<h2>Quản lý thể loại</h2>
			<div class="float-right">
				<c:url var="addURL" value="/admin-category">
					<c:param name="type" value="edit" />
				</c:url>
				<a class="btn btn-success" data-toggle="tooltip" title="Thêm"
					href='${addURL}'> <i class="fa fa-plus-circle"
					aria-hidden="true"></i>
				</a>
				<button id="btnDelete" type="button" class="btn btn-danger ml-2"
					data-toggle="tooltip" title='Xóa'>
					<span> <i class="fas fa-trash"></i>
					</span>
				</button>
			</div>
		</div>
		<c:if test="${not empty messageResponse}">
			<div class="alert alert-${alert} alert-dismissible">
				<button type="button" class="close" data-dismiss="alert">×</button>
				${messageResponse}
			</div>
		</c:if>



		<form action="<c:url value='admin-category'/>" id="formSubmit"
			method="get">
			<table class="table table-borderless w-100">
				<thead>
					<tr class="table-secondary">
						<th></th>
						<th><a href="#">Tên thể loại</a></th>
						<th><a href="#">Mã thể loại</a></th>
						<th style="text-align: center"><a href="#">Hành động</a></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${categories.listResult}">
						<!--lặp list trong abstractModel -->
						<tr>
							<td><input type="checkbox" id="checkbox_${item.id}"
								value="${item.id}"></td>
							<td>${item.name}</td>
							<td>${item.code}</td>
							<td style="text-align: center">
								<c:url var="editURL"
									value="/admin-category">
									<c:param name="type" value="edit" />
									<c:param name="id" value="${item.id}" />
								</c:url> 
								<a class="btn btn-sm btn-primary mr-2" data-toggle="tooltip"
								title="Cập nhật" href='${editURL}'> 
								<i class="fas fa-pen-square"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination" id="pagination"></ul>
			<input type="hidden" value="" id="page" name="page" /> 
			<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
			<input type="hidden" value="" id="sortName" name="sortName" />
			<input type="hidden" value="" id="sortBy" name="sortBy" /> 
			<input type="hidden" value="" id="type" name="type" />
		</form>
	</div>

	<script>
	
	var totalPages = ${categories.totalPage};
	var currentPage = ${categories.page};
	var limit = 2;
	$(function () {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages: totalPages,
			visiblePages: 10,
			startPage: currentPage,
			onPageClick: function (event, page) {
				if (currentPage != page) {
					$('#maxPageItem').val(limit);
					$('#page').val(page);
					$('#sortName').val('id');
					$('#sortBy').val('desc');
					$('#type').val('list');
					$('#formSubmit').submit();
				}
			}
		});
	});
	
		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			deleteCategory(data);
		});

		function deleteCategory(data) {
			$
					.ajax({
						url : '${APIurl}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = "${CategoryURL}?type=list&maxPageItem=2&page=1&sortName=id&sortBy=desc&message=delete_success";
							console.log(result);
						},
						error : function(error) {
							window.location.href = "${CategoryURL}?type=list&message=error_system";
						}
					});
		}
	</script>
</body>

</html>