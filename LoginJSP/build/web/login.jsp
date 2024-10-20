<%-- 
    Document   : login
    Created on : 19-Oct-2024, 10:51:25 pm
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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            String DB_URL = "jdbc:mysql://localhost:3306/bca-142";
            
            Connection conn = DriverManager.getConnection(DB_URL, "root", "");
            
            String SQL = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(SQL);
            
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
                session.setAttribute("username", username);
                Cookie c = new Cookie("sessionid", session.getId());
                response.addCookie(c);
                
                response.sendRedirect("welcome.jsp");
            } else{
                response.sendRedirect("error.html");
            }
        }
    %>
    
    <body>
        <h1>Login</h1>
        <form method="POST" action="">
            Username: 
            <input type="text" name="username"> <br>
            Password: 
            <input type="text" name="password"> <br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
