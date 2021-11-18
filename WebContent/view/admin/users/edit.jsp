<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglib.jsp" %>
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
						<small><i class="ace-icon fa fa-angle-double-right"></i> Chỉnh sửa người dùng</small>
					</c:if>
					<c:if test="${empty model.id}">
						<small><i class="ace-icon fa fa-angle-double-right"></i> Thêm mới người dùng</small>
					</c:if>
					
				</h1>
			</div>
			<!-- /.page-header -->
			
			<div class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
								<%-- <a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
							   		title="Reset" href="<c:url value="/admin-user-list" />">
									<span><i class="far fa-retweet bigger-110 purple"></i></span>
								</a> --%>													
						</div>
					</div>
				</div>
			</div><br /><br />

			<div class="row">
				<div class="col-xs-12">
					<c:if test="${ not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${ not empty error}">
						<div class="alert alert-warning">${error}</div>
					</c:if>
					<div class="container" style="width: 70%; box-shadow: 1px 1px 2px 5px rgb(1 1 1 / 10%);">
	
						<form id="formSubmit" action="admin-user" class="validate-form" method="post">
							<button style="float: right;" class="btn btn-info" formaction="admin-user/reset">Reset</button><br /><br />
							<div class="form-group" style="display: none;">
								<label for="id">Id:</label>
								<input type="text" class="form-control" name="id" id="id" value="${model.id}"/>
							</div> 
							<div class="fomr-group">
								<label for="email" class="control-label">Email</label>
								<div class="validate-input" data-validate="Vui lòng nhập email" style="position: relative;">
									<input type="email" class="form-control input100" name="email" id="email" value="${model.email}" />
									<span class="focus-input100"></span>
								</div>
							</div><br />
							<div class="form-group">
								<label for="password">Mật khẩu</label>
								<div class="validate-input" data-validate="Vui lòng nhập mật khẩu" style="position: relative;">
									<c:if test="${empty model.id}">
										<input type="password" class="form-control input100" name="password" id="password" value="" />								
									</c:if>
									<c:if test="${not empty model.id}">
										<input type="password" readonly="readonly" class="form-control input100" name="password" id="password" value="${model.password}" />								
									</c:if>
									<span class="focus-input100"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="fullname">Họ tên</label>
								<div class="validate-input" data-validate="Vui lòng nhập Họ tên" style="position: relative;">
									<input type="text" class="form-control input100" name="fullName" id="fullName" value="${model.fullName}" />
									<span class="focus-input100"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="tel">Số điện thoại</label>
								<div class="validate-input" data-validate="Vui lòng nhập số điện thoại" style="position: relative;">
									<input type="tel" class="form-control input100" name="mobile" id="mobile" value="${model.mobile}" />
									<span class="focus-input100"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="tel">Ngày</label>
								<input type="date" class="form-control input100" name="createdDate" id="today" value="${model.createdDate}" />
							</div>
							<div class="form-check form-check-inline">
								<label> Role: </label>
								<label style="margin-left: 5px;"><input type="radio" class="form-check-input" id="admin" 
									name="admin" value="true" ${model.admin? 'checked':''} /> Admin </label>
								<label style="margin-left: 5px;"><input type="radio" class="form-check-input" id="user" 
									name="admin" value="false" ${! model.admin? 'checked':''} /> User </label>
							</div>
							<div class="form-check form-check-inline">
								<label> Status: </label>
								<label style="margin-left: 5px;"><input type="radio" class="form-check-input" id="status"
									 name="status" value="true" ${model.status? 'checked':''} /> Active </label>
								<label style="margin-left: 5px;"><input type="radio" class="form-check-input" id="unactive" 
									 name="status" value="false" ${! model.status? 'checked':''} /> Unactive </label>
							</div>
							<div class="form-group" style="text-align: center;">
								<c:if test="${empty model.id}">
									<button type="submit" class="btn btn-primary" formaction="admin-user/create">Thêm</button>								
								</c:if>
								<c:if test="${not empty model.id}">
									<button class="btn btn-primary" formaction="admin-user/update">Cập nhật</button>								
								</c:if>
								<a class="btn btn-warning" href="<c:url value="/admin-user"/>">Đóng</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
document.querySelector("#today").valueAsDate = new Date(); 
	 
$('.validate-form').on('submit',function () {
	var form = $(this);
	var input = form.find('.validate-input .input100');
	var check = true;
	for (var i = 0; i < input.length; i++) {
	   if (validate(input[i]) == false) {
	       showValidate(input[i]);
	       check = false;
	   }
	}
	return check;			
});

 
$('.validate-form .input100').each(function() {
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