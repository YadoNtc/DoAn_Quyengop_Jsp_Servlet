<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<main style="margin-top: 104px;">

	<div class="content-main-user" style="background: #F2F2F2;">
		<div class="container">

			<ol class="breadcrumb">
				<li><a href="<c:url value="/trang-chu?action=profile"/>">Dashboard</a></li>
				<i class="fal fa-chevron-double-right" style="padding: 0 5px;"></i>
				<li>Thành viên</li>
				<i class="fal fa-chevron-double-right" style="padding: 0 5px;"></i>
				<li>Thay đổi mật khẩu</li>
			</ol>
			<c:if test="${not empty error}">
				<div class="alert alert-warning">
					<i>${error}</i>
				</div>
			</c:if>
			<form action="change-pass" method="POST">
				<div class="card">
					<div class="card-header">
						<span style="font-size: 18px; font-weight: bold;"><i
							class="fa fa-lock" aria-hidden="true"></i> Thay đổi mật khẩu</span>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col">
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

							<div class="col">
								<div class="form-group">
									<label style="line-height: 36px;">Mật khẩu mới</label> <input
										type="password" class="form-control" id="newPassword"
										name="newPassword" value="" required="required">
								</div>
								<div class="form-group">
									<label style="line-height: 36px;">Nhập lại mật khẩu mới</label>
									<input type="password" class="form-control"
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
</main>

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