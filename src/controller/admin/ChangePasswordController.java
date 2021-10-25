package controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ChangePasswordForm;
import model.UserModel;
import service.IUserService;
import util.FormUtil;
import util.HashPassUtil;

/**
 * Servlet implementation class ChangePasswordController
 */
@WebServlet("/admin-change-pass")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IUserService userService;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/admin/users/changePassword.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ChangePasswordForm changeForm = FormUtil.toModel(ChangePasswordForm.class, request);
			HttpSession session = request.getSession();
			UserModel userModel = (UserModel) session.getAttribute("userModel");
		
			if (changeForm.getNewPassword().equals(changeForm.getConfirmNewPassword()) && HashPassUtil.hashMd5(changeForm.getOldPassword()).equals(userModel.getPassword())) {
				userModel.setPassword(HashPassUtil.hashMd5(changeForm.getNewPassword()));				
				userService.update(userModel);
				response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=relogin&alert=success");
			} else {
				request.setAttribute("error", "Mật khẩu cũ không chính xác!");
				request.getRequestDispatcher("/view/admin/users/changePassword.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
