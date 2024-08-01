<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Flight</title>
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
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 12px;
            text-align: left;
            vertical-align: middle;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
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
    <h2>Search Flight</h2>
    <form action="/flightsearch" method="post">
        <table>
            <tr>
                <td>From City:</td>
                <td>
                    <select name="fromCity" required>
                        <option value="">SELECT</option>
                        <c:forEach var="location" items="${airportLocations}">
                            <option value="${location}">${location}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>To City:</td>
                <td>
                    <select name="toCity" required>
                        <option value="">SELECT</option>
                        <c:forEach var="location" items="${airportLocations}">
                            <option value="${location}">${location}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Search Flights" />
                </td>
            </tr>
        </table>
    </form>
    <div class="center-link">
        <a href="/customerIndex" style="color: #007BFF; text-decoration: none; font-size: 18px;">Return to Home</a>
    </div>
</body>
</html>
