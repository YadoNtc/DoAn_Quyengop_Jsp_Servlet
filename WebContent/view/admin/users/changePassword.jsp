<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<div class="main-content">
	<div class="main-content-inner">

		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a
					href="<c:url value="/admin-home"/>">Home</a></li>
				<li class="active">Dashboard</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>Dashboard
					<small><i class="ace-icon fa fa-angle-double-right"></i> Thay đổi mật khẩu</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group"></div>
					</div>
				</div>
			</div>
			<br />
			<br />						
			<c:if test="${ not empty error}">
				<div class="alert alert-warning">${error}</div>
			</c:if>
			<div class="container"
				style="width: 70%; box-shadow: 1px 1px 2px 5px rgb(1 1 1/ 10%);">

				<form action="admin-change-pass" method="POST">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label style="line-height: 36px;">Email</label> <input
											type="email" class="form-control" name="email"
											value="${userModel.email}" required="required">
									</div>
									<div class="form-group">
										<label style="line-height: 36px;">Mật khẩu cũ</label> <input
											type="password" class="form-control" name="oldPassword"
											value="" required="required">
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group">
										<label style="line-height: 36px;">Mật khẩu mới</label> <input
											type="password" class="form-control" id="newPassword"
											name="newPassword" value="" required="required">
									</div>
									<div class="form-group">
										<label style="line-height: 36px;">Nhập lại mật khẩu
											mới</label> <input type="password" class="form-control"
											id="confirmNewPassword" name="confirmNewPassword" value=""
											required="required">
										<p id="alert"
											style="font-style: italic; display: none; color: red; font-size: 13px;">Xác
											nhận mật khẩu không đúng!</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="form-group text-center">
								<button id="btn" type="submit" class="btn btn-primary">
									<i class="fa fa-save"></i> Lưu lại
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
				
			
		</div>
	</div>
</div>

<script type="text/javascript">	
	$(document).ready(function() {
		$('#newPassword, #confirmNewPassword').on('keyup', function() {
			if ($('#newPassword').val() == $('#confirmNewPassword').val()) {
				$('#alert').hide();
			} else {
				$('#alert').show();
			}
		});
	});
</script>