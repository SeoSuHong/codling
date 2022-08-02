package codling.identity;

public class Individual {
	private String id, password, name, birth, gender, email, phone, address, resumeTitle;
	
	public Individual() {}

	public Individual(String id, String password, String name, String birth, String gender,
			String email, String phone, String address, String resumeTitle) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.resumeTitle = resumeTitle;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
}