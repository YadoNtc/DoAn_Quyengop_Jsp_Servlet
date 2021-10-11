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
import service.IUserService;
import util.ConvertDate;
import util.FormUtil;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns = {"/admin-project", "/admin-project/create", "/admin-project/update", "/admin-project/delete", 
		"/admin-project/edit", "/admin-project/reset"})
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateService donateService;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		String url = request.getRequestURI();
		
		DonateModel model = null;
		if (url.contains("delete")) {
			model = new DonateModel();
			delete(request, response);	
		} else if (url.contains("reset")) {
			model = new DonateModel();
			request.setAttribute("model", model);
		} else if (url.contains("edit")) {
			edit(request, response);
		} 		
		
		findAll(request, response);
		request.getRequestDispatcher("/view/admin/project/list.jsp").forward(request, response);
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
			request.getRequestDispatcher("/view/admin/project/list.jsp").forward(request, response);
			return;
		} else if (url.contains("reset")) {
			request.setAttribute("model", new DonateModel());
		} 
		
		//findAll(request, response);
		request.getRequestDispatcher("/view/admin/project/edit.jsp").forward(request, response);
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
		DonateModel donateModel =  FormUtil.toModel(DonateModel.class, request);
		try {
			donateService.save(donateModel);			
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
		DonateModel donateModel =  FormUtil.toModel(DonateModel.class, request);
		try {
			donateService.update(donateModel);
			request.setAttribute("model", donateModel); 
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
		DonateModel donateModel =  FormUtil.toModel(DonateModel.class, request);
		try {									
			for (String ids : request.getParameterValues("id")) { 
				Long id = Long.parseLong(ids);
				donateModel = ((IDonateService) donateModel).findOne(id);
				((IUserService) donateModel).deleteById(donateModel.getId());
			}
			 
			request.setAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Xóa thất bại!");
		}		
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		DonateModel donateModel =  FormUtil.toModel(DonateModel.class, request);
		if (donateModel.getId() != null) {
			donateModel = donateService.findOne(donateModel.getId()); 
		}		
		request.setAttribute("model", donateModel);
		request.getRequestDispatcher("/view/admin/users/edit.jsp").forward(request, response);		
	}
	
	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		DonateModel model = new DonateModel();
		try {
			model.setListResult(donateService.findAll());
						
			request.setAttribute("model", model);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Lỗi hệ thống!");
		}		
	}

}
