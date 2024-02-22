/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;


import entity.Cart;
import dao.*;
import entity.Category;
import entity.Item;
import entity.Person;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tanle
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

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
        String target = "View/UserView/Cart.jsp";

        String pid = request.getParameter("id");
        String mode = request.getParameter("mode");
        ProductDAO ProductDAO = new ProductDAO();
        List<Category> listC = ProductDAO.getAllCategory();
        request.setAttribute("listC", listC);
        HttpSession session = request.getSession();
        
       switch (mode) {
            case "view" -> target="View/UserView/Cart.jsp";
            case "add" -> {
                String addQuantity = request.getParameter("quantity");
                int quantity = Integer.parseInt(addQuantity);
                if (quantity <=0){
                    quantity = 1;
                }
                Product p = ProductDAO.getProductById(pid);
                if (session.getAttribute("cart") == null) {
                    Cart cart = new Cart();
                    List<Item> list = new ArrayList<Item>();
                    Item item = new Item();
                    item.setProduct(p);
                    item.setQuantity(quantity);
                    item.setPrice(p.getPrice());
                    list.add(item);
                    cart.setItems(list);
                    session.setAttribute("cart", cart);
                } else {
                    Cart cart = (Cart) session.getAttribute("cart");
                    List<Item> list = cart.getItems();
                    boolean check = false;
                    for (Item i : list) {
                        if (i.getProduct().getID().equalsIgnoreCase(p.getID())) {
                            i.setQuantity(i.getQuantity() + quantity);
                            check = true;
                        }
                    }
                    if (check == false) {
                        Item item = new Item();
                        item.setProduct(p);
                        item.setPrice(p.getPrice());
                        item.setQuantity(quantity);
                        list.add(item);
                    }
                    session.setAttribute("cart", cart);
                }
            }
            case "remove" ->  {
                Cart cart = (Cart) session.getAttribute("cart");
                cart.removeItem(pid);
                session.setAttribute("cart", cart);
            }
            case "update" -> {
                Cart cart = (Cart) session.getAttribute("cart");
                List<Item> list = cart.getItems();
                String updateQuantity = request.getParameter("quantity");
                int quantity = Integer.parseInt(updateQuantity) ; 
                for (Item i : list){
                    if (i.getProduct().getID().equals(pid)){
                        i.setQuantity(i.getQuantity()+quantity);
                        if (i.getQuantity()== 0){
                            cart.removeItem(pid);
                        }
                        break;
                    }
                }
                session.setAttribute("cart", cart);
            }
             case "buy" -> {
                Cart cart = (Cart) session.getAttribute("cart");
                Person customer = (Person) session.getAttribute("account");
                
                if (customer==null){
                    String mess = "You need to login to your account to make an order";
                    request.setAttribute("mess", mess);
                    target="NavigateServlet?mode=login";
                } else {
                    
                    String method = request.getParameter("method");
                    String customer_id = customer.getId();
                    LocalDate date = java.time.LocalDate.now();
                    
                    OrderDAO orderDAO = new OrderDAO();
                    int newID = orderDAO.createOrder(customer_id, cart, date, method);
                    if (newID != 0){
                        orderDAO.createOderDetail(newID, cart);
                        session.removeAttribute("cart");
                    } else {
                        
                    }
                }
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
