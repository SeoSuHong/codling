package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import codling.identity.Career;
import codling.identity.CoverLetter;
import codling.identity.Education;
import codling.identity.Individual;
import codling.identity.JobOpening;
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
				
				individual = new Individual(id, password, name, birth, gender, email, phone, address, "");
				
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
		String query = "INSERT INTO individual VALUES (?,DEFAULT,?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
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
	
	// 개인회원 자기소개서 가져오기
	public CoverLetter getCoverletter(CoverLetter coverLetter) {
		CoverLetter coverletter = null;
		String query = "select * from coverletter";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				String individual_id = rs.getString("individual_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				
				coverletter = new CoverLetter(no, individual_id, title, content);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			System.out.println("getCoverletter errors : "+e.getMessage());
		}
		return coverletter;
	}
	
	//이력서 이력서 title stack update
	public boolean upDateResumeTitleStack(String title, String stack, String indiId) {
		boolean result = false;
		String query ="UPDATE individual "
				+ "SET resumeTitle = ?, stack = ? "
				+ "WHERE id = ?";
		try {
			if(!title.equals("") && !stack.equals("") && !indiId.equals("")) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, title);
				pstmt.setString(2, stack);
				pstmt.setString(3, indiId);
				if(pstmt.executeUpdate() == 1) result = true;
				pstmt.close();
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("setResumeTitleStack errors : " + e.getMessage());
		}
		return result;
	}
	//이력서 학력 insert
	public boolean setEducation(List<Education> educationList) {
		boolean result = false;
		int count = 0;
		String query = "INSERT INTO education VALUES(DEFAULT,?,?,?,?,?,?,?,?)";
		
		try {
			for(int i = 0; i < educationList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Education education = educationList.get(i);
				pstmt.setString(1, education.getIndividual_id());
				pstmt.setString(2, education.getSchool());
				pstmt.setString(3, education.getSchoolName());
				pstmt.setString(4, education.getSchoolStartDate());
				pstmt.setString(5, education.getSchoolEndDate());
				pstmt.setString(6, education.getStatus());
				pstmt.setString(7, education.getDepartment());
				pstmt.setString(8, education.getScore());
				
				if(pstmt.executeUpdate() == 1) count++;
				
				pstmt.close();
				conn.close();
			}
			
			if(count == educationList.size()) result = true;
		}catch (Exception e) {
			System.out.println("setEducation errors : "+e.getMessage());
		}
		return result;
	}
	//이력서 경력사항 insert
	public int setCareer(List<Career> careerList) {
		int result = 0;
		String query = "INSERT INTO career VALUES(DEFAULT,?,?,?,?,?,?,?)";
		
		try {
			for(int i = 0; i < careerList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Career career = careerList.get(i);
				pstmt.setString(1, career.getIndividual_id());
				pstmt.setString(2, career.getPrev_company());
				pstmt.setString(3, career.getTenureStart());
				pstmt.setString(4, career.getTenureEnd());
				pstmt.setString(5, career.getPosition());
				pstmt.setString(6, career.getDepartment());
				pstmt.setString(7, career.getWork_content());
				
				if(pstmt.executeUpdate() == 1) result++;
				
				pstmt.close();
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("setCareer errors :" + e.getMessage());
		}
		return result;
	}
	//이력서 자격증 insert
	public int setLicense(List<License> licenseList) {
		int result = 0;
		String query = "INSERT INTO license VALUES(DEFAULT,?,?,?,?,?)";
		
		try {
			for(int i = 0; i < licenseList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				License license = licenseList.get(i);
				pstmt.setString(1, license.getIndividual_id());
				pstmt.setString(2, license.getName());
				pstmt.setString(3, license.getAgency());
				pstmt.setString(4, license.getPass());
				pstmt.setString(5, license.getAcquireDate());
				
				if(pstmt.executeUpdate() == 1) result++;
				
				pstmt.close();
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("setLicense error : " + e.getMessage());
		}
		return result;
		
	}
	//이력서 포트폴리오 insert
	public int setportfolio(List<Portfolio> portfolioList) {
		int result = 0;
		String query = "INSERT INTO portfolio VALUES(DEFAULT,?,?,?,?,?,?,?,?)";
		
		try {
			for(int i = 0; i < portfolioList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Portfolio portfolio = portfolioList.get(i);
				pstmt.setString(1, portfolio.getIndividual_id());
				pstmt.setString(2, portfolio.getName());
				pstmt.setString(3, portfolio.getDetail());
				pstmt.setString(4, portfolio.getUrl());
				pstmt.setString(5, portfolio.getTitle());
				pstmt.setString(6, portfolio.getFileName());
				pstmt.setString(7, portfolio.getFiledetail());
				pstmt.setString(8, portfolio.getFileSize());
				
				if(pstmt.executeUpdate() == 1) result++;
				
				pstmt.close();
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("setportfolio errors : " + e.getMessage());
		}
		return result;	
	}
	
	//파일 업로드
	public boolean setfile(List<Portfolio> portfolioList) {
		boolean result = false;
		String query = "UPDATE portfolio SET title = ?, fileName = ?, filedetail = ?, fileSize = ? WHERE individual_id = ?";
		
		try {
			for(int i = 0; i < portfolioList.size(); i++) {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				Portfolio portfolio = portfolioList.get(i);
				pstmt.setString(1, portfolio.getTitle());
				pstmt.setString(2, portfolio.getFileName());
				pstmt.setString(3, portfolio.getFiledetail());
				pstmt.setString(4, portfolio.getFileSize());
				pstmt.setString(5, portfolio.getIndividual_id());
				
				if(pstmt.executeUpdate() == 1) result = true;
				
				pstmt.close();
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("setportfolio errors : " + e.getMessage());
		}
		return result;
	}
}