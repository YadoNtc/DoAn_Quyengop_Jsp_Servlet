package model;

import java.text.DecimalFormat;

public class DonateDetailModel extends AbstractModel<DonateDetailModel> {

	private Long campaginId;
	private Long userId;
	private Long amoutMoney;
	private Long subtotal;
	private Long total;
	private Long tax;
	private Long shipping;
	private String fullName;
	private String email;
	private String mobile;
	private String status;
	private DonateModel donateModel = new DonateModel();
	
	DecimalFormat df = new DecimalFormat("###,###.##");
	
	
	
	/*
	 * public DonateDetailModel() {}
	 * 
	 * public DonateDetailModel(String total, String campaginId, String userId,
	 * String fullName, String email, String mobile) { this.total =
	 * Long.parseLong(total); this.campaginId = Long.parseLong(campaginId);
	 * this.userId = Long.parseLong(userId); this.fullName = fullName; this.email =
	 * email; this.mobile = mobile; }
	 */
	
	public void setTotal(Long total) {
		this.total = total;
	}

	public String getSubTotal() {
		return df.format(subtotal);
	}
	
	public String getTotal() {
		return df.format(total);	
	}
	
	public String getShipping() {
		return df.format(shipping);
	}

	public String getTax() {
		return df.format(tax);
	}

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

	public DonateModel getDonateModel() {
		return donateModel;
	}

	public void setDonateModel(DonateModel donateModel) {
		this.donateModel = donateModel;
	}

}
