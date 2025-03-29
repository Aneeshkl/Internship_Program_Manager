<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Intern</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 20px;
            background: url('https://img.freepik.com/free-vector/blue-curve-frame-template_53876-114605.jpg?w=740&t=st=1705034757~exp=1705035357~hmac=c5068d82a0e1cf745d22bf143f28bcfc00be8df82c315dc408fe77ba3c7b7535');
            background-position: center;
            background-attachment: fixed; 
            background-size:cover;
          
        }

        h2 {
            color: #007bff;
            margin-left:600px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color:#000000;
        }

        input[type="text"], input[type="date"], input[type="email"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
         .go-back-btn {
            margin-top: 20px;
            background-color: #007bff;
            color: #ffffff; /* White text */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .go-back-btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
       
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Intern</h2>

    <form action="update" method="post">
        <input type="hidden" name="internID" value="${intern.internID}" />
        Name: <input type="text" name="name" readonly value="${intern.name}" /><br/>
        Email: <input type="email" name="email" readonly value="${intern.email}" /><br/>
        College: <input type="text" name="college" value="${intern.college}" /><br/>
        Course: <input type="text" name="course" value="${intern.course}" /><br/>
        DOB: <input type="date" name="dob" value="${intern.dob}" /> <br/>
        Gender: <input type="text" name="gender" value="${intern.gender}" /><br/>
        Address: <input type="text" name="address" value="${intern.address}" /><br/>
        PhoneNumber: <input type="text" name="phoneNumber" value="${intern.phoneNumber}" /><br/>
        ShortDescription: <input type="text" name="shortDescription" value="${intern.shortDescription}" /><br/>
        InternDuration: <input type="text" name="internDuration" value="${intern.internDuration}" /><br/>
        <input type="submit" value="Update Intern" />
         <a href="#" class="btn go-back-btn" onclick="history.back()">Go Back</a>
    </form>
</div>

</body>
</html>
