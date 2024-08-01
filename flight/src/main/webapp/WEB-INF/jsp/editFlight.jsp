<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Flight</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .edit-flight-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="edit-flight-container">
        <h2>Edit Flight</h2>
        <form action="/flightedit" method="post">
            <input type="hidden" name="flightNumber" value="${flight.flightNumber}" />
            <div class="form-group">
                <label>Carrier Name:</label>
                <input type="text" name="carrierName" value="${flight.carrierName}" required />
            </div>
            <div class="form-group">
                <label>Seat Capacity:</label>
                <input type="number" name="seatCapacity" value="${flight.seatCapacity}" required />
            </div>
            <div class="form-group">
                <label>Seat Booked:</label>
                <input type="number" name="seatBooked" value="${flight.seatBooked}" required />
            </div>
            <div class="form-group">
                <label>Route ID:</label>
                <input type="number" name="routeId" value="${flight.routeId}" required />
            </div>
            <div class="form-group">
                <label>Departure:</label>
                <input type="text" name="departure" value="${flight.departure}" required />
            </div>
            <div class="form-group">
                <label>Arrival:</label>
                <input type="text" name="arrival" value="${flight.arrival}" required />
            </div>
            <div class="form-group">
                <button type="submit">Update Flight</button>
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/flightresults">Cancel</a>
    </div>
</body>
</html>
