<%-- 
    Document   : product_type_management
    Created on : Oct 26, 2022, 6:33:09 PM
    Author     : phanh
--%>

<%@page import="Entity.ProductType"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ProductTypeDAO"%>
<%@page import="java.sql.*"%>

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
            <%--<%@include file="checkAdminHeader.jsp" %>--%>
            <form class=" form-inline" action="AddProductType" method="post">
                <input type="hidden" name="mode" value="add">

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
            </form>
            <table class="table" border= "1">
                <thead>
                    <tr class="">
                        <th scope="col">ID</th>
                        <th scope="col">Type</th>
                        <th scope="col">Description</th>
                        <th scope="col">Status</th>
                        <th scope="col">Function</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String btn = "";
                        List<ProductType> typeList = ProductTypeDAO.getTypeTable();
                        for (int i = 0; i < typeList.size(); i++) {
                            if (typeList.get(i).getStatus().equals("available")) {
                                btn = "disable";
                            } else {
                                btn = "enable";
                            }
                            out.print("<tr class=\"product-detail\">");
                            out.print("<td>" + typeList.get(i).getId() + "</td>");
                            out.print("<td>" + typeList.get(i).getName() + "</td>");
                            out.print("<td>" + typeList.get(i).getDes() + "</td>");
                            out.print("<td class=\"status\">" + typeList.get(i).getStatus() + "</td>");
                            out.println("<td class=\"action-form\">"
                                    + "<span><form  method=\"post\" action=\"AddProductType\">");
                            out.println("   <input type=\"hidden\" name=\"id\" value=\"" + typeList.get(i).getId() + "\" />");
                            out.println("   <button type=\"submit\" name=\"mode\" value=\"update\">Update</button>");
                            out.println("   <button type=\"submit\" name=\"mode\" value=\"disable\">" + btn + "</button>");
                            out.println("</form></span>");
                            out.println("<tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body></html>