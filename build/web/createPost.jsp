<%-- 
    Document   : createPost.jsp
    Created on : Mar 16, 2026, 10:03:08 AM
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
        <title>Create Post</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h1>Create Post</h1>

            <form method="post" action="PostServlet">
                <label>Title</label>
                <input type="text" name="title" required>

                <label>Content</label>
                <textarea name="content" rows="5" required></textarea>

                <input type="submit" value="Post">
            </form>

            <br>
            <a href="viewPosts.jsp">View Posts</a><br><br>
            <a href="dashboard.jsp">Back</a>
        </div>
    </body>
</html>
