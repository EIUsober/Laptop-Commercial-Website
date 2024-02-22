/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.text.DecimalFormat;

/**
 *
 * @author thanh
 */
public class Item {
    private Product product;
    private int quantity;
    private double price;
    
    public Item() {
        
    }

    public Item(Product product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }
    
     public String getStringPrice() {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(getPrice());
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public double getTotal(){
       return price = product.getPrice()*quantity;
        
    }
    public String getStringTotal(){
      DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(getTotal());
    }
}
