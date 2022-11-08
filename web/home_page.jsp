<%-- 
    Document   : home_page
    Created on : Oct 23, 2022, 1:40:16 PM
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <%@include file="/checkLoginHeader.jsp" %>
        <h1>This is home page!</h1>
        <a href="Login">Log in using servlet name</a>
        <br>
        <a href="error2test">Goes to Error Page</a>
        <br>
        <a href="Admin/ProductTypeManager">Manager Page</a>
        <br>
    </body>
</html>
