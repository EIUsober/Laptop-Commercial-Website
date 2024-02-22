/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Person;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tanle
 */
public class AccountDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public AccountDAO() {

    }
    public static String doHashing(String password){
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");

            messageDigest.update(password.getBytes());
            byte[] resultByteArray = messageDigest.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : resultByteArray){
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
    public Person login(String email, String password){
        String query = "select * from customer_tb where customer_email = '"+email+"' and customer_pass = '"+doHashing(password)+"'";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()){
                return new Person(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        "images\\CustomerAvatar\\"+rs.getString(5)+".jpg",
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                
                );
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
         return null;
    }
    
    public Person staffLogin(String email, String password){
        String query = "select * from staff_tb where staff_email = '"+email+"' and staff_pass = '"+doHashing(password)+"'";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()){
                return new Person(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6),
                        "images\\StaffAvatar\\"+rs.getString(7)+".jpg",
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(4),
                        rs.getInt(5)
                
                );
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
         return null;
    }
    
    public boolean checkAccountExist(String email,int staff, int admin){
        String query="";
        if (staff==0 && admin ==0){
            query = "select * from customer_tb where customer_email = '"+email+"'";
        } else {
            query = "select * from staff_tb where staff_email = '"+email+"'";
        }
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            if(rs.next()){
                 con.close();
                return true;
            } else {
                 con.close();
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
         return true;
    }
    
    public void signUpAccount(String email, String pass){
        pass = doHashing(pass);
        String query = "insert into customer_tb (customer_email, customer_pass,customer_active) values ('"+email+"','"+pass+"',1)";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
     }
    
    public ArrayList<Person> getAllCustomerAccount() {
        String query = "select * from customer_tb where customer_active = 1;";
        ArrayList<Person> listPerson = new ArrayList<Person>();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()){
               Person person = new Person(rs.getString(1),
                       rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                       "images\\CustomerAvatar\\"+rs.getString(5)+".jpg",
                       rs.getString(6),
                       rs.getString(7),
                       rs.getString(8)
               );
               listPerson.add(person);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listPerson;
    }
    
    
    public ArrayList<Person> getAllStaffAccount() {
        String query = "select * from staff_tb where isStaff = 1 and staff_active = 1;";
        ArrayList<Person> listPerson = new ArrayList<Person>();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()){
               Person person = new Person(rs.getString(1),
                       rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(6), 
                       "images\\CustomerAvatar\\"+rs.getString(7)+".jpg",
                       rs.getString(8),
                       rs.getString(9),
                       rs.getString(10)
               );
               listPerson.add(person);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listPerson;
    }
    public Person getAccountById(String id) {
        String query = "select * from customer_tb where customer_id = '" + id +"'";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()){
                return new Person(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        "images\\CustomerAvatar\\"+rs.getString(5)+".jpg",
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                
                );
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public Person getStaffById(String id) {
        String query = "select * from staff_tb where staff_id = '" + id +"'";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()){
                return new Person(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(6),
                        "images\\StaffAvatar\\"+rs.getString(7)+".jpg",
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(4),
                        rs.getInt(5)
                
                );
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public void editAccount(String id, String name, String gender, String phone, String address, String email){
        if (id.contains("C")){
            String query =  "update customer_tb set customer_name = '"+ name +"', customer_gender = '"+ gender +"', customer_phone = '"+ phone + "', customer_address = '"+ address +"' where customer_id = '"+ id +"';";
            try {
               con = DBContext.getConnection();
               ps = con.prepareStatement(query);
               ps.executeUpdate();
               con.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else {
            String query =  "update staff_tb set staff_name = '"+ name +"', staff_gender = '"+ gender +"', staff_phone = '"+ phone + "', staff_address = '"+ address +"' where staff_id = '"+ id +"';";
            try {
               con = DBContext.getConnection();
               ps = con.prepareStatement(query);
               ps.executeUpdate();
               con.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
         
    }
    
    public void editAvatar(String id, String image){
        String query="";
        if (id.contains("C")){
            query =  "update customer_tb set customer_img = '"+ image + "' where customer_id = '"+ id +"';";
        } else {
            query =  "update staff_tb set staff_img = '"+ image + "' where staff_id = '"+ id +"';";
        }
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void resetPassword(String email, String newPassword){
         String query =  "update customer_tb set customer_pass = '"+doHashing(newPassword)+"' where customer_email ='"+email+"';";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
    }
    
    public void adminCreateCustomerAccount(String email, String pass, String name,String img, String gender, String phone, String address){
        pass = doHashing(pass);
        String query = "insert into customer_tb (customer_email, customer_pass, customer_name, customer_img, customer_gender, customer_phone, customer_address, customer_active) values"
                + "('"+email+"','"+pass+"','"+name+"','"+img+"','"+gender+"','"+phone+"','"+address+"',1);";
        System.out.println(query); 
       try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void adminCreateStaffAccount(String email, String pass,int isAdmin, int isStaff, String name,String img, String gender, String phone, String address){
        pass = doHashing(pass);
        String query = "insert into staff_tb (staff_email, staff_pass, isAdmin, isStaff, staff_name, staff_img, staff_gender, staff_phone, staff_address, staff_active) values"
                + "('"+email+"','"+pass+"', "+isAdmin+", "+isStaff+",'"+name+"','"+img+"','"+gender+"','"+phone+"','"+address+"', 1);";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void deleteCustomer(String cus_id) {
        String query = "update customer_tb set customer_active = '0' where customer_id = '"+cus_id+"';";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void deleteStaff(String staff_id) {
        String query = "update staff_tb set staff_active = '0' where staff_id = '"+staff_id+"';";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static void main(String[] args) throws SQLException {
        AccountDAO dao = new AccountDAO();
        dao.adminCreateStaffAccount("adminCreateCustomerAccount", "staff", 0, 1, "Nguyen Truong Giang", "NguyenTruongGiang", "Male", "046798494", "Phu Loi, Binh Duong");
    }
}
