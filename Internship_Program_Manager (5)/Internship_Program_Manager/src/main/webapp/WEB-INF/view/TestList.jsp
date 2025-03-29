<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<html>
<head>
    <title>Test List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://w0.peakpx.com/wallpaper/339/896/HD-wallpaper-library-concepts-stack-of-books-education-background-books-background-with-books-books-on-the-table-thumbnail.jpg');
            background-size: cover;
            background-position: center;
            color: #333;
        }

        h1, h4 {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
        }

        .right-corner {
            cursor: pointer;
            position: absolute;
            top: 20px;
            right: 20px;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 3px;
            background-color: #2980b9;
            color: #fff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .right-corner:hover {
            background-color: #1f6da8;
        }

        .container {
            width: 70%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .dropdown {
            position: absolute;
            top: 10px;
            right: 50px;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 90px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        /* Style for the dropdown button/image */
        .dropdown-btn {
            cursor: pointer;
            display: inline-block;
            width: 80px;
            height: 80px;
            background-image: url('https://thumbs.dreamstime.com/b/user-profile-icon-isolated-glassy-vibrant-sky-blue-round-button-illustration-user-profile-icon-glassy-vibrant-sky-blue-round-167324536.jpg');
            background-size: cover;
            border-radius: 50%;
            overflow: hidden;
            vertical-align: middle;
        }

        a {
            text-decoration: none;
            color: #3498db;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #217dbb;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            margin-left: 1100px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button:active {
            background-color: #145a8b;
        }

        .button:focus {
            outline: none;
        }

        .alert {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Scheduled Test</h1>
    <input type="hidden" name="name" value="${name}">
    <div class="container">
        <table border="1" cellpadding="2">
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Action 1</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="test" items="${test}">
                    <tr>
                        <td>${test.tag}</td>
                        <td><a href="takeTest?id=${test.testId}">Take Test</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <a class="button" href="InternHome?name=${name}">Go Back</a>
</body>
</html>
