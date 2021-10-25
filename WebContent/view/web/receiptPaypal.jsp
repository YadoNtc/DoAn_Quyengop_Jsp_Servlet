<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paypal</title>
</head>
<body>
	<div align="center" style="margin-top: 140px;">
	    <h1>Quyên góp hoàn tất. Cảm ơn tấm lòng của bạn!</h1>
	    <br/>
	    <h2>Chi tiết quyên góp:</h2>
	    <table style="box-shadow: 2px 0px 10px 4px darkgrey;">
	        <tr>
	            <td><b>Merchant:</b></td>
	            <td>Company ABC Ltd.</td>
	        </tr>
	        <tr>
	            <td><b>Họ tên:</b></td>
	            <td>${payer.firstName} ${payer.lastName}</td>      
	        </tr>
	        <tr>
	            <td><b>Tên Chương trình:</b></td>
	            <td>${transaction.description}</td>
	        </tr>
	        <%-- <tr>
	            <td><b>Subtotal:</b></td>
	            <td>${transaction.amount.details.subtotal} USD</td>
	        </tr> --%>
	        <%-- <tr>
	            <td><b>Shipping:</b></td>
	            <td>${transaction.amount.details.shipping} USD</td>
	        </tr>
	        <tr>
	            <td><b>Tax:</b></td>
	            <td>${transaction.amount.details.tax} USD</td>
	        </tr> --%>
	        <tr>
	            <td><b>Số tiền quyên góp:</b></td>
	            <td>${transaction.amount.total} USD</td>
	        </tr>                    
	    </table>
	</div>
</body>
</html>