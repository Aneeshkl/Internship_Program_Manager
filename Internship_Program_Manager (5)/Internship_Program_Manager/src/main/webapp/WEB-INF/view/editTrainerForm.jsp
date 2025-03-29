<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Edit Trainer</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyYqBMWO5aFgBodhBrRSyoTKb5BYYI6Dd6"
	crossorigin="anonymous">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	padding: 20px;
	background:
		url('https://img.freepik.com/free-vector/blue-curve-frame-template_53876-114605.jpg?w=740&t=st=1705034757~exp=1705035357~hmac=c5068d82a0e1cf745d22bf143f28bcfc00be8df82c315dc408fe77ba3c7b7535');
	background-position: center;
	background-attachment: fixed;
	background-size: cover;
}

h2 {
	color: #007bff;
	margin-left: 550px;
}

form {
	max-width: 400px;
	margin-top: 20px;
	margin-left: 450px;
}

label {
	display: block;
	margin-bottom: 5px;
	color: #000000;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #007bff;
	color: #ffffff;
	border: none;
	padding: 12px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b4;
}

.go-back-button {
	background-color: #007bff;
	color: #ffffff;
	border: none;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 10px; /* Adjusted margin */
	margin-right: 10px;
}

.go-back-button:hover {
	background-color: #0056b3;
}

.btn btn-primary {
	background-color: #007bff;
	color: #ffffff;
	border: none;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 10px; /* Adjusted margin */
}

.btn btn-primary:hover {
	background-color: #0056b3;
}
</style>



<script>
        function validatePassword() {
            var password = document.getElementById("password").value;

          
            if (!password.trim()) {
                alert("The password cannot be empty.");
                return false;
            }

            var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[\w@$!%*?&]{8,20}$/;
            if (!passwordPattern.test(password)) {
                alert("Password must have between 8 and 20 characters, including at least one lowercase letter, one uppercase letter, one digit, and one special character from @$!%*#?&.");
                return false;
            }


            return true;
        }
    </script>

</head>
<body>
	<div class="container">
		<h2 class="mt-4">Edit Trainer</h2>
		<form:form modelAttribute="trainers" action="updateTrainer"
			method="post" class="mt-4" onsubmit="return validatePassword()">
			<form:input type="hidden" path="trainerID" name="trainerID"
				readonly="readonly" value="${trainers.trainerID}" />

			<div class="form-group">
				<label for="userName">User Name:</label>
				<form:input type="text" class="form-control" id="userName"
					path="userName" name="userName" readonly="${!trainers.userName}"
					value="${trainers.userName}" required="required" />
				<form:errors path="userName" class="text-danger" style="color:red" />
				<br>

				<div class="form-group">
					<label for="password">Password:</label>
					<form:input type="password" class="form-control" id="password"
						path="Password" value="{password}" name="password"
						required="required" readonly="readonly" />
					<form:errors path="Password" class="text-danger" style="color:red" />
					<br>
					<br>
				</div>

				<div class="form-group">
					<label for="trainerName">Trainer Name:</label>
					<form:input type="text" class="form-control" id="trainerName"
						path="trainerName" name="trainerName"
						readonly="${!trainers.trainerName}"
						value="${trainers.trainerName}" required="required" />
					<form:errors path="trainerName" class="text-danger"
						style="color:red" />
					<br>

				</div>
				<div class="form-group">
					<label for="Email">Email:</label>
					<form:input type="email" class="form-control" id="Email"
						readonly="true" path="Email" name="Email"
						value="${trainers.email}" required="required" />
					<form:errors path="Email" class="text-danger" style="color:red" />
					<br>
				</div>

				<button type="updateTrainer" class="go-back-button">Update
					Trainer</button>

				<a class="go-back-button" href="javascript:history.go(-1)">Go
					Back</a>
		</form:form>
	</div>

	<!-- Bootstrap JS and Popper.js CDN (Optional, only if you need Bootstrap JS features) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-TpNbWDIA4kT0AqENkFg9fppLv0r3m45e1yyCp3BAG2MO ad7Ty1gYjP8g5tjDI3eo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyYqBMWO5aFgBodhBrRSyoTKb5BYYI6Dd6"
		crossorigin="anonymous"></script>
</body>
</html>
