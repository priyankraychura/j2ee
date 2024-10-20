/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Priya
 */
public class insertMark extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertMark</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertMark at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int rollno = Integer.parseInt(request.getParameter("rollno"));
            String name = request.getParameter("name");
            int html = Integer.parseInt(request.getParameter("html"));
            int css = Integer.parseInt(request.getParameter("css"));
            int js = Integer.parseInt(request.getParameter("js"));
            int java = Integer.parseInt(request.getParameter("java"));
            int python = Integer.parseInt(request.getParameter("python"));
            int android = Integer.parseInt(request.getParameter("android"));
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            String DB_URL = "jdbc:mysql://localhost:3306/bca-142";
            
            Connection conn = DriverManager.getConnection(DB_URL, "root", "");
            String SQL = "INSERT INTO students(rollno, name, html, css, js, java, python, android) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement stmt = conn.prepareStatement(SQL);
            stmt.setInt(1, rollno);
            stmt.setString(2, name);
            stmt.setInt(3, html);
            stmt.setInt(4, css);
            stmt.setInt(5, js);
            stmt.setInt(6, java);
            stmt.setInt(7, python);
            stmt.setInt(8, android);
            
            int rowInserted = stmt.executeUpdate();
            
            if(rowInserted > 0){
                response.sendRedirect("marks.jsp?id=" + rollno);
            } else{
                response.sendRedirect("error.html");
            }
            
        } catch (Exception ex) {
            Logger.getLogger(insertMark.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
