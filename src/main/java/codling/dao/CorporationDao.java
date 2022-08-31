package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import codling.identity.Announcement;
import codling.identity.Applicant;
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;

public class CorporationDao {
	final static String DB_URL = "jdbc:mysql://localhost:3306/codling";
	final static String DB_NAME = "codling";
	final static String DB_PASSWORD = "1234";
	
	static Connection conn;
	static PreparedStatement pstmt;
	static ResultSet rs;
	
	protected Connection getConnection() throws Exception {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, DB_NAME, DB_PASSWORD);
			return conn;
	}
	
	// 기업회원 정보
	public Corporation getCorporation(String id) {
		Corporation corporation = null;
		String query = "SELECT * FROM corporation WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String corporateName = rs.getString("corporateName");
				String password = rs.getString("password");
				String corporatePhone = rs.getString("corporatePhone");
				String ceoName = rs.getString("ceoName");
				String corporateNumber = rs.getString("corporateNumber");
				String fileName = rs.getString("fileName");
				String address = rs.getString("address");
				
				corporation = new Corporation(id, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, address);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getCorporation Error : " + e.getMessage());
		}
		return corporation;
	}
	
	// 공고 정보(ID)
	public JobOpening getJobOpening(String id) {
		JobOpening jobOpening = null;
		String query = "SELECT * FROM jobOpening WHERE corporation_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int no = rs.getInt("no");
				String corporation_id = rs.getString("corporation_id");
				String title = rs.getString("title");
				String region = rs.getString("region");
				String process = rs.getString("process");
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				int count = rs.getInt("count");
				
				jobOpening = new JobOpening(no, corporation_id, title, region, process, startDate, endDate, count);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getJobOpening Error : " + e.getMessage());
		}
		
		return jobOpening;
	}
	
	// 공고 정보(no)
	public JobOpening getJobOpening(int no) {
		JobOpening jobOpening = null;
		String query = "SELECT * FROM jobOpening WHERE no=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String corporation_id = rs.getString("corporation_id");
				String title = rs.getString("title");
				String region = rs.getString("region");
				String process = rs.getString("process");
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				int count = rs.getInt("count");
				
				jobOpening = new JobOpening(no, corporation_id, title, region, process, startDate, endDate, count);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getJobOpening Error : " + e.getMessage());
		}
		
		return jobOpening;
	}
	
	// 모든 공고 정보(ID)
	public List<JobOpening> getAllJobOpening (String id) {
		List<JobOpening> list = new ArrayList<JobOpening>();
		String query = "SELECT * FROM jobOpening WHERE corporation_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String region = rs.getString("region");
				String process = rs.getString("process");
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				int count = rs.getInt("count");
				
				JobOpening jobOpening = new JobOpening(no, id, title, region, process, startDate, endDate, count);
				list.add(jobOpening);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getAllJobOpening Error : " + e.getMessage());
		}
		return list;
	}
	
	// 가장 최근 공고no (ID)
	public int getRecentJobOpeningNo(String corporation_id) {
		int no = 0;
		String query = "SELECT MAX(no) AS no FROM jobOpening WHERE corporation_id = '" + corporation_id + "'";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) no = rs.getInt("no");
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getRecentJobOpeningNo Error : " + e.getMessage());
		}
		return no;
	}
	
	// 모집분야 정보
	public Field getField(int jobOpening_no) {
		Field field = null;
		String query = "SELECT * FROM field WHERE jobOpening_no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, jobOpening_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String career = rs.getString("career");
				String position = rs.getString("position");
				String pay = rs.getString("pay");
				String workDay = rs.getString("workDay");
				String work = rs.getString("work");
				String stack = rs.getString("stack");
				String requirement = rs.getString("requirement");
				String preference = rs.getString("preference");
				
				field = new Field(no, jobOpening_no, name, career, position, pay, workDay, work, stack, requirement, preference);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getJobOpening Error : " + e.getMessage());
		}
		
		return field;
	}
	
	// 모든 모집분야 정보
	public List<Field> getAllField(int jobOpening_no) {
		List<Field> fields = new ArrayList<Field>();
		String query = "SELECT * FROM field WHERE jobopening_no = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, jobOpening_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String career = rs.getString("career");
				String position = rs.getString("position");
				String pay = rs.getString("pay");
				String workDay = rs.getString("workDay");
				String work = rs.getString("work");
				String stack = rs.getString("stack");
				String requirement = rs.getString("requirement");
				String preference = rs.getString("preference");
				
				Field field = new Field(no, jobOpening_no, name, career, position, pay, workDay, work, stack, requirement, preference);
				fields.add(field);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getAllField Error : " + e.getMessage());
		}
		return fields;
	}
	
	// 공고 작성
	public boolean insertJobOpening(JobOpening jobOpening) {
		boolean result = false;
		String query = "INSERT INTO jobOpening "
				+ "VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, 0)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, jobOpening.getCorporation_id());
			pstmt.setString(2, jobOpening.getTitle());
			pstmt.setString(3, jobOpening.getRegion());
			pstmt.setString(4, jobOpening.getProcess());
			pstmt.setString(5, jobOpening.getStartDate());
			pstmt.setString(6, jobOpening.getEndDate());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertJobOpening Error : " + e.getMessage());
		}
		
		return result;
	}
	
	// 모집분야 작성
	public boolean insertField(List<Field> fields) {
		int count = 0;
		boolean result = false;
		String query = "INSERT INTO field "
				+ "VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			for(int i = 0; i < fields.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Field field = fields.get(i);
				pstmt.setInt(1, field.getJobOpening_no());
				pstmt.setString(2, field.getName());
				pstmt.setString(3, field.getCareer());
				pstmt.setString(4, field.getPosition());
				pstmt.setString(5, field.getPay());
				pstmt.setString(6, field.getWorkDay());
				pstmt.setString(7, field.getWork());
				pstmt.setString(8, field.getStack());
				pstmt.setString(9, field.getRequirement());
				pstmt.setString(10, field.getPreference());
				
				if(pstmt.executeUpdate() == 1) count++;
				
				pstmt.close();
				conn.close();
			}
			if(count == fields.size()) result = true;
		} catch(Exception e) {
			System.out.println("insertField Error : " + e.getMessage());
		}
		
		return result;
	}
	
	// 공고 삭제
	public boolean deleteJobOpening(int no) {
		boolean result = false;
		String query = "DELETE FROM jobOpening WHERE no = " + no;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			if(pstmt.executeUpdate() == 1) result = true;
		} catch(Exception e) {
			System.out.println("deleteJobOpening Error : " + e.getMessage());
		}
		return result;
	}
	
	// 모집분야 삭제
	public boolean deleteField(int jobOpening_no) {
		boolean result = false;
		String query = "DELETE FROM field WHERE jobOpening_no = " + jobOpening_no;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			if(pstmt.executeUpdate() >= 1) result = true;
		} catch(Exception e) {
			System.out.println("deleteField Error : " + e.getMessage());
		}
		return result;
	}
	
	// 지원no로 공고no 가져오기
	public int getJobOpening_no(int apply_no) {
		int no = 0;
		String query = "SELECT jobOpening_no FROM apply WHERE no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, apply_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) no = rs.getInt("jobOpening_no");
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getJobOpening_no Error : " + e.getMessage());
		}
		return no;
	}
	
	// 지원자 정보 가져오기
	public List<Applicant> getApplicant(int jobOpening_no) {
		List<Applicant> applicants = new ArrayList<Applicant>();
		String query = "SELECT A.no, I.id, I.resumeTitle, I.name, F.name AS fieldName, I.stack, I.email, I.phone, A.coverLetter_no, A.status "
						+ "FROM apply A "
						+ "JOIN individual I "
						+ "ON A.individual_id = I.id "
						+ "JOIN field F ON "
						+ "F.no = A.field_no "
						+ "WHERE A.jobOpening_no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, jobOpening_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String resumeTitle = rs.getString("resumeTitle");
				String name = rs.getString("name");
				String fieldName = rs.getString("fieldName");
				String stack = rs.getString("stack");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				int coverLetter_no = rs.getInt("coverLetter_no");
				String status = rs.getString("status");
				
				Applicant applicant = new Applicant(no, id, resumeTitle, name, fieldName, stack, email, phone, coverLetter_no, status);
				applicants.add(applicant);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("getApplicant Error : " + e.getMessage());
		}
		return applicants;
	}
	
	// 지원상태 업데이트
	public boolean updateStatus(int apply_no, String status) {
		boolean result = false;
		String query = "UPDATE apply SET status = ? WHERE no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, apply_no);
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("updateStatus Error : " + e.getMessage());
		}
		return result;
	}
	
	// index 공고
	public ArrayList<Announcement> indexContents() {
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
				+ "FROM jobopening J "
				+ "JOIN field F ON J.no = F.jobOpening_no "
				+ "JOIN corporation C ON J.corporation_id = C.id "
				+ "GROUP BY no "
				+ "ORDER BY J.no DESC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String corporateName = rs.getString("corporateName");
				String title = rs.getString("title");
				String stack = rs.getString("stack");
				String career = rs.getString("career");
				String pay = rs.getString("pay");
				int no = rs.getInt("no");
				int count = rs.getInt("count");
				
				Announcement announcement = new Announcement(corporateName, title, stack, career, pay, no, count);
				list.add(announcement);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("indexContents Error : " + e.getMessage());
		}
		
		return list;
	}
	
	// newcomer 공고
	public ArrayList<Announcement> newcomerContents() {
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
				+ "FROM field F "
				+ "JOIN jobopening J ON F.jobopening_no = J.no "
				+ "JOIN corporation C ON J.corporation_id = C.id "
				+ "WHERE F.career like '%신입%' "
				+ "GROUP BY no "
				+ "ORDER BY J.count DESC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String corporateName = rs.getString("corporateName");
				String title = rs.getString("title");
				String stack = rs.getString("stack");
				String career = rs.getString("career");
				String pay = rs.getString("pay");
				int no = rs.getInt("no");
				int count = rs.getInt("count");
				
				Announcement announcement = new Announcement(corporateName, title, stack, career, pay, no, count);
				list.add(announcement);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("indexContents Error : " + e.getMessage());
		}
		
		return list;
	}
		
	// career 공고
	public ArrayList<Announcement> careerContents() {
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
				+ "FROM field F "
				+ "JOIN jobopening J ON F.jobopening_no = J.no "
				+ "JOIN corporation C ON J.corporation_id = C.id "
				+ "WHERE F.career REGEXP '[0-9]+' "
				+ "GROUP BY no "
				+ "ORDER BY J.count DESC;";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String corporateName = rs.getString("corporateName");
				String title = rs.getString("title");
				String stack = rs.getString("stack");
				String career = rs.getString("career");
				String pay = rs.getString("pay");
				int no = rs.getInt("no");
				int count = rs.getInt("count");
				
				Announcement announcement = new Announcement(corporateName, title, stack, career, pay, no, count);
				list.add(announcement);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("indexContents Error : " + e.getMessage());
		}
		
		return list;
	}
	
	// Top100 공고
	public ArrayList<Announcement> top100Contents() {
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
				+ "FROM field F "
				+ "JOIN jobopening J ON F.jobopening_no = J.no "
				+ "JOIN corporation C ON J.corporation_id = C.id "
				+ "GROUP BY no "
				+ "ORDER BY J.count DESC LIMIT 100";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String corporateName = rs.getString("corporateName");
				String title = rs.getString("title");
				String stack = rs.getString("stack");
				String career = rs.getString("career");
				String pay = rs.getString("pay");
				int no = rs.getInt("no");
				int count = rs.getInt("count");
				
				Announcement announcement = new Announcement(corporateName, title, stack, career, pay, no, count);
				list.add(announcement);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("indexContents Error : " + e.getMessage());
		}
		return list;
	}
	
	// 기업회원 회원가입
	public boolean insertCorporation(Corporation corporation) {
		boolean result = false;
	    String query = "INSERT INTO corporation VALUES (?,DEFAULT,?,?,?,?,?,?,?)";
	    try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, corporation.getId());
			pstmt.setString(2, corporation.getPassword());
			pstmt.setString(3, corporation.getCorporateName());
			pstmt.setString(4, corporation.getCorporatePhone());
			pstmt.setString(5, corporation.getCeoName());
			pstmt.setString(6, corporation.getCorporateNumber());
			pstmt.setString(7, corporation.getFileName());
			pstmt.setString(8, corporation.getAddress());
 
			if(pstmt.executeUpdate() == 1) result = true;
 
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertCorporation Error : " + e.getMessage());
	    }
	    return result;
	}
	
	// 공고 조회수
    public int count(int no) {
       int count= 0;
       String query = "SELECT count "
             + "FROM jobopening "
             + "WHERE no=?";
       try {
          conn = getConnection();
          pstmt = conn.prepareStatement(query);
          pstmt.setInt(1, no);
          rs = pstmt.executeQuery();
          if(rs.next()) {
             count = rs.getInt("count");
             count++;
          }
          rs.close();
          pstmt.close();
          conn.close();
       }catch(Exception e) {
          System.out.println("count Select Error: " + e.getMessage());
       }
       
       query = "UPDATE jobopening "
             + "SET count = ? "
             + "WHERE no = ?";
       try {
          conn = getConnection();
          pstmt = conn.prepareStatement(query);
          pstmt.setInt(1, count);
          pstmt.setInt(2, no);
          pstmt.executeUpdate();
          rs.close();
          pstmt.close();
          conn.close();
       }catch (Exception e) {
          System.out.println("count Update Error: " + e.getMessage());
       }
       return count;
    }
    
    // 스택 suggest
    public List<String> getAllStack(String keyWord) {
    	List<String> list = new ArrayList<String>();
    	String query = "SELECT stack FROM stackList WHERE stack LIKE ?";
    	
    	try {
    		conn = getConnection();
    		pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, "%" + keyWord + "%");
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			list.add(rs.getString(1));
    		}
    		
    		rs.close();
    		pstmt.close();
    		conn.close();
    	} catch (Exception e) {
    		System.out.println("getAllStack Error : " + e.getMessage());
    	}
    	
    	return list;
    }
    
    // 공고 검색 직무 가지고오기
 	public ArrayList<Field> getTask() {
 		ArrayList<Field> list = new ArrayList<Field>();
 		String query = "select name from field GROUP By name;";
 		
 		try {
 			conn = getConnection();
 			pstmt = conn.prepareStatement(query);
 			rs = pstmt.executeQuery();
 			
 			while(rs.next()) {
 				String name = rs.getString("name");
 				
 				Field field = new Field(0, 0, name, "", "", "", "", "", "", "", "");
 				list.add(field);
 			}
 			rs.close();
 			pstmt.close();
 			conn.close();
 		} catch(Exception e) {
 			System.out.println("indexContents Error : " + e.getMessage());
 		}
 		return list;
 	}
 	
 	// 공고 검색
 	public ArrayList<Announcement> getSearch(String search, String zone, String careers, String task) {
 		ArrayList<Announcement> list = new ArrayList<Announcement>();
 		String query = "SELECT C.corporateName, J.title, F.name, F.stack, F.career, F.pay, J.no, J.count "
 				+ "FROM field F \r\n"
 				+ "JOIN jobopening J ON F.jobopening_no = J.no "
 				+ "JOIN corporation C ON J.corporation_id = C.id "
 				+ "WHERE J.title REGEXP ? AND J.region REGEXP ? AND F.career REGEXP ? AND F.name REGEXP ? "
 				+ "GROUP BY no "
 				+ "ORDER BY F.no DESC";
 		
 		try {
 			conn = getConnection();
 			pstmt = conn.prepareStatement(query);
 			if(search.equals("") || search == null) search = "[가-힇]|[a-z]|[0-9]";
 			pstmt.setString(1, search);
 			pstmt.setString(2, zone);
 			pstmt.setString(3, careers);
 			pstmt.setString(4, task);
 			rs = pstmt.executeQuery();
 			
 			while(rs.next()) {
 				String corporateName = rs.getString("corporateName");
 				String title = rs.getString("title");
 				String stack = rs.getString("stack");
 				String career = rs.getString("career");
 				String pay = rs.getString("pay");
 				int no = rs.getInt("no");
 				int count = rs.getInt("count");
 				
 				Announcement announcement = new Announcement(corporateName, title, stack, career, pay, no, count);
 				list.add(announcement);
 			}
 			rs.close();
 			pstmt.close();
 			conn.close();
 		} catch(Exception e) {
 			System.out.println("indexContents Error : " + e.getMessage());
 		}
 		return list;
 	}
}