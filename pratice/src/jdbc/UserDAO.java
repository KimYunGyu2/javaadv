package jdbc;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
	
	public String findId(String uname, String uphone) {
		String uid = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select uid from user where uname=? and uphone=? ";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);			
			
			pstmt.setString(1, uname);
			pstmt.setString(2, uphone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uid = rs.getString("uid");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uid;
	}

	
	public int insert(String uid, String upw, String uname,String uphone, String uemail)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO user VALUES (?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upw);
				pstmt.setString(3, uname);
				pstmt.setString(4, uphone);
				pstmt.setString(5, uemail);
			int result = pstmt.executeUpdate();
			
			return result;
			
		} finally {			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}		
	}	
	
	public int login(String uid, String upw)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT uid, upw FROM user where uid = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,uid);
			rs = pstmt.executeQuery();
			
			if (!rs.next())	return 1;                         //회원이 아닌 경우
			if (!upw.equals(rs.getString("upw"))) return 2;  //암호 틀린경우
			
			return 0;
		} finally {			
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
		
	}
}
