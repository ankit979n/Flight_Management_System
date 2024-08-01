<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Ticket</title>
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
        h3 {
            color: #333;
            margin-top: 20px;
            font-size: 24px;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        .input-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .input-group label {
            flex: 1;
            margin-right: 10px;
            font-weight: bold;
        }
        .input-group input {
            flex: 2;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 16px;
            width: 100%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        td, th {
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
        input[type="text"], input[type="date"] {
            width: calc(100% - 24px);
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        input[readonly] {
            background-color: #f9f9f9;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .center-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
    <script>
        function validateForm() {
            var names = document.getElementsByName("name");
            var dobs = document.getElementsByName("dob");
            var isValid = false;

            for (var i = 0; i < names.length; i++) {
                if (names[i].value.trim() !== "" && dobs[i].value.trim() !== "") {
                    isValid = true;
                    break;
                }
            }

            if (!isValid) {
                alert("Please enter at least one passenger's name and date of birth.");
            }
            return isValid;
        }
    </script>
</head>
<body>
    <h1>Book Ticket</h1>
    <form action="/bookTicket" method="post" onsubmit="return validateForm()">
        <div class="input-group">
            <label>Ticket Number:</label>
            <input name="ticketNumber" value="${ticket.ticketNumber}" readonly />
        </div>
        <div class="input-group">
            <label>Flight Number:</label>
            <input name="flightNumber" value="${ticket.flightNumber}" readonly />
        </div>
        <div class="input-group">
            <label>Airline Name:</label>
            <input name="carrierName" value="${ticket.carrierName}" readonly />
        </div>
        <div class="input-group">
            <label>Fare:</label>
            <input name="totalAmount" value="${ticket.totalAmount}" readonly />
        </div>

        <table>
            <tr>
                <td>From:</td>
                <td><input type="text" value="${fromCity}" readonly /></td>
            </tr>
            <tr>
                <td>To:</td>
                <td><input type="text" value="${toCity}" readonly /></td>
            </tr>
        </table>

        <!-- Hidden input fields to pass the values to the next page -->
        <input type="hidden" name="routeId" value="${ticket.routeId}" />
        <input type="hidden" name="fromCity" value="${fromCity}" />
        <input type="hidden" name="toCity" value="${toCity}" />

        <h3>Enter Passenger Details</h3>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Date of Birth</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="i" begin="0" end="5">
                    <tr>
                        <td><input type="text" name="name" value="${passengerNames[i]}"/></td>
                        <td><input type="date" name="dob" value="${passengerDOBs[i]}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button type="submit">Book</button>
    </form>

    <div class="center-link">
        <a href="/customerIndex" style="color: #007BFF; text-decoration: none; font-size: 18px;">Return to Home</a>
    </div>
</body>
</html>
