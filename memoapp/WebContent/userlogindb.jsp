<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");	
	
	UserDAO dao = new UserDAO();
	
	int result = dao.login(userid, userpw);
	
	
	if (result == 1) { // DB에 아이디 자체가 존재하지 않으므로 회원 가입으로 리다이렉트
		out.print("<script> alert('아이디가 존재하지 않습니다. 회원가입 페이지로 이동합니다.');");
		out.print("location.href='userjoin.jsp'");
			out.print("</script>");			
	}else if (result == 2){ // 아이디는 있으나 비밀번호가 불일치
		out.print("<script> alert('암호가 일치하지 않습니다. 다시 로그인 하세요.');");%>
		history.back();
		<%out.print("</script>");	
	}else {		 
		session.setAttribute("userid", userid);
		response.sendRedirect("main.jsp");
	}
	
%>