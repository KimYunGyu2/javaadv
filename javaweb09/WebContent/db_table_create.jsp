<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 만들기</title>
</head>
<body>
<%
// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
// DB연결
	String url = "jdbc:mysql://localhost:3306/school";
	String id = "root";
	String pw = "1234";
	
	Connection conn = null;   // DB 연결 객체
	PreparedStatement pstmt = null;  // DB에 전달할 SQL 구문 객체
	
	conn = DriverManager.getConnection(url, id, pw);

// 테이블 만들기 SQL

	String sql = "CREATE TABLE emp("
			+"sabun int not null,"
			+"name   varchar(10),"
			+"dept   varchar(20),"
			+"primary key(sabun))";

	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
// DB 연결 종료
	if (pstmt != null) pstmt.close();	
	if (conn != null) conn.close();

	
%>
</body>
</html>