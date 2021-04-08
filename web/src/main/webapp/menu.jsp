<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<!-- �ܺ����� CSS �������� [ ��Ʈ��Ʈ�� ] -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- ����̽� ũ�⿡ ���� ũ�� ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- �ܺ����� JS �������� [ ��Ʈ��Ʈ�� ] -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- �ܺ����� JQ �������� [ ��Ʈ��Ʈ�� ] -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<style type="text/css">

body {
	width: 1000px;
	margin: 0 auto;
}

.container {
	padding-left: 0;
}

</style>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
			data-target="#bs-example-navbar-collapase-1" aria-expanded="false">
		
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		
		</button>
		
		<a class="navbar-brand" href="main.jsp">
		
			<img alt="" src="images/��Ÿ����.png" width="30px">
		
		</a>
		
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		
			<ul class="nav navbar-nav">
				<li><a href="#">��� ��ǰ</a></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">TOP30 ��ǰ<span class="caret"></span></a>
						
						<ul class="dropdown-menu">
							<li><a href="#">����</a></li>
							<li><a href="#">��ä</a></li>
						</ul>
						
				</li>
						
				<li><a href="#">��������</a></li>
				<li><a href="#">Ŀ�´�Ƽ</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
			
				<%
				
					String logid = (String)session.getAttribute("user"); //���� ȣ��
				
				%>
				
				<%
				
					if(logid != null){
					
					%>
						<%=logid %>
						<li><a href="logout.jsp">�α׾ƿ�</a></li>
						<li><a href="memberinfo.jsp">ȸ������</a></li>
					<%
					
					if(logid.equals("admin")){
						
					%>
						<li><a href="#">������������</a></li>
						
					<%
					}
				}else {
					
					%>
						<li><a href="login.jsp"><img alt="" src="images/�α��ηΰ�.png" width="25" height="25">�α���</a></li>
						<li><a href="signup.jsp">ȸ������</a></li>
					<%
				}
				%>
				
			</ul>
		
		</div>
</nav>

</body>
</html>