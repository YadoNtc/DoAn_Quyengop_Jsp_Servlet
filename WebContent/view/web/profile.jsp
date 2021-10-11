<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<!-- <link rel="stylesheet" href="/media/styles/flatpickr.min.css"> -->

<main style="margin-top: 104px;">

	<div class="u-dashboard-top"
		style="background-image: url(https://unica.vn/media/img/bg-db.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>Thành viên: ${userModel.fullName}</p>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav nav-tabs" style="border-bottom: 0px !important">																								
							<li class="">
								<a href="<c:url value="/trang-chu?action=profile&id=${userModel.id}"/>" class=""><i class="fa fa-user" aria-hidden="true"></i> Hồ sơcá nhân</a>
							</li>			
							<li class="">
								<a href="<c:url value="/trang-chu?action=history&id=${userModel.id}"/>" class=""><i class="fa fa-user" aria-hidden="true"></i> Lịch sử quyên góp</a>
							</li>																
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content-main-user" style="background: #F2F2F2;">
		<div class="container">
			<!-- <div class="right"> -->
				<!-- <div id="main-content"> -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<span style="font-weight: bold;"><i class="fa fa-user"
								aria-hidden="true"></i> Thông tin cá nhân</span>
							<div class="pull-right">
								<a href="#" class="btn btn-xs btn-warning margin-left">
								<i class="fa fa-refresh"></i> Thay đổi mật khẩu</a> 
								<a href="<c:url value="/user-profile/delete?id=${userModel.id}"/>" onclick="return confirm('Bạn xác nhận không còn sử dụng tài khoản ${userModel.fullName}?');" class="btn btn-xs btn-default margin-left">
								<i class="fa fa-lock"></i> Khóa tài khoản</a>
							</div>
						</div>
						
						<div class="panel-body">
							<div class="row row-form">
							
								<form id="w0" action="user-profile" method="post">
									<div class="col-md-6 col-sm-6">
										<div class="form-group" style="margin-bottom: 47px;">
											<label style="margin-bottom: 10px;">Chọn ảnh đại diện</label><br> 
											<img class="show_image" src="<c:url value="/template/web/image/profile.png"/>" style="width: 100px; height: 100px;"> 
											<p style="margin-top: 10px; font-size: 14px;">(Ảnh vuông và &lt;500KB)</p>
										</div>
										
										<div class="form-group">
											<label>Thành phố</label>
											<div class="form-group field-muser-city">
												<select id="city" class="form-control" name="city">
													<option value="">Chọn thành phố</option>
													<option value="1">Cao Bằng</option>
													<option value="2">Bắc Ninh</option>
													<option value="3">Hà Giang</option>
													<option value="4">Lai Châu</option>
													<option value="5">Lào Cai</option>
													<option value="6">Bắc Kạn</option>
													<option value="7">Tuyên Quang</option>
													<option value="8">Hưng Yên</option>
													<option value="9">Phú Yên</option>
													<option value="10">Điện Biên</option>
													<option value="11">Yên Bái</option>
													<option value="12">Thái Nguyên</option>
													<option value="13">Sóc Trăng</option>
													<option value="14">Lạng Sơn</option>
													<option value="15">Vĩnh Phúc</option>
													<option value="16">Sơn La</option>
													<option value="17">Phú Thọ</option>
													<option value="18">Hà Nội</option>
													<option value="19">Bắc Giang</option>
													<option value="20">Quảng Ninh</option>
													<option value="22">Hải Dương</option>
													<option value="23">Hòa Bình</option>
													<option value="24">Hải Phòng</option>
													<option value="25">Hà Nam</option>
													<option value="26">Thái Bình</option>
													<option value="27">Ninh Bình</option>
													<option value="28">Nam Định</option>
													<option value="29">Thanh Hóa</option>
													<option value="30">Nghệ An</option>
													<option value="31">Hà Tĩnh</option>
													<option value="32">Quảng Bình</option>
													<option value="33">Quảng Trị</option>
													<option value="34">Thừa Thiên Huế</option>
													<option value="35">Đà Nẵng</option>
													<option value="36">Quảng Nam</option>
													<option value="37">Quảng Ngãi</option>
													<option value="38">Kon Tum</option>
													<option value="39">Bình Định</option>
													<option value="40">Gia Lai</option>
													<option value="42">Đăk Lăk</option>
													<option value="43">Khánh Hòa</option>
													<option value="44">Đăk Nông</option>
													<option value="45">Bình Phước</option>
													<option value="46">Lâm Đồng</option>
													<option value="47">Ninh Thuận</option>
													<option value="48">Tây Ninh</option>
													<option value="49">Bình Dương</option>
													<option value="50">Đồng Nai</option>
													<option value="51">Bình Thuận</option>
													<option value="52">TP.Hồ Chí Minh</option>
													<option value="53">Long An</option>
													<option value="54">Bà Rịa - Vũng Tàu</option>
													<option value="56">An Giang</option>
													<option value="57">Đồng Tháp</option>
													<option value="58">Tiền Giang</option>
													<option value="59">Cần Thơ</option>
													<option value="60">Bến Tre</option>
													<option value="61">Vĩnh Long</option>
													<option value="62">Kiên Giang</option>
													<option value="63">Hậu Giang</option>
													<option value="64">Trà Vinh</option>
													<option value="65">Bạc Liêu</option>
													<option value="68">Cà Mau</option>
												</select>											
											</div>
										</div>
										<div class="form-group">
											<label>Địa chỉ</label>
											<div class="form-group field-muser-address">
												<input type="text" id="address" class="form-control" name="address" value="${model.address}">										
											</div>
										</div>
										<div class="form-group" style="padding-top: 19px;">
											<button type="submit" class="btn btn-success" formaction="user-profile/update?id=${userModel.id}">
												<i class="fa fa-save"></i> Lưu lại
											</button>

										</div>
									</div>
									<div class="col-md-6 col-sm-6">
									
										<div class="form-group">
											<label>Username: <b>${model.email}</b></label>
										</div>
										<div class="form-group">
											<label>Họ và tên</label>
											<div class="form-group field-muser-fullname required">
												<input type="text" id="fullName" class="form-control" name="fullName" value="${model.fullName}">					
											</div>
										</div>
										
										<div class="form-group">
											<label><i title="Đã xác thực email"
												class="fa fa-envelope color-green"></i> Email </label>
											<div class="form-group field-muser-email required">
												<input type="email" id="email" class="form-control" name="email" value="${model.email}" readonly>						
											</div>
										</div>
										<input type="password" id="email" class="form-control" name="password" value="${model.password}" readonly style="display: none;">
										<div class="form-group">
											<label>Số điện thoại</label>
											<div class="form-group field-muser-phone required">
												<input type="text" id="mobile" class="form-control" name="mobile" value="${model.mobile}">									
											</div>
										</div>
																											
									</div>
								</form>
							</div>
						</div>
					</div>				
		</div>
	</div>
	
</main>

