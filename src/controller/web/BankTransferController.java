package controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonateDetailModel;
import service.IDonateDetailServive;
import util.FormUtil;

/**
 * Servlet implementation class BankTransformController
 */
@WebServlet(urlPatterns = "/chuyen-khoan-ngan-hang")
public class BankTransferController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateDetailServive detailService;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonateDetailModel detailModel = FormUtil.toModel(DonateDetailModel.class, request);
		detailModel = detailService.findOne(detailModel.getId());
		request.setAttribute("detailModel", detailModel);
		request.getRequestDispatcher("/view/web/bank-transfer.jsp").forward(request, response);
	}

}
