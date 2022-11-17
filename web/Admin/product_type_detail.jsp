<%-- 
    Document   : ProductTypeDetail
    Created on : Nov 13, 2022, 3:10:25 AM
    Author     : phanh
--%>
<%@page import="DAO.ProductTypeDAO"%>
<%@page import="Entity.ProductType" %>
<%
    String id = request.getParameter("id");
    ProductType type = ProductTypeDAO.getProductType(Integer.parseInt(id));
    String typeName = type.getName();
    String typeDES = type.getDes();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=typeName%> - Detail</title>
    </head>
    <body>
        <div class="container">
            <form action="AddProductType" method="post">
                <input type="hidden" name ="mode" value="do-update">
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" name="type-name" id="type-name">
                    </div>
                </div>
                <textarea class="form-control" id="type-des" name="type-des" required=""></textarea>
                <button type="submit" name ="id" value ="<%=id%>" class="btn btn-primary mb-2">Edit</button>
            </form>
        </div>
        <script>
            document.getElementById("type-name").defaultValue = "<%=typeName%>";
        </script><script>
            document.getElementById("type-des").defaultValue = "<%=typeDES%>";
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
