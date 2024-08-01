<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<title>Flight Management System</title>
<style type="text/css">
body {
    background-image: url("/background.jpg");
    background-size: cover; /* Optional: covers the entire background */
    background-repeat: no-repeat; /* Optional: prevents image repetition */
    background-attachment: fixed; /* Optional: fixes the background image */
}

.navbar {
    overflow: hidden;
    background-color: #333; /* Background color of the navbar */
}

.navbar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.navbar ul li {
    float: left;
}

.navbar ul li a, .navbar ul li ul li a {
    display: block;
    color: white; /* Text color */
    text-align: center;
    padding: 14px 20px; /* Increased padding for larger buttons */
    text-decoration: none;
    font-size: 18px; /* Increased font size */
    font-weight: bold; /* Bold text */
}

.navbar ul li a:hover, .navbar ul li ul li a:hover {
    background-color: #555; /* Background color on hover */
    color: #ddd; /* Text color on hover */
}

.navbar ul li ul {
    display: none;
    position: absolute;
    min-width: 200px; /* Increased width for dropdown */
    z-index: 1;
}

.navbar ul li:hover ul {
    display: block;
}

.navbar ul li ul li {
    float: none;
    background-color: #333; /* Background color of dropdown items */
}

.navbar ul li ul li a:hover {
    background-color: #777; /* Background color on hover for dropdown items */
}

.content {
    padding: 20px;
}
</style>
</head>
<body>
    <h1 align="center" style="color:white;">Welcome To The Flight Management System Customer</h1>
    <div class="navbar">
        <ul>
            
             <li><a href="javascript:void(0);"><b>Flight</b></a>
                <ul>
                    <li><a href="/flightresultsC">All Flight</a></li>
                </ul></li>
                
            <li><a href="javascript:void(0);"><b>Flight Booking</b></a>
                <ul>
                    <li><a href="/flightsearch">Flight Search</a></li>
                </ul></li>
            <li><a href="javascript:void(0);"><b>Passenger</b></a>
                <ul>
                    <li><a href="/passengerDetailsC">Passenger Details</a></li>
                </ul></li>
            <li><a href="javascript:void(0);"><b>Ticket</b></a>
                <ul>
                    <li><a href="/ticketsBookedC">Tickets Booked</a></li>
                </ul></li>
            <li><a href="<c:url value='/logout' />"><b>Logout</b></a></li>
        </ul>
    </div>
    <div class="content">
       
    </div>
</body>
</html>
