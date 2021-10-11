package model;

public class DonateModel extends AbstractModel<DonateModel> {

	private String name;
	private String description;
	private String image;
	private String detail;
	private Long targetMoney;
	private Long currentMoney;
	private String status;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Long getTargetMoney() {
		return targetMoney;
	}

	public void setTargetMoney(Long targetMoney) {
		this.targetMoney = targetMoney;
	}

	public Long getCurrentMoney() {
		return currentMoney;
	}

	public void setCurrentMoney(Long currentMoney) {
		this.currentMoney = currentMoney;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
