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
    <meta charset="UTF-8">
    <title>Posts</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="login-container">
    <h1>All Posts</h1>

    <%
        while(rs.next()){
            int postId = rs.getInt("id");
    %>

    <div style="border:1px solid #ccc; padding:10px; margin:10px;">
        
        <!-- Post Content -->
        <h3><%= rs.getString("title") %></h3>
        <p><%= rs.getString("content") %></p>
        <small>By: <%= rs.getString("username") %></small><br><br>

        <!-- Delete Button (Only Owner) -->
        <%
            if(user.equals(rs.getString("username"))){
        %>
            <a href="DeletePostServlet?id=<%= postId %>">Delete</a>
        <%
            }
        %>

        <hr>

        <!-- COMMENTS SECTION -->
        <h4>Comments:</h4>

        <%
            Statement cstmt = conn.createStatement();
            ResultSet crs = cstmt.executeQuery(
                "SELECT * FROM comments WHERE post_id=" + postId + " ORDER BY created_at ASC"
            );

            while(crs.next()){
        %>
            <p>
                <b><%= crs.getString("username") %>:</b>
                <%= crs.getString("comment") %>
            </p>
        <%
            }
        %>

        <!-- Add Comment Form -->
        <form method="post" action="CommentServlet">
            <input type="hidden" name="postId" value="<%= postId %>">
            <input type="text" name="comment" placeholder="Write a comment..." required>
            <input type="submit" value="Comment">
        </form>

    </div>

        <%
            }
        %>

        <a href="createPost.jsp">Create New Post</a><br><br>
        <a href="dashboard.jsp">Back</a>
    </div>

</body>
</html>