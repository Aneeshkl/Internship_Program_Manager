<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
    <title>View Questions</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("https://wallpapers.com/images/hd/plain-light-blue-background-1920-x-1080-2lqx0agfbl9srxgv.jpg");
            background-size: cover;
            background-position: center;
            color: #000000;
            min-height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 70%; /* Adjust width as needed */
        }

        h1 {
            color: #007bff;
            margin-left: 20px;
        }

        p {
            margin-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 5px;
        }

        a {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 10px;
            margin-left: 40px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
           margin-bottom:500px;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Questions</h1>
        <ol>
            <c:forEach var="question" items="${questions}">
                <li>
                    <p>${question.question}</p>
                    <ul>
                        <li>${question.option1}</li>
                        <li>${question.option2}</li>
                        <li>${question.option3}</li>
                        <li>${question.option4}</li>
                    </ul>
                    <p>Correct Answer: ${question.correctAnswer}</p>
                </li>
            </c:forEach>
        </ol>
    </div>

    <a href="assigned?batchID=${batchId}" class="button">Go back</a>
</body>
</html>
