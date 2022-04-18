<%@page import="jdbc.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String uid  = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("/user/login.jsp");
		return;
	} // 세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 보기</title>
</head>
<body>
	<%!// 선언문
	String title = "상세 보기";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

	<%@ include file="/_header.jsp"%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>

	<%
		String bid = request.getParameter("bid");
	BoardDTO board = (new BoardDAO()).getDetail(bid);
	%>

	<div class="container">
		<div class="row">
			<div class="col-ma-5">
				<img src="" style="width: 100%">
			</div>
			<div class="col-ma-6">
				<h3><%=board.getBid()%></h3>
				<p><%=board.getBtitle()%>
				<p>
					<b>내용 : <%=board.getBcontent()%></b>
				<p>
					<b>작성일자 : <%=board.getBdate()%></b> 
				<p>	
					<a href="boardlist.jsp"
						class="btn btn-info">뒤로가기</a> <a href="/product/productlist.jsp"
						class="btn btn-secondary">홈으로</a>
			</div>

		</div>
	</div>


	<%@ include file="/_footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
</html>