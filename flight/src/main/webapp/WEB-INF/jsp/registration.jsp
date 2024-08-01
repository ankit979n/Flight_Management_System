<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: #f5f5f5;
        }
        .signup-box {
            width: 360px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background: #fff;
            text-align: center;
        }
        .signup-box h2 {
            margin-bottom: 20px;
        }
        .signup-box input[type="text"],
        .signup-box input[type="password"],
        .signup-box input[type="email"],
        .signup-box select {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .signup-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .signup-box input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
    <script>
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('password');
            var confirmPasswordField = document.getElementById('confirmPassword');
            var showPasswordCheckbox = document.getElementById('showPassword');
            
            if (showPasswordCheckbox.checked) {
                passwordField.type = 'text';
                confirmPasswordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        }

        function validatePassword() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var errorMessage = document.getElementById('error-message');
            
            var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$/;
            
            if (!passwordPattern.test(password)) {
                errorMessage.textContent = 'Password must be at least 5 characters long, contain one uppercase letter, one special character, and one numeric character.';
                return false;
            }
            
            if (password !== confirmPassword) {
                errorMessage.textContent = 'Password and Confirm Password do not match.';
                return false;
            }
            
            errorMessage.textContent = '';
            return true;
        }
    </script>
</head>
<body>
    <div class="signup-box">
        <h2>SignUp</h2>
        <div id="error-message" class="error">${errorMessage}</div>
        <form action="registration" method="post" onsubmit="return validatePassword()">
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="email" id="email" name="email" placeholder="Email" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
            <select id="userType" name="userType" required>
                <option value="Customer">Customer</option>
                <option value="Admin">Admin</option>
            </select>
            <div class="show-password">
                <input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()">
                <label for="showPassword">Show Password</label>
            </div>
            <input type="submit" value="Register">
        </form>
        
    </div>
</body>
</html>
