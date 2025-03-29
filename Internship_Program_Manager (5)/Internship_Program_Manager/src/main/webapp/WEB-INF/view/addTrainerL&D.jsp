<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Trainer</title>
    <!-- Add any additional styling or imports as needed -->
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
            background: url(' https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149005675.jpg?w=740&t=st=1705129072~exp=1705129672~hmac=fbc8cc928c232ce577e0cec32cc5e8d5a3173ad71299c30e15bde739cd436b1c');
            background-size: cover;
            background-position: center;
            background-attachment: fixed; 
        }

        h2 {
            color: #007bff;
            margin-left:550px;
        }

        form {
            max-width: 400px;
            margin-top: 20px;
            margin-left:450px;
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
            background-color: #0056b3;
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
            margin-left:450px;
        }

        .go-back-button:hover {
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

<h2>Add New Trainer</h2>

<!-- <form action="AddNewTrainerPost" method="post">

    <label for="trainerName">Name:</label>
    <input type="text" id="trainerName" placeholder="Enter your name as Trainername-java" name="trainerName" required><br>
     <form:errors path="trainerName" style="color:red" /><br>
      -->
     
       <form:form modelAttribute="trainer" action="AddNewTrainerPostLD" method="post" onsubmit="return validatePassword()">

	 <label for="userName">User Name:</label>
   
     
     <form:input type="text" id="userName" path="userName" name="userName" required="required" />
        <form:errors path="userName" style="color:red" /><br>
         <label for="password">Password:</label>
        
        <form:input  type="password" id="password" path="Password" value="${password}" name="password" required="required" readonly="readonly"/>
        <%--  <form:errors path="Password" style="color:red" /><br><br> --%>
   
    <label for="trainerName">Name:</label>
   
     
     <form:input type="text" id="trainerName" path="trainerName" name="trainerName" required="required" />
        <form:errors path="trainerName" style="color:red" /><br>
        
       
        <label for="Email">Email:</label>
     
     <form:input type="email" id="Email" path="Email" name="Email" required="required"/>
     <form:errors path="Email" style="color:red" /><br>
            <input type="submit" value="Submit">
        </form:form>
     


<!-- "Go Back" button -->
<a class="go-back-button" href="javascript:history.go(-1)">Go Back</a>

</body>
</html>
