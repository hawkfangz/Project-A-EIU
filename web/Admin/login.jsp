<%-- 
    Document   : login
    Created on : Nov 16, 2022, 8:26:43 PM
    Author     : phanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-5">
                    <form action="GoingIn" method="post">
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Account</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="account" id="account">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Sign in</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
