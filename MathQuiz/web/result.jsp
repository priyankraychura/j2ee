<%-- 
    Document   : result
    Created on : 20-Oct-2024, 5:01:50 pm
    Author     : Priya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            int num1 = Integer.parseInt(request.getParameter("num1"));
            int num2 = Integer.parseInt(request.getParameter("num2"));
            int operator = Integer.parseInt(request.getParameter("operator"));
            int ans = Integer.parseInt(request.getParameter("ans"));
            int result = 0;
            
            Integer score = (Integer)session.getAttribute("score");
            
            switch(operator){
                case 0:
                    result = num1 + num2;
                    break;
                case 1:
                    result = num1 - num2;
                    break;
                case 2:
                    result = num1 * num2;
                    break;
            }
            
            if(ans == result){
                out.println("Congratulations, your answer is correct.");
                score++;
                
                session.setAttribute("score", score);
            }  else{
                out.println("Sorry, the correct answer is " + result);
            }
        %>
    </head>
    <body>
        <button><a href="index.jsp">Next Question</a></button>
    </body>
</html>
