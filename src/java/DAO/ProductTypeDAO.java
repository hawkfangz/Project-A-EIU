/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Entity.ProductType;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phanh
 */
public class ProductTypeDAO {

    public static List<ProductType> getTypeTable() throws SQLException, ClassNotFoundException {
        List<ProductType> typeList = new ArrayList<>();
        try {
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product_type");
            while (rs.next()) {
                ProductType type = new ProductType(rs.getInt("typeID"), rs.getString("typeName"), rs.getString("Description"), rs.getInt("Status"));
                typeList.add(type);
            }
            con.close();
            return typeList;
        } catch (Exception e) {
        }
        return typeList;
    }

    public static void addProductType(String name, String des, int status) {
        try {
            DB_Connection db_con = new DB_Connection();
            try ( Connection con = db_con.getConnection()) {
                String sql = "INSERT INTO `toyshop`.`product_type` (`typeName`, `Description`, `Status`) VALUES (?,?,?);";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, des);
                ps.setInt(3, status);
                ps.execute();
                con.close();
            }

        } catch (Exception e) {
        }
    }

    public static ProductType getProductType(int id) {
        try {
            DB_Connection db_con = new DB_Connection();
            try ( Connection con = db_con.getConnection()) {
                String sql = "SELECT * FROM `toyshop`.`product_type` WHERE typeID = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    ProductType type = new ProductType(rs.getInt("typeID"), rs.getString("typeName"), rs.getString("Description"), rs.getInt("Status"));
                    return type;
                }
                con.close();
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static String getProductTypeDetail(int id,String findWhat) throws SQLException, ClassNotFoundException {
        try {
            System.out.println(id);
            String typeName = "REEEEEEEEEEEEE";
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
            String sql = "SELECT * FROM `toyshop`.`product_type` where typeID = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                typeName = rs.getString(findWhat);
            }
            con.close();
            return typeName;
        } catch (Exception e) {
        }
        return "";
    }

    public static void disableProductType(int id) {
        try {
            int status = 1;
            DB_Connection db_con = new DB_Connection();
            try ( Connection con = db_con.getConnection()) {
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("select Status from `toyshop`.`product_type` where typeID =" + id);
                while (rs.next()) {
                    if (rs.getInt("Status") == 1) {
                        status = 0;
                    }
                }

                String sql = "UPDATE `toyshop`.`product_type` SET Status = " + status + " WHERE typeID = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
                con.close();
            }
        } catch (Exception e) {
        }
    }

    public static void updateProductType(int id, String des, String name) {
        try {
            DB_Connection db_con = new DB_Connection();
            try ( Connection con = db_con.getConnection()) {
                System.out.println(des);
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("select Status from `toyshop`.`product_type` where typeID =" + id);
                String sql = "UPDATE `toyshop`.`product_type` SET typeName = \"" + name + "\",Description = \"" + des + "\" WHERE typeID = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
                con.close();
            }
        } catch (Exception e) {
        }
    }
}
