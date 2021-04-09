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

	int num = Integer.parseInt(request.getParameter("num"));

	BoardDao dao = BoardDao.getinstance();
	
	BoardDto dto = dao.board(num);

%>

<form>

	<table>
	
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
		</tr>
		
		<tr>
			<td><input type="text" name="title" value="<%=dto.getTitle() %>" readonly="readonly"></td>
			<td><textarea rows="" cols="" name="contents" readonly="readonly"><%=dto.getContents() %></textarea></td>
			<td><input type="text" name="author" value="<%=dto.getAuthor() %>" readonly="readonly"></td>
		</tr>
		
	
	</table>

</form>

<a href="boardSave.jsp">글작성</a>

</body>
</html>