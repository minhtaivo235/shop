<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-category"/>
<c:url var ="CategoryURL" value="/admin-category"/>
<html>
<head>
    <title>Quản lý bài viết</title>
</head>
<body>
    <div class="container">
        <h2></h2>
        <c:if test="${not empty messageResponse}">
                    <div class="alert alert-${alert}">
                        ${messageResponse}
                    </div>
        </c:if> 
        <form id="formSubmit">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right">Tên thể loại</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name" name="name" value="${categories.name}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right">Mã thể loại</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="code" name="code" value="${categories.code}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <c:if test="${not empty categories.id}">
                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật thể loại" id=btnAddOrUpdate/>
                    </c:if>
                    <c:if test="${empty categories.id}">
                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm thể loại" id="btnAddOrUpdate"/>
                    </c:if>
                </div>
            </div>
          <input type="hidden" value="${categories.id}" id="id" name="id"/>          
        </form>
      </div>
                                                                    
<script>
	/* var editor = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'content');
	}); */
	
    $('#btnAddOrUpdate').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        //data["content"] = editor.getData();
        var id = $('#id').val();
        if (id == "") {
        	addCategory(data);
        } else {
            updateCategory(data);
        }
    });
    function addCategory(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${CategoryURL}?type=list&message=insert_success";  
            	//console.log(result);
            },
            error: function (error) {
//            	window.location.href = "${CategoryURL}?type=list&maxPageItem=2&page=1&message=error_system";            
            	console.log(result);
            }
        });
    }
    function updateCategory(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	//window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=update_success";
            	console.log(result);
            },
            error: function (error) {
            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
            	console.log(error);
            }
        });
    }
</script>
</body>
</html>
