<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");	
	
	UserDAO dao = new UserDAO();
	
	if (!dao.exists(userid)) {
		out.print("<script> alert('존재하지 않는 아이디 입니다. 다시 입력하세요.');");%>
			history.back();			
			<%out.print("</script>");
	}else if(!dao.comparepw(userid, userpw)){
		out.print("<script> alert('잘못된 비밀번호 입니다. 다시 입력하세요.');");%>
		history.back();			
		<%out.print("</script>");
	}else{
		dao.delete(userid);
		out.print("<script>alert('회원 탈퇴 되었습니다.');");
		session.removeAttribute("userid");
		out.print("location.href='userjoin.jsp'");
		out.print("</script>");
		/* out.print("<script> alert('회원 탈퇴 되었습니다.');");
		session.removeAttribute("userid");
		response.sendRedirect("userjoin.jsp"); */
		}

%>