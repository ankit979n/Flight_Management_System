<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Airports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9; /* Light background color for the page */
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
        table {
            width: 80%; /* Adjust the width of the table */
            max-width: 1000px; /* Optional: maximum width for larger screens */
            margin: 20px auto; /* Center the table */
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
            font-size: 18px;
        }
        tr:hover {
            background-color: #f1f1f1; /* Highlight row on hover */
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
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
    <h2>All Airports</h2>
    <table border="0">
        <thead>
            <tr>
                <th>Airport Code</th>
                <th>Airport Location</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="airport" items="${airportList}">
                <tr>
                    <td>${airport.airportCode}</td>
                    <td>${airport.airportLocation}</td>
                    <td>
                        <form action="/airportEnquiry" method="GET">
                            <input type="hidden" name="airportCode" value="${airport.airportCode}" />
                            <input type="hidden" name="airportLocation" value="${airport.airportLocation}" />
                            <button type="submit">Enquire</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <a href="/adminIndex">Return to Home</a>
</body>
</html>
