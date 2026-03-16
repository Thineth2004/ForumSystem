<%-- 
    Document   : login.jsp
    Created on : Mar 16, 2026, 10:02:20 AM
    Author     : Thineth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Forum</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <%
                String error = request.getParameter("error");
                if(error != null){
            %>
                <p class="error">Invalid username or password</p>
                <%
                }
                %>          
            <form method="post" action="LoginServlet">
                <label>Username</label>
                <input type="text" name="username" required><br>
                <label>Password</label>
                <input type="password" name="password" required>
                <input type="submit" value="Login">
            </form>
            <br>
            <a href="register.jsp">Create Account</a>
        </div>
    </body>
</html>
