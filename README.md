Flight Management System Documentation



1. Introduction
1.1 Project Overview
The Flight Management System is a web-based application designed to manage flights, routes, airports and bookings. It offers functionalities for administrators to manage airport, routes, and flights, and for customers to search for flights, book tickets, and view booking details. The system is built using Spring Boot, JSP, and MySQL.

1.2 Purpose and Scope
The purpose of this documentation is to provide a detailed description of the Flight Management System, including its  features, data models, user interfaces, and other technical details. This documentation is intended for developers, testers, and maintainers of the system.

Scopes:
Following is the functionality provided by the system:
 
There are two categories of people who would access the system: customer and administrator. Each of these would have some exclusive privileges.
 
The customer can:
•	Create his user account.
•	Login into the application.
•	Check for available flights.
•	Make a booking.
•	View the bookings made.
•	Cancel a booking.
 
The administrator can:
•	Login into the application.
•	Add flight, airport and route details.
•	View the flight, airport and route details.
•	Cancel or modify the flight and route details.

2. System Architecture
2.1 Architecture Overview
The system follows a layered architecture, consisting of the presentation layer, service layer, and data access layer. The presentation layer includes JSP pages for the user interface, the service layer handles business logic, and the data access layer interacts with the MySQL database.

2.2 Technologies Used
•	Frontend: JSP, CSS, Javascript
•	Backend: Spring Boot, Spring Security, Spring Data JPA
•	Database: MySQL
•	Tools:  Eclipse IDE, Github

3. Key Functionalities
3.1 Flight Management
Administrators can add, update, and delete flights and routes. Each flight has details such as flight number, carrier name, seat capacity, and route information.



3.2 Route Management
Routes connect source and destination airports. Administrators can manage routes, including setting the fare for each route.

3.3 Ticket Booking
Customers can search for available flights based on source and destination cities, select a flight, and book tickets. The system generates unique ticket numbers and allows for booking at least 1 passenger up to 6 passengers per ticket.
And also discounts will be given based on the passenger's age like:
•	if passenger’s age is less than 14 years then there will be 50% discount on the ticket fare
•	if passenger’s age is greater then 60 years then there will be 30% discount on the ticket fare
•	Others have to give the full fare.

3.4 Ticket Cancellation
Customers can cancel their booked tickets, which updates the seat capacity of the corresponding flight and deletes the ticket and passenger details.

4. Data Models
4.1 Database Schema
The system uses a MySQL database with the following main tables:
•	Flight_User: Stores information of registered users.
•	Airport: Stores airport codes and locations.
•	Route: Stores route details, including source and destination airport codes.
•	Flight: Stores flight details.
•	Ticket: Stores ticket details, including ticket number and total amount.
•	Passenger: Stores passenger details for each ticket.

4.2 Entity Classes
The entity classes map to the database tables. Key entity classes include Flight, Route, Ticket, Passenger, and Airport.


5. User Interface

5.1 Login and Registration
The system provides a login page for users to access the system. New users can register as either administrators or customers.

Login.jsp
 ![image](https://github.com/user-attachments/assets/a89c6cc4-f187-4ca4-9605-8dc3804ab53a)


Customer.jsp
 ![image](https://github.com/user-attachments/assets/203b06bf-9daf-42d5-bc42-5214de1b94b3)


5.2 Admin Dashboard
The admin dashboard allows administrators to manage flights, routes, airports and view booked tickets.
 ![image](https://github.com/user-attachments/assets/c5a71294-320c-4c8d-8c8f-2b3d490122ca)


5.3 Customer Interface
Customers can search for flights, view available options, and book tickets. They can also view their booking history and cancel tickets if needed.
 ![image](https://github.com/user-attachments/assets/06e75bd1-abde-4058-afd3-51622140d449)


5.4 Error Handling and Alerts
The system handles errors gracefully, displaying user-friendly messages and redirecting users to appropriate pages in case of errors (e.g., invalid routes or no flights available, no more seats available).
![image](https://github.com/user-attachments/assets/7e9f32f2-10af-4a30-a62c-d1bf131d91f5)

 

6. Security
6.1 User Authentication
Spring Security is used for user authentication. The system supports role-based access control, with separate roles for administrators and customers.

6.2 Authorization
The system restricts access to certain pages based on user roles. For example, only administrators can access the flight and route management pages.

6.3 Logout Functionality
Users can log out from the system, which invalidates their session and prevents unauthorized access to protected pages.


7. Deployment
7.1 Deployment Environment
The system is deployed on a server with a Java runtime environment and a MySQL database. The deployment process involves setting up the database schema, configuring the server, and deploying the Spring Boot application.

7.2 Deployment Steps
1.	Set up the MySQL database and import the schema.
2.	Configure the application properties (e.g., database connection, security settings).
3.	Deploy the Spring Boot application on the server.
4.	Verify the deployment by accessing the application through a web browser.

8. Future Improvements
8.1 Enhanced User Interface
Improving the user interface with modern design principles and better responsiveness.

8.2 Additional Features
Adding features like seat selection, 
flight status tracking, and 
notifications for users via email.


9. Conclusion
The Flight Management System is a comprehensive solution for managing flights, routes, and bookings. It provides a user-friendly interface for administrators and customers, with robust security and error handling. Future improvements will focus on enhancing the user experience, adding new features, and optimizing performance.
