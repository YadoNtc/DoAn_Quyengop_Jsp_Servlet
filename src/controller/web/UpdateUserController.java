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
import util.ConvertDate;
import util.FormUtil;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns = {"/user-profile", "/user-profile/update", "/user-profile/delete"})
public class UpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IUserService userService;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		String url = request.getRequestURI();
		
		if (url.contains("delete")) {
			delete(request, response);	
		}  				
		findOne(request, response);
		request.getRequestDispatcher("/view/web/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		String url = request.getRequestURI();
		if (url.contains("update")) {
			update(request, response);
			edit(request, response);
			return;
		} else if (url.contains("delete")) {
			delete(request, response);
		}  
		response.sendRedirect(request.getContextPath() + "/trang-chu");
		//request.getRequestDispatcher("/view/web/profile.jsp").forward(request, response);
 	}

	/**
	 * Chỉnh sửa
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");
		UserModel userModel =  FormUtil.toModel(UserModel.class, request);
		userModel.setStatus(true);
		userModel.setAdmin(false);
		try {
			userService.update(userModel);
			HttpSession session = request.getSession();
			session.setAttribute("userModel", userModel);
			request.setAttribute("model", userModel); 
			request.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Cập nhật thất bại");
		}		
	}
	
	/**
	 * Xóa 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");		
		UserModel userModel =  FormUtil.toModel(UserModel.class, request);
		try {											
			userService.deleteById(userModel.getId());		 
			request.setAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Xóa thất bại!");
		}		
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		UserModel userModel =  FormUtil.toModel(UserModel.class, request);
		if (userModel.getId() != null) {
			userModel = userService.findOne(userModel.getId()); 
		}		
		request.setAttribute("userModel", userModel);
		request.getRequestDispatcher("/view/web/profile.jsp").forward(request, response);		
	}
	
	protected void findOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		UserModel model = FormUtil.toModel(UserModel.class, request);
		try {
			model = userService.findOne(model.getId());
						
			request.setAttribute("model", model);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi hệ thống!");
		}		
	}

}
