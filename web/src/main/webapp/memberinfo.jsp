<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@include file="menu.jsp" %>

<%
// DB 연동

MemberDao dao = MemberDao.getinstance();

MemberDto memberDto = dao.getmember(logid);


%>

<table>

	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" placeholder="Signup ID" value=<%=memberDto.getId() %>><button>중복체크</button>
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password" placeholder="Signup Password" value=<%=memberDto.getPassword() %>></td>
	</tr>
	
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" placeholder="Signup name" value=<%=memberDto.getName() %>></td>
	</tr>
	
	<tr>
		<td>성별</td>
		<td><input type="text" name="gender" value=<%=memberDto.getGender() %>></td>
	</tr>
	
	<tr>
		<td>생일</td>
		<td>
			<input type="text" name="birth" value=<%=memberDto.getBirth() %>>
		</td>
	</tr>
	
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="mail" value=<%=memberDto.getMail() %>>
		</td>
	</tr>
	
	<tr>
		<td>휴대폰 번호</td>
		<td>
			<input type="text" name="phone" value=<%=memberDto.getPhone() %>>
		</td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td>
			<input type="text" name="address" value=<%=memberDto.getAddress() %>>
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</td>
		
	</tr>

</table>

<!-- 회원 탈퇴 -->

<a href="memberdeleteController.jsp">회원탈퇴</a>
<a href="memberModify.jsp">회원정보수정</a>

</body>
</html>