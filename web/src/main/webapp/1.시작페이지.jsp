<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<p>JSP 사용</p>
* 그냥 입력하면 HTML BODY구역<br>
* JAVA는 태그 언어가 아님 => 태그와 언어와 같이 사용시 태그 안에서 사용<br>
<p>1. 선언문 : 변수, 메소드 선언시</p>
<p>2. 스크립트문 : JAVA 로직</p>
<p>3. 표현문 : 결과 출력</p>

<%! // 자바 코드 : 변수, 메소드
	int count = 3;
	String 소문자변환(String 문자){
		
		return 문자.toLowerCase();
		
	}
%>

<%
	for(int i = 1; i <= count; i++){
		
		out.print("java Server Page" + i + "<br>");
		// HTML에 작성됨
	}
%>

<p>JAVA 출력은 표현문</p>
<%=소문자변환("HELLO JSP") %>

</body>
</html>