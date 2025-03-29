<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome L&D</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background: #f4f4f4;
            color: #333;
        }

        header {
            background: #3498db;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        nav {
            background: #2980b9;
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #1f618d;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .jumbotron {
            background: #3498db;
            color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .custom-link {
            display: block;
            margin: 15px 0;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            color: #ffffff;
            background: #3498db;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .custom-link:hover {
            background: #2980b9;
        }

        .card {
            background: #ffffff;
            border: 1px solid #dcdcdc;
            border-radius: 5px;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: #ffffff;
            transition: background 0.3s;
        }

        .go-back-btn {
            background: #3498db;
            margin-left: 300px;
        }

        .go-back-btn:hover {
            background: #2980b9;
        }

        .logout-btn {
            background: #e74c3c;
            margin-left:1100px;
        }

        .logout-btn:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome ${name}</h1>
    </header>
    <nav>
        <a href="ListOfTrainers">Trainer</a>
        <a href="Batch">Batch</a>
    </nav>
    <div class="container">
        <div class="jumbotron">
            <h2>Welcome to the Learning & Development Platform</h2>
        </div>
        <a href="ListOfTrainers" class="custom-link">Explore Trainers</a>
        <a href="Batch" class="custom-link">Check Batch Information</a>
      

        </div>
        <div class="d-flex justify-content-between">
            <a href="logout" class="btn logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>
