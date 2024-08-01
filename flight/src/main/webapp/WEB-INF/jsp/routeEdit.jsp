<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Route</title>
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
        .edit-route-container {
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
        select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
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
    <div class="edit-route-container">
        <h2>Edit Route</h2>
        <form action="${pageContext.request.contextPath}/routeupdate" method="post">
            <input type="hidden" name="routeId" value="${route.routeId}" />
            <div class="form-group">
                <label for="sourceAirportCode">Source Airport Code:</label>
                <select name="sourceAirportCode" id="sourceAirportCode">
                    <c:forEach var="airport" items="${airportList}">
                        <option value="${airport.airportCode}" ${route.sourceAirportCode == airport.airportCode ? 'selected' : ''}>
                            ${airport.airportLocation} (${airport.airportCode})
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="destinationAirportCode">Destination Airport Code:</label>
                <select name="destinationAirportCode" id="destinationAirportCode">
                    <c:forEach var="airport" items="${airportList}">
                        <option value="${airport.airportCode}" ${route.destinationAirportCode == airport.airportCode ? 'selected' : ''}>
                            ${airport.airportLocation} (${airport.airportCode})
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="fair">Fair:</label>
                <input type="text" name="fair" value="${route.fair}" />
            </div>
            <div class="form-group">
                <input type="submit" value="Update Route" />
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/routeall">Cancel</a>
    </div>
</body>
</html>
