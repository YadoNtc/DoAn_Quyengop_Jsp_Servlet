<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<main style="padding: 104px 0">
	
	<div class="row" style="display: inline-block;">
	    <div style="color: #2ebec0; margin: 50px 0 0 150px;" class="col-md-12">
	        <h3>CÙNG THẮP SÁNG ƯỚC MƠ CỦA HÀNG TRIỆU GIA ĐÌNH VIỆT NAM</h3>
	    </div>
    </div>
    <div class="container-fluid form-donate">
	    <div class="container">
	        <div class="row">
	            <div style="margin-top:63px;" class="col-md-8">
	                <form name="donateForm" method="post" target="_self" action="">		         	
	                    <div class="amountDiv">  
	                    	<input type="hidden" name="hosted_button_id" id="hosted_button_id" value="">                                            
	                        <h4 class="tertiary-color text-uppercase">Vui lòng chọn số tiền quyên góp</h4>
	                        <div id="myDIV" class="text-center" style="padding: 20px 0px;height: 100px;">
	                            <a id="btn-10" class="btn btn-amount btn-active" onclick="setDataType(this)" role="button">10USD</a>
	                            <a id="btn-50" class="btn btn-amount" onclick="setDataType(this)" role="button">50 USD</a>
	                            <a id="btn-100" class="btn btn-amount" onclick="setDataType(this)" role="button">100 USD</a>
	                            <a id="btn-500" class="btn btn-amount" onclick="setDataType(this)" role="button">500 USD</a>
	                            
	                            <div class="text-left" style="border-bottom: 1px solid #d9d9d9; display: none;">
	                                <input id="other-amount" class="" type="number" name="amountMoney" placeholder="Số khác">
	                            </div>
	                        </div>
	                        
	                        <div class="donate-payment-account">
	                        <h4 class="tertiary-color text-uppercase">thông tin liên lạc</h4>
	                        <div class="form-group">
	                            <c:if test="${not empty userModel}">
	                        		<input class="form-control" id="fullName" name="fullName" type="text" placeholder="Họ & tên" required value="${userModel.fullName}">	                
	                            	<input class="form-control" id="email" name="email" type="email" placeholder="Email" required value="${userModel.email}">
	                           	 	<input class="form-control" id="mobile" name="mobile" type="number" placeholder="Số điện thoại" required value="${userModel.mobile}">
	                        	</c:if>
	                            <c:if test="${empty userModel}">
	                        		<input class="form-control" id="fullName" name="fullName" type="text" placeholder="Họ & tên" required value="">	                
	                            	<input class="form-control" id="email" name="email" type="email" placeholder="Email" required value="">
	                           	 	<input class="form-control" id="mobile" name="mobile" type="number" placeholder="Số điện thoại" required value="">
	                        	</c:if>
	
	                        </div>
	                    </div>
	                        
	                    </div> 	                    	                                    
	                    <div class="donationCampaignHeader">
	                        <!-- <img src="https://onehealth.foundation/wp-content/themes/thewish/img/icon/icon-ohf-white.png"> -->
	                        <span>nếu bạn muốn quyên góp<br>cho các chiến dịch riêng biệt</span>
	                    </div>
	                    <div class="amountDiv donationCampaign">
	                        <div id="" class="content clearfix paddingtopmore item-form-container paddingbottom15 uniform-designation">
	                            <span class="heading">Tôi muốn đóng góp cho chương trình:</span>
	                            <div class="selector" id="">
	                                <%-- <input type="hidden" name="campaginId" id="campaginId" value="${model.id}"> --%>
	                                <select class="form-control" id="campaginId" name="campaginId">
                                		<option value=""></option>
		                                	<c:forEach var="item" items="${model}">
                                				<c:if test="${item.status == 'inprogress'}">
		                                		<option value="${item.id}">${item.name}</option>
	                                			</c:if>
		                                	</c:forEach>
	                                </select>
	                            </div> 	
	                          
	                        </div>
	                    </div>
	                    
	                    <div class="amountDiv donate-payment-option" style="margin-top: 15px;">
	                        <h4 class="tertiary-color text-uppercase">Phương thức quyên góp</h4>
	                        <div class="text-center p-3">
	                            <input type="hidden" id="payment_Mode" name="payment_Mode" value="">
	                            <a id="epay" onclick="check_payment_option('epay', this);" class="tertiary-bg" role="button">Thẻ tín dụng/ Thẻ ghi nợ</a>
	                            <a id="paypal" onclick="check_payment_option('paypal', this);" class="tertiary-bg" role="button"><img src="<c:url value="template/web/image/logo-paypal.png"/>"></a>
	                            <div id="selectBank" class="selectBank">
	                                <input type="hidden" class="input_text" name="fullName" value="">
	                                <input type="hidden" class="input_text" name="txnAmount" id="txnAmount" value="">
	                                <input type="hidden" class="input_text" name="fee" value="">
	                                <input type="hidden" class="input-text" id="bankID_text" name="" value="">
	                                <select id="bankID" name="bankID" class="input_text d-none">
	                                    <option value="0">Chọn ngân hàng</option>
	                                    <option value="99001">Agribank</option>
	                                    <option value="99002">Saigonbank</option>
	                                    <option value="99003">PG Bank</option>
	                                    <option value="99004">GP Bank</option>
	                                    <option value="99005">Sacombank</option>
	                                    <option value="99006">Nam Á Bank</option>
	                                    <option value="99007">Đông Á bank</option>
	                                    <option value="99008">Vietinbank</option>
	                                    <option value="99009">Techcombank</option>
	                                    <option value="99010">VIB</option>
	                                    <option value="99011">HDBank</option>
	                                    <option value="99012">Eximbank</option>
	                                    <option value="99013">TienphongBank</option>
	                                    <option value="99014">Maritime Bank</option>
	                                    <option value="99015">BIDV</option>
	                                    <option value="99016">MB</option>
	                                    <option value="99017">Seabank</option>
	                                    <option value="99018">SHB</option>
	                                    <option value="99019">Việt Á Bank</option>
	                                    <option value="99020">OceanBank</option>
	                                    <option value="99021">Vietcombank</option>
	                                    <option value="99022">VP Bank</option>
	                                    <option value="99023">ACB</option>
	                                    <option value="99027">NaviBank</option>
	                                    <option value="99026">Bắc á</option>
	                                </select>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="text-center btn-submit">	
	                        <button type="submit" id="submit" class="text-uppercase">quyên góp ngay</button>
	                    </div>
	                    <input type="hidden" name="task" value="donate">
	                    <br>
	                </form>
	            </div>
	            <div class="col-md-4 form-donate-info">
	                <div>
	                    <div class="text-center icon-logo" style="margin-bottom: 15px;">
	                        <img class="logoOHF_info" src="data:image/webp;base64,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">
                        </div>
	                    <p>Khoản tiền tài trợ của bạn, dù lớn hay nhỏ, đều quan trọng với chúng tôi trên hành trình mang lại nụ cười và tương lai cho trẻ em có hoàn cảnh khó khăn, cải thiện chất lượng các cơ sở y tế và tuổi trẻ Việt Nam.</p>
	                    <img class="img" src="<c:url value="/template/web/image/Img_donate_frm1.jpg"/>">
	                    <img class="img" src="<c:url value="/template/web/image/Img_donate_frm2.jpg"/>">
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

</main>

<script type="text/javascript">
	function check_payment_option(paymentMode, obj) {
		var _payment_option = paymentMode;
		$('div.donate-payment-option').find('a').removeClass('on');
		$(obj).addClass('on');
		document.getElementById('payment_Mode').value = paymentMode;
		if (paymentMode == 'epay') {
			document.donateForm.action = "";
			$('#submit').removeClass('onclick');
			$('#bankID').removeClass('d-none');
		} else {
			$('#submit').attr("onclick", "submitTwice(this.form)");
			$('#bankID').addClass('d-none');
		}
	}
	
	function submitTwice(form) {
		if (document.getElementById('payment_Mode').value = "paypal") {
			form.action = 'https://paypal.me/quyengop?locale.x=vi_VN';
			form.submit();
		}
	}
	
	function reset() {
        document.getElementById('btn-10').classList.remove('btn-active');
        document.getElementById('btn-50').classList.remove('btn-active');
        document.getElementById('btn-100').classList.remove('btn-active');
        document.getElementById('btn-500').classList.remove('btn-active');
    }
	
	function setDataType(ele) {
		var x = ele.innerHTML;
		var y = 23000;
		if (x == "10 USD") {
            document.getElementById('hosted_button_id').value = '5UWGESJZVYST4';
            document.getElementById('txnAmount').value = 10 * y;
            reset();
            ele.classList.add('btn-active');
        }
        if (x == "50 USD") {
            document.getElementById('hosted_button_id').value = '7E6T7S4TSBKZG';
            document.getElementById('txnAmount').value = 50 * y;
            reset();
            ele.classList.add('btn-active');
        }
        if (x == "100 USD") {
            document.getElementById('hosted_button_id').value = '394Z7KQKEHAQC';
            document.getElementById('txnAmount').value = 100 * y;
            reset();
            ele.classList.add('btn-active');
        }
        if (x == "500 USD") {
            document.getElementById('hosted_button_id').value = 'MUXXK4XFJJ5EE';
            document.getElementById('txnAmount').value = 500 * y;
            reset();
            ele.classList.add('btn-active');
        }
        document.getElementById('other-amount').value = "";
	}
</script>