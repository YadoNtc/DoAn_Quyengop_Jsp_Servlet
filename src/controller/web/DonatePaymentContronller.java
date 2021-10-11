package controller.web;

import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonateDetailModel;
import model.DonateModel;
import service.IDonateDetailServive;
import service.IDonateService;
import util.ConvertDate;
import util.FormUtil;

/**
 * Servlet implementation class DonatePayContronller
 */
@WebServlet(urlPatterns = {"/chi-tiet-quyen-gop"})
public class DonatePaymentContronller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateService donateService;
	
	@Inject
	private IDonateDetailServive donateDetailService;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("paypal")) {
			request.setAttribute("model", donateService.findAll());
			request.getRequestDispatcher("/view/web/donateByPaypal.jsp").forward(request, response);		
		} else if (action != null && action.equals("bank")) {
			DonateModel model = FormUtil.toModel(DonateModel.class, request);
			request.setAttribute("model", donateService.findAll());
			if (model.getId() != null) {
				model = donateService.findOne(model.getId());
			}
			try {
				model.setListResult(donateService.findAll());
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("DonatePaymentController: " + e.getMessage());
			}
			request.setAttribute("model", model);			
			request.getRequestDispatcher("/view/web/donateByBank.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");
		DonateDetailModel detailModel = FormUtil.toModel(DonateDetailModel.class, request);
		detailModel.setStatus("transferring");
		try {
			detailModel = donateDetailService.save(detailModel);
			
			response.sendRedirect(request.getContextPath() + "/chuyen-khoan-ngan-hang?id="+detailModel.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
