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

// form 에서 action : 보내고자 하는 위치

// method : get / post

String id = request.getParameter("id");
String password = request.getParameter("password");

MemberDao dao = MemberDao.getinstance();

int result = dao.login(id, password);

if(result == 1){ // 로그인 성공

	// 세션 부여
	
	session.setAttribute("user", id);
		// setAttribute("세션ID", 값);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	
		script.println("alert('안녕하세요');");
		script.println("location.href='main.jsp'");
	
	script.println("</script>");
	
}

if(result == 2){ // 로그인 실패 // 아이디, 비밀번호 틀림
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	
		script.println("alert('일치하는 정보가 없습니다');");
		script.println("history.back()");
	
	script.println("</script>");
	
}

if(result == -1){ // DB 오류
	
	out.print("오류");
	
}

%>

</body>
</html>