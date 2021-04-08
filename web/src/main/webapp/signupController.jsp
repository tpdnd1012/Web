<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
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

	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birthyy = request.getParameter("birthyy");
	String birthmm = request.getParameter("birthmm");
	String birthdd = request.getParameter("birthdd");
	
	String birth = birthyy + "/" + birthmm + "/" + birthdd;
	
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	
	String mail = mail1 + "@" + mail2;
	
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	
	String address = address1 + "-" + address2 + "-" + address3;
	
	MemberDto memberdto = new MemberDto();
	
	memberdto.setId(id);
	memberdto.setPassword(password);
	memberdto.setName(name);
	memberdto.setGender(gender);
	memberdto.setBirth(birth);
	memberdto.setMail(mail);
	memberdto.setPhone(phone);
	memberdto.setAddress(address);
	
	Date date = new Date();
	
	memberdto.setRegist_day(date.toString());
	
	MemberDao dao = MemberDao.getinstance();
	
	int result = dao.signup(memberdto);
	
	if(result == 1){
		
		session.setAttribute("user", id);
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('가입 완료');");
			script.println("location.href='main.jsp'");
		
		script.println("</script>");
		
	}
	
	if(result == -1){
		
		out.print("DB 오류");
		
	}
	
%>

</body>
</html>