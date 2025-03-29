<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Batch Name</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLnvex2+rGGg1jX/EqL2qI5DDsF5Ut6A3" crossorigin="anonymous">

    <!-- Your custom CSS (if any) -->
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
              background: url('https://img.freepik.com/free-vector/blue-curve-background_53876-113112.jpg?w=740&t=st=1704956592~exp=1704957192~hmac=11e40857bd57f9d4ff0a3d6d617a417c2368fe4f25702fcfe2e9c5b253f4d558');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        h1 {
            margin-bottom: 30px;
            color: #007bff; /* Bootstrap primary color */
        }

        .container {
            background-color: #ffffff; /* White background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            padding: 30px;
        }

        label {
            font-weight: bold;
            color: #495057; /* Bootstrap secondary color */
        }

        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            border: 1px solid #ced4da; /* Bootstrap form control border color */
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff; /* Bootstrap primary color */
            color: #ffffff; /* White text */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px; /* Add margin to the right of the button */
        }

        button:hover {
            background-color: #007bff; /* Darker shade on hover */
        }

        .go-back-btn {
            background-color: #007bff; /* Bootstrap secondary color */
            color: #ffffff; /* White text */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none; /* Remove default link underline */
        }

        .go-back-btn:hover {
            background-color: #5a6268; /* Darker shade on hover */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Select Batch Name</h1>

    <form action="ViewBatchByName" method="post">
        <div class="form-group">
            <label for="batchName">Select Name</label>
            <select id="batchName" name="batchName" class="form-control" required="required">
                <option value="0">Select Batch</option>
                <c:forEach var="Batch" items="${batches}">
                    <option value="${Batch.batchName}">${Batch.batchName}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="#" class="btn go-back-btn" onclick="history.back()">Go Back</a>
    </form>
</div>

<!-- Bootstrap JS and dependencies (if needed) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        integrity="sha384-xUZf02U4R1NlU6ihtL5o5eVH+1cVIb/rF5xFu5Y7ujVqFqEv9VJus5bYIblXgOpd"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLnvex2+rGGg1jX/EqL2qI5DDsF5Ut6A3"
        crossorigin="anonymous"></script>
<!-- Your custom scripts (if any) -->

</body>
</html>
