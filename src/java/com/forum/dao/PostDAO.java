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
public class PostDAO {
    
    public static boolean createPost(String title, String content, String username){

        boolean status = false;

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO posts (title, content, username) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, username);

            int rows = ps.executeUpdate();

            if(rows > 0){
                System.out.println("✅ POST CREATED");
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
