<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<!-- 외부파일 CSS 가져오기 [ 부트스트랩 ] -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 디바이스 크기에 따라 크기 변경 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 외부파일 JS 가져오기 [ 부트스트랩 ] -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 외부파일 JQ 가져오기 [ 부트스트랩 ] -->
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
		
			<img alt="" src="images/스타벅스.png" width="30px">
		
		</a>
		
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		
			<ul class="nav navbar-nav">
				<li><a href="#">모든 상품</a></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">TOP30 상품<span class="caret"></span></a>
						
						<ul class="dropdown-menu">
							<li><a href="#">과일</a></li>
							<li><a href="#">야채</a></li>
						</ul>
						
				</li>
						
				<li><a href="#">공지사항</a></li>
				<li><a href="#">커뮤니티</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
			
				<%
				
					String logid = (String)session.getAttribute("user"); //세션 호출
				
				%>
				
				<%
				
					if(logid != null){
					
					%>
						<%=logid %>
						<li><a href="logout.jsp">로그아웃</a></li>
						<li><a href="memberinfo.jsp">회원정보</a></li>
					<%
					
					if(logid.equals("admin")){
						
					%>
						<li><a href="#">관리자페이지</a></li>
						
					<%
					}
				}else {
					
					%>
						<li><a href="login.jsp"><img alt="" src="images/로그인로고.png" width="25" height="25">로그인</a></li>
						<li><a href="signup.jsp">회원가입</a></li>
					<%
				}
				%>
				
			</ul>
		
		</div>
</nav>

</body>
</html>