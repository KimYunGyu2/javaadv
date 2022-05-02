<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //jdbc 드라이버 로딩
String driverClass = "com.mysql.jdbc.Driver";

try {
	Class.forName(driverClass);
	out.print("JDBC Driver loading 성공!!<br>");
	} catch (ClassNotFoundException err) {
		out.print("JDBC Driver loading 실패!!<br>");
	}

//DB 연결

String url = "jdbc:mysql://localhost:3306/";
String id = "root";
String pw = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
   conn = DriverManager.getConnection(url, id, pw);
   out.print("SQL DB 연결 성공!!<br>");
} catch (SQLException sqlerr) {
   out.print("SQL DB 연결 실패!!<br>");
} 

// PreaparedStatement 구문 설정

try{
String sql = "CREATE DATABASE sojunghaeng";

pstmt = conn.prepareStatement(sql);

pstmt.executeUpdate();

out.print("데이터 베이스 생성 성공 ! <br>");
} catch(SQLException sqlerr) {
	out.print("데이터 베이스 생성 실패 ! <br>");
	out.print(sqlerr.getMessage() + "<br>");
} finally {
	//데이터베이스 연결 종료
	if (conn != null) conn.close();
	if (pstmt != null) pstmt.close();
	out.print("SQL DB 연결 종료!!<br>");
}
// 데이터 삽입후 결과는 0 또는 1로 반환된다.




  


%>