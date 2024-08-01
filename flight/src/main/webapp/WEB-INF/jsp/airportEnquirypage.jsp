<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Airport Enquiry</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e9eff1; /* Light background color for the page */
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
            font-size: 28px;
            font-weight: bold;
        }
        p {
        	 width: 60%; /* Adjust the width of the box */
            max-width: 600px; /* Optional: maximum width for larger screens */
            margin: 20px auto; /* Center the box */
            text-align: center;
            font-size: 18px;
            color: #555;
            margin-top: 20px;
            padding: 15px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        a {
            display: block;
            text-align: center;
            margin-top: 30px;
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Airport Enquiry</h2>
    <p>Details for Airport: ${param.airportCode} - ${param.airportLocation}</p>
    
    <!-- Add any additional details or functionality as needed -->
    
    <a href="/airportall">Back to All Airports</a>
</body>
</html>
