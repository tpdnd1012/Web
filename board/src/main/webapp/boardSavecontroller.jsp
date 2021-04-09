<%@page import="java.io.PrintWriter"%>
<%@page import="dto.BoardDto"%>
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

	request.setCharacterEncoding("UTF-8"); // 요청 인코딩 한글

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String author = request.getParameter("author");
	
	BoardDto dto = new BoardDto();
	
	dto.setTitle(title);
	dto.setContents(contents);
	dto.setAuthor(author);
	
	BoardDao dao = BoardDao.getinstance();
	
	int result = dao.boardSave(dto);
	
	if(result == 1)	{
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('등록 완료');");
			script.println("location.href='boardlist.jsp'");
		
		script.println("</script>");
		
	} else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('오류 [ 관리자에게 문의 해주세요. ]');");
			script.println("location.href='boardlist.jsp'");
		
		script.println("</script>");
		
	}
	
%>

</body>
</html>