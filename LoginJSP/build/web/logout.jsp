<%-- 
    Document   : logout.jsp
    Created on : 19-Oct-2024, 11:23:01 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        session.removeAttribute("username");
        session.invalidate();
        
        response.sendRedirect("login.jsp");
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
