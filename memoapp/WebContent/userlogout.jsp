<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

session.invalidate();
out.print("<script> alert('로그아웃합니다.');");
out.print("location.href='userlogin.jsp'");
out.print("</script>");

%>