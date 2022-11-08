<%@page import="Entity.Customer"%>
<%
    String mode = "";
    String modeName = "";
    String msg = "";
    Customer customer = (Customer) session.getAttribute("user");
    if (customer != null) {
        msg = "Hello "+customer.Name;
        mode = "logout";
        modeName = "Sign out";
    } else {
        msg ="Hello there!";
        mode = "login";
        modeName = "Sign in";
    }
%>

<form action="CustomerController" method="post">
    <input type="hidden" name="mode" value="<%=mode%>">
    <label class="col-sm-2 col-form-label"><%=msg%></label>
    <button type="submit" class="btn btn-primary"><%=modeName%></button>
</form>
