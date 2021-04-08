<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDao"%>
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
	// 세션 : 서버에 데이터 저장 [ 페이지가 변경되도 동일한 데이터 사용 ]
	String logid = (String)session.getAttribute("user");

	MemberDao dao = MemberDao.getinstance();
	
	int result = dao.delete(logid);
	
	if(result == 1){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('회원 탈퇴 되었습니다.');");
			script.println("location.href='logout.jsp'");
		
		script.println("</script>");
		
	}
	
	if(result == -1){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('DB 오류 [ 관리자에게 문의해주세요. ]');");
			script.println("location.href='main.jsp'");
		
		script.println("</script>");
		
	}

%>

</body>
</html>