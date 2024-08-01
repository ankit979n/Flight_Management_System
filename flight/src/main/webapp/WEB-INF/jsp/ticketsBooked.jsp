<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tickets Booked</title>
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
        button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background-color: #c82333;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Tickets Booked</h1>
    <table>
        <thead>
            <tr>
                <th>Ticket Number</th>
                <th>Flight Number</th>
                <th>Carrier Name</th>
                <th>Total Amount</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ticket" items="${tickets}">
                <tr>
                    <td>${ticket.ticketNumber}</td>
                    <td>${ticket.flightNumber}</td>
                    <td>${ticket.carrierName}</td>
                    <td>${ticket.totalAmount}</td>
                    <td>
                        <form action="/cancelTicket" method="post">
                            <input type="hidden" name="ticketNumber" value="${ticket.ticketNumber}"/>
                            <button type="submit">Cancel Ticket</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="center-link">
        <a href="/adminIndex" style="color: #007BFF; text-decoration: none; font-size: 18px;">Return to Home</a>
    </div>
</body>
</html>
