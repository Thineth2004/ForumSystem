<%-- 
    Document   : dashboard.jsp
    Created on : Mar 16, 2026, 10:02:57 AM
    Author     : Thineth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");

    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <div class="login-container">
            <h1>Welcome, <%= user %> 🎉</h1>

            <p>You are successfully logged in.</p>

            <a href="createPost.jsp">Create Post</a><br><br>

            <a href="LogoutServlet">Logout</a>
        </div>
    </body>
</html>
