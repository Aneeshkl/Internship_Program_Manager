<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Intern Details</title>
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

        .btn-go-back {
            margin-top: 10px;
            display: inline-block;
            background-color: #007bff; /* Custom color */
            color: #ffffff; /* Text color */
            border: 1px solid #007bff; /* Border color */
        }

        .btn-go-back:hover {
            background-color: #0056b3; /* Darker color on hover */
            border: 1px solid #0056b3; /* Darker border on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4 mb-4">Intern Details</h2>

    <c:if test="${not empty intern}">
        <table class="table table-bordered">
            <tr>
                <th>Name</th>
                 <th>Email</th>
                <th>College</th>
                <th>Course</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Short Description</th>
                <th>Intern Duration</th>
            </tr>

            <tr>
                <td>${intern.name}</td>
                 <td>${intern.email}</td>
                <td>${intern.college}</td>
                <td>${intern.course}</td>
                <td>${intern.dob}</td>
                <td>${intern.gender}</td>
                <td>${intern.address}</td>
                <td>${intern.phoneNumber}</td>
                <td>${intern.shortDescription}</td>
                <td>${intern.internDuration}</td>
            </tr>
        </table>

        <!-- "Go Back" button -->
        <button class="btn btn-go-back" onclick="goBack()">Go Back</button>
    </c:if>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- JavaScript function to go back -->
<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
