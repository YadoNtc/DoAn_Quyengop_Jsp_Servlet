package model;

public class ChangePasswordForm {
	private String email;
	private String oldPassword;
	private String newPassword;
	private String confirmNewPassword;
	
	public ChangePasswordForm() {}

	public ChangePasswordForm(String email, String oldPassword, String newPassword, String confirmNewPassword) {
		this.email = email;
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
		this.confirmNewPassword = confirmNewPassword;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}

	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}

	
	
	
	
	
}
