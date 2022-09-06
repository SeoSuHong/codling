package codling.identity;

public class RankJobOpening {
	private int jobOpening_no;
	private String corporateName, title, fieldName, stack, career, position, workDay, region, date, logo;
	
	public RankJobOpening() {}
	
	public RankJobOpening(int jobOpening_no, String corporateName, String title, String fieldName, String stack,
			String career, String position, String workDay, String region, String date, String logo) {
		super();
		this.jobOpening_no = jobOpening_no;
		this.corporateName = corporateName;
		this.title = title;
		this.fieldName = fieldName;
		this.stack = stack;
		this.career = career;
		this.position = position;
		this.workDay = workDay;
		this.region = region;
		this.date = date;
		this.logo = logo;
	}
	
	public int getJobOpening_no() {
		return jobOpening_no;
	}
	
	public void setJobOpening_no(int jobOpening_no) {
		this.jobOpening_no = jobOpening_no;
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
	
	public String getFieldName() {
		return fieldName;
	}
	
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
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
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getWorkDay() {
		return workDay;
	}
	
	public void setWorkDay(String workDay) {
		this.workDay = workDay;
	}
	
	public String getRegion() {
		return region;
	}
	
	public void setRegion(String region) {
		this.region = region;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
	}
}