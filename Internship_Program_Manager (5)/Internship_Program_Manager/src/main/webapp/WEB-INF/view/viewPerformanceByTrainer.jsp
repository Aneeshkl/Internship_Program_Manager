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
            background:url('https://img.freepik.com/free-photo/blue-brushstrokes-background_125540-809.jpg?w=740&t=st=1704985869~exp=1704986469~hmac=84214e923bc021b7e4059af02b70f468e09ce5fcaf792b1e6ac9eafed6ee58cd');
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

        .btn-go-back {
            margin-top: 20px;
            background-color: #007bff;
            color: #ffffff; /* White text */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
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
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">Performance Details</h2>
      <c:if test="${not empty message}">${message}</c:if><br>

    <c:if test="${not empty performance}">
        <table class="table table-bordered">
            <tr>
                <th>Name</th>
                <th>Completion Status</th>
                <th>Score</th>
            </tr>

            <tr>
                <td>${performance.internName}</td>
                <td>${performance.completionStatus}</td>
                <td>${performance.performanceScore}</td>
            </tr>
        </table>

        
    </c:if>
    <a href="#" class="btn btn-go-back" onclick="history.back()">Go Back</a>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
