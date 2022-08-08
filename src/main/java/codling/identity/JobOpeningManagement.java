package codling.identity;

public class JobOpeningManagement {
	private String title;
	private String startDate;
	private String endDate;
	private String name;
	private String career;
	private String position;
	private String region;
	private int no;
	
	public JobOpeningManagement() {}

	public JobOpeningManagement(String title, String startDate, String endDate, String name, String career,
			String position, String region, int no) {
		super();
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.name = name;
		this.career = career;
		this.position = position;
		this.region = region;
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
}
