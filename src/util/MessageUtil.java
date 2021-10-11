package util;

import javax.servlet.http.HttpServletRequest;

public class MessageUtil {

	public static void MessageShow(HttpServletRequest req) {
		if (req.getParameter("message") != null) {
			String message = req.getParameter("message");
			String messageText = "";
			String alert = "";
			if (message.equalsIgnoreCase("insert_success")) {
				messageText = "Thêm mới thành công!";
				alert = "success";
			} else if (message.equalsIgnoreCase("update_success")) {
				messageText = "Cập nhật thành công!";
				alert = "success";
			} else if (message.equalsIgnoreCase("delete_success")) {
				messageText = "Xóa thành công!";
				alert = "success";
			} else if (message.equalsIgnoreCase("error_system")) {
				messageText = "Đã xảy ra lỗi! Vui lòng thử lại";
				alert = "warning";
			} else if (message.equalsIgnoreCase("signup_success")) {
				messageText = "Đăng ký thành công, bạn có thể đăng nhập";
				alert = "success";
			}
			req.setAttribute("alert", alert);
			req.setAttribute("messageText", messageText);
		}
	}
}
