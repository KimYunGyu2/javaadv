<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 드라이버 로딩</title>
</head>
<body>
<%
//JDBC 드라이버 로딩테스트

	try {
	Class.forName("com.mysql.jdbc.Driver");
	out.print("JDBC Driver loading 성공!!<br>");
	} catch (ClassNotFoundException err) {
		out.print("JDBC Driver loading 실패!!");
	}


	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns","root","1234");

%>
</body>
</html>