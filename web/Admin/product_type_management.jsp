<%-- 
    Document   : product_type_management
    Created on : Oct 26, 2022, 6:33:09 PM
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Type</title>
    </head>
    <body>

        <div class="form-group col-md-4">
            <label for="inputState">Showing</label>
            <select id="inputState" class="form-control">
                <option selected>product types</option>
                <option>products</option>
            </select>
        </div>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/toyshop", "root", "admin");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from product_type");
        %><table class="table" border= "1"><%
            ResultSetMetaData resMetaData = rs.getMetaData();
            int nCols = resMetaData.getColumnCount();
            %><tr><%
                out.print("<td><b>Type ID</b></td>");
                out.print("<td><b>Name</b></td>");
                out.print("<td><b>Des</b></td>");
                out.print("<td><b>Status</b></td>");
                %></tr><%
                    while (rs.next()) {
                %><tr><%
                %><td><% out.print(rs.getInt(1));%></td><%
                %><td><% out.print(rs.getString(2));%></td><%
                %><td><% out.print(rs.getString(3));%></td><%
                %><td><% out.print(rs.getInt(4));%></td><%
                %></tr><%
                    }

                %></table><%                conn.close();
            %>
        <form class="form-inline" action="AddProductType" method="post">
            <div class="form-group mb-2">
                <input type="text" class="form-control-plaintext" name="name" placeholder="Name">
            </div>
            <div class="form-group mb-2">
                <input type="text" class="form-control-plaintext" name="des"  placeholder="Description">
            </div>
            <div class="form-group mb-2">
                <input type="text" class="form-control-plaintext" name="status"  placeholder="Status">
            </div>
            <button type="submit" name="addBtn" value="add" class="btn btn-primary mb-2">Add</button>
            <!--<button type="submit" name="delBtn" value="del" class="btn btn-primary mb-2">Delete</button>-->
        </form>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body></html>