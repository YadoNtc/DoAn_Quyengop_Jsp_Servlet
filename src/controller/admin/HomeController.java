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
import util.FormUtil;

@WebServlet (urlPatterns = "/admin-home")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateService donateService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DonateModel donateModel = FormUtil.toModel(DonateModel.class, req);
		try {
			int newCampagin = donateService.countTotalCampagin();
			int completed = donateService.countTotalItemCompleted();
			donateModel.setTotalItem(donateService.countTotalItem());
			req.setAttribute("newCampagin", newCampagin);
			req.setAttribute("completed", completed);
			req.setAttribute("model", donateModel);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Admin Home: " + e.getMessage());
		}
		req.getRequestDispatcher("/view/admin/home.jsp").forward(req, resp);
	}
}
