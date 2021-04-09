<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function delete2(num) {

		if (confirm("정말 삭제하시겠습니까??") ) { //확인

			location.href='boarddeletecontroller.jsp?num='+ num

		} else { //취소

			location.href='boardlist.jsp'

		}

	}
	
</script>

</head>
<body>
<%

	BoardDao dao = BoardDao.getinstance();

	ArrayList<BoardDto> list = dao.boardlist();

	BoardDto dto = new BoardDto();
	
%>

	<!-- 게시판 리스트 틀 -->
	
<table>

		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>

		<%
		for (int i = 0; i < list.size(); i++) {

			dto = list.get(i);
		%>

		<tr>
			<td><%=dto.getNum()%></td>
			<td><a href="boarddetail.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle()%></a></td>
			<td><%=dto.getContents()%></td>
			<td><%=dto.getAuthor()%></td>
			<td><a href="boardmodify.jsp">수정</a></td>
			<td><a href="#" onclick="delete2('<%=dto.getNum()%>')">삭제</a></td>
		</tr>

		<%
		}
		%>
</table>
	<a href="boardSave.jsp">글작성</a>
</body>
</html>