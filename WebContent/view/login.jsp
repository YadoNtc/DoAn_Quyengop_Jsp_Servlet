<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="loginGg" value="/dang-nhap-fbgg?action=google" />
<c:url var="loginFb" value="/dang-nhap-fbgg?action=facebook" /> 
<c:url var="index" value="/trang-chu"/>
<!DOCTYPE html>

<div class="limiter">
	<div class="container-login100"
		style="background-image: url('template/login/images/bg-01.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-20 p-b-54">
			
			<form action="<c:url value="/dang-nhap"/>" class="login100-form validate-form" method="post">			
				<input id="form-token" type="hidden" name="_csrf" value=""/>
				<span class="login100-form-title p-b-49"> Đăng nhập </span>
				<c:if test="${not empty message}"> 
					<p style="font-style: italic; font-family: inherit;" class="alert alert-${alert}"> 							
						${message}
					</p>
				</c:if>

				<div class="wrap-input100 validate-input m-b-23" data-validate="Vui lòng nhập email">
					<span class="label-input100">Tài khoản</span> 
					<input id="select_user" class="input100" type="email" name="email" placeholder="Nhập email" value="">
					<span class="focus-input100" data-symbol="&#xf206;"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate="Vui lòng nhập mật khẩu">
					<span class="label-input100">Mật khẩu</span> 
					<input class="input100" type="password" name="password" placeholder="Nhập mật khẩu" value=""> 
					<span class="focus-input100" data-symbol="&#xf190;"></span>
				</div>				

				<div class="p-t-8 p-b-31">
					<a href="<c:url value="/reset-pass"/>"> Quên mật khẩu? </a>
				</div>
				
				<!-- <div style="margin-top: 10px; margin-bottom: 0px;" 
					class="alert alert-danger alert-dismissable col-md-12 error-loginservice">Thông tin chưa chính xác!
				</div> -->

				<div class="container-login100-form-btn">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button type="submit" class="login100-form-btn">Đăng nhập</button>
						<input type="hidden" value="login" name=action />
					</div>
				</div>

				<div class="txt1 text-center p-t-20 p-b-20">
					<span> Hoặc đăng nhập sử dụng </span>
				</div>

				<div class="flex-c-m">
					<!-- <a href="#" onclick="return checkLoginState();" class="login100-social-item bg1"> <i
						class="fa fa-facebook"></i>
					 </a> --> 				
					<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
					</fb:login-button>
					<a id="customBtn" href="#" class="login100-social-item bg3"> <i
						class="fa fa-google"></i>
					</a>
				</div>

				<div class="flex-col-c p-t-20">
					<span class="txt1 p-b-17"> Chưa có tài khoản </span> <a
						href="<c:url value="/dang-ky"/>" class="txt2"> Đăng ký mới </a>
				</div>
				<!-- <div
				  class="fb-like"
				  data-share="true"
				  data-width="450"
				  data-show-faces="true">
				</div> -->
			</form>
		</div>
		
		<script>

	    var googleUser = {};
	    var startApp = function() {
	        gapi.load('auth2', function(){
	            // Retrieve the singleton for the GoogleAuth library and set up the client.
	            auth2 = gapi.auth2.init({
	                client_id: '10240492001-hbkj142i2pb79pfjl2d1vllje5fr4ict.apps.googleusercontent.com',
	                cookiepolicy: 'https://google.com',
	                // Request scopes in addition to 'profile' and 'email'
	                //scope: 'additional_scope'
	            });
	            attachSignin(document.getElementById('customBtn'));
	        });
	    };
	
	    function attachSignin(element) {
	        // console.log(element.id);
	        auth2.attachClickHandler(element, {},
	            function(googleUser) {
	                var idgg = googleUser.getBasicProfile().getId();
	                var fullName = googleUser.getBasicProfile().getFamilyName() + ' ' + googleUser.getBasicProfile().getGivenName();
	                var email = googleUser.getBasicProfile().getEmail();
	                var avatar = googleUser.getBasicProfile().getImageUrl();
	                console.log('idgg: '+ idgg);
	                console.log('email: '+ email);
	                console.log('fullName: '+ fullName);
	                console.log('avatar: '+ avatar);
	                if(email != ''){
	                    $.ajax({
	                        url: '${loginGg}',
	                        type: 'post',
	                        data: {
	                            'idgg': idgg,
	                            'email': email,
	                            'fullName': fullName,
	                            'avatar': avatar,	                            
	                        },
	                        success: function (response) {
	                            location.href = "${index}";
	                        }
	                    })
	                } else{
	                    alert('Không thể đăng nhập bằng Google lúc này');
	                }
	
	            },
            );
	    }
	    startApp();
	
	    window.fbAsyncInit = function() {
			FB.init({				
				appId : '978806999366789',
				cookie : true,
				xfbml : true,
				version : 'v12.0'
			});
			FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function checkLoginState() {               // Called when a person is finished with the Login Button.
		    FB.getLoginStatus(function(response) {   // See the onlogin handler
		    	statusChangeCallback(response);
		    });
		  }
		
		function statusChangeCallback(response) {
				if (response.status === 'connected') {
					console.log(response);
					testApi();
				} else {
					console.log("Error: nologin Fb");
				}			
		}	
		
		// get user basic info
		function testApi() {		
			FB.api(
				'/me',
				'GET',
				{
					fields : 'id, name, email, birthday'
				},
				function(response) {
					var idfb = response.hasOwnProperty('id') ? response.id: '';
					var email = response.hasOwnProperty('email') ? response.email: '';
					var fullName = response.hasOwnProperty('name') ? response.name: 'HỌ và tên';
					var birthday = response.hasOwnProperty('birthday') ? response.birthday: '';
					if (email != '') {							
						console.log("Id: " + idfb);
	                    console.log("Fullname: " + fullName);
	                    console.log("Email: " + email);
	                    console.log("Year: " + birthday);
						$.ajax({
							url : '${loginFb}',
							type : 'post',
							data : {
								'idfb' : idfb,
								'email' : email,
								'fullName' : fullName,															
							},
							success : function(response) {											
								location.href = "${index}";
							}
						})
					} else {
						alert('Không thể đăng nhập bằng facebook lúc này');
					}
				});
		}
	    
	   /*  $(document).ready(function(){
	        let back_url = "http://google.com";
	        $('.error-loginservice').hide();
	        $("#login_normal").submit(function(e){
	            e.preventDefault();
	        });
	
	
	        $('.login-service').on('click',function(){
	            var email = $('input[name="email"]').val();
	            var password = $('input[name="pass"]').val();
	            let pin_code = $('input[name="pin_code"]').val();
	            var token = $('#form-token').val();
	            var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
	            let phone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
	            let id_user = 0;
	
	            if ($('#select_user').length > 0) {
	                id_user = Number($('#select_user').val());
	            }
	
	            if (testEmail.test(email) == false &&
	                phone.test(email) ==  false &&
	                password.length >= 6
	            ) {
	                $('.error-loginservice').show().html("Thông tin chưa chính xác!");
	            } else {
	                phone.test(email);
	
	                if (phone.test(email) == false) {
	                    var type = 'email';
	                } else {
	                    var type = 'phone';
	                }
	
	                $.ajax({
	                    url: "/site/loginservicev2",
	                    type: 'POST',
						//dataType: 'JSON',
	                    data: {type:type,id_user:id_user,email : email,pass : password,_csrf : token},
	                    success: function(res){
							let back_link = '';
							
							if (res.status && res.link){
								back_link = res.link;
							}
	                        res = JSON.parse(res);
	                        if (res.code) {
	                            $('.pin-code').show();
	                            return;
	                        }
	
	                        if (res.reload) {
	                            window.location.reload();
	                        }
	
	                        if (type == 'email') {
	                            if(res.status){
	                                location.href = back_link;
	                            }else{
	                                window.location.reload();
	                            }
	                        } else {
	                            if (res.status && res.link) {
	                                location.href = back_link;
	                            } else if (res.status && res.arr_user.length > 1) {
	                                let html = '<select style="height:40px;" id="select_user" class="wrap-input100 validate-input">';
	
	                                for (var i = 0; i < res.arr_user.length; i++) {
	                                    html += '<option value="'+res.arr_user[i].ID+'">'+res.arr_user[i].Username+'</option>';
	                                }
	
	                                html += '</select>';
	                                if (!$('#select_user').length > 0) {
	                                    $('.select-user').append(html);
	                                } 
	                            } else {
	                                window.location.reload();
	                            }
	                        }
	                    }
	                });
	            }
	        });
	    }); */
	</script>  
	</div>
</div>

<div id="dropDownSelect1"></div>