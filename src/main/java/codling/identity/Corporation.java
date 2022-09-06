package codling.identity;

public class Corporation {
	private String id, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, email, address, detailAddress, logo;
	
	public Corporation() {}

	public Corporation(String id, String password, String corporateName, String corporatePhone,
			String ceoName, String corporateNumber, String fileName, String email, String address, String detailAddress, String logo) {
		super();
		this.id = id;
		this.password = password;
		this.corporateName = corporateName;
		this.corporatePhone = corporatePhone;
		this.ceoName = ceoName;
		this.corporateNumber = corporateNumber;
		this.fileName = fileName;
		this.email = email;
		this.address = address;
		this.detailAddress = detailAddress;
		this.logo = logo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCorporateName() {
		return corporateName;
	}

	public void setCorporateName(String corporateName) {
		this.corporateName = corporateName;
	}

	public String getCorporatePhone() {
		return corporatePhone;
	}

	public void setCorporatePhone(String corporatePhone) {
		this.corporatePhone = corporatePhone;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public String getCorporateNumber() {
		return corporateNumber;
	}

	public void setCorporateNumber(String corporateNumber) {
		this.corporateNumber = corporateNumber;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	
	public String getDetailAddress() {
		return detailAddress;
	}
	
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
	}
}