<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
    <title>Assigned Test</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://i.pinimg.com/1200x/92/fc/ec/92fcec96696851713ba1c819f9897b07.jpg'); /* Add the path to your background image */
            background-size: cover;
            background-position: center;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #007bff; /* Adjust text color for better visibility on the background image */
        }

        .right-corner {
            cursor: pointer;
            position: absolute;
            top: 20px;
            right: 20px;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 3px;
            background-color: #2980b9;
            color: #fff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .right-corner:hover {
            background-color: #1f6da8;
        }

        table {
            width: 70%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 8px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
        
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .goback-button {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-left:900px;
        }

        .goback-button:hover {
            background-color: #007bff;
        }

        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #217dbb;
        }
    </style>
</head>
<body>
    <h1>Assigned Test Lists</h1>
    <table border="1" width="70%" cellpadding="2">
        <thead>
            <tr>
                <th>Category</th>
                <th>Action 1</th>
                <th>Action 2</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="test" items="${tests}">
                <tr>
                    <td>${test.tag}</td>
                    <td><a href="viewQuestion?id=${test.testId}">View Questions</a></td>
                    <td><a href="download?id=${test.testId}">Download Report</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="button-container">
        <a href="ListOfBatches" class="goback-button">Go Back</a>
    </div>
</body>
</html>
