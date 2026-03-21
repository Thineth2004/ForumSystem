/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.forum.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Thineth
 */
public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/forumdb",
                "root",
                ""   // change this
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
