<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trainer Details</title>
    <!-- Add any additional styling or imports as needed -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
            background: url('https://img.freepik.com/free-photo/fitness-concept-with-blue-jumping-rope_23-2148531440.jpg?w=826&t=st=1704967006~exp=1704967606~hmac=0385349ecc9fb42938e357522788cd5d2c47eead20bba3d311d1af6e44ef9c0d');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        h2 {
            color: #007bff;
        }

        table {
            width: 50%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        a {
            text-decoration: none;
            color: #007bff;
            margin-right: 10px;
        }

        a:hover {
            text-decoration: underline;
        }

        .go-back-button {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
            cursor: pointer;
        }

        .go-back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>Trainer Details</h2>

<c:if test="${not empty trainer}">
    <table>
        <tr>
            <th>Name</th>
              <th>Email</th>
        </tr>

        <tr>
            <td>${trainer.trainerName}</td>
            <td>${trainer.email}</td>
        </tr>
    </table>

    <!-- "Go Back" button -->
    <a class="go-back-button" href="javascript:history.go(-1)">Go Back</a>
</c:if>

</body>
</html>
