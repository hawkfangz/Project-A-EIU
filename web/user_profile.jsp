<%-- 
    Document   : user_profile
    Created on : Nov 7, 2022, 10:51:30 PM
    Author     : phanh
--%>

<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entity.Customer"%>
<%
    Customer customer = (Customer) session.getAttribute("user");
    int id = customer.getID();
    String account = customer.Account;
    String name = customer.getName();
    String gender = customer.getGender();
    String email = customer.getEmail();
    Date birtdate = customer.getDoB();
    String phone = customer.getPhone();
    String address = customer.getAddress();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css"/>
        <title><%=account%> profile</title>
    </head>
    <body>
        <div class="container">
            <form>
                <div class="img-container">
                    <img src="user-img/<%=id%>.jpg" class="profile-image img-thumbnail">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <input disabled type="text" class="form-control" placeholder="<%=account%>" id="account">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="inputEmail4">Customer</label>
                        <input type="text" class="form-control" placeholder="<%=name%>" id="name">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputEmail4">Gender</label>
                        <input type="text" class="form-control" placeholder="<%=gender%>" id="name">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="inputEmail4">Birthday</label>
                        <input type="text" class="form-control" id="name" placeholder="<%=birtdate%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="inputEmail4">Address</label>
                        <input type="text" class="form-control" id="address"  placeholder="<%=address%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="inputEmail4">Phone Number</label>
                        <input type="text" class="form-control" id="address" placeholder="<%=phone%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="inputEmail4">Email</label>
                        <input type="text" class="form-control" id="address"placeholder="<%=email%>">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Edit</button>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    </body>

</html>
