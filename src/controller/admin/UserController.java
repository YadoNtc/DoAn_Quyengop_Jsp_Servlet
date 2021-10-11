package controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import service.IUserService;
import util.ConvertDate;
import util.FormUtil;
import util.HashPassUtil;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns = {"/admin-user", "/admin-user/create", "/admin-user/update", "/admin-user/delete", 
		"/admin-user/edit", "/admin-user/reset"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IUserService userService;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		String url = request.getRequestURI();
		
		UserModel model = null;
		if (url.contains("delete")) {
			model = new UserModel();
			delete(request, response);	
		} else if (url.contains("reset")) {
			model = new UserModel();
			request.setAttribute("model", model);
		} else if (url.contains("edit")) {
			edit(request, response);
		} 		
		
		findAll(request, response);
		request.getRequestDispatcher("/view/admin/users/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		String url = request.getRequestURI();
		if (url.contains("create")) {
			insert(request, response);
		} else if (url.contains("update")) {
			update(request, response);
			edit(request, response);
			return;
		} else if (url.contains("delete")) {
			delete(request, response);
			findAll(request, response);
			request.getRequestDispatcher("/view/admin/users/list.jsp").forward(request, response);
			return;
		} else if (url.contains("reset")) {
			request.setAttribute("model", new UserModel());
		} 
		
		//findAll(request, response);
		request.getRequestDispatcher("/view/admin/users/edit.jsp").forward(request, response);
 	}
	
	/**
	 * Thêm mới
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");
		UserModel userModel =  FormUtil.toModel(UserModel.class, request);
		String pass = HashPassUtil.hashMd5(userModel.getPassword());
		userModel.setPassword(pass);
		try {
			userService.save(userModel);			
			request.setAttribute("message", "Thêm mới thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Thêm mới thất bại!");
		}		
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
		try {
			userService.update(userModel);
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
			for (String ids : request.getParameterValues("id")) { 
				Long id = Long.parseLong(ids);
				userModel = userService.findOne(id);
				userService.deleteById(userModel.getId());
			}
			 
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
		request.setAttribute("model", userModel);
		request.getRequestDispatcher("/view/admin/users/edit.jsp").forward(request, response);		
	}
	
	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		UserModel model = new UserModel();
		try {
			model.setListResult(userService.findAll());
						
			request.setAttribute("model", model);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi hệ thống!");
		}		
	}

}
