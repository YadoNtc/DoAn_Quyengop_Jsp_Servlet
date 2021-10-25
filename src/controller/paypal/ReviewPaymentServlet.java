 package controller.paypal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import util.PaymentServices;

/**
 * Servlet implementation class ReviewPaymentServlet
 * Hiển thị trang xem lại thanh toán
 */
@WebServlet(urlPatterns = "/review_payment")
public class ReviewPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        
        try {
        	PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.getPaymentDetails(paymentId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			request.setAttribute("shippingAddress", shippingAddress);
			
			String url = "/view/web/reviewPaypal.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
			
			request.getRequestDispatcher(url).forward(request, response);
		} catch (PayPalRESTException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/view/web/errorPaypal.jsp").forward(request, response);
		}
	}



}
