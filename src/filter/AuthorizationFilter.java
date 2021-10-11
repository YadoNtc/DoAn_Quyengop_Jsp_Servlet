package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserModel;

public class AuthorizationFilter implements Filter {
	
	@SuppressWarnings("unused")
	private ServletContext context;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		String url = req.getRequestURI();
		
		if (url.contains("/admin-")) {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("userModel");
			if (userModel != null) {
				if (userModel.isAdmin() == true) {
					filterChain.doFilter(request, response);
				} else if (userModel.isAdmin() == false) {
					resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&message=not_permission&alert=warning");
				}
			} else {
				resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&message=not_login&alert=warning");		
			}
		} else {
			filterChain.doFilter(req, resp);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}			

}
