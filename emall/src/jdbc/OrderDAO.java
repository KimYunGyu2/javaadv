package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class OrderDAO {
	
	public ArrayList<OrderDTO> getList() 
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//디비 연결
		conn = ConnectionPool.get();
		
		String sql = "SELECT * FROM orders";
		
		//던지기
		pstmt = conn.prepareStatement(sql);
		
		//덩어리째 결과받기
		rs = pstmt.executeQuery();
		
		ArrayList<OrderDTO> orders = new ArrayList<OrderDTO>();
		
		while(rs.next()) { // 결과값이 있으면 객체 만들어서 넣기
			orders.add(new OrderDTO(rs.getString("oid"),
									rs.getString("opid"),
									rs.getString("ouid"),
									rs.getString("opname"),
									rs.getString("oprice"),
									rs.getString("ostatus"),
									rs.getString("odate"),
									rs.getString("ograde"),
									rs.getString("ocomm")));
		}
		
		
		return orders;
	}
	
	public ArrayList<OrderDTO> getList(String status) 
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				//디비 연결
				conn = ConnectionPool.get();
				
				String sql = "SELECT * FROM orders where ostatus = ?";
				
				//던지기
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, status);
				
				//덩어리째 결과받기
				rs = pstmt.executeQuery();
				
				ArrayList<OrderDTO> orders = new ArrayList<OrderDTO>();
				
				while(rs.next()) { // 결과값이 있으면 객체 만들어서 넣기
					orders.add(new OrderDTO(rs.getString("oid"),
											rs.getString("opid"),
											rs.getString("ouid"),
											rs.getString("opname"),
											rs.getString("oprice"),
											rs.getString("ostatus"),
											rs.getString("odate"),
											rs.getString("ograde"),
											rs.getString("ocomm")));
				}
				
				
				return orders;
	}
	
	//구매 시작 매서드 status 1 고객
	public int insert() {

	
	return 1;
	}
	
	//입금 확인 매서드 status 2 고객
		public int confirm() {

		
		return 1;
		}
		
	//발송 매서드 status 3 판매자
		public int delivery() {

		
		return 1;
		}
		
	//리뷰 status 4 고객
		public int review() {

		
		return 1;
		}
}
