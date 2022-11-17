/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.Products;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hau
 */
public class ProductsDAO {
//                Products product = new Products(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("typeID"), rs.getString("description"), rs.getInt("price"), rs.getInt("Status"));

    public static List<Products> getPrList() throws SQLException, ClassNotFoundException {
        List<Products> typeList = new ArrayList<>();
        try {
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from products");
            while (rs.next()) {
                Products product = new Products(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("typeID"), rs.getString("description"), rs.getInt("price"), rs.getInt("Status"));
                typeList.add(product);
            }
            con.close();
            return typeList;
        } catch (Exception e) {
        }
        return typeList;
    }

    public static void addProduct(String name, int typeID, String des, int price) throws SQLException, ClassNotFoundException {
        try {
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
            String sql = "INSERT INTO `toyshop`.`products` (`ProductName`, `typeID`, `price`, `description`) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, typeID);
            ps.setString(3, des);
            ps.setInt(4, price);
            ps.execute();
            con.close();
        } catch (Exception e) {
        }
    }

    public static Products getProduct(int id) throws SQLException, ClassNotFoundException {
        Products product = null;
        try {
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from products where ProductID = " + id);
            while (rs.next()) {
                product = new Products(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("typeID"), rs.getString("description"), rs.getInt("price"), rs.getInt("Status"));

            }
        } catch (Exception e) {

        }
        return product;
    }

}
