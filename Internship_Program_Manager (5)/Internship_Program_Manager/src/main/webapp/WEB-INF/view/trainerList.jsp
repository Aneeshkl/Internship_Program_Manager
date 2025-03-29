<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trainer List</title>
    <!-- Add any additional styling or imports as needed -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
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

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .action-buttons {
            display: flex;
        }

        .button {
    margin-right: 10px;
    margin-top: 15px; /* Adjust this value as needed */
    background-color: #007bff;
    color: #ffffff;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    cursor: pointer;
}

.button:hover {
    background-color: #0056b3;
}

         #back {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 20px;
            margin-left:1000px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        
    </style>
    
</head>

<body>

<h2>Trainer List</h2>
<c:if test="${not empty message}">${message}</c:if>
<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Action 1</th>
        <th>Action 2</th>
        <th>Action 3</th>
    </tr>

    <c:forEach var="trainer" items="${trainers}">
        <tr>
            <td>${trainer.trainerName}</td>
             <td>${trainer.email }</td>
            <td><a href="<c:url value='/viewTrainer?trainerID=${trainer.trainerID}'/>">View</a></td>
            <td><a href="editTrainer?trainerID=${trainer.trainerID}">Edit</a></td>
            <td><a href="deleteTrainer?trainerID=${trainer.trainerID}" onclick="return confirmDelete();">Delete </a>
        </tr>
    </c:forEach>
    
</table>

<!-- Button container for "Go Back" and "Add New Trainer" buttons -->
<div class="button-container">
    <!-- "Add New Trainer" button -->
    <a class="button" href="AddNewTrainerLD">Add New Trainer</a>
    <script>
    function confirmDelete(){
    	return confirm("Are you sure want to delete the Trainer associated with batch and intern?");
    }
    </script>
    <div class="test-center">
          		<a href="GoBackLD" id="back">Go Back </a>
      </div>
</div>

</body>
</html>
