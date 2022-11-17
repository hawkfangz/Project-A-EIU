<%-- 
    Document   : products_management
    Created on : Nov 16, 2022, 8:39:28 PM
    Author     : phanh
--%>
<%@page import="java.util.List"%>
<%@page import="Entity.Products"%>
<%@page import="DAO.ProductsDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager</title>
    </head>
    <body>
        <div class="container">
            <table class="table">
                <thead>
                    <tr class="">
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Type</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Products> productList = ProductsDAO.getPrList();
                        for (Products product : productList) {
                            out.println("<tr class=\"product-detail\">");
                            out.println("<th>" + product.getId() + "</td>");
                            out.println("<td>" + product.getName() + "</td>");
                            out.println("<td>" + product.getTypeID() + "</td>                        ");
                            out.println("<td>" + product.getDes() + "</td>");
                            out.println("<td>" + product.getPrice() + "</td>");
                            out.println("<td>" + product.getStatus() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
