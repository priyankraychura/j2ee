<%-- 
    Document   : marks
    Created on : 20-Oct-2024, 10:21:28 am
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
       int rollno, html, css, js, java, python, android, total;
       float percentage;
       String name, result = "Pass"; 
    %>
    <%
        int id = Integer.parseInt(request.getParameter("id"));

        Class.forName("com.mysql.cj.jdbc.Driver");
        String DB_URL = "jdbc:mysql://localhost:3306/bca-142";
        
        Connection conn = DriverManager.getConnection(DB_URL, "root", "");
        String SQL = "SELECT * FROM students WHERE rollno = ?";
        
        PreparedStatement stmt = conn.prepareStatement(SQL);
        stmt.setInt(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
       if(rs.next()){
            rollno = rs.getInt("rollno");
            name = rs.getString("name");
            html = rs.getInt("html");
            css = rs.getInt("css");
            js = rs.getInt("js");
            java = rs.getInt("java");
            python = rs.getInt("python");
            android = rs.getInt("android");
            
            total = html + css + js + java + python + android;
            percentage = (float)total / 600 * 100;
            
            if(html < 35 || css < 35 || js < 35 || java < 35 || python < 35 || android < 35){
                result = "Fail";
            }
       }
       
    %>
    <body>
        <table border="1">
            <tr>
                <td colspan="3">Christ College, Rajkot</td>
            </tr>
            <tr>
                <td>Roll no: <%= rollno %></td>
                <td colspan="2">Name: <%= name %></td>
            </tr>
            <tr>
                <td>Subject Name</td>
                <td>Total Marks</td>
                <td>Marks Obtained</td>
            </tr>
            <tr>
                <td>HTML</td>
                <td>100</td>
                <td><%= html %></td>
            </tr>
            <tr>
                <td>CSS</td>
                <td>100</td>
                <td><%= css %></td>
            </tr>
            <tr>
                <td>JavaScript</td>
                <td>100</td>
                <td><%= js %></td>
            </tr>
            <tr>
                <td>Java</td>
                <td>100</td>
                <td><%= java %></td>
            </tr>
            <tr>
                <td>Python</td>
                <td>100</td>
                <td><%= python %></td>
            </tr>
            <tr>
                <td>Android</td>
                <td>100</td>
                <td><%= android %></td>
            </tr>
            <tr>
                <td></td>
                <td>Total</td>
                <td><%= total %></td>
            </tr>
            <tr>
                <td></td>
                <td>Percentage</td>
                <td><%= percentage %>%</td>
            </tr>
            <tr>
                <td></td>
                <td>Result</td>
                <td><%= result %></td>
            </tr>
        </table>
    </body>
</html>
