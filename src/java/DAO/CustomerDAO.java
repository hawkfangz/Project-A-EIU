/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Customer;
import java.sql.*;

/**
 *
 * @author phanh
 */
public class CustomerDAO {

    public static Customer login(String account, String password) throws SQLException, ClassNotFoundException {
        DB_Connection db_con = new DB_Connection();
        Connection con = db_con.getConnection();
        boolean exist = false;
        Customer customer = null;
        System.out.println(account + " " + password);
        String sql = "select * from customer where account = ? and password = ?";
        PreparedStatement ps;
        ps = con.prepareStatement(sql);
        ps.setString(1, account);
        ps.setString(2, password);
        System.out.println(ps);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            customer = new Customer(rs.getInt(1), rs.getString(2), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7));
        }
        return customer;

    }

}
