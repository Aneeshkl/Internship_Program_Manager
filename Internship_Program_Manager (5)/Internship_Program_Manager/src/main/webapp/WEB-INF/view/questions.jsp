<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Add Question</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("https://img.freepik.com/free-photo/blue-office-stationery-set-with-laptop_23-2147843325.jpg");
            background-size: cover;
            background-position: center;
            color: #333;
            min-height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            color: #007bff;
        }
		
		h3{
		color:#007bff;
		}
        .alert {
            background-color: #ffdddd;
            color: #ff0000;
            padding: px;
            margin-bottom: 15px;
            border: 1px solid #ff9999;
            border-radius: 5px;
        }

        form {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 70%;
          
        }

        label {
            margin-top: 10px;
            display: block;
            font-weight: bold;
            color: #333;
        }

        input {
            margin: 5px 0 15px 0;
            padding: 10px;
            width: calc(100% - 22px);
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Add Question</h1>
    <c:if test="${not empty errorMessage}">
        <div class="alert">
            <p>${errorMessage}</p>
        </div>
    </c:if>
    <form action="saveQuestion" method="post">
        <input type="hidden" id="numOfQuestions" name="numOfQuestions"
            value="${numOfQuestions}">
        <input type="hidden" name="testID" value="${testID}">
        <c:forEach var="i" begin="1" end="${numOfQuestions}">
            <h3>Question ${i}</h3>
            <c:if test="${not empty questionsToAdd}">
                <label for="question${i}">Question:</label>
                <input type="text" id="question${i}" name="question${i}" required
                    value="${questionsToAdd[i-1].question}">
                <br>
                <label for="option1${i}">Option 1:</label>
                <input type="text" id="option1${i}" name="option1${i}" required
                    value="${questionsToAdd[i-1].option1}">
                <br>
                <label for="option2${i}">Option 2:</label>
                <input type="text" id="option2${i}" name="option2${i}" required
                    value="${questionsToAdd[i-1].option2}">
                <br>
                <label for="option3${i}">Option 3:</label>
                <input type="text" id="option3${i}" name="option3${i}" required
                    value="${questionsToAdd[i-1].option3}">
                <br>
                <label for="option4${i}">Option 4:</label>
                <input type="text" id="option4${i}" name="option4${i}" required
                    value="${questionsToAdd[i-1].option4}">
                <br>
                <label for="correctAnswer${i}">Correct Answer:</label>
                <input type="text" id="correctAnswer${i}" name="correctAnswer${i}"
                    required value="${questionsToAdd[i-1].correctAnswer}">
                <br>
            </c:if>
            <c:if test="${empty questionsToAdd}">
                <label for="question${i}">Question:</label>
                <input type="text" id="question${i}" name="question${i}" required>
                <br>
                <label for="option1${i}">Option 1:</label>
                <input type="text" id="option1${i}" name="option1${i}" required>
                <br>
                <label for="option2${i}">Option 2:</label>
                <input type="text" id="option2${i}" name="option2${i}" required>
                <br>
                <label for="option3${i}">Option 3:</label>
                <input type="text" id="option3${i}" name="option3${i}" required>
                <br>
                <label for="option4${i}">Option 4:</label>
                <input type="text" id="option4${i}" name="option4${i}" required>
                <br>
                <label for="correctAnswer${i}">Correct Answer:</label>
                <input type="text" id="correctAnswer${i}" name="correctAnswer${i}"
                    required>
                <br>
            </c:if>
        </c:forEach>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
