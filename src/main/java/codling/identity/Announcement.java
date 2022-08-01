package codling.identity;

public class Announcement {
	private String corporateName;
	private String title;
	private String stack;
	private String career;
	private String pay;
	
	public Announcement() {}

	public Announcement(String corporateName, String title, String stack, String career, String pay) {
		super();
		this.corporateName = corporateName;
		this.title = title;
		this.stack = stack;
		this.career = career;
		this.pay = pay;
	}

	public String getCorporateName() {
		return corporateName;
	}

	public void setCorporateName(String corporateName) {
		this.corporateName = corporateName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStack() {
		return stack;
	}

	public void setStack(String stack) {
		this.stack = stack;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}
	
	
}
