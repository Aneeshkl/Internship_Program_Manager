<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome Intern</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 150px;
            text-align: center;
            background:url('https://img.freepik.com/free-vector/blue-curve-frame-template-vector_53876-111537.jpg?w=740&t=st=1704986397~exp=1704986997~hmac=65c6f048a62f80f5ec82d57c8ef46e0e209abbf121da06b2902f3105dfbe74c8');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        h1 {
            color: #333;
        }

        hr {
            border: 1px solid #ccc;
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 10px;
            text-decoration: none;
            background-color: #3498db;
            color: #fff;
            border-radius: 5px;
        }

        a:hover {
            background-color: #2980b9;
        }

        .alert {
            margin: 20px;
            padding: 10px;
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            color: #a94442;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Welcome ${name} </h1>
    <hr>
    <a href="ViewProfile">Profile</a>
    <a href="AttendTest">Attend Test</a>
    <a href="ViewPerformance">Result</a>
    <a href="showGoogleForm">Practice Link</a>
    <a href="logout" onclick="confirmLogout()">Logout</a>
    
    <c:if test="${not empty sessionScope.message}">
        <div class="alert">
            <p>${sessionScope.message}</p>
        </div>
        <script>
            function confirmLogout() {
                if (confirm("Are you sure you want to logout?")) {
                    // If user confirms, remove the message from session and proceed with logout
                    window.location.href = "logout";
                }
            }
        </script>
        <%-- Remove the message from session after displaying --%>
        <% session.removeAttribute("message"); %>
    </c:if>
</body>
</html>
