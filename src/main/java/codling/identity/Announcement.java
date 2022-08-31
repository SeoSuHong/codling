package codling.identity;

public class Announcement {
	private String corporateName;
	private String title;
	private String stack;
	private String career;
	private String pay;
	private String name;
	private int no;
	private int count;
	
	public Announcement() {}

	public Announcement(String corporateName, String title, String stack, String career, String pay, String name, int no, int count) {
		super();
		this.corporateName = corporateName;
		this.title = title;
		this.stack = stack;
		this.career = career;
		this.pay = pay;
		this.name = name;
		this.no = no;
		this.count = count;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
}
