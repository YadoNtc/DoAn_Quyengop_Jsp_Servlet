package controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DonateDetailModel;
import model.DonateModel;
import model.UserModel;
import service.IDonateDetailServive;
import service.IDonateService;
import service.IUserService;
import util.FormUtil;
import util.HashPassUtil;

@WebServlet (urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IUserService userService;
	
	@Inject
	private IDonateService donateService;
	
	@Inject
	private IDonateDetailServive detaiModelService;
	
	//Locale localeVi = new Locale("vi");
	ResourceBundle bundle = ResourceBundle.getBundle("message_vi");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");	
		if (action != null && action.equalsIgnoreCase("login")) {
			String message = req.getParameter("message");
			String alert = req.getParameter("alert");
			if (message != null && alert != null) {
				req.setAttribute("message", bundle.getString(message));
				req.setAttribute("alert", alert);
			}
			req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
		} else if (action != null && action.equalsIgnoreCase("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("userModel");
			resp.sendRedirect(req.getContextPath() + "/trang-chu");
		} else if (action != null && action.equalsIgnoreCase("register")) {
			req.getRequestDispatcher("/view/register.jsp").forward(req, resp);
		} else if (action != null && action.equalsIgnoreCase("about")) {
			req.getRequestDispatcher("/view/web/about.jsp").forward(req, resp);
			return;
		} else if (action != null && action.equalsIgnoreCase("detail")) {
			DonateModel donateModel = FormUtil.toModel(DonateModel.class, req);
			if (donateModel.getId() != null) {
				donateModel = donateService.findOne(donateModel.getId());
			}
			int total = detaiModelService.countTotalCampaigin(donateModel.getId());
			req.setAttribute("totalCampagin", total);
			req.setAttribute("model", donateModel);
			req.getRequestDispatcher("/view/web/detail.jsp").forward(req, resp);
			return;
		} else if (action != null && action.equalsIgnoreCase("donate")) {
			req.getRequestDispatcher("/view/web/donate.jsp").forward(req, resp);
			return;
		} else if (action != null && action.equalsIgnoreCase("profile")) {
			UserModel userModel = FormUtil.toModel(UserModel.class, req);
			userModel = userService.findOne(userModel.getId());
			req.setAttribute("model", userModel);
			req.getRequestDispatcher("/view/web/profile.jsp").forward(req, resp);
			return;
		} else if (action != null && action.equalsIgnoreCase("history")) {
			UserModel userModel = FormUtil.toModel(UserModel.class, req);
			try {
				if (userModel.getId() != null) {
					DonateDetailModel detailModel = new DonateDetailModel();
					detailModel.setListResult(detaiModelService.findByUserId(userModel.getId()));
					DonateModel donateModel = new DonateModel();
					List<DonateModel> listModel = new ArrayList<>();
					for (DonateDetailModel list : detailModel.getListResult()) {					
						donateModel = donateService.findOne(list.getCampaginId()); 			
						listModel.add(donateModel);
					}
					int toltalAmout = detaiModelService.coutTotalAmout(userModel.getId());
					req.setAttribute("toltalAmout", toltalAmout);
					donateModel.setListResult(listModel);
					req.setAttribute("donateModel", listModel);
					req.setAttribute("detailModel", detailModel);
				}
			req.getRequestDispatcher("/view/web/campagin-history.jsp").forward(req, resp);
			} catch (Exception e) {
				System.out.println("ActionHistory: " + e.getMessage());
			}				
			return;
		} else {
			DonateModel donateModel = new DonateModel();
			donateModel.setListResult(donateService.findAll());
			req.setAttribute("model", donateModel);
			req.getRequestDispatcher("/view/web/home.jsp").forward(req, resp);
		}
	}					
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		 
		String action = req.getParameter("action");
		if (action != null && action.equalsIgnoreCase("login")) {
			UserModel userModel = FormUtil.toModel(UserModel.class, req);
			userModel = userService.findAccount(userModel.getEmail(), HashPassUtil.hashMd5(userModel.getPassword()), true);
			if (userModel != null) {
				HttpSession session = req.getSession();
				session.setAttribute("userModel", userModel);
				req.setAttribute("user", userModel);
				if (userModel.isAdmin() == true) {
					resp.sendRedirect(req.getContextPath() + "/admin-home");
				} else if (userModel.isAdmin() == false) {
					resp.sendRedirect(req.getContextPath() + "/trang-chu");
				} 
			} else {			
				resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&message=invalid&alert=warning");
			}
		}
	}
}
