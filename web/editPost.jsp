<%-- 
    Document   : editPost
    Created on : Mar 22, 2026, 10:43:43 PM
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

    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM posts WHERE id=?");
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();

    if(!rs.next()){
        out.println("Post not found");
        return;
    }

    if(!user.equals(rs.getString("username"))){
        out.println("Unauthorized");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Post</title>
    </head>
    <body>
        <div class="login-container">
            <h1>Edit Post</h1>

            <form method="post" action="UpdatePostServlet">
                <input type="hidden" name="id" value="<%= id %>">

                <label>Title</label>
                <input type="text" name="title" value="<%= rs.getString("title") %>" required>

                <label>Content</label>
                <textarea name="content" rows="5" required><%= rs.getString("content") %></textarea>

                <input type="submit" value="Update">
            </form>

            <br>
            <a href="viewPosts.jsp">Back</a>
        </div>
    </body>
</html>
