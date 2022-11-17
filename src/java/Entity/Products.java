/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import DAO.ProductTypeDAO;
import java.sql.SQLException;

/**
 *
 * @author Hau
 */
public class Products {

    private int id;
    private String name;
    private int typeID;
    private String type;
    private String des;
    private int price;
    private String status;

    public Products(int id, String name, int typeID, String des, int price, int status) throws SQLException, ClassNotFoundException {
        this.id = id;
        this.typeID = typeID;
        this.name = name;
        this.type = ProductTypeDAO.getProductTypeDetail(typeID, "typeName");
        this.des = des;
        this.price = price;
        this.status = (status == 1) ? "available" : "unavailable";
    }

    public int getId() {
        return id;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = (status == 1) ? "available" : "unavailable";
    }

}
