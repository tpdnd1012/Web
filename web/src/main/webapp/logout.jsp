<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	// session.invalidate(); // 모든 세션 없애기

	session.setAttribute("user", null); // 해당 세션 id = null
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	
		script.println("alert('로그아웃 완료');");
		script.println("location.href='main.jsp'");
	
	script.println("</script>");
	
	// JSP 페이지 이동
	//response.sendRedirect("main.jsp");
	
%>

</body>
</html>