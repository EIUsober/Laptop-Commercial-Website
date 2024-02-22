/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.text.DecimalFormat;

/**
 *
 * @author tanle
 */
public class Product {
    private String id;
    private String name;
    private String image;
    private double price;
    private int cid;
    private int quantity;
    private String description;

    public Product(String id, String name, String image, double price, int cid, int quantity, String description) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.cid = cid;
        this.quantity = quantity;
        this.description = description;
    }
    
    public Product( String name, String image, double price, int cid, int quantity, String description) {
        this.name = name;
        this.image = image;
        this.price = price;
        this.cid = cid;
        this.quantity = quantity;
        this.description = description;
    }

    public String getID() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void steName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }
    public String getStringPrice() {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(this.price);
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", image=" + image + ", price=" + price + ", cid=" + cid + "description="+ description + '}';
    }

   

    
    
    
}
