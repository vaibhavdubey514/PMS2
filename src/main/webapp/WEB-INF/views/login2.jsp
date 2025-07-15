<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f4f6f8;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #333;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    width: 400px;
    background-color: #fff;
    padding: 40px 30px;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

h1,h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 25px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px 14px;
    font-size: 15px;
    border: 1px solid #ccc;
    border-radius: 6px;
    margin-top: 5px;
    margin-bottom: 10px;
    outline: none;
    box-sizing: border-box;
}

input.is-invalid {
    border-color: red;
}

.invalid-feedback {
    display: none;
    color: red;
    font-size: 12px;
    margin-top: -8px;
    margin-bottom: 10px;
}

input.is-invalid + .invalid-feedback {
    display: block;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #34495e;
    color: white;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 10px;
}

button:hover {
    background-color: #2c3e50;
}

.text-center {
    text-align: center;
    margin-top: 15px;
}

.alert {
    background-color: #f8d7da;
    color: #721c24;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 20px;
    font-weight: bold;
    text-align: center;
}
</style>
</head>
<body>
    <div class="login-container">
        <% if ("error".equals(request.getAttribute("status"))) { %>
            <div class="alert">Invalid User ID or Password</div>
        <% } %>
		<h1>Parcel Management System</h1>
        <h2>Login</h2>

        <form action="<%=request.getContextPath()%>/login" method="post" onsubmit="return validateLogin()">
            <label for="userId">User ID</label>
            <input type="text" id="userId" name="userId" minlength="5" maxlength="15" required />
            <div class="invalid-feedback">User ID must be between 5 and 15 characters.</div>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required />
            <div class="invalid-feedback">Password must be max 8 characters and include uppercase, lowercase, and special character.</div>

            <button type="submit">Login</button>
        </form>

        <div class="text-center">
            Don't have an account? <a href="<%=request.getContextPath()%>/customer-register">Register</a>
        </div>
    </div>

</body>
</html>
