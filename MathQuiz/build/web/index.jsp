<%-- 
    Document   : index
    Created on : 20-Oct-2024, 4:24:27 pm
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
        int num1 = (int)(Math.random() * 100);
        int num2 = (int)(Math.random() * 100);
        String restart = request.getParameter("restart");
        String operatation = "";
        
        
        
        Integer score = (Integer)session.getAttribute("score");
        if(score == null){
            session.setAttribute("score", 0);
        } else{
            if(restart != null){
                if(restart.equals("true")){
                    session.setAttribute("score", 0);
                    score = 0;
                }
            }
        }
        
        int operator = (int) (Math.random() * 3);
        
        switch(operator){
            case 0:
                operatation = "+";
                break;
            case 1:
                operatation = "-";
                break;
            case 2:
                operatation = "*";
                break;
        }
    %>
    <body>
        <h3>what is <%= num1 %> <%= operatation %> <%= num2 %>?</h3>
        <h4>Your score is: <%= score %></h4>
        <button><a href="index.jsp?restart=true">Restart Game</a></button> <br><br>
        <form action="result.jsp" method="POST">
            <input type="hidden" value="<%= num1 %>" name="num1">
            <input type="hidden" value="<%= num2 %>" name="num2">
            <input type="hidden" value="<%= operator %>" name="operator">
            <input type="text" name="ans" required="true">
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
