<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attend Test</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f8f9fa;
            background-image: url('https://media.istockphoto.com/id/499509690/photo/abstract-blur-background-english-multiple-choice-test.jpg?s=612x612&w=0&k=20&c=QGgDDUHH7lkzTKkTB4laBFj1_1KAgooqsqY3ppEIjHg='); /* Add the path to your background image */
            background-size: cover;
            background-position: center;
        }

        h2 {
            text-align: center;
            color: #007bff;
        }

        form {
            max-width: 800px;
            font-size: 1em;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        p {
            font-size: 1.6em;
            margin-bottom: 15px;
        }

        .radio,
        .checkbox {
            margin-bottom: 10px;
            font-size: 1.6em;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            form {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="testForm" action="submitTest" method="post">
        <h2>Attend Test - ${tag}</h2>

        <c:forEach var="question" items="${questions}">
            <div>
                <p>${question.question}</p>

                <c:choose>
                    <c:when test="${fn:length(fn:split(question.correctAnswer, ',')) > 1}">
                        <input type="checkbox" name="answer${question.questionID}" value="${question.option1}" class="checkbox">${question.option1}<br>
                        <input type="checkbox" name="answer${question.questionID}" value="${question.option2}" class="checkbox">${question.option2}<br>
                        <input type="checkbox" name="answer${question.questionID}" value="${question.option3}" class="checkbox">${question.option3}<br>
                        <input type="checkbox" name="answer${question.questionID}" value="${question.option4}" class="checkbox">${question.option4}<br>
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="answer${question.questionID}" value="${question.option1}" class="radio">${question.option1}<br>
                        <input type="radio" name="answer${question.questionID}" value="${question.option2}" class="radio">${question.option2}<br>
                        <input type="radio" name="answer${question.questionID}" value="${question.option3}" class="radio">${question.option3}<br>
                        <input type="radio" name="answer${question.questionID}" value="${question.option4}" class="radio">${question.option4}<br>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>

        <br/>
        <input type="submit" value="Submit Test" />
    </form>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("testForm").addEventListener("submit", function (event) {
                // Validate checkboxes and radios
                var questions = document.querySelectorAll('[name^="answer"]');
                var isValid = validateQuestions(questions);

                if (!isValid) {
                    event.preventDefault(); // Prevent form submission if validation fails
                    alert("Please answer all questions.");
                }
            });

            function validateQuestions(questions) {
                for (var i = 0; i < questions.length; i++) {
                    if (!isQuestionAnswered(questions[i])) {
                        return false;
                    }
                }
                return true;
            }

            function isQuestionAnswered(question) {
                var questionType = question.type;

                if (questionType === 'radio' || questionType === 'checkbox') {
                    var options = document.querySelectorAll('[name="' + question.name + '"]');
                    for (var j = 0; j < options.length; j++) {
                        if (options[j].checked) {
                            return true;
                        }
                    }
                    return false;
                }

                return false; // Unsupported question type
            }
        });
    </script>
</body>
</html>
