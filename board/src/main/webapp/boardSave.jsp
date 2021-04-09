<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="boardSavecontroller.jsp" method="post">

	<table>
	
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
		</tr>
		
		<tr>
			<td><input type="text" name="title"></td>
			<td><textarea rows="" cols="" name="contents"></textarea></td>
			<td><input type="text" name="author"></td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	
	</table>

</form>
</body>
</html>