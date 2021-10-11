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

@WebServlet (urlPatterns = "/admin-project-list")
public class ListProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateService donateService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ConvertDate.convertDate();
		DonateModel model = FormUtil.toModel(DonateModel.class, req);
		model.setListResult(donateService.findAll());
		MessageUtil.MessageShow(req);
		req.setAttribute("model", model);
		req.getRequestDispatcher("/view/admin/project/list.jsp").forward(req, resp);
	}
}
