<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Routes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9; /* Light background color for the page */
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
            font-size: 28px;
            font-weight: bold;
        }
        table {
            width: 80%; /* Adjust the width of the table */
            max-width: 1200px; /* Optional: maximum width for larger screens */
            margin: 20px auto; /* Center the table */
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
            font-size: 18px;
        }
        tr:hover {
            background-color: #f1f1f1; /* Highlight row on hover */
        }
        a {
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .actions {
            text-align: center;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>All Routes</h2>
    <table border="0">
        <thead>
            <tr>
                <th>Route ID</th>
                <th>Source Airport Code</th>
                <th>Destination Airport Code</th>
                <th>Fair</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="route" items="${routeList}">
                <tr>
                    <td>${route.routeId}</td>
                    <td>${route.sourceAirportCode}</td>
                    <td>${route.destinationAirportCode}</td>
                    <td>${route.fair}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/routeedit/${route.routeId}">Edit</a> |
                        <a href="${pageContext.request.contextPath}/routedelete/${route.routeId}" 
                           onclick="return confirm('Are you sure you want to delete this route?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="center-link">
        <a href="/adminIndex">Return to Home</a>
    </div>
</body>
</html>
