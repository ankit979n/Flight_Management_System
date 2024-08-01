<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9; /* Light background color */
            margin: 0;
            padding: 20px;
        }
        h2 {
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
    <h2>Flight Results</h2>

    <c:if test="${empty flights}">
        <p>No flights found.</p>
    </c:if>
    <c:if test="${not empty flights}">
        <table>
            <thead>
                <tr>
                    <th>Flight Number</th>
                    <th>Carrier Name</th>
                    <th>Seat Capacity</th>
                    <th>Seats Booked</th>
                    <th>Seats Available</th>
                    <th>Route ID</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${flights}">
                    <tr>
                        <td>${flight.flightNumber}</td>
                        <td>${flight.carrierName}</td>
                        <td>${flight.seatCapacity}</td>
                        <td>${flight.seatBooked != null ? flight.seatBooked : 0}</td>
                        <td>${flight.seatCapacity - (flight.seatBooked != null ? flight.seatBooked : 0)}</td>
                        <td>${flight.routeId}</td>
                        <td>${flight.departure}</td>
                        <td>${flight.arrival}</td>
                        <td>
                            <a href="/flightedit/${flight.flightNumber}">Edit</a> |
                            <a href="/flightdelete/${flight.flightNumber}" onclick="return confirm('Are you sure you want to delete this flight?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="center-link">
        <a href="/customerIndex">Return to Home</a>
    </div>
</body>
</html>
