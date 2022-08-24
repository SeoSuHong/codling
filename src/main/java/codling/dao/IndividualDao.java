package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import codling.identity.Apply;
import codling.identity.Career;
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.License;
import codling.identity.Portfolio;

public class IndividualDao {
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
	
	// 개인회원 정보
	public Individual getIndividual(String id) {
		Individual individual = null;
		String query = "SELECT * FROM individual WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String password = rs.getString("password");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				
				individual = new Individual(id, password, name, birth, gender, email, phone, address, "", "");
				
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getIndividual Error : " + e.getMessage());
		}
		return individual;
	}
	
	// 개인회원 회원가입
	public boolean insertIndividual(Individual individual) {
		boolean result = false;
		String query = "INSERT INTO individual VALUES (?,DEFAULT,?,?,?,?,?,?,?,'')";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual.getId());
			pstmt.setString(2, individual.getPassword());
			pstmt.setString(3, individual.getName());
			pstmt.setString(4, individual.getBirth());			
			pstmt.setString(5, individual.getGender());
			pstmt.setString(6, individual.getEmail());
			pstmt.setString(7, individual.getPhone());
			pstmt.setString(8, individual.getAddress());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertIndividual Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 제목 작성
	public boolean insertResumeTitle(String id, String title) {
		boolean result = false;
		String query = "UPDATE individual SET resumeTitle = ? WHERE id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertResumeTitle Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 스택 작성
	public boolean insertStack(String id, String stack) {
		boolean result = false;
		String query = "UPDATE individual SET stack = ? WHERE id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, stack);
			pstmt.setString(2, id);
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertStack Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 학력사항 작성
	public boolean insertEducation(Education education) {
		boolean result = false;
		String query = "INSERT INTO education VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, education.getIndividual_id());
			pstmt.setString(2, education.getSchool());
			pstmt.setString(3, education.getSchoolName());
			pstmt.setString(4, education.getSchoolStartDate());
			pstmt.setString(5, education.getSchoolEndDate());
			pstmt.setString(6, education.getStatus());
			pstmt.setString(7, education.getDepartment());
			pstmt.setString(8, education.getScore());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertEducation Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 경력사항 작성
	public boolean insertCareer(Career career) {
		boolean result = false;
		String query = "INSERT INTO career VALUES(DEFAULT, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, career.getIndividual_id());
			pstmt.setString(2, career.getPrev_company());
			pstmt.setString(3, career.getTenureStartDate());
			pstmt.setString(4, career.getTenureEndDate());
			pstmt.setString(5, career.getPosition());
			pstmt.setString(6, career.getDepartment());
			pstmt.setString(7, career.getWork_content());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertCareer Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 자격증 작성
	public boolean insertLicense(License license) {
		boolean result = false;
		String query = "INSERT INTO license VALUES(DEFAULT, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, license.getIndividual_id());
			pstmt.setString(2, license.getName());
			pstmt.setString(3, license.getAgency());
			pstmt.setString(4, license.getPass());
			pstmt.setString(5, license.getAcquireDate());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertLicense Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 포트폴리오 작성
	public boolean insertPortfolio(Portfolio portfolio) {
		boolean result = false;
		String query = "INSERT INTO portfolio VALUES(DEFAULT, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, portfolio.getIndividual_id());
			pstmt.setString(2, portfolio.getName());
			pstmt.setString(3, portfolio.getDetail());
			pstmt.setString(4, portfolio.getUrl());
			pstmt.setString(5, portfolio.getFileName());
			pstmt.setString(6, portfolio.getFileSize());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertPortfolio Error : " + e.getMessage());
		}
		return result;
	}
	
	// 이력서 학력사항 가져오기
	public List<Education> getEducation(String id) {
		List<Education> educations = new ArrayList<Education>();
		String query = "SELECT * FROM education WHERE individual_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String school = rs.getString("school");
				String schoolName = rs.getString("schoolName");
				String schoolStartDate = rs.getString("schoolStartDate");
				String schoolEndDate = rs.getString("schoolEndDate");
				String status = rs.getString("status");
				String department = rs.getString("department");
				String score = rs.getString("score");
				
				Education education = new Education(no, id, school, schoolName, schoolStartDate, schoolEndDate, status, department, score);
				educations.add(education);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getEducation Error : " + e.getMessage());
		}
		return educations;
	}
	
	// 이력서 경력사항 가져오기
	public List<Career> getCareer(String id) {
		List<Career> careers = new ArrayList<Career>();
		String query = "SELECT * FROM career WHERE individual_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String prev_company = rs.getString("prev_company");
				String tenureStartDate = rs.getString("tenureStartDate");
				String tenureEndDate = rs.getString("tenureEndDate");
				String position = rs.getString("position");
				String department = rs.getString("department");
				String work_content = rs.getString("work_content");
				
				Career career = new Career(no, id, prev_company, tenureStartDate, tenureEndDate, position, department, work_content);
				careers.add(career);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getCareer Error : " + e.getMessage());
		}
		return careers;
	}
	
	// 이력서 자격증 가져오기
	public List<License> getLicense(String id) {
		List<License> licenses = new ArrayList<License>();
		String query = "SELECT * FROM license WHERE individual_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
		} catch(Exception e) {
			System.out.println("getLicense Error : " + e.getMessage());
		}
		return licenses;
	}
	
	// 이력서 포트폴리오 가져오기
	public List<Portfolio> getPortfolio(String id) {
		List<Portfolio> portfolios = new ArrayList<Portfolio>();
		String query = "SELECT * FROM portfolio WHERE individual_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
		} catch(Exception e) {
			System.out.println("getPortfolio Error : " + e.getMessage());
		}
		return portfolios;
	}
	
	// 자기소개서 가져오기
	public List<CoverLetter> getCoverLetter(String individual_id) {
		List<CoverLetter> coverLetterList = new ArrayList<CoverLetter>();
		String query = "SELECT * FROM coverLetter WHERE individual_id = ?";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				
				CoverLetter coverLetter = new CoverLetter(no, individual_id, title, content);
				coverLetterList.add(coverLetter);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			System.out.println("getCoverLetter Error : " + e.getMessage());
		}
		return coverLetterList;
	}
	
	// 자기소개서 작성
	public boolean insertCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "INSERT INTO coverLetter "
				+ "VALUES(DEFAULT, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, coverLetter.getIndividual_id());
			pstmt.setString(2, coverLetter.getTitle());
			pstmt.setString(3, coverLetter.getContent());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("deleteCoverLetter Error : " + e.getMessage());
		}
		return result;
	}
	
	// 자기소개서 수정
	public boolean updateCoverLetter(CoverLetter coverLetter) {
		boolean result = false;
		String query = "UPDATE coverLetter "
				+ "SET individual_id = ?, title = ?, content = ? "
				+ "WHERE no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, coverLetter.getIndividual_id());
			pstmt.setString(2, coverLetter.getTitle());
			pstmt.setString(3, coverLetter.getContent());
			pstmt.setInt(4, coverLetter.getNo());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("updateCoverLetter Error : " + e.getMessage());
		}
		return result;
	}
	
	// 자기소개서 삭제
	public boolean deleteCoverLetter(int no) {
		boolean result = false;
		String query = "DELETE FROM coverLetter WHERE no = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("deleteCoverLetter Error : " + e.getMessage());
		}
		return result;
	}
	
	// 개인회원 지원하기
	public boolean insertApply(Apply apply) {
		boolean result = false;
		String query = "INSERT INTO apply VALUES(DEFAULT, ?, ?, ?, ?, DEFAULT)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, apply.getIndividual_id());
			pstmt.setInt(2, apply.getJobOpening_no());
			pstmt.setInt(3, apply.getField_no());
			pstmt.setInt(4, apply.getCoverLetter_no());
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("insertApply Error : " + e.getMessage());
		}
		return result;
	}
	
	// 지원한 공고 데이터 가져오기
	public List<Apply> getApply(String individual_id) {
		List<Apply> applys = new ArrayList<Apply>();
		String query = "SELECT A.*, C.corporateName, F.name AS fieldName, F.career, F.pay FROM apply A "
				+ "JOIN corporation C "
				+ "ON C.id = (SELECT corporation_id FROM jobOpening WHERE no = A.jobOpening_no) "
				+ "JOIN field F "
				+ "ON F.no = A.field_no "
				+ "WHERE individual_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, individual_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				int jobOpening_no = rs.getInt("jobOpening_no");
				int field_no = rs.getInt("field_no");
				int coverLetter_no = rs.getInt("coverLetter_no");
				String status = rs.getString("status");
				String corporateName = rs.getString("corporateName");
				String fieldName = rs.getString("fieldName");
				String career = rs.getString("career");
				String pay = rs.getString("pay");
				
				Apply apply = new Apply(no, individual_id, jobOpening_no, field_no, coverLetter_no, status, corporateName, fieldName, career, pay);
				applys.add(apply);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getApply Error : " + e.getMessage());
		}
		return applys;
	}
}