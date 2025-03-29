
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Intern Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            color: #333333;
            margin: 20px;
              background: url('https://img.freepik.com/free-vector/blue-curve-background_53876-113112.jpg?w=740&t=st=1704956592~exp=1704957192~hmac=11e40857bd57f9d4ff0a3d6d617a417c2368fe4f25702fcfe2e9c5b253f4d558');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        h2 {
            color: #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #cccccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        tr:nth-child(even) {
            background-color: #ffffff;
        }

        tr:hover {
            background-color: #e6e6e6;
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
    <h2>Intern Profile</h2>

    <table>
        <!-- Table contents as before -->
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
             <th>Batch Name</th>
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
            <td>${intern.batchName}</td>
        </tr>
    </table>

    <!-- Go Back button -->
    <button onclick="goBack()" class="go-back-button">Go Back</button>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</div>

</body>
</html>
