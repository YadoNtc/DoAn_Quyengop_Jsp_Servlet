package controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Email;
import model.UserModel;
import service.IUserService;
import util.HashPassUtil;
import util.RandomString;
import util.SendEmailUtil;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/reset-pass")
public class ForgotPasswordContronller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IUserService userService;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/resetpass.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailAddress = request.getParameter("email");
		try {
			UserModel userModel = new UserModel();
			userModel = userService.findByEmail(emailAddress);
			if (userModel != null) {
				String password = new RandomString().randomString(6);	
				
				Email email = new Email();
				email.setFrom("gopquyenservice@gmail.com");
				email.setFromPassword("doan_quyengop");
				email.setTo(emailAddress);
				email.setSubject("Reset mật khẩu");
				StringBuilder sb = new StringBuilder();
				sb.append("Xin chào, ").append(userModel.getFullName()).append("<br>");
				sb.append("Cám ơn bạn đã sử dụng chức năng quên mật khẩu. <br>");
				sb.append("Mật khẩu mới của bạn là: ").append(password + ".<br>");
				sb.append("Vui lòng thay đổi mật khẩu sau khi đăng nhập. <br>");
				sb.append("Click vào link để đăng nhập: http://localhost:8081/com.doan.quyengop/dang-nhap?action=login");
				sb.append("<br>");
				sb.append("Administrator hệ thống quyên góp. Thân chào!");			
				email.setContent(sb.toString());			
				SendEmailUtil.sendEmail(email);
				
				userModel.setPassword(HashPassUtil.hashMd5(password));
				userService.update(userModel);
				
				request.setAttribute("message", "Hệ thống đã nhận được phản hồi của bạn! "
						+ " Vui lòng kiểm tra email để nhận mật khẩu mới.");
			} else {
				request.setAttribute("error", "Email đã nhập không tồn tại!");
			}
			request.getRequestDispatcher("/view/resetpass.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
