/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tanle
 */
public class ProductDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ProductDAO() {
    }
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product_tb where enable = '1' order by product_id desc";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next()) {
                Product product = new Product(rs.getString(1),
                        rs.getString(2),
                        "images\\ProductImages\\"+rs.getString(3)+".jpg",
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
                list.add(product);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public ArrayList<Product> getDisabledProducts() {
        ArrayList<Product> list = new ArrayList<Product>();
        String query = "SELECT * FROM product_tb where enable = '0' order by product_id desc";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next()) {
                Product product = new Product(rs.getString(1),
                        rs.getString(2),
                        "images\\ProductImages\\"+rs.getString(3)+".jpg",
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
                list.add(product);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<Category>();
        String query = "SELECT * FROM categories where enable = '1' order by cat_id desc";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next()) {
                Category category = new Category(rs.getInt(1),
                        rs.getString(2)
                );
                list.add(category);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Product> getNewestProduct() {
        ArrayList<Product> list = new ArrayList<Product>();
        try {
            String query = "SELECT * FROM product_tb where enable = '1' order by product_id desc";
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
           
            
            rs = ps.executeQuery(query);
            int count =0;
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next() && count <6){
                 Product product = new Product(rs.getString(1),
                            rs.getString(2),
                            "images\\ProductImages\\"+rs.getString(3)+".jpg",
                            rs.getDouble(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getString(7)
                    );
                    list.add(product);
                    count++;
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Product> getAllProductByCatId(String cid) {
        ArrayList<Product> list = new ArrayList<Product>();
        
        try {
            String query = "select * from product_tb where cat_id="+cid+" and enable = 1 order by product_id desc";
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            
            rs = ps.executeQuery(query);
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next()) {
                Product product = new Product(rs.getString(1),
                        rs.getString(2),
                        "images\\ProductImages\\"+rs.getString(3)+".jpg",
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
                list.add(product);
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public ArrayList<Product> getRelatedProducts(String cid, String pid){
        ArrayList<Product> relatedProducts = getAllProductByCatId(cid);
        for (Product p : relatedProducts){
            if (p.getID().equalsIgnoreCase(pid)){
                relatedProducts.remove(p);
                break;
            }
        }
       while(relatedProducts.size()>4){
           relatedProducts.remove(relatedProducts.get(4));
       }
        return relatedProducts;
    }
    
     public Product getProductById(String id) {
        try {
            String query = "select * from product_tb where product_id = '"+id+"'";
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next()) {
                return new Product(rs.getString(1),
                        rs.getString(2),
                        "images\\ProductImages\\"+rs.getString(3)+".jpg",
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
     
     public ArrayList<Product> searchByName(String search) {
        ArrayList<Product> list = new ArrayList<Product>();
        String query = "select * from product_tb where enable = '1' and product_name like '%"+search+"%' order by product_id desc";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            //String imageLocation="resources\\uploadedIMG\\" + imgName + ".jpg";
            while (rs.next()) {
                Product product = new Product(rs.getString(1),
                        rs.getString(2),
                        "images\\ProductImages\\"+rs.getString(3)+".jpg",
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)
                );
                list.add(product);
            }
            con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
     
     public void insertProduct(Product p){
         String query = "insert into product_tb (product_name, product_img, product_price, cat_id,product_quantity, product_description, enable) values ('"+p.getName()+"','"+p.getImage()+"','"+p.getPrice()+"','"+p.getCid()+"','"+p.getQuantity()+"','"+p.getDescription()+"', 1)";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
         } catch (Exception e) {
            System.out.println(e.getMessage());
         }
     }
     
    public void deleteProduct(String id){
        String query = "delete from product_tb where product_id = '"+id+"'";
        try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            String query2 = "update product_tb set enable = 0 where  product_id = '"+id+"'";
            try {
                con = DBContext.getConnection();
                ps = con.prepareStatement(query2);
                ps.executeUpdate();
            } catch (Exception e2){
                System.out.println(e2.getMessage());
            }
        }
    }
    public void enableProduct(String id){
         String query =  "update product_tb set enable = 1 where product_id ='"+id+"'";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
     }
    
    public void editProduct(String id, String name, String price, String cat_id, String quantity, String description){
         String query =  "update product_tb set product_name = '"+ name + "', product_price = '"+ price +"', cat_id = '"+ cat_id +"', product_quantity = '"+ quantity + "', product_description = '"+ description +"' where product_id = '"+ id +"';";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
     }
    
    public void changeProductImg(String id, String img){
         String query =  "update product_tb set product_img = '"+ img +"' where product_id = '"+ id +"';";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
     }
    
//    public static void main(String[] args) throws SQLException {
//        ProductDAO dao = new ProductDAO();
//        ArrayList<Product> related = dao.getRelatedProducts("1", "L0002");
//        
//        for (int i=0; i<related.size(); i++){
//            System.out.println(i+" "+related.get(i));
//        }
//    }

    public void addNewCat(String newCatName) {
        String query = "insert into categories (cat_name, enable) values ('"+newCatName+"', 1);";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
         } catch (Exception e) {
            System.out.println(e.getMessage());
         }
    }
    public void deleteCat(String cat_id) {
        String query = "delete from categories where cat_id = '"+cat_id+"'";
         try {
            con = DBContext.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
         } catch (Exception e) {
            System.out.println(e.getMessage());
            String query2 = "update categories set enable = 0 where  cat_id = '"+cat_id+"'";
             try {
                con = DBContext.getConnection();
                ps = con.prepareStatement(query2);
                ps.executeUpdate();
            } catch (Exception e2){
                System.out.println(e2.getMessage());
            }
         }
    }
}
