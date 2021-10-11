package controller.web;

import java.io.IOException;
import java.util.Random;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import model.UserModel;
import service.IUserService;
import util.ConvertDate;
import util.FormUtil;
import util.HashPassUtil;
import util.SendingEmailUtil;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/dang-ky")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IUserService userService;
	
	@EJB
	private SendingEmailUtil emailSender;
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");
		UserModel userModel = FormUtil.toModel(UserModel.class, request);
		String pass = HashPassUtil.hashMd5(userModel.getPassword());
		userModel.setPassword(pass);
		userModel.setAdmin(false);
		userModel.setStatus(false);
		try {
			
			//Tạo ra mã code add vào link kích hoạt tài khoản
			Random random = new Random();
			random.nextInt(999999);
			String myHash = DigestUtils.md5Hex("" + random);
			userModel.setMyhash(myHash);
			
			userService.save(userModel);	
			
			SendingEmailUtil se = new SendingEmailUtil(userModel.getEmail(), userModel.getMyhash());
			se.sendMail();
			
			response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=active_account&alert=success");			
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Đăng ký thất bại");
		}		
		request.setAttribute("model", userModel);
		response.sendRedirect(request.getContextPath() + "/dang-ky");
	}

}
