/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import entity.Category;
import entity.Product;
import dao.*;
import entity.Cart;
import entity.Order;
import entity.Person;
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
public class NavigateServlet extends HttpServlet {

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
        String target = "HomeControl";
        String mode = request.getParameter("mode");
        ProductDAO productDAO = new ProductDAO();
        
        ArrayList<Product> listProduct;
        ArrayList<Category> listC = productDAO.getAllCategory();
        request.setAttribute("listC", listC);
        
        switch (mode) {
            case "about" -> target = "View/UserView/About.jsp";
            case "why" -> target = "View/UserView/WhyUs.jsp";
            case "testimoninal" -> target = "View/UserView/Testimoninal.jsp";
            case "login" -> {
                String mess = (String) request.getAttribute("mess");
                request.setAttribute("mess", mess);
                target = "View/UserView/Login.jsp";
            }
            case "staffLogin" -> target = "View/UserView/StaffLogin.jsp";
            case"signup" -> target = "View/UserView/SignUp.jsp";
            case "admin" -> target="ManagerControl";
            case "profile" -> {
                target = "View/UserView/Profile.jsp";
                HttpSession session = request.getSession();
                Person person = (Person) session.getAttribute("account");
                OrderDAO orderDAO = new OrderDAO();
                List<Order> listO = orderDAO.getOrderByCusId(person.getId());
                request.setAttribute("listO", listO);
            }
             case "orderDetail" -> {
                String orderId = request.getParameter("oID");
                String customerId = request.getParameter("cID");
                OrderDAO orderDAO = new OrderDAO();
                Order order = orderDAO.getOrderDetail(orderId, customerId);

                request.setAttribute("order", order);
                target = "View/UserView/OrderDetailUser.jsp";

            }
            case "pay" -> {
                HttpSession session = request.getSession();
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
                        target = "View/UserView/vnpay_pay.jsp";
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
