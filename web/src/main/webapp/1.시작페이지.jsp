<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<p>JSP ���</p>
* �׳� �Է��ϸ� HTML BODY����<br>
* JAVA�� �±� �� �ƴ� => �±׿� ���� ���� ���� �±� �ȿ��� ���<br>
<p>1. ���� : ����, �޼ҵ� �����</p>
<p>2. ��ũ��Ʈ�� : JAVA ����</p>
<p>3. ǥ���� : ��� ���</p>

<%! // �ڹ� �ڵ� : ����, �޼ҵ�
	int count = 3;
	String �ҹ��ں�ȯ(String ����){
		
		return ����.toLowerCase();
		
	}
%>

<%
	for(int i = 1; i <= count; i++){
		
		out.print("java Server Page" + i + "<br>");
		// HTML�� �ۼ���
	}
%>

<p>JAVA ����� ǥ����</p>
<%=�ҹ��ں�ȯ("HELLO JSP") %>

</body>
</html>