<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Trainer</title>
    <!-- Bootstrap CSS Link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
             font-family: Arial, sans-serif;
            margin: 150px;
            text-align: center;
            background:url('https://img.freepik.com/free-vector/blue-curve-frame-template-vector_53876-111537.jpg?w=740&t=st=1704986397~exp=1704986997~hmac=65c6f048a62f80f5ec82d57c8ef46e0e209abbf121da06b2902f3105dfbe74c8');
			background-size: cover;
			background-position: center;
			background-attachment: fixed;
        }

        h1 {
            color: #007bff; /* Bootstrap primary color */
        }

        hr {
            border: 1px solid #007bff; /* Bootstrap primary color */
            width: 50%;
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff; /* Bootstrap primary color */
            color: #fff;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome ${name} </h1>
        <hr>
        <%--  <c:if test="${not empty message}">${message}</c:if> --%>
        <a href="ViewAllProfile?trainerName=${name}" class="btn btn-primary">View All Intern Profile</a>
       <!--  <a href="getAllPerformance" class="btn btn-primary">All Performance</a> -->
        <a href="logout" class="btn btn-primary">Logout</a>
    </div>

    <!-- Bootstrap JS and Popper.js scripts (place them before the closing </body> tag) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
