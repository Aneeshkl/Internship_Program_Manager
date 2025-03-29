<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Performance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
             background: url('https://img.freepik.com/free-vector/blue-curve-frame-template_53876-114605.jpg?w=740&t=st=1705034757~exp=1705035357~hmac=c5068d82a0e1cf745d22bf143f28bcfc00be8df82c315dc408fe77ba3c7b7535');
            background-position: center;
            background-attachment: fixed; 
            background-size:cover;
        }

        h2 {
            color: #007bff;
            margin-left:560px;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color:#000000;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }

        input[type="submit"], input[type="button"] {
            background-color: #007bff; /* Blue color */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

         input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #2980b9; /* Darker blue on hover */
        } 
    </style>
</head>
<body>

<h2>Edit Performance</h2>

<form action="updatePerformance" method="post">
    <input type="hidden" name="performanceID" value="${performance.performanceID} " />
    Name: <input type="text" name="internName" value="${performance.internName}" readonly="readonly" required="required"/><br/>
    Completion Status: <input type="text" name="completionStatus" value="${performance.completionStatus}" readonly="readonly" required="required"/><br/>
    Performance Score: <input type="text" name="performanceScore" value="${performance.performanceScore}" required="required"/><br/>
    
    <input type="submit" value="Update Performance" />
    <input type="button" value="Go Back" onclick="history.back()"/>
</form>

</body>
</html>
