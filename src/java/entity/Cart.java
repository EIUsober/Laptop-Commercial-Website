/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tanle
 */
public class Cart {
    private List<Item> items;
    
    public Cart() {
        items = new ArrayList<>();
    }
    
    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    private Item getItemById(String id) {
        for(Item i:items) {
            if(i.getProduct().getID().equalsIgnoreCase(id))
                return i;
        }
        return null;
    }
    
    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();
    }
    //add to cart
    
    public void addItem(Item t) {
        if(getItemById(t.getProduct().getID()).equals("")) {
            Item i =getItemById(t.getProduct().getID());
        } else {
            items.add(t);
        }
    } 
    public void removeItem(String id) {
        if(getItemById(id) !=null) {
            items.remove(getItemById(id));
        }
    }
    public int getTotalQuantity(){
        int totalQuantity=0;
        for (Item i : items){
            totalQuantity+= i.getQuantity();
        }
        return totalQuantity;
    }
    public double getTotalMoney() {
        double t = 0;
        for(Item i:items)
            t+=i.getTotal();
        return t;
    }
    public String getStringTotalMoney() {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(getTotalMoney());
    }
}
