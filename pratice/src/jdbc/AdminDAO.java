package jdbc;

import java.sql.*;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class AdminDAO {

	public String findId(String aname, String aphone) {
		String aid = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select aid from admin where aname=? and aphone=? ";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);			
			
			pstmt.setString(1, aname);
			pstmt.setString(2, aphone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				aid = rs.getString("aid");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aid;
	}
	
	public int insert(String aid, String apw)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO admin VALUES (?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, aid);
				pstmt.setString(2, apw);				
			int result = pstmt.executeUpdate();
			
			return result;
			
		} finally {			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}		
	}
	
	public int login(String aid, String apw)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT aid, apw FROM admin where aid = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,aid);
			rs = pstmt.executeQuery();
			
			if (!rs.next())	return 1;                         //회원이 아닌 경우
			if (!apw.equals(rs.getString("apw"))) return 2;  //암호 틀린경우
			
			return 0;
		} finally {			
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
		
	}
}