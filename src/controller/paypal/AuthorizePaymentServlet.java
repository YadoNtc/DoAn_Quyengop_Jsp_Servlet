package controller.paypal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.base.rest.PayPalRESTException;

import model.DonateDetailModel;
import util.FormUtil;
import util.PaymentServices;

/**
 * Servlet implementation class AuthorizePaymentServlet
 * Gửi thông tin chi tiết đến đến Paypal để xét duyệt 
 */
@WebServlet(urlPatterns = {"/paypal", "/paypal/cancel", "/paypal/success"})
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final String SUCCESS_URL = "paypal/success";
	public static final String CANCEL_URL = "paypal/cancel";
	
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { DonateDetailModel
		  detailModel = FormUtil.toModel(DonateDetailModel.class, request);
		  try {
	 
			  PaymentServices paymentServices = new PaymentServices(); 
			  String approvalLink  = paymentServices.authorizePayment(detailModel);  
			  response.sendRedirect(approvalLink); 
		  } catch (PayPalRESTException e) {
			  e.printStackTrace(); request.setAttribute("errorMessage", e.getMessage());
			  request.getRequestDispatcher("/view/web/errorPaypal.jsp").forward(request,response); 
		  }
	  } 
	
	/*
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		String success = request.getParameter(SUCCESS_URL);
		String cancel = request.getParameter(CANCEL_URL);
		String url = request.getRequestURI();
		if (url.contains(success)) {
			try {
				Payment payment = paypalService.excutePayment(paymentId, payerId);
				if (payment.getState().equals("approved")) {
					request.getRequestDispatcher("/view/web/receiptPaypal.jsp").forward(request, response);
				}

				
			} catch (PayPalRESTException e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/view/web/errorPaypal.jsp").forward(request, response);
			}
		} else if (url.contains(cancel)) {
			request.getRequestDispatcher("/view/web/donateByPaypal.jsp").forward(request, response);
		}
		
	}
	 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonateDetailModel detailModel = FormUtil.toModel(DonateDetailModel.class, request);
		try {

			Payment payment = paypalService.createdPayment(detailModel,"paypal", "http://localhost:8081/com.doan.quyengop/" + CANCEL_URL,
					"http://localhost:8081/com.doan.quyengop/" + SUCCESS_URL, "USD", "sale");
			
			for(Links link : payment.getLinks()) {
				String approvalLink = null;
				if (link.getRel().equals("approval_url")) {
					approvalLink = link.getHref();
					response.sendRedirect(approvalLink);
				}			
			}
		} catch (PayPalRESTException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/view/web/errorPaypal.jsp").forward(request, response);
		}
				
	}	*/

}
