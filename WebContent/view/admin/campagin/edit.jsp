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
					<small><i class="ace-icon fa fa-angle-double-right"></i> Chỉnh sửa đợt quyên góp</small>							
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
	
						<form id="formSubmit" action="admin-campagin" method="post">
							<!-- <button style="float: right;" class="btn btn-info" formaction="reset">Reset</button><br /><br /> -->
							<div class="form-group" style="display: none;">
								<label for="id">Id:</label>
								<input type="text" class="form-control" name="id" id="id" value="${model.id}"/>
							</div> 
							<div class="form-check form-check-inline" style="margin-top: 20px;">
								<label> Status: </label>
								<label style="margin-left: 5px;"><input type="radio" class="form-check-input" id="status"
									 name="status" value="transferred" ${model.status == 'transferred' ? 'checked':''} /> Transferred </label>
								<label style="margin-left: 5px;"><input type="radio" class="form-check-input" id="unactive" 
									 name="status" value="transferring" ${model.status == 'transferring' ? 'checked':''} /> Transferring </label>
							</div>
							
							<div class="fomr-group">
								<label for="id" class="control-label">User Id:</label>							
								<input readonly type="text" class="form-control input100" name="userId" id="userId" value="${model.userId}" />							
							</div><br />
							<div class="fomr-group">
								<label for="id" class="control-label">Id Chương trình quyên góp:</label>								
								<input readonly type="text" class="form-control input100" name="campaginId" id="campaginId" value="${model.campaginId}" />						
							</div><br />
							<div class="fomr-group">
								<label for="email" class="control-label">Email</label>								
								<input readonly type="email" class="form-control input100" name="email" id="email" value="${model.email}" />									
							</div><br />
							<div class="form-group">
								<label for="password">Số tiền</label>													
								<input readonly type="number" readonly="readonly" class="form-control input100" name="amoutMoney" id="amoutMoney" value="${model.amoutMoney}" />																				
							</div>
							<div class="form-group">
								<label for="fullname">Họ tên</label>								
								<input readonly type="text" class="form-control input100" name="fullName" id="fullName" value="${model.fullName}" />						
							</div>
							<div class="form-group">
								<label for="tel">Số điện thoại</label>								
								<input readonly type="tel" class="form-control input100" name="mobile" id="mobile" value="${model.mobile}" />							
							</div>
							<div class="form-group">
								<label for="tel">Ngày</label>
								<input readonly type="date" class="form-control input100" name="createdDate" id="today" value="${model.createdDate}" />
							</div>							
							
							<div class="form-group" style="text-align: center;">													
								<button class="btn btn-primary" formaction="admin-campagin/update">Cập nhật</button>																
								<a class="btn btn-warning" href="<c:url value="/admin-campagin"/>">Đóng</a>
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