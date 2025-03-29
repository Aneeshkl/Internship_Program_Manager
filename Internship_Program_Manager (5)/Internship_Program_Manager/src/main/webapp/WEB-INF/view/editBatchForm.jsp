<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Edit Batch</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f2f2f2;
    color: #333333;
    margin: 20px;
    background:
        url(' https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149005675.jpg?w=740&t=st=1705129072~exp=1705129672~hmac=fbc8cc928c232ce577e0cec32cc5e8d5a3173ad71299c30e15bde739cd436b1c');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

h2 {
    color: #007bff;
    margin-left: 600px;
}

form {
    max-width: 600px;
    margin: 0 auto;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    color: #000000;
}

input, select {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

button {
    background-color: #007bff;
    color: #ffffff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

.error {
    color: red;
}

.back-button {
    background-color: #007bff;
    color: #ffffff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 20px;
}

.back-button:hover {
    background-color: #0056b3;
}
</style>
<script>
function validateDateRange() {
    var startDate = document.getElementById('startDate').value;
    var endDate = document.getElementById('endDate').value;

    // Check if both start and end dates are provided
    if (!startDate || !endDate) {
        alert("Please enter both start date and end date");
        return false;
    }

    var currentDate = new Date();
    var startDateObj = new Date(startDate);
    var endDateObj = new Date(endDate);

    if (startDateObj <= currentDate) {
        alert("Start date should be in the future");
        return false;
    }
    if (endDateObj <= startDateObj) {
        alert("End date should be greater than the start date");
        return false;
    }
    var monthsApart = (endDateObj.getFullYear() - startDateObj.getFullYear()) * 12 +
    endDateObj.getMonth() - startDateObj.getMonth();

if (monthsApart < 2) {
alert("End date should be at least greater than 1 month from the start date");
return false;
}

    return true;
}
</script>
</head>
<body>
<div class="container">
    <h2>Edit Batch</h2>

    <form:form modelAttribute="batch" action="updateBatch" method="post" onsubmit="return validateDateRange();">
        <input type="hidden" name="batchID" value="${batch.batchID}" />

        <label for="batchName">Batch Name:</label>
        <input type="text" name="batchName" readonly="readonly" value="${batch.batchName}" />
        <form:errors path="batchName" class="error" />
        <br>
        <br>

        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" value="${batch.startDate}" />
        <form:errors path="startDate" class="error" />
        <br>
        <br>

        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" value="${batch.endDate}" />
        <form:errors path="endDate" class="error" />
        <br>
        <br>

        <label for="category">Category:</label>
        <input type="text" name="category" value="${batch.category}" required="required" />
        <form:errors path="category" style="color:red" />
        <br>
        <br>

        <label for="trainerName">Trainer:</label>
        <input type="text" name="trainerName" readonly="readonly" value="${batch.trainerName}" />
        <form:errors path="trainerName" class="error" />
        <br>
        <br>

        <button type="submit" class="btn-primary">Submit</button>
        <a class="back-button" href="javascript:history.go(-1)">Go Back</a>
    </form:form>
</div>
</body>
</html>
