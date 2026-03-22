<%-- 
    Document   : register.jsp
    Created on : Mar 16, 2026, 10:02:34 AM
    Author     : Thineth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h1>Register</h1>

            <form method="post" action="RegisterServlet">
                <label>Username</label>
                <input type="text" name="username" required>

                <label>Password</label>
                <input type="password" name="password" required>

                <label>Role</label>
                <select name="role">
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>

                <input type="submit" value="Register">
            </form>

            <br>
            <a href="login.jsp">Back to Login</a>
        </div>
    </body>
</html>
