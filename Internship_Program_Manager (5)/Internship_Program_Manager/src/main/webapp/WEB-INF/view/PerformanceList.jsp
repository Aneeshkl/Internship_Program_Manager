<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Performance Details</title>
    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add any additional styling or imports as needed -->
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
            color: #495057;
             background: url('https://img.freepik.com/premium-vector/abstract-background-vector-illustration-wallpaper-with-blue-light-color-blue-grid-mosaic_354831-237.jpg?w=740');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .container {
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
        }

        h2 {
            color: #007bff;
        }

        table {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        .btn-edit, .btn-delete {
            margin-top: 10px;
            display: inline-block;
        }
         .go-back-button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }

        .go-back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">Performance Details</h2>

    <c:if test="${not empty performanceList}">
        <table class="table table-bordered">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Category</th>
                <th>Score</th>
                <th>Rank</th>
            </tr>
            <c:forEach var="performance" items="${performanceList}">
                <tr>
                    <td>${performance.name}</td>
                    <td>${performance.email}</td>
                    <td>${performance.tag}</td>
                    <td>${performance.score}</td>
                    <td>${performance.rank}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
     <a href="InternHome?name=${name}" class="go-back-button">Go Back</a>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
