<%@include file="/common/taglib.jsp"%>
<c:url var="api-category-url" value="/api-admin-category" />
<c:url var="categoryURL" value="/admin-category" />


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
  <meta name="author" content="">
  <link href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="<c:url value='/template/admin/css/sb-admin-2.min.css'/>" rel="stylesheet">
  
<title>Danh sách thể loại</title>
</head>

<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<h2>Quản lý thể loại</h2>
		<c:url var="addURL" value="/admin-category">
			<c:param name="type" value="edit"/>			
		</c:url>
		<a class="btn btn-sm btn-primary mr-2 float-right"
		data-toggle="tooltip" title="Thêm"
		href='${addURL}'>
			<i class="fa fa-plus-circle" aria-hidden="true"></i> 
		</a>     
		<c:if test="${not empty messageResponse}">
			<div class="alert alert-${alert}">
						${messageResponse}
			</div>
		</c:if>
		<form action="<c:url value='admin-category'/>" id="formSubmit" method="get">     
		<table class="table table-borderless w-100">
			<thead>
			<tr class="table-secondary">
				<th></th>
				<th>Tên thể loại</th>
				<th>Mã thể loại</th>
				<th>Hành động</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${categories.listResult}">
			<c:url var="editURL" value="/admin-category">
				<c:param name="type" value="edit" />
				<c:param name="id" value="${item.id}" />
			</c:url>
				<!--lặp list trong abstractModel -->													                                       
				<tr>
					<td><input class="check" type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
					<td>${item.name}</td>
					<td>${item.code}</td>
					<td> 		
						<c:url var="editURL" value="/admin-category">
							<c:param name="type" value="edit"/>
							<c:param name="id" value="${item.id}"/>
						</c:url>				
						<a class="btn btn-sm btn-primary mr-2"
						data-toggle="tooltip" title="Cập nhật"
						href='${editURL}'>
							<i class="fas fa-pen-square"></i>
						</a>
						<a class="btn btn-sm btn-primary mr-2"
						data-toggle="tooltip" title="Xóa"
						href="#" id="btnDelete">
							<i class="fas fa-trash"></i> 
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
	
	<script>


	$("#btnDelete").click(function() {
		var data = {};
		var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
		data['ids'] = ids;
		deleteNew(data);
	});
	
	function deleteNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${NewURL}?type=list&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${NewURL}?type=list&message=error_system";
            }
        });
    }
	</script>
</body>

</html>