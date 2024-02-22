/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import static control.AdminServlet.withLargeIntegers;
import dao.OrderDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Order;
import entity.Person;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "AdminStartServlet", urlPatterns = {"/AdminStartServlet"})
public class AdminStartServlet extends HttpServlet {

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
//        HttpSession session = request.getSession();
//        Person account = (Person)session.getAttribute("account");
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            int active = 4;
            request.setAttribute("active", active);
            String month = request.getParameter("month");
            OrderDAO orderDAO = new OrderDAO();
            if (month == null) {
                LocalDate date = java.time.LocalDate.now();
                month = date.getYear() + "-" + date.getMonthValue();

            }
            request.setAttribute("month", month);
            ArrayList<Order> orderList = orderDAO.getOrdersByMonth(month);
            double total = 0;
            for (Order o : orderList) {
                if (o.getOrderStatus().equalsIgnoreCase("unconfirmed")) {
                    continue;
                } else {
                    total += Math.round(o.getOrderPrice());
                }
            }
            String revenue = withLargeIntegers(total);
            request.setAttribute("revenue", revenue);
            request.setAttribute("listO", orderList);
            request.getRequestDispatcher("View/AdminView/ManagerHomepage.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("View/AdminView/StaffLogin.jsp").forward(request, response);
        }

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
