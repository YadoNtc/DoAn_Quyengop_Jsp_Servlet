package model;

public class UserModel extends AbstractModel<UserModel> {

	private String avatar;
	private String password;
	private String fullName;
	private String email;
	private String mobile;
	private String idgg;
	private String idfb;
	private String address;
	private boolean status;
	private String rolesCode;
	private boolean admin;
	private boolean remember;
	private String myhash;


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getRolesCode() {
		return rolesCode;
	}

	public void setRolesCode(String rolesCode) {
		this.rolesCode = rolesCode;
	}

	public boolean isRemember() {
		return remember;
	}

	public void setRemember(boolean remember) {
		this.remember = remember;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getMyhash() {
		return myhash;
	}

	public void setMyhash(String myhash) {
		this.myhash = myhash;
	}

	public String getIdgg() {
		return idgg;
	}

	public void setIdgg(String idgg) {
		this.idgg = idgg;
	}

	public String getIdfb() {
		return idfb;
	}

	public void setIdfb(String idfb) {
		this.idfb = idfb;
	}

}
