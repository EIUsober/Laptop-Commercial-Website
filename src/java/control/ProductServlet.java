/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import configPkg.ConfigInfo;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author tanle
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String target = "View/UserView/Product.jsp";
        String mode = request.getParameter("mode");
        ProductDAO productDAO = new ProductDAO();
        
        ArrayList<Product> listProduct;
        ArrayList<Category> listC = productDAO.getAllCategory();
        request.setAttribute("listC", listC);
        
        switch (mode) {
            case "view" ->             {   
                target = "View/UserView/Product.jsp";
                String cat_id = request.getParameter("cid");
                String cat_name = request.getParameter("cname");
                String title="OUR ALL PRODUCTS";
                if (cat_id==null || cat_id.equals("")){
                    listProduct = productDAO.getAllProduct();
                } else {
                    listProduct = productDAO.getAllProductByCatId(cat_id);
                    title=cat_name;
                }
                request.setAttribute("tag", cat_id);
                request.setAttribute("title", title);
                request.setAttribute("listP", listProduct);
            }
            case "search" ->             {
                String search = request.getParameter("text");
                listProduct = productDAO.searchByName(search);
                request.setAttribute("value", search);
                request.setAttribute("listP", listProduct);
                target ="View/UserView/Product.jsp";
            }
                
            case "detail" ->             {
                String pid = request.getParameter("pid");
                Product p = productDAO.getProductById(pid);
                ArrayList<Product> relatedProduct = productDAO.getRelatedProducts(String.valueOf(p.getCid()), p.getID());
                request.setAttribute("relateProduct", relatedProduct);
                request.setAttribute("productP", p);
                target="View/UserView/ProductDetail.jsp";
            }
            case "add" -> {
                int active = 2;
                request.setAttribute("active", active);
                target="View/AdminView/AddProduct.jsp";
            }
            case "addConfirm" -> {
                String name = request.getParameter("name");
                Part imgFilePart = request.getPart("image");
                String image = name.replaceAll(" ", "");
                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\ProductImages\\" + image + ".jpg");
                double price = Double.parseDouble(request.getParameter("price"));
                int category = Integer.parseInt(request.getParameter("category"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String description = request.getParameter("description");
                Product p = new Product(name, image,price,category,quantity,description);
                productDAO.insertProduct(p);
                target = "AdminServlet?mode=productManage";
            }
            case "delete" -> {
                String id = request.getParameter("pid");
                productDAO.deleteProduct(id);
                target = "AdminServlet?mode=productManage";
            }
            case "enableProduct" -> {
                String id = request.getParameter("pid");
                productDAO.enableProduct(id);
                target = "AdminServlet?mode=productManage";
            }
            
            case "edit" -> {
                int active = 2;
                request.setAttribute("active", active);
                String pid = request.getParameter("pid");
                Product product = productDAO.getProductById(pid);
                request.setAttribute("product", product);
                target="View/AdminView/EditProduct.jsp";
            }
            
            case "edited" -> {
                String edited_id = request.getParameter("id");
                String edited_name = request.getParameter("name");
                String edited_price = request.getParameter("price");
                String edited_category = request.getParameter("category");
                String edited_quantity = request.getParameter("quantity");
                String edited_description = request.getParameter("description");
                productDAO.editProduct(edited_id, edited_name, edited_price, edited_category,edited_quantity, edited_description);
                target = "AdminServlet?mode=productManage";
            }
            
            case "changeImg" -> {
                String id = request.getParameter("id");
                Part imgFilePart = request.getPart("image");
                String image = id.replaceAll(" ", "");
                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\ProductImages\\" + image + ".jpg");
                productDAO.changeProductImg(id, image);
                target="ProductServlet?mode=edit&pid="+id;
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(target);
        requestDispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
