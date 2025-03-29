<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Test</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://img.freepik.com/free-vector/hand-drawn-school-supplies-pattern-background_23-2150855728.jpg?size=626&ext=jpg&ga=GA1.1.461895509.1704712324&semt=ais');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
            text-align: center;
            color: #007bff;
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0;
            font-size: 16px;
            font-weight: bold;
            text-align: left;
            color: #000000;
        }

        input {
            padding: 10px;
            margin: 5px 0 15px 0;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007bff;
            padding: 8px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }
        
        a#back {
            display: inline-block;
            padding: 5px;
            margin-top: 20px;
            background-color: transparent;
            color: #007bff;
            text-decoration: none;
            border-radius: 4px;
            transition: color 0.3s ease;
        }

        a#back:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            Add Test
        </div>
        <form action="saveTest" method="post">
            <label for="tag">Category:</label>
            <input type="text" id="tag" name="tag" required><br>
            <label for="numOfQuestions">Number of Questions:</label>
            <input type="number" id="numOfQuestions" name="numOfQuestions" required>
            <input type="submit" value="Submit">
            <a href="Batch" id="back">Go back</a>
        </form>
    </div>
</body>
</html>
