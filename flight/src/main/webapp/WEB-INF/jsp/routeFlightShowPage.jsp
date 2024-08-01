<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.UUID" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }
        p {
            text-align: center;
            font-size: 18px;
            color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
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
        form {
            margin: 0;
        }
        input[type="hidden"] {
            display: none;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Flights from ${fromAirport} to ${toAirport}</h2>
    <p>Fare: ${fair}</p>
    <table>
        <thead>
            <tr>
                <th>Flight Number</th>
                <th>Airlines Name</th>
                <th>Route ID</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Booking</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${flightList}" var="flight">
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.carrierName}</td>
                    <td>${flight.routeId}</td>
                    <td>${flight.departure}</td>
                    <td>${flight.arrival}</td>
                    <td>
                        <form action="/bookTicket" method="get">
                            <input type="hidden" name="flightNumber" value="${flight.flightNumber}" />
                            <input type="hidden" name="carrierName" value="${flight.carrierName}" />
                            <input type="hidden" name="routeId" value="${flight.routeId}" />
                            <input type="hidden" name="fromCity" value="${fromAirport}" />
                            <input type="hidden" name="toCity" value="${toAirport}" />
                            <input type="hidden" name="fair" value="${fair}" />
                            <input type="submit" value="Book" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="center-link">
        <a href="/customerIndex" style="color: #007BFF; text-decoration: none; font-size: 18px;">Return to Home</a>
    </div>
</body>
</html>
