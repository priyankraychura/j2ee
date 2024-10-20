<%-- 
    Document   : welcome
    Created on : 19-Oct-2024, 11:13:21 pm
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
        String username = (String)session.getAttribute("username");
    %>
    <body>
        <h1><%= username %>, You are logged in successfully</h1>
        <a href="logout.jsp">Logout</a>
    </body>
</html>
