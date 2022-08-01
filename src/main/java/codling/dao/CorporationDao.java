package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;

<<<<<<< HEAD
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
		String query = "SELECT * FROM corporation WHERE id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String position = rs.getString("position");
				String password = rs.getString("password");
				String corporateName = rs.getString("corporateName");
				String corporatePhone = rs.getString("corporatePhone");
				String ceoName = rs.getString("ceoName");
				String corporateNumber = rs.getString("corporateNumber");
				String fileName = rs.getString("fileName");
				String address = rs.getString("address");
				
				corporation = new Corporation(id, position, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, address);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getCorporation Error : " + e.getMessage());
		}
		
		return corporation;
	}
	
	// 공고 정보
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
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				int count = rs.getInt("count");
				
				jobOpening = new JobOpening(no, corporation_id, title, region, startDate, endDate, count);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getJobOpening Error : " + e.getMessage());
		}
		
		return jobOpening;
	}
	
	// 지원분야 정보
	public Field getField(int jobOpening_no) {
		Field field = null;
		String query = "SELECT * FROM field WHERE jobOpening_no=?";
		
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
				String process = rs.getString("process");
				
				field = new Field(no, jobOpening_no, name, career, position, pay, workDay, work, stack, requirement, preference, process);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getJobOpening Error : " + e.getMessage());
		}
		
		return field;
	}
}
=======

public class CorporationDao {
    final static String DB_URL = "jdbc:mysql://localhost:3306/codling";
    final static String DB_NAME = "codling";
    final static String DB_PASSWORD ="1234";
    
    static Connection conn;
    static PreparedStatement pstmt;
    static ResultSet rs;
    
    protected Connection getConnection() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(DB_URL, DB_NAME, DB_PASSWORD);
        return conn;
    }
    
    // 기업회원 정보
    public Corporation getCorporation(String id) {
        Corporation corporation = null;
        String query = "SELECT * FROM corporation WHERE id=?";
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                String position = rs.getString("position");
                String password = rs.getString("password");
                String corporateName = rs.getString("corporateName");
                String corporatePhone = rs.getString("corporatePhone");
                String ceoName = rs.getString("ceoName");
                String corporateNumber = rs.getString("corporateNumber");
                String fileName = rs.getString("fileName");
                String address = rs.getString("address");
                
                corporation = new Corporation(id, position, password, corporateName, corporatePhone, ceoName, corporateNumber, fileName, address);
            
            }
            rs.close();
            pstmt.close();
            conn.close();
        }catch (Exception e) {
            System.out.println("getCorporation Error : " + e.getMessage());
        }
        
        return corporation;    
    }
    
    //공고 정보
    public JobOpening getJobOpening(String id) {
        JobOpening jobOpening = null;
        String query = "SELECT * FROM jobOpening WHERE corporation_id=?";
        
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                int no = rs.getInt("no");
                String corporation_id = rs.getString("corporation_id");
                String title = rs.getString("title");
                String region = rs.getString("region");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                int count = rs.getInt("count");
                
                jobOpening = new JobOpening(no, corporation_id, title, region, startDate, endDate, count);
            }
            
            rs.close();
            pstmt.close();
            conn.close();
        }catch (Exception e) {
            System.out.println("getJobOpening Error : " + e.getMessage());
        }
        return jobOpening;
    }

	public Field getField(int no) {
		// TODO Auto-generated method stub
		return null;
	}
}
>>>>>>> 우진
