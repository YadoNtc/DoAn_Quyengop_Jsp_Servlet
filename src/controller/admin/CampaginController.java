package controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DonateDetailModel;
import service.IDonateDetailServive;
import service.IDonateService;
import util.ConvertDate;
import util.FormUtil;

/**
 * Servlet implementation class CampaginController
 */
@WebServlet(urlPatterns = {"/admin-campagin", "/admin-campagin/update", "/admin-campagin/edit", "/admin-campagin/delete"})
public class CampaginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateDetailServive donateDetailServive;
	
	@Inject 
	private IDonateService donateService;
	      
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		if (url.contains("edit")) {
			edit(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
		}
		
		findAll(request, response);
		request.getRequestDispatcher("/view/admin/campagin/list.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		if (url.contains("update")) {
			update(request, response);
			edit(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			findAll(request, response);
			request.getRequestDispatcher("/view/admin/campagin/list.jsp").forward(request, response);
		}
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		DonateDetailModel model = FormUtil.toModel(DonateDetailModel.class, request);	
		model = donateDetailServive.findOne(model.getId());
		request.setAttribute("model", model);			
		request.getRequestDispatcher("/view/admin/campagin/edit.jsp").forward(request, response);
		
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");
		DonateDetailModel model = FormUtil.toModel(DonateDetailModel.class, request);
		try {
			for (String ids : request.getParameterValues("id")) {
				Long id = Long.parseLong(ids);
				model = donateDetailServive.findOne(id);
				donateDetailServive.deleteById(model.getId());
			}
			request.setAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Xóa thất bại");
		}
		
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		request.setCharacterEncoding("UTF-8");
		DonateDetailModel detailModel = FormUtil.toModel(DonateDetailModel.class, request);
		try {
			if (detailModel.getUserId() == 0) {
				detailModel.setUserId(null);
			}
			donateDetailServive.update(detailModel);
			request.setAttribute("model", detailModel);
			request.setAttribute("message", "Cập nhật thành công!");
			List<DonateDetailModel> lists = new ArrayList<>();
			lists = donateDetailServive.findAll();
			for (DonateDetailModel list : lists) {
				if (list.getCampaginId() != null && list.getStatus().equalsIgnoreCase("transferred")) {
				donateService.updateCurrentMoney(list.getCampaginId());
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Cập nhật lỗi");
		}
	
		
	}
	
	private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConvertDate.convertDate();
		DonateDetailModel detailModel = new DonateDetailModel();
		try {
			detailModel.setListResult(donateDetailServive.findAll());
			request.setAttribute("model", detailModel);
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Admin-campagin: " + e.getMessage());
		}
	}

}
