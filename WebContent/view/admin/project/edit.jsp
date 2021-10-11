<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglib.jsp" %>
<c:url var="editApi" value="/api-admin-donate"/>
<c:url var="editProject" value="/admin-project-edit"/>
<c:url var="listProject" value="/admin-project-list" />
<!DOCTYPE html>
<div class="main-content">
	<div class="main-content-inner">

		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/admin-home"/>">Home</a>
				</li>
				<li class="active">Dashboard</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>Dashboard 
					<c:if test="${not empty model.id}">
						<small><i class="ace-icon fa fa-angle-double-right"></i> Chỉnh sửa chương trình quyên góp</small>
					</c:if>
					<c:if test="${empty model.id}">
						<small><i class="ace-icon fa fa-angle-double-right"></i> Thêm chương trình quyên góp</small>
					</c:if>
					
				</h1>
			</div>
			<!-- /.page-header -->
			
			<div class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
								<a
							   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
							   title="Reset" href="<c:url value="/admin-project?type=edit" />">
									<span>
										<i class="far fa-retweet bigger-110 purple"></i>
									</span>
								</a>
							
							
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-xs-12">

					<c:if test="${ not empty messageText }">
						<div class="alert alert-${alert}">${messageText}</div>
					</c:if>

					<form id="formSubmit" class="validate-form">
						
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Tên chương trình</label>
							<div class="col-sm-10 validate-input" data-validate="Vui lòng nhập tên của chiến dịch quyên góp">
								<input type="text" class="form-control input100" id="name" name="name" required value="${model.name}" />
								<span class="focus-input100"></span>
							</div>
						</div>
						<br /> <br /> <br />
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Hình ảnh</label>
							<div class="col-sm-10 validate-input" data-validate="Chọn hình ảnh đại diện cho chiến dịch">								
								<input id="productmodel_image" style="width: 50%; display: unset;" type="text" class="form-control input100" id="image" name="image" required value="${model.image}" />								
								<span class="focus-input100"></span>															
								<a id="Browse" href="#" class="btn btn-sm red btn-img">Chọn hình<i class="fa fa-link"></i></a>																
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Mô tả ngắn</label>
							<div class="col-sm-10 validate-input" data-validate="Vui lòng nhập mô tả ngắn"> 
								<input type="text" class="form-control input100" id="description" name="description" required value="${model.description}" />
								<span class="focus-input100"></span>
							</div>
						</div>
						<br /> <br />
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Nội dung</label>
							<div class="col-sm-10">
								<textarea class="input100" id="detail" name="detail">${model.detail}</textarea><br />
								<!-- <span class="focus-input100"></span> -->
							</div>
						</div>
						<br /> <br /> <br />
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Dự kiến quyên góp(Vnd)</label>
							<div class="col-sm-10 validate-input" data-validate="Vui lòng nhập số tiền dự kiến sẽ quyên góp">
								<input type="number" class="form-control input100" id="targetMoney" name="targetMoney" required value="${model.targetMoney}" />
								<span class="focus-input100"></span><br/>
							</div>
						</div>
						<br /> <br /> <br />
						<%-- <div class="form-group" style="display: none">
							<label class="col-sm-2 control-label no-padding-right">Đã quyên góp</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="currentMoney" name="currentMoney" value="${model.currentMoney}" /><br/>
							</div>
						</div>
						<br /> <br /> <br /> --%>
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Ngày bắt đầu</label>
							<div class="col-sm-10"> 							
								<input type="date" class="form-control" id="today" name="createdDate" value="${model.createdDate}"/><br />						
							</div>
						</div>
						<br /> <br /> <br />
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right">Trạng thái</label>
							<div class="col-sm-10 validate-input" data-validate="Vui lòng nhập trạng thái hoạt động của chiến dịch"> 
								<%-- <input type="text" class="form-control" id="status" name="status" value="${model.status}" >	 --%>
								<select class="form-control input100" id="status" name="status" required>
									<c:if test="${empty model.id}">
										<option value="">Chọn trạng thái</option>
										<option>inprogress</option>
										<option>completed</option>
									</c:if>
									<c:if test="${not empty model.id}">											
										<option value="${model.status}">${model.status}</option>																																																									
										<option>inprogress</option>
										<option>completed</option>																																																																	
									</c:if>
									
								</select> 
								<span class="focus-input100"></span>
								<br />
							</div>
						</div>
						<br /> <br /> <br />
						<!-- <div class="form-group"> -->
							<div class="col-sm-12" style="text-align: center;"> 
								<c:if test="${not empty model.id }">
									<input value="Cập nhật" type="submit" id="btnAddOrUpdate" class="btn btn-primary" onclick="return validator();">	 
									<!-- <button type="submit" id="btnAddOrUpdate" class="btn btn-primary" onclick="return addOrUpdate();">
									<span>Cập nhật</span>
							    	</button> --> 
								</c:if> 
								
								<c:if test="${empty model.id }">
									<input value="Thêm" type="submit" id="btnAddOrUpdate" class="btn btn-primary" onclick="return validator();"> 
									<!-- <button type="submit" id="btnAddOrUpdate" class="btn btn-primary" onclick="return addOrUpdate();">
							        <span>Thêm</span>
							    	</button>  -->
								</c:if>
								<a href="<c:url value="/admin-project?type=list" />" class="btn btn-warning">Đóng</a>
						   
							</div> 
						<!-- </div> -->
						<input type="hidden" value="${model.id}" id="id" name="id" />
						<input type="hidden" id="type" value="list" name="type">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

var editor = '';
$(document).ready(function() {
	document.querySelector("#today").valueAsDate = new Date();
	editor = CKEDITOR.replace('detail');
	CKFinder.setupCKEditor(editor, '<c:url value="/ckfinder"/>');
	 $('#Browse').on('click', function (e) {
	        e.preventDefault();
	        var finder = new CKFinder();
	        finder.selectActionFunction = function (url) {
	            $('#productmodel_image').val(url);
	        };
	        finder.popup();
	    });
});
	 
	 
function validator() {
	var form = $('#formSubmit');
	var input = form.find('.validate-input .input100');
	var check = true;
	for (var i = 0; i < input.length; i++) {
	   if (validate(input[i]) == false) {
	       showValidate(input[i]);
	       check = false;
	   }
	}
	return check == false ? check : addOrUpdate();			
}

function addOrUpdate() {
	
	/* if($('#formSubmit')[0].checkValidity() === false) {
		return;
	} */ 
   	var data = {};
   	var formData = $('#formSubmit').serializeArray();
   	$.each(formData, function(i, v) {
   		 data[""+v.name+""] = v.value;
   	});
   	data["detail"] = CKEDITOR.instances.detail.getData();
   	var id = $('#id').val();
   	if (id == "") {
   		insert(data);
   	} else {
   		update(data);	       	 
    }	     
}

function insert(data) {
	 $.ajax({
		 type: "POST",
		 url: "${editApi}",
		 contentType: "application/json",
		 data: JSON.stringify(data),
		 dataType: "json",
		 success: function(result) {
			 window.location.href = "${editProject}?id="+result.id+"&message=insert_success";
		 },
		 error: function() {
			 window.location.href = "${listProject}?message=error_system";
		 }
	 });
}

function update(data) {
	 $.ajax({
		 type: "PUT",
		 url: "${editApi}",
		 contentType: "application/json",
		 data: JSON.stringify(data),
		 dataType: "json",
		 success: function(result) {
			 window.location.href = "${editProject}?id="+result.id+"&message=update_success";
		 },
		 error: function() {
			 window.location.href = "${listProject}?message=error_system";
		 }
	 });
} 
 
$('#formSubmit .input100').each(function() {
    $(this).focus(function() {
        hideValidate(this);
    });
});

function validate(input) {
	
    if ($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
        if ($(input).val().trim().match(/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i) == null) {
            return false;
        }
    } else if ($(input).attr('type') == 'tel' || $(input).attr('name') == 'mobile') {
        if ($(input).val() == '') {
            return false;
        }
    } else {
        if ($(input).val().trim() == '') {
            return false;
        }
    }
}

function showValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).addClass('alert-validate');
}

function hideValidate(input) {
    var thisAlert = $(input).parent();

    $(thisAlert).removeClass('alert-validate');
}   

</script>