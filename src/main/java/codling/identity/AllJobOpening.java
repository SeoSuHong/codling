package codling.identity;

import java.util.List;

public class AllJobOpening {
	private JobOpening jobOpening;
	private List<Field> fields;
	
	public AllJobOpening() {}

	public AllJobOpening(JobOpening jobOpening, List<Field> fields) {
		super();
		this.jobOpening = jobOpening;
		this.fields = fields;
	}

	public JobOpening getJobOpening() {
		return jobOpening;
	}

	public void setJobOpening(JobOpening jobOpening) {
		this.jobOpening = jobOpening;
	}

	public List<Field> getFields() {
		return fields;
	}

	public void setFields(List<Field> fields) {
		this.fields = fields;
	}
}