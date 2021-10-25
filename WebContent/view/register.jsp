<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('template/login/images/bg-01.jpg'); padding-top: 5%;">
			<script src="https://www.google.com/recaptcha/api.js?hl=vi"></script>
			<!-- <div class="text-center form-group" style="width: 100%">
				<span class="login100-form-title p-b-10"> <img src="#">
				</span>
			</div> -->

			<div class="wrap-login100 p-l-110 p-r-110 p-t-20 p-b-13">

				<form id="formSubmit" action="<c:url value="/dang-ky"/>" method="POST" class="login100-form validate-form flex-sb flex-w">
					<input id="form-token" type="hidden" name="_csrf" value="#">
					<div class="p-t-10 p-b-10 col-md-12" style="text-align: center; color: #555">
						<h3>ĐĂNG KÝ TÀI KHOẢN</h3>
					</div>
					
					<c:if test="${not empty error}">
					<p style="font-style: italic;" class="alert alert-${alert}">
						${message}
					</p>
				</c:if>

					<div class="wrap-input100 validate-input register-input" data-validate="Yêu cầu nhập đầy đủ Họ và tên của bạn">
						<input placeholder="Họ và tên" class="input100" type="text" name="fullName" value="${model.fullName}"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input register-input" data-validate="Yêu cầu nhập Email của bạn">
						<input placeholder="Email" class="input100" type="email" name="email" value="${model.email}"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input register-input" data-validate="Yêu cầu nhập Số điện thoại của bạn">
						<input placeholder="Số điện thoại" class="input100" type="tel" name="mobile" value="${model.mobile}"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input register-input" data-validate="Yêu cầu nhập mật khẩu">
						<input id="password" placeholder="Nhập mật khẩu" class="input100" type="password" name="password"> <span class="focus-input100"></span>
					</div>	
					
					<div class="wrap-input100 validate-input register-input" data-validate="Yêu cầu xác nhận mật khẩu">
						<input id="confirmNewPassword" placeholder="Xác nhận mật khẩu" class="input100" type="password" name="confirmNewPassword"> <span class="focus-input100"></span>
					</div>
					<p id="alert" style="font-style: italic; display: none; color: red; font-size: 15px;">Xác nhận mật khẩu không đúng!</p>
								
					<input type="date" readonly="readonly" id="today" name="createdDate" style="display: none;" />				

					<!-- widget city -->
					
			     <!-- <div style="margin-top: 10px;" class="alert alert-danger alert-dismissable col-md-12">
                		<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                		<strong>Số điện thoại không đúng!</strong>
            	</div>
                <div style="margin-top: 15px;">
            
                <div class="g-recaptcha" data-sitekey="6LcAC1kcAAAAAMfgMTUfsDqglQ6Ay_2ENJQSFOi7"></div>
            
       			</div> --> 

					<!-- <div style="margin-top: 15px;">
						
						<div class="g-recaptcha">
							<div style="width: 304px; height: 78px;">
								<div>
									<iframe title="reCAPTCHA"
										src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LcLsycTAAAAABTE6i9OmvP8VvJ-yqWPFZ0JWQ4l&amp;co=aHR0cHM6Ly9pZC51bmljYS52bjo0NDM.&amp;hl=vi&amp;v=wxAi4AKLXL2kBAvXqI4XLSWS&amp;size=normal&amp;cb=nyvycxk251bn"
										width="304" height="78" name="a-ow5gfwrx3qm7"></iframe>
								</div>
								<textarea id="g-recaptcha-response" name="g-recaptcha-response"
									class="g-recaptcha-response" required="required"
									style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
							</div>
							<iframe style="display: none;"></iframe>
						</div>
						
					</div>  -->
					 
					<!-- <div class="form-terms">
                          <input type="checkbox">
                          <span>I agree all statements in <a href="">Terms & Conditions</a></span>
                    </div> -->
                    
					<div class="container-login100-form-btn m-t-17">
						<button type="submit" class="login100-form-btn">ĐĂNG KÝ</button>
					</div>

					<div class="clearfix"></div>
					<div class="p-t-10 col-md-12">
						<!-- <center> -->
						<span class="txt1"> Hoặc </span>
						<!-- </center> -->
					</div>

					<!-- <a style="width: 100%;" href="javascript:void(0)"
						onclick="return login();" class="btn-face m-b-20"> <i class="fa fa-facebook-official"></i> Đăng nhập bằng Facebook
					</a> -->

					<!-- <div class="flex-c-m">
						<a href="#" class="login100-social-item bg1"> <i
							class="fa fa-facebook"></i>
						</a> <a href="#" class="login100-social-item bg2"> <i
							class="fa fa-twitter"></i>
						</a> <a href="#" class="login100-social-item bg3"> <i
							class="fa fa-google"></i>
						</a>
					</div> -->
					<div class="w-full text-center">
						<span class="txt2"> Bạn có tài khoản? </span> <a href="<c:url value="/dang-nhap?action=login"/>"
							class="txt2 bo1"> Đăng nhập </a>
					</div>
				</form>
			</div>	
		</div>	
	</div>	
				
<script type="text/javascript">
	document.querySelector('#today').valueAsDate = new Date();
	
	$(document).ready(function() {
		$('#password, #confirmNewPassword').on('keyup', function() {
			if ($('#password').val() == $('#confirmNewPassword').val()) {
				$('#alert').hide();
			} else {
				$('#alert').show();
			}
		});
	});
</script>
