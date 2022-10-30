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
public class AdminDAO {

    private static String dbURL = "jdbc:mysql://localhost:3306/";
    private static String dbName = "toyshop";
    private static String dbUsername = "root";
    private static String dbPassword = "admin";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
        return con;
    }

    public static boolean checkAdminAccount(String account, String password) throws ClassNotFoundException, SQLException {
        boolean exist = false;
        Connection con = getConnection();
        String sql = "select * from admin where account = ? and password = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2, password);
        System.out.println(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getBoolean(4)) {
                exist = true;
            }
        }
        con.close();
        return exist;
    }

}
