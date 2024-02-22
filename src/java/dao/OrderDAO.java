/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Cart;
import entity.Item;
import entity.Order;
import entity.Person;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author tanle
 */
public class OrderDAO {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public OrderDAO() {
        
    }
    
    public int createOrder (String customer_id, Cart cart, LocalDate date, String method) {
         String query = "insert into order_tb (customer_id, total_price, order_date,payment_method, order_status) values('"+customer_id+"','"+cart.getTotalMoney()+"' , '"+date+"', '"+method+"', 'unconfirmed');";
         int newID =0;
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            ResultSet res = ps.getGeneratedKeys();
            while (res.next()){
                newID = res.getInt(1);
                System.out.println("Generated key: " + newID);
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
         return newID;
     }
    
    public void createOderDetail(int order_id, Cart cart){
        
        try {
            con = DBContext.getConnection();
            for (Item i : cart.getItems()){
                String query="INSERT INTO order_detail (`order_id`, `product_id`, `quantity`, `price`) VALUES ('"+order_id+"', '"+i.getProduct().getID()+"', '"+i.getQuantity()+"', '"+i.getPrice()+"');";
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                updateQuantity(i.getProduct().getID(), i.getQuantity());
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
     }
    
    public void updateQuantity(String product_id, int quantity){
        String query = "select product_quantity from product_tb where product_id ='"+product_id+"'";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            int temp=0;
            while (rs.next()){
                temp = rs.getInt(1);
            }
            int newQuantity = temp - quantity;
            String query1 = "update product_tb set product_quantity = '"+newQuantity+"' where  product_id = '"+product_id+"';";
            ps = con.prepareStatement(query1);
            ps.executeUpdate(query1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public ArrayList<Order> getAllOrder(){
        String query = "select * from order_tb ORDER BY order_id DESC;";
        ArrayList<Order> listOreder = new ArrayList<Order>();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            while (rs.next()) {
                Order order = new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                listOreder.add(order);
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
        return listOreder;
    }
    
    public ArrayList<Order> getOrderByStatus(String status){
        String query = "select * from order_tb where order_status = '"+status+"' ORDER BY order_id DESC;";
        ArrayList<Order> listOreder = new ArrayList<Order>();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            while (rs.next()) {
                Order order = new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                listOreder.add(order);
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
        return listOreder;
    }
    
    public ArrayList<Order> getOrderByCusId(String customer_id){
        String query = "select * from order_tb where customer_id = '"+customer_id+"' ORDER BY order_id DESC;";
        ArrayList<Order> listOreder = new ArrayList<Order>();
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            while (rs.next()) {
                Order order = new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                listOreder.add(order);
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
         return listOreder;
    }
    
    public ArrayList<Order> getOrderByStaffId(String staff_id){
        String query = "select * from order_tb where seller_id = '"+staff_id+"' ORDER BY order_id DESC;";
        ArrayList<Order> listOreder = new ArrayList<Order>();
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            while (rs.next()) {
                Order order = new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                listOreder.add(order);
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
         return listOreder;
    }
    
    public Cart getCartById (String orderId){
        String query = "select * from order_detail where order_id = '"+orderId+"';";
        ArrayList<Order> listOreder = new ArrayList<Order>();
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Item> listItem = new ArrayList<Item>();
        Cart cart=new Cart();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            while (rs.next()) {
                String productId = rs.getString(2);
                int itemQuantity = rs.getInt(3);
                //System.out.println(itemQuantity);
                double price = rs.getDouble(4);
                //System.out.println(price);
                Product product = productDAO.getProductById(productId);
                listItem.add(new Item(product, itemQuantity, price));              
            }
            cart.setItems(listItem);
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
         return cart;
    }
    
    public void confirmOrder(String order_id, String seller_id){
        String query = "update order_tb set order_status = 'confirmed', seller_id = '"+seller_id+"' where order_id = '"+order_id+"';";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateOrderStatus(String order_id, String new_status) {
        String query = "update order_tb set order_status = '"+new_status+"' where order_id = '"+order_id+"';";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Order getOrderDetail(String orderID, String customerId) {
        String query = "select * from order_tb where order_id = '"+orderID+"';";
        OrderDAO orderDAO = new OrderDAO();
        AccountDAO accountDAO = new AccountDAO();
        Cart cart = orderDAO.getCartById(orderID);
        Person person = accountDAO.getAccountById(customerId);
        Order order = new Order();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            
            while (rs.next()) {
                order.setCart(cart);
                order.setPerson(person);
                order.setOrderId(rs.getString(1));
                order.setOrderDate(rs.getDate(4));
                order.setOrderMethod(rs.getString(5));
                order.setOrderStatus(rs.getString(6));
                order.setSellerId(rs.getString(7));
                
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
         return order;
    }
    
//         public static void main(String[] args){
//        OrderDAO orderDAO = new OrderDAO();
//        Order o = orderDAO.getOrderDetail("156517","C0016");
//             System.out.println(o);
//         
//   }

    public ArrayList<Order> getOrdersByMonth(String month) {
        String query = "select * from order_tb where order_date like '"+month+"-%' ORDER BY order_id DESC";
        ArrayList<Order> listOreder = new ArrayList<Order>();
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            while (rs.next()) {
                Order order = new Order(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                listOreder.add(order);
            }
            ps.close();
            con.close();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
        return listOreder;
    }
}
