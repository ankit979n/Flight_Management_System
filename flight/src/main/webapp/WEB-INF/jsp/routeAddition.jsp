<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Route</title>
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
        form {
            max-width: 600px; /* Restrict form width */
            margin: 0 auto; /* Center the form */
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        select, input[type="number"] {
            width: calc(100% - 22px); /* Full width minus padding */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        button:hover {
            background-color: #0056b3;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
        .center-link a {
            color: #007BFF;
            text-decoration: none;
            font-size: 16px;
        }
        .center-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Add Route</h2>
    <form action="${pageContext.request.contextPath}/routeadd" method="post">
        <input type="hidden" name="routeId" value="${route.routeId}" />
        
        <label for="sourceAirportCode">Source Airport Code:</label>
        <select name="sourceAirportCode" required>
            <option value="">SELECT</option>
            <c:forEach var="airport" items="${airportList}">
                <option value="${airport.airportCode}">${airport.airportCode}</option>
            </c:forEach>
        </select>

        <label for="destinationAirportCode">Destination Airport Code:</label>
        <select name="destinationAirportCode" required>
            <option value="">SELECT</option>
            <c:forEach var="airport" items="${airportList}">
                <option value="${airport.airportCode}">${airport.airportCode}</option>
            </c:forEach>
        </select>

        <label for="fair">Fair:</label>
        <input type="number" step="0.01" name="fair" required/>

        <button type="submit">Add Route</button>
    </form>
    
    <div class="center-link">
        <a href="/adminIndex">Return to Home</a>
    </div>
</body>
</html>
