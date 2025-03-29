<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BatchByName</title>
    <!-- Add Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add any additional styling or imports as needed -->
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
            color: #495057;
            background: url('https://img.freepik.com/free-vector/blue-curve-background_53876-113112.jpg?w=740&t=st=1704956592~exp=1704957192~hmac=11e40857bd57f9d4ff0a3d6d617a417c2368fe4f25702fcfe2e9c5b253f4d558');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

      .container {
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 30px; /* Increase padding to your preferred value */
    border-radius: 15px; /* Increase border-radius to your preferred value */
    margin-top: 30px; /* Increase margin-top to your preferred value */
    margin-bottom: 30px; /* Add margin-bottom if needed */
    max-width: 1500px; /* Adjust max-width to your preferred value */
    margin-left: auto;
    margin-right: auto;
}
        h2 {
            color: #007bff;
        }

        table {
            margin-top: 10px;
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
         #back {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 20px;
            margin-right:1220px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

         
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">BatchByName</h2>
<c:if test="${not empty message}">${message}</c:if><br>
    <c:if test="${not empty batch}">
    
        <table class="table table-bordered">
            <tr>
                <th>Name</th>
                <th>College</th>
                <th>Course</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Short Description</th>
                <th>Intern Duration</th>
                <th>BatchID</th>
                <th>BatchName</th>
            </tr>

            <c:forEach var="intern" items="${batch}">
                <tr>
                    <td>${intern.name}</td>
                    <td>${intern.college}</td>
                    <td>${intern.course}</td>
                    <td>${intern.dob}</td>
                    <td>${intern.gender}</td>
                    <td>${intern.address}</td>
                    <td>${intern.phoneNumber}</td>
                    <td>${intern.shortDescription}</td>
                    <td>${intern.internDuration}</td>
                    <td>${intern.batchID}</td>
                    <td>${intern.batchName}</td>
                </tr>
            </c:forEach>
        </table>

        <!-- Example Edit and Delete buttons with Bootstrap styling -->
        <div class="text-center">
         <a href ="Batch" id="back">Go Back</a>
        </div>
    </c:if>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
