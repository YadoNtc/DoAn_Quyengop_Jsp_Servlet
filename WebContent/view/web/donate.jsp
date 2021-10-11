<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<main style="padding: 104px 0">
	
	<div class="container-fluid p-4">
        <div class="container">
            <div class="row" style="color: #2ebec0">
                <h2>Chung tay Quyên góp...</h2>
            </div>
            <div class="row">
                <div class="col-md-7">
                    <p>Hãy quyên góp cho chúng tôi để giảm tỷ lệ hộ nghèo ở Việt Nam và xây dựng một hệ thống y tế bền vững cho hàng ngàn người ở Việt Nam.</p>
					<p>Đồng hành cùng chúng tôi và chúng ta sẽ làm nên lịch sử...</p>
                </div>
                <div class="col-md-5">
                    <img src="<c:url value="/template/web/image/donate-img_1.jpg"/>" alt="" width="100%">
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid p-4">
        <div class="container">
            <div class="row" style="color: #2ebec0" data-wpmeteor-mouseover="true" data-wpmeteor-mouseout="true">
                <div class="" style="width: 70%;position: relative;margin: auto;" data-wpmeteor-mouseover="true" data-wpmeteor-mouseout="true">
                    <h2 style="font-weight: bolder">PHƯƠNG THỨC QUYÊN GÓP</h2>
                    <div style="margin-top: 20px;" class="col-md-12">
                        <a href="<c:url value="/chi-tiet-quyen-gop?action=paypal"/>">
                            <img src="<c:url value="/template/web/image/paypal.jpg"/>" alt="" width="100%" data-wpmeteor-mouseover="true" data-wpmeteor-mouseout="true">
                        </a>
                    </div>
                    <div style="margin-top: 20px;" class="col-md-12">
                        <a href="<c:url value="/chi-tiet-quyen-gop?action=bank"/>">
                            <img src="<c:url value="/template/web/image/bank.jpg"/>" alt="" width="100%" data-wpmeteor-mouseover="true">
                        </a>
                    </div>
					<input type="hidden" name="action" />
                    

                    <div class="pt-5">
                        <p style="color: #2ebec0;">* Tuyên bố và bảo lãnh</p>
						<p>Chúng tôi đảm bảo rằng tiền của người quyên góp sẽ được sử dụng cho mục đích chính đáng và đúng ý nghĩa hoạt động của tổ chức.<br>
							Ngoài ra tiền đã được quyên góp không được hoàn lại và trở thành tài sản của quỹ bảo trợ.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>