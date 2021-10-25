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
	                <form id="donateForm" method="post" action="chi-tiet-quyen-gop">		         	
	                    <div class="amountDiv">                                              
	                        <h4 class="tertiary-color text-uppercase">Vui lòng chọn số tiền quyên góp</h4>
	                        <div id="myDIV" class="text-center" style="padding: 20px 0px;height: 100px;">                         
	                            <select id="selectMoney" class="form-select" name="amoutMoney" style="border-color: #9c828255;">
									  <option value="">Chọn số tiền muốn quyên góp</option>
									  <optgroup label="Từ 10 ngàn đồng đến 100 ngàn đồng">
										  <option value="10000">10 ngàn đồng</option>
										  <option value="10000">20 ngàn đồng</option>
										  <option value="50000">50 ngàn đồng</option>
										  <option value="100000">100 ngàn đồng</option>
									  </optgroup>
									  <optgroup label="Từ 200 ngàn đồng đến 1 triệu">
										  <option value="200000">200 ngàn đồng</option>
										  <option value="500000">500 ngàn đồng</option>
										  <option value="700000">700 ngàn đồng</option>
										  <option value="1000000">1 triệu đồng</option>
									  </optgroup>
									  <optgroup label="Từ 2 triệu đến 10 triệu">
										  <option value="2000000">2 triệu đồng</option>
										  <option value="5000000">5 triệu đồng</option>
										  <option value="7000000">7 triệu đồng</option>
										  <option value="10000000">10 triệu đồng</option>
									  </optgroup>
								</select>
                                <input id="amoutMoney" type=number name="amoutMoney" placeholder="Số khác" style="width: 100%; border: 1px solid #d9d9d9; display:none"  value="">
	                            <div class="text-left mt-2" style="border-bottom: 1px solid #d9d9d9; width: 100%">
	                            	<input type="button" onclick="return showMoney();" id="btnMoney" class="btn btn-primary" value="Số khác">
	                            </div>
	                        </div>
	                        
	                        <div class="donate-payment-account">
	                        <h4 class="tertiary-color text-uppercase">thông tin liên lạc</h4>
	                        <div class="form-group">
	                        	<c:if test="${not empty userModel}">
	                        		<input class="form-control" id="fullName" name="fullName" type="text" placeholder="Họ & tên" required value="${userModel.fullName}">	                
	                            	<input class="form-control" id="email" name="email" type="email" placeholder="Email" required value="${userModel.email}">
	                           	 	<input class="form-control" id="mobile" name="mobile" type="number" placeholder="Số điện thoại" required value="${userModel.mobile}">
	                           	 	<input type="hidden" name="userId" value="${userModel.id}"/>
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
	                        <span>nếu bạn muốn quyên góp<br>cho các chiến dịch riêng biệt</span>
	                    </div>
	                    
	                    <div class="amountDiv donationCampaign">
	                        <div id="" class="content clearfix paddingtopmore item-form-container paddingbottom15 uniform-designation">
	                            <span class="heading">Tôi muốn đóng góp cho chương trình:</span>
	                            <div class="selector mt-2">
	                                <!-- <input type="hidden" name="campaginId" id="campaginId" value=""> -->
	                                <select class="form-control" name="campaginId" id="campaginId" value="">
	                                	<option value=""></option>
                       					<c:if test="${empty model.id}">
                        					<c:forEach var="item" items="${model.listResult}">
                        						<c:if test="${item.status == 'inprogress'}">
                         							<option value="${item.id}">${item.name}</option>	                                			                                		
                         						</c:if>
                          					</c:forEach>
                       					</c:if>
                        					<c:if test="${not empty model.id}">                              								                    								
                     							<c:forEach var="item" items="${model.listResult}">
                        						<c:if test="${item.status == 'inprogress'}">	                         						
                         							<option value="${item.id}"
	                          							<c:if test="${item.id == model.id}">
	                         								selected="selected"
	                         							</c:if>>
	                         							${item.name}	                         					
                         							</option>	                                			                                		
                         						</c:if>
                          					</c:forEach>	                                			                                					                        				                                			                                		
                   						</c:if>                               				                         							
	                                </select>
	                            </div> 	
	                          
	                        </div>
	                    </div>	                    	            
	
	                    <div class="text-center btn-submit">	
	                       <button type="submit" id="submit" class="text-uppercase">quyên góp ngay</button> 	                   
	                    </div>	       
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
	<%-- <a href="<c:url value="/chuyen-khoan-ngan-hang"/>" class="text-uppercase btn btn-active">quyên góp ngay</a> --%>

</main>

<script type="text/javascript">
	
	function showMoney() {
		$('#selectMoney').hide();
		$('#selectMoney').prop('disabled', true);
		$('#amoutMoney').show();
	}
</script>