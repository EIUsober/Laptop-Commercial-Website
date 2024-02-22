/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author tanle
 */
public class Order {
    private String orderId;
    private String customerId;
    private Cart cart;
    private Person person;
    private  double orderPrice;
    private Date orderDate;
    private String orderMethod;
    private String orderStatus;
    private String sellerId;

    public Order(String orderId,String customerId, double orderPrice, Date orderDate, String orderMethod, String orderStatus, String sellerId) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.orderPrice = orderPrice;
        this.orderDate = orderDate;
        this.orderMethod = orderMethod;
        this.orderStatus = orderStatus;
        this.sellerId = sellerId;
    }
    
     public Order() {
    }

    public Order(String orderId, Cart cart, Person person, Date orderDate, String orderMethod, String orderStatus, String sellerId) {
        this.orderId = orderId;
        this.cart = cart;
        this.person = person;
        this.orderDate = orderDate;
        this.orderMethod = orderMethod;
        this.orderStatus = orderStatus;
        this.sellerId = sellerId;
    }
    
    

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
    
    

    public double getOrderPrice() {
        return orderPrice;
    }
    
    public String getStringOrderPrice() {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(getOrderPrice());
    }

    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderMethod() {
        return orderMethod;
    }

    public void setOrderMethod(String orderMethod) {
        this.orderMethod = orderMethod;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", customerId=" + customerId + ", cart=" + cart + ", person=" + person + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate + ", orderMethod=" + orderMethod + ", orderStatus=" + orderStatus + ", sellerId=" + sellerId + '}';
    }
    
    
    
    
}
