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
            customer = new Customer(rs.getInt("CustomerID"), rs.getString("Account"), rs.getString("Name"),rs.getString("gender"), rs.getDate("DoB"), rs.getString("Phone"), rs.getString("Email"),rs.getString("Address"));
        }
        return customer;
    }

}
