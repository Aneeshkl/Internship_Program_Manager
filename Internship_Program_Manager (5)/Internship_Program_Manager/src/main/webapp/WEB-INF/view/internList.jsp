<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Intern List</title>
    <!-- Add Bootstrap CSS -->
  <!--   <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"> -->
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
            margin-top: 30px;
            overflow-x: auto;
            
            padding:20px;
            margin-left:0;
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

        .add-link{
            display: inline-block;
            margin-top: 20px;
            font-size: 18px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
        }

        .add-link:hover {
            background-color: #0056b3;
        }

        .btn-go-back {
            margin-top: 30px;
 		
            display: inline-block;
            background-color: #007bff; /* Custom color */
            color: #ffffff; /* Text color */
            border: 7px solid #007bff; /* Border color */
            margin-right:1010px;
        }

        .btn-go-back:hover {
            background-color: #0056b3; /* Darker color on hover */
            border: 5px solid #0056b3; /* Darker border on hover */
        }
        .action-column a {
            margin-right: 15px;
        }

        .dob-column {
            min-width: 120px;
        }

        .phone-column, .short-description-column, .intern-duration-column,
        .action1-column, .action2-column, .action3-column {
            min-width: 112px;
        }

     /* Add padding to the right side of the container */
        .container {
            padding-right: 15px;
        }
        
    #back {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 20px;
            margin-right:1220px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Intern List</h2>
   <c:if test="${not empty message}">${message}</c:if><br>
    <c:choose>
        <c:when test="${not empty message}">
            <p>${message}</p>
        </c:when>
        <c:otherwise>
    <table class="table">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>College</th>
            <th>Course</th>
            <th class="dob-column">DOB</th>
            <th>Gender</th>
            <th>Address</th>
            <th class="phone-column">Phone Number</th>
            <th class="short-description-column">Short Description</th>
            <th class="intern-duration-column">Intern Duration</th>
            <th class="action1-column">Action 1</th>
            <th class="action2-column">Action 2</th>
            <th class="action3-column">Action 3</th>
        </tr>

        <c:forEach var="intern" items="${interns}">
            <tr>
                <td>${intern.name}</td>
                <td>${intern.email}</td>
                <td>${intern.college}</td>
                <td>${intern.course}</td>
                <td>${intern.dob}</td>
                <td>${intern.gender}</td>
                <td>${intern.address}</td>
                <td>${intern.phoneNumber}</td>
                <td>${intern.shortDescription}</td>
                <td>${intern.internDuration}</td>
                <td class="action1-column">
                    <a href="<c:url value='/view?internID=${intern.internID}'/>">View</a></td>
                <td class="action2-column">
                    <a href="edit?internID=${intern.internID}">Edit</a> </td>
                <td class="action3-column">
                    <a href="delete?internID=${intern.internID}" onclick="return confirmDelete();">Delete </a>
                </td>
            </tr>
        </c:forEach>
    </table>
  
 </c:otherwise>
   </c:choose>
    <!-- Button container with Bootstrap classes for alignment -->
   <div class="test-center">
			<a href="Batch" id="back">Go Back </a>
   
      <script>
    function confirmDelete(){
    	return confirm("Are you sure want to delete this Intern List?");
    }
    </script>
       
    </div>
</div>

<!-- Add Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
