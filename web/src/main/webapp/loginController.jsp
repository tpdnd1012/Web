<%@page import="java.io.PrintWriter"%>
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

<%

// form ���� action : �������� �ϴ� ��ġ

// method : get / post

String id = request.getParameter("id");
String password = request.getParameter("password");

MemberDao dao = MemberDao.getinstance();

int result = dao.login(id, password);

if(result == 1){ // �α��� ����

	// ���� �ο�
	
	session.setAttribute("user", id);
		// setAttribute("����ID", ��);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	
		script.println("alert('�ȳ��ϼ���');");
		script.println("location.href='main.jsp'");
	
	script.println("</script>");
	
}

if(result == 2){ // �α��� ���� // ���̵�, ��й�ȣ Ʋ��
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	
		script.println("alert('��ġ�ϴ� ������ �����ϴ�');");
		script.println("history.back()");
	
	script.println("</script>");
	
}

if(result == -1){ // DB ����
	
	out.print("����");
	
}

%>

</body>
</html>