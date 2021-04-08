<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@include file="menu.jsp" %>

<div class="container">

	<div class="col-sm-3"></div>
	<div class="col-sm-6">
		<form action="loginController.jsp" method="post">
	
			<div class="col-sm-7"> <!-- col-sm-12 가 최대 : 홈페이지 가로 사이즈 12 등분 -->
				<div class="form-group row">	
					
					<div>			
						<input type="text" name="id" class="form-control" placeholder="Login-ID">			
					</div>
					
					<div>
						<input type="password" name="password" class="form-control" placeholder="Login-Password">
					</div>	
					
				</div>	
			</div>
			
			<div class="col-sm-5">
				<button type="submit" class="btn btn btn-lg btn-success btn-block">로그인</button>
			</div>
		
		</form>
	</div>
</div>

</body>
</html>