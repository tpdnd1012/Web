<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%!
	int count = 0; // ���� // �������� ���� [ ���� ���� ]
	
	public void �Լ�(){};
	
%>

<body>

<!-- JAVA ��ũ��Ʈ�� -->
<%

	out.print(++count);

%>

<!-- JAVA ǥ���� -->
<%=count %>

<p>������</p>
<%

int count2 = 0; // ���� ���� ���� [ ���� ���� ]
//public void �Լ�(){};

for(int i = 1; i <= 9; i++){
	
	for(int j = 1; j <= 9; j++){
		
		out.print(i + " * " + j + " = " + i * j + "<br>");
		
	}
	
}

%>

</body>
</html>