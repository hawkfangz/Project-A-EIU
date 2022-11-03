/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
/**
 *
 * @author phanh
 */
public class DB_Connection {
  private static String dbURL = "jdbc:mysql://localhost:3306/";
    private static String dbName = "toyshop";
    private static String dbUsername = "root";
    private static String dbPassword = "admin";

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
        return con;
    }
}
