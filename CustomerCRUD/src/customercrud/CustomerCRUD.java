/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package customercrud;

/**
 *
 * @author Priya
 */
public class CustomerCRUD {
    public static void main(String[] args) {
        CustomerPOJO cust1 = new CustomerPOJO("Priyank", "6359467208", "priyank@gmail.com");
        
        CustomerDAO dao = new CustomerDAO();
        dao.insertCustomer(cust1);
    }
    
}
