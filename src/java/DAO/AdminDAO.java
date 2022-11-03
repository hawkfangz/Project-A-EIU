/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import DAO.DB_Connection;

/**
 *
 * @author phanh
 */
public class AdminDAO {

    public static boolean checkAdminAccount(String account, String password) throws ClassNotFoundException, SQLException {
        DB_Connection db_con = new DB_Connection();
        Connection con = db_con.getConnection();
        boolean exist = false;
        String sql = "select * from admin where account = ? and password = ?";
        PreparedStatement ps;
        ps = con.prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2, password);
        System.out.println(ps);
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
