<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
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
        h2 {
            color: #333;
            margin-top: 20px;
            font-size: 24px;
        }
        p {
            font-size: 18px;
            color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
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
        button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 20px;
        }
        button:hover {
            background-color: #c82333;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
        .total-row {
            font-weight: bold;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h1>Booking Confirmation</h1>
    <h3>Your ticket is successfully booked</h3>
    <br><br>
    <p>Ticket Number: ${ticket.ticketNumber}</p>
    <p>Flight Number: ${ticket.flightNumber}</p>
    <p>Carrier Name: ${ticket.carrierName}</p>
    <p>From: ${fromCity}</p>
    <p>To: ${toCity}</p>

    <h2>Passenger Details:</h2>
    <table>
        <thead>
            <tr>
                <th>Serial Number</th>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Fare</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="passenger" items="${passengers}">
                <tr>
                    <td>${passenger.embeddedId.serialNumber}</td>
                    <td>${passenger.passengerName}</td>
                    <td>${passenger.passengerDOB}</td>
                    <td>${passenger.fair}</td>
                </tr>
            </c:forEach>
            <tr class="total-row">
                <td colspan="3" align="right"><strong>Total Amount:</strong></td>
                <td>${ticket.totalAmount}</td>
            </tr>
        </tbody>
    </table>

    <form action="/cancelTicket" method="post" style="text-align: center;">
        <input type="hidden" name="ticketNumber" value="${ticket.ticketNumber}" />
        <button type="submit">Cancel Ticket</button>
    </form>

    <div class="center-link">
        <a href="/customerIndex" style="color: #007BFF; text-decoration: none; font-size: 18px;">Return to Home</a>
    </div>
</body>
</html>
