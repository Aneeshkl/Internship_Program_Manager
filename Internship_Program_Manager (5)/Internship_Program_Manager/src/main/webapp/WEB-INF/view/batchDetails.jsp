<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Batch Details</title>
    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add any additional styling or imports as needed -->
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
            color: #495057;
            background: url('https://img.freepik.com/free-photo/fitness-concept-with-blue-jumping-rope_23-2148531440.jpg?w=826&t=st=1704967006~exp=1704967606~hmac=0385349ecc9fb42938e357522788cd5d2c47eead20bba3d311d1af6e44ef9c0d');
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
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            display: inline-block; /* Added display property */
            text-decoration: none; /* Remove default link styling */
            margin-right:20px;
        }

        .go-back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">Batch Details</h2>

    <c:if test="${not empty batch}">
        <table class="table table-bordered">
            <tr>
                <th>BatchName</th>
                <th>category</th>
                <th>startDate</th>
                <th>endDate</th>
                <th>trainerName</th>
                <th>Action1</th>
            </tr>

            <tr>
                <td>${batch.batchName}</td>
                <td>${batch.category}</td>
                <td>${batch.startDate}</td>
                <td>${batch.endDate}</td>
                <td>${batch.trainerName}</td>
                <td><a href="listAllInternByBatchId?id=${batch.batchID}">View Interns</a></td>
            </tr>
        </table>

        <!-- Example Edit and Delete buttons with Bootstrap styling -->

        <!-- Go Back button -->
        <a class="btn go-back-button" href="javascript:history.go(-1)">Go Back</a>
        <a class="btn go-back-button" href="AddNewInternLD?id=${batch.batchID}&name=${batch.batchName}">Add New Intern</a>
    </c:if>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
