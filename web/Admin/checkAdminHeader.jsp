<%
    String logedUser = (String) session.getAttribute("admin");
    if (logedUser == null) {
        response.sendRedirect("Login");
    }
%>