<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Intern Name</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyLnvex2+rGGg1jX/EqL2qI5DDsF5Ut6A3" crossorigin="anonymous">
    <!-- Your custom CSS (if any) -->

    <style>
        body {
            padding: 20px;
             background:('.freepik.com/premium-vector/abstract-background-vector-illustration-wallpaper-with-blue-light-color-blue-grid-mosaic_354831-237.jpg?w=740');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
        }

        h1 {
            margin-bottom: 20px;
        }

        /* Add any additional custom styles here */
    </style>
</head>
<body>

<div class="container">
    <h1>Select Intern Name</h1>

    <form action="ViewInternByName" method="post">
        <div class="form-group">
            <label for="InternName">Select Name</label>
            <select id="InternName" name="InternName" class="form-control" required="required">
                <option value="0">Select Intern</option>
                <c:forEach var="Intern" items="${interns}">
                    <option value="${Intern.name}">${Intern.name}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
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
