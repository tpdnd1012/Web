<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BoardDao"%>
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

	int num = Integer.parseInt(request.getParameter("num"));

 	BoardDao dao = BoardDao.getinstance();
	
	int result = dao.delete(num);
	
	if(result == 1) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('삭제 완료');");
			script.println("location.href='boardlist.jsp'");
		
		script.println("</script>");
		
	} else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('실패 [ 관리자에게 문의해주세요. ]');");
			script.println("location.href='boardlist.jsp'");
		
		script.println("</script>");
		
	}
	
%>

</body>
</html>