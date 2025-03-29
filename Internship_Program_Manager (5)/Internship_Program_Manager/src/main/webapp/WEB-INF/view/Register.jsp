<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
            height: 100vh; /* Adjust as needed */
            background: url('https://img.freepik.com/premium-vector/sortir-1_7081-646.jpg?w=740');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .registration-container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
        }

        .btn-primary {
            background-color: #007bff;
            width: 100%;
        }
    </style>
<meta charset="ISO-8859-1">
<title>Registration</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>

<jsp:include page="style.jsp"></jsp:include>
<body><c:if test="${not empty message}">${message}</c:if>
    <div class="registration-container">
        <h2>Registration</h2>
        <form:form modelAttribute="registerUser" action="registerPost" method="post">
            <div class="form-group mb-3">
                UserName : <form:input type="text" path="username" class="form-control"  name="username"/>
                <form:errors path="username" style="color:red;"/>
            </div> 
            <div class="form-group mb-3">
                Password : <form:input type="password" path="password" class="form-control" name="password"/>
                <form:errors path="password" style="color:red;"/>
            </div> 
            <div class="form-group mb-3">
                Email : <form:input type="email" path="email" class="form-control" name="email"/>
                <form:errors path="email" style="color:red;"/>
          
               
            </div><br><br>
            
            <button type="submit" class="btn-primary">Submit</button>
        </form:form>
        
<font color="blue">
    ${message } 
    </font>
    </div>
</body>
</html>
