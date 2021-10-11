<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<div class="limiter">
    <div class="container-login100" style="background-image: url('template/login/images/bg-01.jpg');padding-top: 10%;">
        <div class="text-center form-group" style="width: 100%"></div>
		<div class="wrap-login100 p-l-110 p-r-110 p-t-20 p-b-33">

                <form method="POST" class="login100-form validate-form flex-sb flex-w">
                    <input id="form-token" type="hidden" name="_csrf" value="#"/>
                    <div class="p-t-10 p-b-10 col-md-12" style="text-align: center;color: #555">
                        <h3>LẤY LẠI MẬT KHẨU</h3>
                    </div>

                    <div class="p-t-31 p-b-9">
                        <span class="txt1">
                            
                            Nhập địa chỉ email bạn đã đăng ký, chúng tôi sẽ
                            giúp bạn lấy lại mật khẩu
                            
                        </span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate = "Yêu cầu nhập Email của bạn">
                        <input placeholder="Địa chỉ Email bạn đã đăng ký" class="input100" type="email" name="email" value="" >
                        <span class="focus-input100"></span>
                    </div>         
                    
                    <div class="container-login100-form-btn m-t-17">
                        <button class="login100-form-btn">
                            Gửi mật khẩu cho tôi
                        </button>
                    </div>

                </form>
            </div>   
   	</div>
</div>


<div id="dropDownSelect1"></div>