package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import codling.identity.Announcement;
import codling.identity.Apply;
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
	
	// 지원분야 정보
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
	
	// 모든 지원분야 정보
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
	
	// 지원분야 작성
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
	
	// 지원분야 삭제
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
	
	// 지원 정보 가져오기
	public List<Apply> getApply(int jobOpening_no) {
		List<Apply> applies = new ArrayList<Apply>();
		String query = "SELECT * FROM apply WHERE jobOpening_no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, jobOpening_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("");
				String individual_id = rs.getString("");
				int field_no = rs.getInt("field_no");
				int coverLetter_no = rs.getInt("coverLetter_no");
				String status = rs.getString("status");
				
				Apply apply = new Apply(no, individual_id, jobOpening_no, field_no, coverLetter_no, status);
				applies.add(apply);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getApply Error : " + e.getMessage());
		}
		return applies;
	}
	
	// index 공고
	public ArrayList<Announcement> indexContents() {
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
				+ "FROM jobopening J "
				+ "JOIN field F ON J.no = F.jobOpening_no "
				+ "JOIN corporation C ON J.corporation_id = C.id "
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
				+ "WHERE F.career like '%신입%' ORDER BY J.count DESC";
		
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
				+ "WHERE F.career REGEXP '[0-9]+' ORDER BY J.count DESC;";
		
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
}