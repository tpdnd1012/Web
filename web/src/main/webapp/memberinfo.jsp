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
// DB ����

MemberDao dao = MemberDao.getinstance();

MemberDto memberDto = dao.getmember(logid);


%>

<table>

	<tr>
		<td>���̵�</td>
		<td>
			<input type="text" name="id" placeholder="Signup ID" value=<%=memberDto.getId() %>><button>�ߺ�üũ</button>
		</td>
	</tr>
	
	<tr>
		<td>��й�ȣ</td>
		<td><input type="password" name="password" placeholder="Signup Password" value=<%=memberDto.getPassword() %>></td>
	</tr>
	
	<tr>
		<td>�̸�</td>
		<td><input type="text" name="name" placeholder="Signup name" value=<%=memberDto.getName() %>></td>
	</tr>
	
	<tr>
		<td>����</td>
		<td><input type="text" name="gender" value=<%=memberDto.getGender() %>></td>
	</tr>
	
	<tr>
		<td>����</td>
		<td>
			<input type="text" name="birth" value=<%=memberDto.getBirth() %>>
		</td>
	</tr>
	
	<tr>
		<td>�̸���</td>
		<td>
			<input type="text" name="mail" value=<%=memberDto.getMail() %>>
		</td>
	</tr>
	
	<tr>
		<td>�޴��� ��ȣ</td>
		<td>
			<input type="text" name="phone" value=<%=memberDto.getPhone() %>>
		</td>
	</tr>
	
	<tr>
		<td>�ּ�</td>
		<td>
			<input type="text" name="address" value=<%=memberDto.getAddress() %>>
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" value="���">
			<input type="reset" value="���">
		</td>
		
	</tr>

</table>

<!-- ȸ�� Ż�� -->

<a href="memberdeleteController.jsp">ȸ��Ż��</a>
<a href="memberModify.jsp">ȸ����������</a>

</body>
</html>