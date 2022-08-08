package codling.dao;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import codling.identity.Announcement;
import codling.identity.Corporation;
import codling.identity.Field;
import codling.identity.JobOpening;
import codling.identity.JobOpeningManagement;

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
				String corporateName = rs.getString("name");
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
			System.out.println("getIndiInfo Error : " + e.getMessage());
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
	//index 공고 들고오기
	public ArrayList<Announcement> indexContents() {
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
				+ "FROM field F "
				+ "JOIN jobopening J ON F.jobopening_no = J.no "
				+ "JOIN corporation C ON J.corporation_id = C.id "
				+ "ORDER BY J.count";
		
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
	
	//newcomer 공고 들고오기
		public ArrayList<Announcement> newcomerContents() {
			ArrayList<Announcement> list = new ArrayList<Announcement>();
			String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
					+ "FROM field F "
					+ "JOIN jobopening J ON F.jobopening_no = J.no "
					+ "JOIN corporation C ON J.corporation_id = C.id "
					+ "WHERE F.career like '%신입%' ORDER BY J.count";
			
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
		
		//career 공고 들고오기
				public ArrayList<Announcement> careerContents() {
					ArrayList<Announcement> list = new ArrayList<Announcement>();
					String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
							+ "FROM field F "
							+ "JOIN jobopening J ON F.jobopening_no = J.no "
							+ "JOIN corporation C ON J.corporation_id = C.id "
							+ "WHERE F.career REGEXP '[0-9]+' ORDER BY J.count;";
					
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
				
				//top100 공고 들고오기
				public ArrayList<Announcement> top100Contents() {
					ArrayList<Announcement> list = new ArrayList<Announcement>();
					String query = "SELECT C.corporateName, J.title, F.stack, F.career, F.pay, J.no, J.count "
							+ "FROM field F "
							+ "JOIN jobopening J ON F.jobopening_no = J.no "
							+ "JOIN corporation C ON J.corporation_id = C.id "
							+ "ORDER BY J.count LIMIT 100";
					
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
				
				//공고관리 공고불러오기
				public ArrayList<JobOpeningManagement> jobOpeningManagement(String id) {
					ArrayList<JobOpeningManagement> list = new ArrayList<JobOpeningManagement>();
					String query = "SELECT J.title, J.startDate, J.endDate, F.name, F.career, F.position, J.region, J.no "
							+ "FROM field F "
							+ "JOIN jobopening J ON F.jobopening_no = J.no "
							+ "WHERE J.corporation_id= ? "
							+ "ORDER BY J.no";
					try {
						conn = getConnection();
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							
							String title = rs.getString("title");
							String startDate = rs.getString("startDate");
							String endDate = rs.getString("endDate");
							String name = rs.getString("name");
							String career = rs.getString("career");
							String position = rs.getString("position");
							String region = rs.getString("region");
							int no = rs.getInt("no");
							jobOpeningManagement jobOpeningManagement = new JobOpeningManagement(title, startDate, endDate, name, career, position, region, no);
							list.add(jobOpeningManagement);
						}
						rs.close();
						pstmt.close();
						conn.close();
					} catch (Exception e) {
						System.out.println("jobOpeningManagement Error : " + e.getMessage());
					}
					return list;
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
}