<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Intern</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyYqBMWO5aFgBodhBrRSyoTKb5BYYI6Dd6"
        crossorigin="anonymous">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 20px;
            background: url('https://img.freepik.com/free-vector/blue-curve-frame-template_53876-114605.jpg?w=740&t=st=1705034757~exp=1705035357~hmac=c5068d82a0e1cf745d22bf143f28bcfc00be8df82c315dc408fe77ba3c7b7535');
            background-position: center;
            background-attachment: fixed; 
            background-size: cover;
        }

        h2 {
            color: #007bff;
            margin-left: 610px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        #gender{
        	width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="text"], input[type="date"], input[type="email"], input[type="password"],input[type="dob"],input[type="tel"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            width:100px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .go-back-btn {
            margin-top: 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .go-back-btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }

        .error-message {
            color: red;
            font-size: 12px;
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
        function validateDOB() {
            var dob = document.getElementById("dob").value;

            if (!dob) {
                alert("Date of Birth cannot be empty.");
                return false;
            }

            // Validate age (18 years or above)
            var currentDate = new Date();
            var selectedDate = new Date(dob);
            var age = currentDate.getFullYear() - selectedDate.getFullYear();

            if (age < 18) {
                alert("Age must be 18 years or above.");
                return false;
            }

            // Validate if the date is not in the past
            if (selectedDate > currentDate) {
                alert("Date of Birth cannot be in the future.");
                return false;
            }

            return true;
        }


        function validateForm() {
            return validatePassword() && validateDOB();
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Edit Intern</h2>

    <form:form modelAttribute="intern" action="updateParticularIntern" method="post" onsubmit="return validateForm()">
        
        <div class="form-group">
            <label for="userName">UserName:</label>
            <form:input type="text" class="form-control" id="userName" path="userName" value="${intern.userName}" name="userName" required="required" readonly="true"/>
            <form:errors path="userName" style="color:red" />
        </div>
        
        <div class="form-group">
            <label for="password">Password:</label>
            <form:input type="password" class="form-control" id="password" path="password" name="password" value="{Password@123456}" placeholder="Enter your new password"/>
            <form:errors path="password" style="color:red" />
        </div>
        
        <div class="form-group">
            <label for="name">Name:</label>
            <form:input type="text" class="form-control" id="name" path="name" value="${intern.name}" name="name" required="required" readonly="true"/>
            <form:errors path="name" style="color:red" />
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <form:input type="text" class="form-control" id="email" path="email" value="${intern.email}" name="email" required="required" readonly="true"/>
            <form:errors path="email" style="color:red" />
        </div>


        <div class="form-group">
            <label for="college">College:</label>
            <form:input type="text" class="form-control" id="college" path="college" name="college" required="required"/>
            <form:errors path="college" style="color:red" />
        </div>

        <div class="form-group">
            <label for="course">Course:</label>
            <form:input type="text" class="form-control" id="course" path="course" name="course" required="required"/>
            <form:errors path="course" style="color:red" />
        </div>

        <div class="form-group">
            <label for="dob">DOB:</label>
            <form:input type="date" class="form-control" id="dob" path="dob" value="${intern.dob}" name="dob" required="required"/>
            <form:errors path="dob" style="color:red" />
        </div>

        <div class="form-group">
            <label for="gender">Gender:</label><br>
            <form:select class="form-control" id="gender" name="gender" path="gender" required="required">
                <form:option value="Male">Male</form:option>
                <form:option value="Female">Female</form:option>
            </form:select>
            <form:errors path="gender" style="color:red" />
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <form:input type="text" class="form-control" id="address" path="address" name="address" required="required"/>
            <form:errors path="address" style="color:red" />
        </div>

        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label><br>
            <form:input type="tel" class="form-control" id="phoneNumber" path="phoneNumber" name="phoneNumber" required="required" readonly="true" />
            <form:errors path="phoneNumber" style="color:red" />
        </div>

        <div class="form-group">
            <label for="shortDescription">Short Description:</label>
            <form:input type="text" class="form-control" id="shortDescription" name="shortDescription" path="shortDescription" required="required"/>
            <form:errors path="shortDescription" style="color:red" />
        </div>

        <div class="form-group">
            <label for="internDuration">Intern Duration:</label>
            <form:input type="text" class="form-control" id="internDuration" path="internDuration" name="internDuration" required="required"/>
            <form:errors path="internDuration" style="color:red" />
        </div>

        <form:input type="hidden" class="form-control" value="${intern.batchID}" path="batchID" required="required"/>
        <form:input type="hidden" class="form-control" value="${intern.internID}" path="internID" required="required"/>

        <div class="form-group" style="display: flex; justify-content: space-between; margin-top: 20px;">
            <input type="submit" class="btn btn-primary go-back-btn" value="Submit">
            <a href="#" class="btn btn-secondary go-back-btn" onclick="history.back()">Go Back</a>
        </div>
    </form:form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-TpNbWDIA4kT0AqENkFg9fppLv0r3m45e1yyCp3BAG2MOad7Ty1gYjP8g5tjDI3eo"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyYqBMWO5aFgBodhBrRSyoTKb5BYYI6Dd6"
    crossorigin="anonymous"></script>
</body>
</html>
