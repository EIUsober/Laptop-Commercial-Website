/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author tanle
 */
public class Person extends Account {
    private int isStaff;
    private int isAdmin;
    private String name;
    private String img;
    private String gender;
    private String phone;
    private String address;
    //private String DateOfBirth;

    public Person(String id, String email, String password, String name, String img, String gender, String phone, String address) {
        super(id, email, password);
        this.name = name;
        this.img = img;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
    }
    
    public Person (String id, String email, String password, String name, String img, String gender, String phone, String address, int isAdmin, int isStaff) {
        super(id, email, password);
        this.name = name;
        this.img = img;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.isAdmin = isAdmin;
        this.isStaff = isStaff;
    }

//    public Person(String name, String img, String gender, String id, String email, String password) {
//        super(id, email, password);
//        this.name = name;
//        this.img = img;
//        this.gender = gender;
//    }
    
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

//    public String getDateOfBirth() {
//        return DateOfBirth;
//    }
//
//    public void setDateOfBirth(String DateOfBirth) {
//        this.DateOfBirth = DateOfBirth;11221132
//    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getIsStaff() {
        return isStaff;
    }

    public void setIsStaff(int isStaff) {
        this.isStaff = isStaff;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Person{" + "isStaff=" + isStaff + ", isAdmin=" + isAdmin + ", name=" + name + ", img=" + img + ", gender=" + gender + ", phone=" + phone + ", address=" + address + '}';
    }
    
    
    
    
}
