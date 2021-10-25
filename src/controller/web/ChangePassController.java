package controller.web;

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

@WebServlet (urlPatterns = "/change-pass")
public class ChangePassController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Inject 
	private IUserService userService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/view/web/changePassword.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ChangePasswordForm changeForm = FormUtil.toModel(ChangePasswordForm.class, req);
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("userModel");
		
			if (changeForm.getNewPassword().equals(changeForm.getConfirmNewPassword()) && HashPassUtil.hashMd5(changeForm.getOldPassword()).equals(userModel.getPassword())) {
				userModel.setPassword(HashPassUtil.hashMd5(changeForm.getNewPassword()));				
				userService.update(userModel);
				resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&message=relogin&alert=success");
			} else {
				req.setAttribute("error", "Mật khẩu cũ không chính xác!");
				req.getRequestDispatcher("/view/web/changePassword.jsp").forward(req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
