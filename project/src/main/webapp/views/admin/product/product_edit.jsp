<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product" />
<c:url var="Url" value="/admin-product" />
<c:url var="UploadImage" value="/api-admin-uploadImage" />
<html>
<head>
<title>Quản lý sản phẩm</title>
</head>
<script>

</script>
<body>
	<div class="container">
		<h2></h2>
		<c:if test="${not empty messageResponse}">
			<div class="alert alert-${alert}">${messageResponse}</div>
		</c:if>
		<form id="sampleUploadFrm" method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<div class="input-group input-file" name="file">
					<span class="input-group-btn">
						<button class="btn btn-default btn-choose" type="button">Choose</button>
					</span> <input type="text" class="form-control"
						placeholder='Choose a file...' /> <span class="input-group-btn">
						<button class="btn btn-warning btn-reset" type="button">Reset</button>
						<button type="button" class="btn btn-primary pull-right" id="uploadBtn">Submit</button>
					</span>
				</div>
			</div>			
		</form> 
		<form id="formSubmit">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Tên sản phẩm</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="name" name="name" value="${model.name}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Giá niêm yết</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="origin_price" name="origin_price" value="${model.origin_price}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Giá khuyến mãi</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="sale_price" name="sale_price" value="${model.sale_price}" />
				</div>
			</div>
			
		<!-- 	<div class="form-group" >
					<div class="input-group input-file" name="file">
						<span class="input-group-btn">
							<button class="btn btn-default btn-choose" type="button">Choose</button>
						</span> <input type="text" class="form-control"
							placeholder='Choose a file...' /> <span class="input-group-btn">
							<button class="btn btn-warning btn-reset" type="button">Reset</button>
						</span>
					</div>
			</div> -->
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Nhãn hiệu</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="brand" name="brand" value="${model.brand}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Thể loại</label>
				<div class="col-sm-9">
					<select class="form-control" id="categoryid" name="categoryid">
						<c:if test="${empty model.categoryid}">
							<option value="">Chọn loại bài viết</option>
							<c:forEach var="item" items="${categories}">
								<option value="${item.id}">${item.name}</option>
							</c:forEach>
						</c:if>
						<%-- <c:if test="${not empty model.categoryCode}">
							<option value="">Chọn loại bài viết</option>
							<c:forEach var="item" items="${categories}">
								<option value="${item.id}"
									<c:if test="${item.id == model.categoryid}">selected="selected"</c:if>>
									${item.name}</option>
							</c:forEach>
						</c:if> --%>
					</select>
				<%-- 	<input type="text" class="form-control" id="categoryid" name="categoryid" value="${model.categoryid}" /> --%>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Loại dây</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="wire_type" name="wire_type" value="${model.wire_type}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="status" name="status" value="${model.status}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Kiểu mặt kính</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="glass_surface" name="glass_surface" value="${model.glass_surface}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Chất liệu vỏ</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="material_case" name="material_case" value="${model.material_case}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Kích thước mặt số</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="size" name="size" value="${model.size}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Bảo hành</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="guarantee" name="guarantee" value="${model.guarantee}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Thương hiệu</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="trademark" name="trademark" value="${model.trademark}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right">Giới tính</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="sex" name="sex" value="${model.sex}" />
				</div>
			</div>	
			<div class="form-group">
				<div class="col-sm-12">
					<input type="button" class="btn btn-white btn-warning btn-bold"
						id="btnAddOrUpdate" />
				</div>
			</div>		
			<input type="hidden" value="${model.id}" id="id" name="id" />
		</form>
	</div>

	<script>
	/* var editor = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'content');
	}); */

	
		
	$(document).ready(function() {
		var id = $('#id').val();
     if (id == "") {
         $('#btnAddOrUpdate').val("Thêm");
     }else{
        $('#btnAddOrUpdate').val("Cập nhật");
     }
     
     function bs_input_file() {
			$(".input-file").before(
				function() {
					if ( ! $(this).prev().hasClass('input-ghost') ) {
						var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
						element.attr("name",$(this).attr("name"));
						element.change(function(){
							element.next(element).find('input').val((element.val()).split('\\').pop());
						});
						$(this).find("button.btn-choose").click(function(){
							element.click();
						});
						$(this).find("button.btn-reset").click(function(){
							element.val(null);
							$(this).parents(".input-file").find('input').val('');
						});
						$(this).find('input').css("cursor","pointer");
						$(this).find('input').mousedown(function() {
							$(this).parents('.input-file').prev().click();
							return false;
						});
						return element;
					}
				}
			);
		}
     
     bs_input_file();
     
    })
    
      function add(data) {
        $.ajax({
        	async: false,
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	//window.location.href = "${Url}?type=list&maxPageItem=2&page=1&sortName=id&sortBy=desc&message=insert_success";  
            	console.log(result);
            },
            error: function (error) {
            	//window.location.href = "${Url}?type=list&maxPageItem=2&page=1&message=error_system";            
            	console.log(error);
            }
        });
    }
    function update(data) {
        $.ajax({
        	async: false,
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	//window.location.href = "${Url}?type=list&maxPageItem=2&page=1&sortName=id&sortBy=desc&message=update_success";
            	console.log(result);
            },
            error: function (error) {
            	//window.location.href = "${Url}?type=list&maxPageItem=2&page=1&message=error_system";
            	console.log(error);
            }
        });
    }
    
    
	$("#btnAddOrUpdate").on("click", function() {
			var url = "${UploadImage}";
			var form = $("#sampleUploadFrm")[0];
			var data1 = new FormData(form);
			var img = "";			
			/* var data = {};
			data['key1'] = 'value1';
			data['key2'] = 'value2'; */
			$.ajax({
				async: false,
				type : "POST",
				encType : "multipart/form-data",
				url : url,
				cache : false,
				processData : false,
				contentType : false,
				data : data1,
				success : function(msg) {
					/* var response = JSON.parse(msg);
					var status = response.status; */
					img = msg;
					console.log(msg);
					/* if (status == 1) {
						alert("File has been uploaded successfully");
					} else {
						alert("Couldn't upload file");
					} */
				},
				error : function(msg) {
					alert("Couldn't upload file");
				}
			});
			var data = {};
	        var formData = $('#formSubmit').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
			
			data["image"] = img; 
	        //data["content"] = editor.getData();
	        var id = $('#id').val();
	        if (id == "") {
	        	add(data);
	        } else {
	            update(data);
	        }
		});	

   
  
    function upload(data,nameImg) {
    	$.ajax({
			type : "POST",
			encType : "multipart/form-data",
			url : "${UploadImage}",
			cache : false,
			processData : false,
			contentType : false,
			data : data,
			success : function(msg) {
				nameImg = msg;
				console.log(msg);
			},
			error : function(msg) {
				alert("Couldn't upload file");
			}
		});
    }
    
	
    
  /*   $('#btnAddOrUpdate').click(function (e) {
        e.preventDefault();
        var file = $('#formSubmit')[3];
		var filedata = new FormData(file);
        var imgName;
        upload(filedata,imgName);
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data["image"] = imgName;
        //data["content"] = editor.getData();
        var id = $('#id').val();
        if (id == "") {
        	add(data);
        } else {
            update(data);
        } 
    }); */
</script>
</body>
</html>
