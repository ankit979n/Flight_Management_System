<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Airport Addition</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f7; /* Light background color for the page */
            margin: 0;
            padding: 20px;
        }
        .content {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }
        form label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        form input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        form button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        form button:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
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
    <div class="content">
        <h2>Airport Addition</h2>
        <form action="/airportadd" method="post">
            <label for="airportCode">Airport Code:</label>
            <input type="text" id="airportCode" name="airportCode" required><br>
            <label for="airportLocation">Airport Location:</label>
            <input type="text" id="airportLocation" name="airportLocation" required><br>
            <button type="submit">Add Airport</button>
        </form>
    </div>
    <a href="/adminIndex">Return to Home</a>
</body>
</html>
