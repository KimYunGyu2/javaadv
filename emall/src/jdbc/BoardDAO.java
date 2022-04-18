package jdbc;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {
	
	public ArrayList<BoardDTO> getList()
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM board";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				boards.add(new BoardDTO(rs.getString("bid"),
											rs.getString("btitle"),
											rs.getString("bcontent"),
											rs.getString("buser"),											
											rs.getString("bdate")));
			}
			return boards;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		
	}
	
	
	public BoardDTO getDetail(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM board WHERE bid = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString(1);
			String btitle = rs.getString(2);
			String bcontent = rs.getString(3);
			String buser = rs.getString(4);
			String bdate = rs.getString(5);			
			
			BoardDTO board = new BoardDTO(id, btitle, bcontent, buser, bdate);
			
			return board;
			
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	}

	public boolean insert(String btitle, String bcontent, String buser)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO board VALUES (?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);	
				pstmt.setString(1, null);
				pstmt.setString(2, btitle);
				pstmt.setString(3, bcontent);
				pstmt.setString(4, buser);			
				pstmt.setString(5, LocalDate.now().toString());
				
			int result = pstmt.executeUpdate();
			return (result==1) ? true: false;
		} finally {			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}
}