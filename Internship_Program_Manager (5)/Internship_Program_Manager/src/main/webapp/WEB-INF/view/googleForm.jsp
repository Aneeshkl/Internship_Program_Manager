<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Google Form Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            color: #333333;
            margin: 150px;
            text-align: center;
            background: url('https://img.freepik.com/free-vector/soft-blue-color-watercolor-texture-background_1055-17697.jpg?w=740&t=st=1704986303~exp=1704986903~hmac=a780ca477f506e3b9ad46e605b003fb1a34eb38b452074c311e9bebf09cef327');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        h1 {
            color: #007bff;
        }

        p {
            font-size: 18px;
            margin-top: 10px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 18px;
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }

        .go-back-btn {
            margin-top: 20px;
            background-color: #007bff;
            color: #ffffff; /* White text */
            border: none;
            padding: 10px 20px;
           
            border-radius: 5px;
            cursor: pointer;
        }

        .go-back-btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <h1>Welcome to the Google Form Page</h1>
    <p>Click the below link to access the Google Form:</p>
    <a href="<%= request.getAttribute("googleFormUrl") %>">Go to Google Form</a><br>

    <%-- Log or print the URL --%>
    <%
        String googleFormUrl = (String) request.getAttribute("googleFormUrl");
        System.out.println("Google Form URL: " + googleFormUrl);
    %>

    <a class="go-back" href="javascript:history.back()">Go Back</a>
</body>
</html>
