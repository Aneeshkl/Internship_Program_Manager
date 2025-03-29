<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
    <title>Reassign Test</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://www.shutterstock.com/image-photo/blue-paper-background-260nw-398705026.jpg'); /* Add the path to your background image */
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

        .form-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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
            margin-left: 900px;
        }

        .goback-button:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #3498db;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #217dbb;
        }
    </style>
</head>
<body>
    <h1>Reassigned Test Lists</h1>
    <div class="form-container">
        <table border="1" width="100%" cellpadding="2">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Action 1</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="test" items="${tests}">
                    <tr>
                        <td>${test.tag}</td>
                        <td><a href="ReassignTest?id=${test.testId}" onClick="return confirmReassign();">Reassign</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="button-container">
        <a href="listAllInternByBatchId?id=${batchId}" class="goback-button">Go Back</a>
    </div>
    <script>
        function confirmReassign() {
            return confirm("Are you sure you want to reassign the test?");
        }
    </script>
</body>
</html>
