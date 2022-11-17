<%-- 
    Document   : product_detail
    Created on : Nov 17, 2022, 6:17:13 PM
    Author     : phanh
--%>
<%@page import="DAO.ProductTypeDAO"%>
<%@page import="Entity.ProductType"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductsDAO"%>
<%@page import="Entity.Products"%>
<%
    int id = Integer.parseInt((String) request.getParameter("id"));
    Products product = ProductsDAO.getProduct(id);
    List<ProductType> productType = ProductTypeDAO.getTypeTable();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title><%=product.getName()%> || Detail!</title>
    </head>
    <body>
        <div class="container">
            <form>
                <div class="form-row">
                    <div class="form-group col-md-1">
                        <label for="inputEmail4">ID</label>
                        <input type="text" class="form-control" id="ID" disabled>
                    </div>
                    <div class="form-group col-md-9">
                        <label for="inputPassword4">Name</label>
                        <input type="text" class="form-control" id="name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Price</label>
                    <input type="number" class="form-control" id="price">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Type</label>
                    <select class="form-control" id="type" name="type">
                        <%
                            for (ProductType type : productType) {
                                out.println("<option id=\"" + type.getId() + "\" value=\"" + type.getId() + "\">" + type.getName() + "</option>");
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Description</label>
                    <textarea class="form-control" id="des" rows="3"></textarea>
                </div>
            </form>
        </div>
        <script>
            document.getElementById("ID").defaultValue = "<%=product.getId()%>";
        </script>
        <script>
            document.getElementById("name").defaultValue = "<%=product.getName()%>";
        </script>
        <script>
            document.getElementById("price").defaultValue = "<%=product.getPrice()%>";
        </script>
        <script>
            document.getElementById("des").defaultValue = "<%=product.getDes()%>";
        </script>
        <%
            int typeID = product.getTypeID();
        %>
         <script>
             document.getElementById(<%=typeID%>).selected = true;
        </script>
        
        
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </body>
</html>
