package codling.identity;

public class Apply {
	private int no, jobOpening_no, coverLetter_no;
	private String individual_id, fieldName, status;
	
	public Apply() {}

	public Apply(int no, String individual_id, int jobOpening_no, String fieldName, int coverLetter_no, String status) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.jobOpening_no = jobOpening_no;
		this.fieldName = fieldName;
		this.coverLetter_no = coverLetter_no;
		this.status = status;
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

	public int getJobOpening_no() {
		return jobOpening_no;
	}

	public void setJobOpening_no(int jobOpening_no) {
		this.jobOpening_no = jobOpening_no;
	}
	
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public int getCoverLetter_no() {
		return coverLetter_no;
	}

	public void setCoverLetter_no(int coverLetter_no) {
		this.coverLetter_no = coverLetter_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}