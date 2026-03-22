/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.forum.dao;

import com.forum.util.DBConnection;
import java.sql.*;

/**
 *
 * @author Thineth
 */
public class CommentDAO {
    public static boolean addComment(int postId, String username, String comment){

        boolean status = false;

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO comments (post_id, username, comment) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, postId);
            ps.setString(2, username);
            ps.setString(3, comment);

            int rows = ps.executeUpdate();

            if(rows > 0){
                System.out.println("💬 COMMENT ADDED");
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
