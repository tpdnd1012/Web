<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</head>
<body>

<%@include file="menu.jsp" %>

<%

	// �α��� �Ǿ� ������ ���� �α�
	
	if(logid != null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
			script.println("alert('�����Ҽ� ���� ������ �Դϴ�.');");
			script.println("history.back()");
		
		script.println("</script>");
		
	}

%>

<form action="signupController.jsp" method="post">

<table>

	<tr>
		<td>���̵�</td>
		<td>
			<input type="text" name="id" placeholder="Signup ID"><button>�ߺ�üũ</button>
		</td>
	</tr>
	
	<tr>
		<td>��й�ȣ</td>
		<td><input type="password" name="password" placeholder="Signup Password"></td>
	</tr>
	
	<tr>
		<td>�̸�</td>
		<td><input type="text" name="name" placeholder="Signup name"></td>
	</tr>
	
	<tr>
		<td>����</td>
		<td><input type="radio" name="gender" value="����">����
		<input type="radio" name="gender" value="����">����</td>
	</tr>
	
	<tr>
		<td>����</td>
		<td>
			<input type="text" name="birthyy">
			<input type="text" name="birthmm">
			<input type="text" name="birthdd">
		</td>
	</tr>
	
	<tr>
		<td>�̸���</td>
		<td>
			<input type="text" name="mail1"> @ 
				<select name = "mail2">
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="kakao.com">kakao.com</option>
				</select>
		</td>
	</tr>
	
	<tr>
		<td>�޴��� ��ȣ</td>
		<td>
			<input type="text" name="phone1">
			<input type="text" name="phone2">
			<input type="text" name="phone3">
		</td>
	</tr>
	
	<tr>
		<td>�ּ�</td>
		<td>
			<input type="text" id="sample4_postcode" placeholder="�����ȣ" name="address1">
			<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
			<input type="text" id="sample4_roadAddress" placeholder="���θ��ּ�" name="address2">
			<input type="text" id="sample4_jibunAddress" placeholder="�����ּ�">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="���ּ�" name="address3">
			<input type="text" id="sample4_extraAddress" placeholder="�����׸�">
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" value="���">
			<input type="reset" value="���">
		</td>
		
	</tr>

</table>

</form>

</body>
</html>