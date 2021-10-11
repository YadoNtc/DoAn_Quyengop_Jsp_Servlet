package controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import service.IUserService;

/**
 * Servlet implementation class ActiveAccount
 */
@WebServlet("/ActiveAccount")
public class ActiveAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Inject
	private IUserService userService;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String hash = request.getParameter("key");
		
		UserModel userModel = new UserModel();
		//userModel.setEmail(email);
		//userModel.setMyhash(hash);
		try {
			if (userModel != null) {
				userModel = userService.findAcByEmailAndHash(email, hash, false);
				userService.updateActiveAccount(userModel);
				response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=signup_success&alert=success");
			} else {
				response.sendRedirect(request.getContextPath() + "/trang-chu");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ActiveAccount: " + e.getMessage());
		}
	}

	

}
