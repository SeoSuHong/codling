package codling.identity;

public class Portfolio {
	private int no;
	private String individual_id, name, detail, url, fileName;
	private int fileSize;
	
	public Portfolio() {}

	public Portfolio(int no, String individual_id, String name, String detail, String url, String fileName,
			int fileSize) {
		super();
		this.no = no;
		this.individual_id = individual_id;
		this.name = name;
		this.detail = detail;
		this.url = url;
		this.fileName = fileName;
		this.fileSize = fileSize;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
}