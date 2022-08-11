package codling.identity;

public class Education {
	private int no;
	private String individual_id, school, schoolName, schoolDateStart, schoolDateEnd, status, department, score;
	
	public Education() {}

	public Education(int no, String individual_id, String school, String schoolName, String schoolDateStart,
			String schoolDateEnd, String status, String department, String score) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.school = school;
		this.schoolName = schoolName;
		this.schoolDateStart = schoolDateStart;
		this.schoolDateEnd = schoolDateEnd;
		this.status = status;
		this.department = department;
		this.score = score;
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

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSchoolDateStart() {
		return schoolDateStart;
	}

	public void setSchoolDateStart(String schoolDateStart) {
		this.schoolDateStart = schoolDateStart;
	}

	public String getSchoolDateEnd() {
		return schoolDateEnd;
	}

	public void setSchoolDateEnd(String schoolDateEnd) {
		this.schoolDateEnd = schoolDateEnd;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	
	
}