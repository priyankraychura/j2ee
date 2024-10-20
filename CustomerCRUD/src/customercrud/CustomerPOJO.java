/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package customercrud;

/**
 *
 * @author Priya
 */
public class CustomerPOJO {
    public int id;
    public String name;
    public String number;
    public String email;

    public CustomerPOJO(String name, String number, String email) {
        this.name = name;
        this.number = number;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getNumber() {
        return number;
    }

    public String getEmail() {
        return email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "CustomerPOJO{" + "id=" + id + ", name=" + name + ", number=" + number + ", email=" + email + '}';
    }
    
}
