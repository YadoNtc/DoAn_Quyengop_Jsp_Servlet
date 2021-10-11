package controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.DonateModel;
import model.UserModel;
import service.IDonateService;
import util.ConvertJson;

/**
 * Servlet implementation class ApiProjectContronller
 */
@WebServlet(urlPatterns = "/api-admin-donate")
public class ApiProjectContronller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IDonateService donateService;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("application/json");		
		
		DonateModel donateModel = ConvertJson.jsonConvertToString(request.getReader()).toModel(DonateModel.class);
		
		HttpSession session = request.getSession();
		donateModel.setCreatedBy(((UserModel) session.getAttribute("userModel")).getFullName());
		donateModel = donateService.save(donateModel);
		
		// Tra du lieu hien thi cho UI
		mapper.writeValue(response.getOutputStream(), donateModel);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("application/json");		
		
		DonateModel donateModel = ConvertJson.jsonConvertToString(request.getReader()).toModel(DonateModel.class);	
		HttpSession session = request.getSession();
		donateModel.setModifiedBy(((UserModel) session.getAttribute("userModel")).getFullName());
		donateModel = donateService.update(donateModel);	
		// Tra du lieu hien thi cho UI
		mapper.writeValue(response.getOutputStream(), donateModel);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("application/json");		
		
		DonateModel donateModel = ConvertJson.jsonConvertToString(request.getReader()).toModel(DonateModel.class);	
		HttpSession session = request.getSession();
		donateModel.setModifiedBy(((UserModel) session.getAttribute("userModel")).getFullName());
		donateService.delete(donateModel.getIds());	
		mapper.writeValue(response.getOutputStream(), donateModel);
	}

}
