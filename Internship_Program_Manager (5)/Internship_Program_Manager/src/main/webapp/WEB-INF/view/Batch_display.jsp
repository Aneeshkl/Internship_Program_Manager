<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <!-- Bootstrap CSS Link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa; /* Bootstrap background color */
            background:url('https://st4.depositphotos.com/3930503/19991/i/450/depositphotos_199910082-stock-photo-light-blue-gradient-background-blue.jpg8');
			background-size: cover;
			background-position: center;
			background-attachment: fixed;
        }

        .jumbotron {
            background-color: #007bff; /* Bootstrap primary color */
            color: #ffffff; /* White text on primary background */
            padding: 20px;
            border-radius: 10px;
        }

        .custom-link {
            margin-bottom: 10px;
            color: #007bff; /* Bootstrap primary color for link */
        }

        .list-group-item {
            background-color: #ffffff; /* White background for list items */
            border-color: #007bff; /* Border color for list items */
        }

        .list-group-item:hover {
            background-color: #e9ecef; /* Hover color for list items */
        }

        #back {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 20px;
            margin-right:1000px;
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
        <div class="jumbotron">
            <h1 class="display-4">Welcome To Batch Operation</h1>
            <hr class="my-4">
        </div>
        
        <div class="list-group">
           
            <a href="CreateBatch" class="list-group-item list-group-item-action custom-link">Create Batch</a>
            <a href="ListOfBatches" class="list-group-item list-group-item-action custom-link">View All Batch</a>
            <a href="EnterBatchByName" class="list-group-item list-group-item-action custom-link">View Batch By Name</a>
            <a href="AddTest" class="list-group-item list-group-item-action custom-link">Add Test</a>
          
            
        </div>

        <!-- Go Back button -->
        <div class="test-center">
          		<a href="GoBackLD" id="back">Go Back </a>
      </div>
    </div>

    <!-- Bootstrap JS Link -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
