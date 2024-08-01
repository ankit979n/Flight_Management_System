<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Passenger Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9; /* Light background color */
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse; /* Remove gaps between borders */
            margin: 20px 0;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Passenger Details</h1>
    <table>
        <thead>
            <tr>
                <th>Ticket Number</th>
                <th>Serial Number</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Fare</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="passenger" items="${passengers}">
                <tr>
                    <td>${passenger.embeddedId.ticketNumber}</td>
                    <td>${passenger.embeddedId.serialNumber}</td>
                    <td>${passenger.passengerName}</td>
                    <td>${passenger.passengerDOB}</td>
                    <td>${passenger.fair}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="center-link">
        <a href="/customerIndex">Return to Home</a>
    </div>
</body>
</html>
