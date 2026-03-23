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
public class LikeDAO {
    public static boolean likePost(int postId, String username){

        boolean status = false;

        try {
            Connection conn = DBConnection.getConnection();

            // Check if already liked
            String check = "SELECT * FROM likes WHERE post_id=? AND username=?";
            PreparedStatement cps = conn.prepareStatement(check);
            cps.setInt(1, postId);
            cps.setString(2, username);

            ResultSet rs = cps.executeQuery();

            if(!rs.next()){
                String sql = "INSERT INTO likes (post_id, username) VALUES (?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setInt(1, postId);
                ps.setString(2, username);

                ps.executeUpdate();
                System.out.println("👍 LIKED");
                status = true;
            } else {
                System.out.println("⚠️ ALREADY LIKED");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int countLikes(int postId){

        int count = 0;

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM likes WHERE post_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, postId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}
