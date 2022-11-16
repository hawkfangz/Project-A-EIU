
import DAO.DB_Connection;
import static DAO.ProductsDAO.getPrList;
import Entity.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Hau
 */
public class NewClass {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        System.out.println("Hello");
        try {
            String typeName = "REEEEEEEEEEEEE";
            DB_Connection db_con = new DB_Connection();
            Connection con = db_con.getConnection();
            String sql = "SELECT `typeName` FROM `toyshop`.`product_type` where typeID = ?;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, 111);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                typeName = rs.getString("typeName");
            }
            con.close();
            System.out.println(typeName);

        } catch (Exception e) {
        }
    }
}
