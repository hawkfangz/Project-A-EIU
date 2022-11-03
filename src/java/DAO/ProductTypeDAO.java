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
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
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
