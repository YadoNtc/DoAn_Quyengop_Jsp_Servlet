<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
</head>
<body>
	<div align="center" style="margin-top: 140px;">
	    <h1>Vui lòng kiểm tra thông tin trước khi tiếp tục</h1>
	    <form action="execute_payment" method="post">
	    <table class="table-hover" style="box-shadow: 2px 0px 10px 4px darkgrey;">
	        <tr>
	            <td colspan="2"><b>Chi tiết quyên góp:</b></td>
	            <td>
	                <input type="hidden" name="paymentId" value="${param.paymentId}" />
	                <input type="hidden" name="PayerID" value="${param.PayerID}" />
	            </td>
	        </tr>
	        <tr>
	            <td>Tên chương trình:</td>
	            <td>${transaction.description}</td>
	        </tr>
	       <%--  <tr>
	            <td>Số tiền:</td>
	            <td>${transaction.amount.details.subtotal} USD</td>
	        </tr> --%>
	        <%-- <tr>
	            <td>Shipping:</td>
	            <td>${transaction.amount.details.shipping} USD</td>
	        </tr>
	        <tr>
	            <td>Tax:</td>
	            <td>${transaction.amount.details.tax} USD</td>
	        </tr> --%>
	        <tr>
	            <td>Số tiền đã quyên góp:</td>
	            <td>${transaction.amount.total} USD</td>
	        </tr>
	        <tr><td><br/></td></tr>
	        <tr>
	            <td colspan="2"><b>Thông tin người thanh toán:</b></td>
	        </tr>
	        <tr>
	            <td>Họ:</td>
	            <td>${payer.firstName}</td>
	        </tr>
	        <tr>
	            <td>Tên:</td>
	            <td>${payer.lastName}</td>
	        </tr>
	        <tr>
	            <td>Email:</td>
	            <td>${payer.email}</td>
	        </tr>
	        <tr><td><br/></td></tr>
	        <tr>
	            <td colspan="2"><b>Địa chỉ:</b></td>
	        </tr>
	        <tr>
	            <td>Họ tên:</td>
	            <td>${shippingAddress.recipientName}</td>
	        </tr>
	        <tr>
	            <td>Địa chỉ:</td>
	            <td>${shippingAddress.line1}</td>
	        </tr>
	        <tr>
	            <td>Thành phố:</td>
	            <td>${shippingAddress.city}</td>
	        </tr>
	        <tr>
	            <td>Tỉnh, Thành Phố:</td>
	            <td>${shippingAddress.state}</td>
	        </tr>
	        <tr>
	            <td>Quốc gia:</td>
	            <td>${shippingAddress.countryCode}</td>
	        </tr>
	        <tr>
	            <td>Mã bưu điện:</td>
	            <td>${shippingAddress.postalCode}</td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <input class="btn btn-info" type="submit" value="Tiếp tục" />
	            </td>
	        </tr>    
	    </table>
	    </form>
	</div>
</body>
</html>