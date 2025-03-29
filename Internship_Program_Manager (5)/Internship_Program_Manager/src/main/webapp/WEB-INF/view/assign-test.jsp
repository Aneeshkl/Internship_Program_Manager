<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Assign Tests</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background: url('https://media.istockphoto.com/id/925244914/photo/colorful-pencils-white-papers-and-metal-pencil-sharpener-empty-place-for-text-or-drawing-on.jpg?b=1&s=612x612&w=0&k=20&c=gYf0qjv9hd2PkfJURM1652nn6VuqjEGtbpAVAYKx6_8=');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #007bff;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
            height: 150px; /* Set the desired height */
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 3px;
        }

        input[type="submit"]:hover {
            background-color: #007bff;
        }

        .go-back-button {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 3px;
            margin-top: 10px;
        }

        .go-back-button:hover {
            background-color: #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Assign Tests to Interns in Batch: ${batch.batchName}</h2>
        <form action="assignTest" method="post">
            <input type="hidden" name="batchID" value="${batch.batchID}">
            <label for="testIDs">Select Tests:</label>
            <select multiple="multiple" name="testIDs">
                <c:forEach var="test" items="${availableTests}">
                    <option value="${test.testId}">${test.tag}</option>
                </c:forEach>
            </select>
            <br>
            <input type="submit" value="Assign Tests">
        </form>
        <!-- Go Back button -->
        <a class="go-back-button" href="ListOfBatches">Go Back</a>
    </div>
</body>
</html>
