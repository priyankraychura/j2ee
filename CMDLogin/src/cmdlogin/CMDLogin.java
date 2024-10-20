/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package cmdlogin;
import java.util.Scanner;

/**
 *
 * @author Priya
 */
public class CMDLogin {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Enter username: ");
        String username = sc.nextLine();
        
        System.out.println("Enter password: ");
        String password = sc.nextLine();
        
        LoginPojo user = new LoginPojo(username, password);
        
        LoginDAO dao = new LoginDAO();
        dao.loginUser(user);
    }
    
}
