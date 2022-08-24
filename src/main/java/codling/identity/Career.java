package codling.identity;

public class Career {
	private int no;
	private String individual_id, prev_company, tenureStartDate, tenureEndDate, position, department, work_content;
	
	public Career() {}
	
	public Career(int no, String individual_id, String prev_company, String tenureStartDate, String tenureEndDate, String position, String department, String work_content) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.prev_company = prev_company;
		this.tenureStartDate = tenureStartDate;
		this.tenureEndDate = tenureEndDate;
		this.position = position;
		this.department = department;
		this.work_content = work_content;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getIndividual_id() {
		return individual_id;
	}
	
	public void setIndividual_id(String individual_id) {
		this.individual_id = individual_id;
	}
	
	public String getPrev_company() {
		return prev_company;
	}
	
	public void setPrev_company(String prev_company) {
		this.prev_company = prev_company;
	}
	
	public String getTenureStartDate() {
		return tenureStartDate;
	}
	
	public void setTenureStartDate(String tenureStartDate) {
		this.tenureStartDate = tenureStartDate;
	}
	
	public String getTenureEndDate() {
		return tenureEndDate;
	}
	
	public void setTenureEndDate(String tenureEndDate) {
		this.tenureEndDate = tenureEndDate;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getDepartment() {
		return department;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getWork_content() {
		return work_content;
	}
	
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
}