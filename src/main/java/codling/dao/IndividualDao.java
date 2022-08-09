package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import codling.identity.CoverLetter;
import codling.identity.Individual;

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
}