<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <h2>Add Flight</h2>
    <form action="${pageContext.request.contextPath}/flightadd" method="post">
        <label for="flightNumber">Flight Number:</label>
        <input type="text" id="flightNumber" name="flightNumber" required><br>
        <label for="carrierName">Airline Name:</label>
        <input type="text" id="carrierName" name="carrierName" required><br>
        <label for="routeId">Route ID:</label>
        <select name="routeId" required>
            <option value="">SELECT</option>
            <c:forEach items="${routeList}" var="route">
                <option value="${route.routeId}">${route.routeId}</option>
            </c:forEach>
        </select><br>
        <label for="seatCapacity">Seat Capacity:</label>
        <input type="number" id="seatCapacity" name="seatCapacity" required><br>
        <label for="departure">Departure Time:</label>
        <input type="text" id="departure" name="departure" required placeholder="10:30 AM"><br>
        <label for="arrival">Arrival Time:</label>
        <input type="text" id="arrival" name="arrival" required><br>
        <label for="returnDeparture">Return Departure Time:</label>
        <input type="text" id="returnDeparture" name="returnDeparture" required><br>
        <label for="returnArrival">Return Arrival Time:</label>
        <input type="text" id="returnArrival" name="returnArrival" required><br>
        <button type="submit">Add Flight</button>
    </form>
</div>
<a href="/adminIndex">Return to Home</a>

<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: #f8f9fa;
        margin: 0;
        padding: 20px;
    }
    .content {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    h2 {
        margin-bottom: 15px;
        font-size: 24px;
        color: #333;
        text-align: center;
    }
    form label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
    }
    form input[type="text"],
    form input[type="number"],
    form select {
        width: calc(100% - 20px);
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    form button {
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    form button:hover {
        background-color: #0056b3;
    }
    a {
        display: block;
        margin-top: 10px;
        text-align: center;
        color: #007BFF;
        text-decoration: none;
        font-size: 16px;
        transition: color 0.3s ease;
    }
    a:hover {
        color: #0056b3;
        text-decoration: underline;
    }
</style>
