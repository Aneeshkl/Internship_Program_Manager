<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Batch List</title>
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

        .add-link {
            display: block;
            margin-top: 20px;
            font-size: 18px;
            color: #007bff;
        }

        .add-link:hover {
            text-decoration: underline;
        }

        .go-back-button {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
        }

        .go-back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Batch List</h2>
<c:if test="${not empty message}">${message}</c:if>
    <table>
        <tr>
            <th>BatchName</th>
            <th>category</th>
            <th>startDate</th>
            <th>endDate</th>
            <th>trainerName</th>
          <th class="action1-column">Action1</th>
            <th class="action2-column">Action2</th>
            <th class="action3-column">Action3</th>
            <th class="action3-column">Action4</th>
             <th class="action4-column">Action5</th>
        </tr>
        <c:forEach var="batch" items="${batches}">
            <tr>
                <td>${batch.batchName}</td>
                <td>${batch.category}</td>
                <td>${batch.startDate}</td>
                <td>${batch.endDate}</td>
                <td>${batch.trainerName}</td>
                <td class="action1-column">
                    <a href="<c:url value='/viewBatch?batchID=${batch.batchID}'/>">View</a> </td>
                <td class="action2-column">
                    <a href="editBatch?batchID=${batch.batchID}">Edit</a> </td>
                <td class="action3-column">
                    <a href="deleteBatch?batchID=${batch.batchID}" onclick="return confirmDelete();">Delete </a>
                 <td class="action4-column">
                    <a href="assignTest?batchID=${batch.batchID}">Assign </a>
                </td>
                 <td class="action5-column">
                    <a href="assigned?batchID=${batch.batchID}">Assigned Test Details</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!-- Go Back button -->
    <a class="go-back-button" href="Batch">Go Back</a>
    <script>
    function confirmDelete(){
    	return confirm("Are you sure want to delete the interns associated with batch?");
    }
    </script>
</div>

</body>
</html>
