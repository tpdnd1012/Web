<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%!
	int count = 0; // 선언문 // 변수선언 가능 [ 전역 변수 ]
	
	public void 함수(){};
	
%>

<body>

<!-- JAVA 스크립트문 -->
<%

	out.print(++count);

%>

<!-- JAVA 표현식 -->
<%=count %>

<p>구구단</p>
<%

int count2 = 0; // 변수 선언 가능 [ 지역 변수 ]
//public void 함수(){};

for(int i = 1; i <= 9; i++){
	
	for(int j = 1; j <= 9; j++){
		
		out.print(i + " * " + j + " = " + i * j + "<br>");
		
	}
	
}

%>

</body>
</html>