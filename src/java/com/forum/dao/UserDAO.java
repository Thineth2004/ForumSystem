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
public class UserDAO {
    public static boolean login(String username, String password) {

    boolean status = false;

    try {
        Connection conn = DBConnection.getConnection();
        System.out.println(conn);

        String sql = "SELECT * FROM users WHERE username=? AND password=? AND status='active'";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            System.out.println("✅ USER FOUND");
            status = true;
        } else {
            System.out.println("❌ USER NOT FOUND");
        }
        
        while (rs.next()) {
            System.out.println("DB USER: " + rs.getString("username"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}
}
