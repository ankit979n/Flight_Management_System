<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
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
        .login-box {
            width: 360px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background: #fff;
            text-align: center;
        }
        .login-box h2 {
            margin-bottom: 20px;
        }
        .login-box input[type="email"],
        .login-box input[type="password"] {
            width: calc(100% - 22px);
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-box input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-box a {
            display: block;
            margin: 10px 0;
            color: #007BFF;
            text-decoration: none;
        }
        .login-box a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
        .input-error {
            border-color: red;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Login</h2>
        <div class="error">${errorMessage}</div>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <input type="email" id="email" name="email" placeholder="Email" required class="${not empty errorMessage ? 'input-error' : ''}">
            <input type="password" id="password" name="password" placeholder="Password" required class="${not empty errorMessage ? 'input-error' : ''}">
            <input type="submit" value="Get Started">
        </form>
        
        <a href="${pageContext.request.contextPath}/registration">Don't have an account? Create one</a>
    </div>
</body>
</html>
