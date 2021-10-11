package controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonateModel;
import service.IDonateService;
import util.ConvertDate;
import util.FormUtil;
import util.MessageUtil;

/**
 * Servlet implementation class EditContronller
 */
@WebServlet("/admin-project-edit")
public class EditProjectContronller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Inject
	private IDonateService donateService;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		DonateModel model = FormUtil.toModel(DonateModel.class, request);
		model.setListResult(donateService.findAll());
		if (model.getId() != null) {
			model = donateService.findOne(model.getId());
		}
		MessageUtil.MessageShow(request);
		request.setAttribute("model", model);
		request.getRequestDispatcher("/view/admin/project/edit.jsp").forward(request, response);
	}



}
