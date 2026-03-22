<%-- 
    Document   : viewPosts.jsp
    Created on : Mar 16, 2026, 10:03:27 AM
    Author     : Thineth
--%>

<%@page import="java.sql.*"%>
<%@page import="com.forum.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");

    if(user == null){
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = DBConnection.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM posts ORDER BY created_at DESC");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Posts</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h1>All Posts</h1>

            <%
                while(rs.next()){
            %>
                <div style="border:1px solid #ccc; padding:10px; margin:10px;">
                    <h3><%= rs.getString("title") %></h3>
                    <p><%= rs.getString("content") %></p>
                    <small>By: <%= rs.getString("username") %></small>
                </div>
            <%
                }
            %>

            <a href="createPost.jsp">Create New Post</a><br><br>
            <a href="dashboard.jsp">Back</a>
        </div>
    </body>
</html>
