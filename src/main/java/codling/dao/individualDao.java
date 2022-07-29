package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class individualDao {
	final static String DB_URL = "jdbc:mysql://localhost:3306/codling";
	final static String DB_NAME = "codling";
	final static String DB_PASSWORD ="1234";
	
	static Connection conn;
	static PreparedStatement pstmt;
	static ResultSet rs;
	
	public individualDao() throws Exception {
		conn = getConnection();
	}
	
	protected Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL, DB_NAME, DB_PASSWORD);
		return conn;
	}
}
