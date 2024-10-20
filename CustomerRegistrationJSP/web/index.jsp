<%-- 
    Document   : index
    Created on : 19-Oct-2024, 11:33:12 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if(request.getMethod().equals("POST")){
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            String DB_URL = "jdbc:mysql://localhost:3306/bca-142";
            
            Connection conn = DriverManager.getConnection(DB_URL, "root", "");
            String SQL = "INSERT INTO customers(name, number, email) VALUES(?, ?, ?)";
            
            PreparedStatement stmt = conn.prepareStatement(SQL);
            stmt.setString(1, name);
            stmt.setString(2, number);
            stmt.setString(3, email);
            
            int rowInserted = stmt.executeUpdate();
            
            if(rowInserted > 0){
                out.println("Customer inserted successfully");
            } else{
                out.println("Failed to insert customer");
            }
        }
    %>
    <body>
        <h1>Customer Register</h1>
        <form action="" method="POST">
            Name:
            <input type="text" name="name"> <br><br>
            Email:
            <input type="email" name="email"> <br><br>
            Number:
            <input type="text" name="number"> <br><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
