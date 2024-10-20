/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package customercrud;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Priya
 */
public class CustomerDAO {
    public static final String DB_URL = "jdbc:mysql://localhost:3306/bca-142";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "";
    
    public void insertCustomer(CustomerPOJO cust){
        try {
            Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            
            String SQL = "INSERT INTO customers(name, number, email) VALUES(?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(SQL);
            
            stmt.setString(1, cust.getName());
            stmt.setString(2, cust.getEmail());
            stmt.setString(3, cust.getNumber());
            
            int rowsInserted = stmt.executeUpdate();
            
            if(rowsInserted > 0){
                System.out.println("Customer inserted successfully");
            } else{
                System.out.println("Failed to insert customer");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateCustomer(CustomerPOJO cust, int id){
        try {
            Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            
            String SQL = "UPDATE customber SET name = ?, email = ?, number = ?, WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(SQL);
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
