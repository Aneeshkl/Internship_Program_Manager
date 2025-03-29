<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Java MCQ Test</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
              background:url('https://img.freepik.com/premium-vector/background-with-light-area_554888-2005.jpg?w=740');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
        }

        h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333333;
        }

        pre {
            background-color: #f0f0f0;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .alert{
       
        color:red;
        }
    </style>
</head>
<body>
    <h2>Java MCQ Test</h2>
<c:if test="${not empty errorMessage}">
            <div class="alert">
                <p>${errorMessage}</p>
            </div>
    </c:if>
    <form action="${pageContext.request.contextPath}/submitTest" method="post">
        <!-- Question 1 -->
        <label for="internName">Intern Name:</label>
        <input type="text" id="internName" value="${name}" name="internName" required readonly>
        <br><br>

        <!-- Question 2 -->
        <label>1. What is the output of the following Java code?</label>
        <pre>
            public class Main {
                public static void main(String[] args) {
                    System.out.println("Hello, World!");
                }
            }
        </pre>
        <input type="radio" name="q1" value="A"> A. Hello, World!
        <input type="radio" name="q1" value="B"> B. Compilation Error
        <input type="radio" name="q1" value="C"> C. Runtime Error
        <br><br>

        <!-- Question 2 -->
        <label>2. What is the result of 10 + 20?</label>
        <input type="radio" name="q2" value="A"> A. 30
        <input type="radio" name="q2" value="B"> B. 40
        <input type="radio" name="q2" value="C"> C. 50
        <br><br>

        <!-- Question 3 -->
        <label>3. What is the default value of the data type 'float' in Java?</label><br>
        <input type="radio" name="q3" value="A"> A. 0.0
        <input type="radio" name="q3" value="B"> B. 0
        <input type="radio" name="q3" value="C"> C. 0.0f
        <br><br>

        <!-- Question 4 -->
        <label>4. How is an interface different from an abstract class in Java?</label><br>
        <input type="radio" name="q4" value="A"> A. Interfaces can have instance variables, abstract classes cannot.
        <input type="radio" name="q4" value="B"> B. Abstract classes can have constructors, interfaces cannot.
        <input type="radio" name="q4" value="C"> C. Interfaces support multiple inheritance, abstract classes do not.
        <br><br>

        <!-- Question 5 -->
        <label>5. What is the purpose of the 'super' keyword in Java?</label><br>
        <input type="radio" name="q5" value="A"> A. Refers to the superclass object.
        <input type="radio" name="q5" value="B"> B. Calls the superclass method.
        <input type="radio" name="q5" value="C"> C. Both A and B.
        <br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
