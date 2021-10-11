package controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserModel;
import service.IUserService;
import util.FormUtil;

/**
 * Servlet implementation class LoginGgFbController
 */
@WebServlet("/dang-nhap-fbgg")
public class LoginGgFbController extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
	@Inject
	private IUserService userService;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		UserModel userModel = FormUtil.toModel(UserModel.class, request);
		userModel.setAdmin(false);
		userModel.setStatus(true);
		UserModel model = new UserModel();
		try {
			if (action != null && action.equals("google")) {			
				model = userService.findByIdGg(userModel.getEmail(), userModel.getIdgg(), true);
				if (model == null) {
					userService.save(userModel);
					model = userService.findByIdGg(userModel.getEmail(), userModel.getIdgg(), true);
				} 
			} else if (action != null && action.equals("facebook")) {					
				model = userService.findByIdFb(userModel.getEmail(), userModel.getIdfb(), true);
				if (model == null) {
					userService.save(userModel);
					model = userService.findByIdFb(userModel.getEmail(), userModel.getIdfb(), true);
				}
			}
			if (model != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userModel", model);
				if (model.isAdmin() == false) {
					response.sendRedirect(request.getContextPath() + "/trang-chu");
				}
			}					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
