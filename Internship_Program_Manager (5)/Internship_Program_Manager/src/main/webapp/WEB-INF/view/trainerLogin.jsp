<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background:
		url('https://img.freepik.com/free-photo/close-up-male-hands-using-laptop-home_1150-790.jpg?w=740&t=st=1704730252~exp=1704730852~hmac=cd19038c861a94d3364df072d729e8e5dc0fa88f9d74743b72bf73822f641917');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
}

.login-container {
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 400px;
	width: 100%;
	position: relative;
}

h2 {
	color: #007bff;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

.form-control {
	width: calc(100% - 26px);
	padding-right: 26px;
}

.btn-primary {
	background-color: #007bff;
	width: 100%;
}

.eye-button {
	cursor: pointer;
	position: absolute;
	right: 5px;
	top: 50%;
	transform: translateY(-50%);
	padding: 8px;
	display: flex;
	align-items: center;
}
</style>
<meta charset="UTF-8">
<title>Trainer Login</title>
</head>
<jsp:include page="style.jsp"></jsp:include>
<body>
	<div class="login-container">
		<h2>Login</h2>
		<form:form modelAttribute="loginTrainer" class="container"
			action="trainerLoginPost" method="post">
            Username : <form:input type="text" path="userName"
				class="form-control" value="${loginTrainer.userName}" name="userName" />
            Password : 
            <div style="position: relative;">
				<form:input type="password" class="form-control"
					oncopy="return false" oncut="return false" path="password"
					value="${loginTrainer.password}" name="password" id="password" />
				<button type="button" id="togglePassword" class="eye-button">👁️</button>
			</div>
             Email : <form:input type="email" path="Email"
				class="form-control" value="${loginTrainer.email}" name="Email" /><br>
			
			<input type="submit" class="btn-primary" value="Submit" />
		</form:form>
		<hr>
		<font color="red"> ${message } </font>
	</div>

	<script>
   


        document.addEventListener('DOMContentLoaded', function () {
            const passwordInput = document.getElementById('password');
            const togglePasswordButton = document.getElementById('togglePassword');

            togglePasswordButton.addEventListener('click', function () {
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    togglePasswordButton.innerHTML = '👁️';
                } else {
                    passwordInput.type = 'password';
                    togglePasswordButton.innerHTML = '👁️';
                }
            });
        });
    </script>
</body>
</html>