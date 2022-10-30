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

    private static String dbURL = "jdbc:mysql://localhost:3306/";
    private static String dbName = "toyshop";
    private static String dbUsername = "root";
    private static String dbPassword = "admin";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
        return con;
    }
    public static List<ProductType> getTypeTable() throws SQLException, ClassNotFoundException {
        List<ProductType> typeList = new ArrayList<>();
        try {
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product_type");
//        ResultSetMetaData resMetaData = rs.getMetaData();
//        int nCols = resMetaData.getColumnCount();
            while (rs.next()) {
                ProductType type = new ProductType(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                typeList.add(type);
            }
            con.close();
            System.out.println("ArrayList Created!!!");
            return typeList;
        } catch (Exception e) {
        }
        return typeList;
    }

    public static void addProductType(String name, String des, int status) {
        try {
            Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
            String sql = "INSERT INTO `toyshop`.`product_type` (`typeName`, `Description`, `Status`) VALUES (?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, des);
            ps.setInt(3, status);
            ps.execute();
            con.close();
        } catch (Exception e) {
        }
    }
}
