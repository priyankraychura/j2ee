/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cmdlogin;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Priya
 */
public class LoginDAO {
    public String DB_URL = "jdbc:mysql://localhost:3306/bca-142";
    public String USERNAME = "root";
    public String PASSWORD = "";
    
    public void loginUser(LoginPojo user){
        try {
            Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            
            String SQL = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(SQL);
            
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
                System.out.println("Logged in successfully");
            } else{
                System.out.println("Usrname or password incorrect");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
}
