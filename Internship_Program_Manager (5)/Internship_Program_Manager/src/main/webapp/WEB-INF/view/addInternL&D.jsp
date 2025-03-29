<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Intern</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 20px;
              background: url('https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149005675.jpg?w=740&t=st=1705129072~exp=1705129672~hmac=fbc8cc928c232ce577e0cec32cc5e8d5a3173ad71299c30e15bde739cd436b1c');
            background-size: cover;
            background-position: center;
            background-attachment: fixed; 
        }

        h2 {
            color: #007bff;
            margin-left:590px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color:#000000;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            width:30%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
         .go-back-btn {
            padding: 8px;
            margin-bottom: 10px;
            margin-left:20px;
            box-sizing: border-box;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            width:30%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
           
        }

        .go-back-btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
    </style>
      <script>
        function validateDOB() {
            var dobInput = document.getElementById("dob").value;
            var selectedDate = new Date(dobInput);
            var currentDate = new Date();
            var minDOB = new Date(currentDate.getFullYear() - 18, currentDate.getMonth(), currentDate.getDate());

            if (selectedDate > currentDate) {
                alert("Date of Birth cannot be in the future.");
                return false;
            }

            if (selectedDate > minDOB) {
                alert("Age must be 18 years or older.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Add New Intern</h2>

     <form:form modelAttribute="intern" action="AddNewInternPostLD" method="post"  onsubmit="return validateDOB()">
     
     <label for="userName">UserName:</label>
        <form:input type="text" id="userName" path="userName" value="${userName}" name="userName" required="required" />
          <form:errors path="userName" style="color:red" /><br>
          
          
          <label for="password">Password:</label>
<form:input type="password" id="password" path="password" name="password" />
<form:errors path="password" style="color:red" /><br><br>
     
     
     
     
     
        <label for="name">Name:</label>
        <form:input type="text" id="name" path="name" value="${name}" name="name" required="required" />
          <form:errors path="name" style="color:red" /><br>
        
         <label for="email">Email:</label>
        <form:input type="text" id="email" path="email" value="${email}" name="email" required="required" readonly="readonly"/>
          <form:errors path="email" style="color:red" /><br>
        
               

        <label for="college">College:</label>
        <form:input  type="text" id="college" path="college" name="college" required="required"/>
         <form:errors path="college" style="color:red" /><br><br>

        <label for="course">Course:</label>
        <form:input  type="text" id="course" path="course" name="course" required="required"/>
         <form:errors path="course" style="color:red" /><br><br>

        <label for="dob">DOB:</label>
        <form:input type="date" id="dob" path="dob" value="${intern.dob}" name="dob" required="required"/>
         <form:errors path="dob" style="color:red" /><br><br>

        <label for="gender">Gender:</label>
        <form:select type="text" id="gender"  name="gender" path="gender" required="required">
                                        <form:option value="Male">Male</form:option>
                                        <form:option value="Female">Female</form:option>
                                         </form:select>
                                    <form:errors path="gender" style="color:red" /><br>
        

        <label for="address">Address:</label>
        <form:input type="text" id="address" path="address" name="address" required="required"/>
        <form:errors path="address" style="color:red" /><br>

        <label for="phoneNumber">Phone Number:</label>
        <form:input type="tel" id="phoneNumber" path="phoneNumber" name="phoneNumber" required="required"/>
        <form:errors path="phoneNumber" style="color:red" /><br>

        <label for="shortDescription">Short Description:</label>
        <form:input type="text" id="shortDescription" name="shortDescription" path="shortDescription" required="required"/>
        <form:errors path="shortDescription" style="color:red" /><br>

        <label for="internDuration">Intern Duration:</label>
        <form:input type="text" id="internDuration" path="internDuration" name="internDuration" required="required"/>
         <form:errors path="internDuration" style="color:red" /><br><br>
         
     <form:input type="hidden"  path="batchID" value="${batchID}" required="required"/>
         <form:input type="hidden"  path="batchName" value="${batchName}" required="required"/>
         
        <div style="display: flex; ">
    <input type="submit" value="Submit">
    <a href="#" class="btn go-back-btn" onclick="history.back()">Go Back</a>
</div>
</form:form>

  
</div>

</body>
</html>

