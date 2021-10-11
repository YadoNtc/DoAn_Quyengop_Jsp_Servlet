package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	
	/***
	 * Lấy dữ liệu cookies
	 * @param name
	 * @param req
	 * @return
	 */
	public static String get(String name, HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}
		return "";	
	}
	
	public static Cookie add(String name, String value, int hours, HttpServletResponse resp) {
		Cookie cookie = new Cookie(name, value);
		
		cookie.setMaxAge(60 * 60 * hours);
		cookie.setPath("/");
		resp.addCookie(cookie);
		
		return cookie;
	}
}
