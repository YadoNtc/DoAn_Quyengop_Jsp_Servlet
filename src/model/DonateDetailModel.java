package model;

public class DonateDetailModel extends AbstractModel<DonateDetailModel> {

	private Long campaginId;
	private Long userId;
	private Long amoutMoney;
	private String fullName;
	private String email;
	private String mobile;
	private String status;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getCampaginId() {
		return campaginId;
	}

	public void setCampaginId(Long campaginId) {
		this.campaginId = campaginId;
	}

	public Long getAmoutMoney() {
		return amoutMoney;
	}

	public void setAmoutMoney(Long amoutMoney) {
		this.amoutMoney = amoutMoney;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
