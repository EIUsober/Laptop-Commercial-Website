/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import configPkg.ConfigInfo;
import dao.*;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.Person;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author tanle
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AdminServlet extends HttpServlet {

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
        String target = "";
        String mode = request.getParameter("mode");
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();
        if (session.getAttribute("account")!=null){
            switch (mode) {
                case "logout" ->                {
                    //HttpSession session = request.getSession();
                    session.removeAttribute("account");
                    target="AdminStartServlet";
                }
                case "customerAccount" ->                {
                    target = "View/AdminView/ManagerAccount.jsp";
                    ArrayList<Person> listPerson = accountDAO.getAllCustomerAccount();
                    int active = 3;
                    String title = "CUSTOMER";
                    request.setAttribute("title", title);
                    request.setAttribute("active", active);
                    request.setAttribute("listAccount", listPerson);
                }
                case "profile" ->                {
                    target = "View/AdminView/Account.jsp";
                    String id = request.getParameter("id");
                    int active = 3;
                    OrderDAO orderDAO = new OrderDAO();
                    if (id.contains("C")){
                        ArrayList<Order> orderList = orderDAO.getOrderByCusId(id);
                        Person customer = accountDAO.getAccountById(id);
                        request.setAttribute("account", customer);
                        request.setAttribute("orederList", orderList);
                    } else {
                        ArrayList<Order> orderList = orderDAO.getOrderByStaffId(id);
                        Person staff = accountDAO.getStaffById(id);
                        request.setAttribute("account", staff);
                        request.setAttribute("orederList", orderList);
                    }
                    request.setAttribute("active", active);

                }
                case "personalProfile" ->{
                    target = "View/AdminView/Profile.jsp";
                    int active = 5;
                    Person person = (Person) session.getAttribute("account");
                    String id = person.getId();
                    OrderDAO orderDAO = new OrderDAO();
                    request.setAttribute("active", active);
                    ArrayList<Order> orderList = orderDAO.getOrderByStaffId(id);
                    request.setAttribute("orederList", orderList);
                }
                case "staffAccount" ->                {
                    target = "View/AdminView/ManagerAccount.jsp";
                    ArrayList<Person> listPerson = accountDAO.getAllStaffAccount();
                    int active = 3;
                    String title = "STAFF";
                    request.setAttribute("title", title);
                    request.setAttribute("active", active);
                    request.setAttribute("listAccount", listPerson);
                }
                case "ceateAccount" ->                {
                    int active = 3;
                    request.setAttribute("active", active);
                    target = "View/AdminView/CreateNewAccount.jsp";

                }
                case "search" ->                {
                    int active = 2;
                    int nav=1;
                    String search = request.getParameter("text");
                    ProductDAO productDAO = new ProductDAO();
                    ArrayList<Product> listP = productDAO.searchByName(search);
                    ArrayList<Category> listC = productDAO.getAllCategory();
                    request.setAttribute("active", active);
                    request.setAttribute("nav", nav);
                    request.setAttribute("listP", listP);
                    request.setAttribute("listC", listC);
                    target = "View/AdminView/ManagerProduct.jsp";
                }
                case "createConfirm" ->                {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String pass = request.getParameter("pass");
                    String pass_repeat = request.getParameter("confirmPass");
                    String gender = request.getParameter("gender");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");
                    String role = request.getParameter("role");
                    Part imgFilePart = request.getPart("image");
                    String image = name.replaceAll(" ", "");

                    int isStaff = 0;
                    int isAdmin =0;
                    if (!pass.equals(pass_repeat)){
                        request.setAttribute("mess", "Passwords do not match! Please try again");
                        target = "View/AdminView/CreateNewAccount.jsp";
                    } else {
                        if (role.equalsIgnoreCase("Admin")){
                            isAdmin=1;
                            isStaff=1;
                            if(accountDAO.checkAccountExist(email, isStaff, isAdmin)) {
                                request.setAttribute("mess", "Email has been registered");
                                target="View/AdminView/CreateNewAccount.jsp";
                            } else {
                                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\StaffAvatar\\" + image + ".jpg");
                                accountDAO.adminCreateStaffAccount(email, pass, isAdmin, isStaff, name, image, gender, phone, address);
                                target="AdminServlet?mode=staffAccount";
                            }
                        } else if (role.equalsIgnoreCase("Staff")){
                            isStaff=1;
                            if(accountDAO.checkAccountExist(email, isStaff, isAdmin)) {
                                request.setAttribute("mess", "Email has been registered");
                                target="View/AdminView/CreateNewAccount.jsp";
                            } else {
                                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\StaffAvatar\\" + image + ".jpg");
                                accountDAO.adminCreateStaffAccount(email, pass, isAdmin, isStaff, name, image, gender, phone, address);
                                target="AdminServlet?mode=staffAccount";
                            }
                        } else {
                            if(accountDAO.checkAccountExist(email, isStaff, isAdmin)) {
                                request.setAttribute("mess", "Email has been registered");
                                target="View/AdminView/CreateNewAccount.jsp";
                            } else {
                                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\CustomerAvatar\\" + image + ".jpg");
                                accountDAO.adminCreateCustomerAccount(email, pass, name, image, gender, phone, address);
                                target="AdminServlet?mode=customerAccount";
                            }
                        }
                    }  
                }
                case "orderAll" ->              {
                    int active = 1;
                    int nav=1;
                    OrderDAO orderDAO = new OrderDAO();

                    ArrayList<Order> listOrder = orderDAO.getAllOrder();

                    request.setAttribute("listO", listOrder);
                    request.setAttribute("active", active);
                    request.setAttribute("nav", nav);
                    target = "View/AdminView/ManagerOrder.jsp";

                }
                case "orderUnconfirmed" ->                {
                    int active = 1;
                    int nav=2;
                    OrderDAO orderDAO = new OrderDAO();

                    ArrayList<Order> listOrder = orderDAO.getOrderByStatus("unconfirmed");

                    request.setAttribute("listO", listOrder);
                    request.setAttribute("active", active);
                    request.setAttribute("nav", nav);
                    target = "View/AdminView/ManagerOrder.jsp";

                }
                case "orderConfirmed" ->                {
                    int active = 1;
                    int nav=3;
                    OrderDAO orderDAO = new OrderDAO();

                    ArrayList<Order> listOrder = orderDAO.getOrderByStatus("confirmed");

                    request.setAttribute("listO", listOrder);
                    request.setAttribute("active", active);
                    request.setAttribute("nav", nav);
                    target = "View/AdminView/ManagerOrder.jsp";

                }
                case "orderDelivering" ->                {
                    int active = 1;
                    int nav=4;
                    OrderDAO orderDAO = new OrderDAO();

                    ArrayList<Order> listOrder = orderDAO.getOrderByStatus("delivering");

                    request.setAttribute("listO", listOrder);
                    request.setAttribute("active", active);
                    request.setAttribute("nav", nav);
                    target = "View/AdminView/ManagerOrder.jsp";

                }
                case "orderComplete" ->                {
                    int active = 1;
                    int nav=5;
                    OrderDAO orderDAO = new OrderDAO();

                    ArrayList<Order> listOrder = orderDAO.getOrderByStatus("complete");

                    request.setAttribute("listO", listOrder);
                    request.setAttribute("active", active);
                    request.setAttribute("nav", nav);
                    target = "View/AdminView/ManagerOrder.jsp";

                }

                case "confirmOrder" ->                {
                    String orderId = request.getParameter("id");
                    String status = request.getParameter("status");
                    //HttpSession session = request.getSession();
                    OrderDAO orderDAO = new OrderDAO();

                    if (status.equalsIgnoreCase("unconfirmed")){
                        Person p  = (Person) session.getAttribute("account");
                        String sellerId = p.getId();
                        orderDAO.confirmOrder(orderId, sellerId);
                        target = "AdminServlet?mode=orderUnconfirmed";
                    } else {
                        String newStatus = "";
                        if (status.equalsIgnoreCase("confirmed")){
                            newStatus = "delivering";
                            target = "AdminServlet?mode=orderConfirmed";
                        } else if (status.equalsIgnoreCase("delivering")){
                             newStatus = "complete";
                             target = "AdminServlet?mode=orderDelivering";
                        }
                        orderDAO.updateOrderStatus(orderId, newStatus);
                    }
                }
                
                case "orderDetail" ->                {
                    int active = 1;
                    String orderId = request.getParameter("oID");
                    String customerId = request.getParameter("cID");
                    OrderDAO orderDAO = new OrderDAO();
                    Order order = orderDAO.getOrderDetail(orderId, customerId);
                    //orderDAO.getOrderDetail(id);
                    
                    request.setAttribute("order", order);
                    request.setAttribute("active", active);
                    target = "View/AdminView/OrderDetail.jsp";

                }
                
                case "updateStatus" ->                {
                    String orderId = request.getParameter("order_id");
                    String status = request.getParameter("status");
                    String sellerId = request.getParameter("seller");
                    OrderDAO orderDAO = new OrderDAO();
                    
                    if(sellerId==null || sellerId.equals("")){
                        Person p = (Person) session.getAttribute("account");
                        String staffId = p.getId();
                        orderDAO.confirmOrder(orderId, staffId);
                    }
                    orderDAO.updateOrderStatus(orderId, status);
                    //orderDAO.getOrderDetail(id);
                    
                    if (status.equalsIgnoreCase("unconfirmed")){
                        target = "AdminServlet?mode=orderUnconfirmed";
                    } else if (status.equalsIgnoreCase("confirmed")){
                        target = "AdminServlet?mode=orderConfirmed";
                    } else if (status.equalsIgnoreCase("delivering")){
                        target = "AdminServlet?mode=orderDelivering";
                    } else {
                        target = "AdminServlet?mode=orderComplete";
                    }
                }
                
                case "deleteAccount" ->                {
                    int active = 3;
                    String id = request.getParameter("id");
                    request.setAttribute("active", active);
                    if (id.contains("C")){
                        accountDAO.deleteCustomer(id);
                        target = "AdminServlet?mode=customerAccount";
                    } else {
                        accountDAO.deleteStaff(id);
                        target = "AdminServlet?mode=staffAccount";
                    }
                }
                case "storeManage" ->                {
                    int active = 4;
                    request.setAttribute("active", active);
                    String month = request.getParameter("month");
                    OrderDAO orderDAO = new OrderDAO();
                    if (month == null){
                        LocalDate date = java.time.LocalDate.now();
                        month = date.getYear()+"-"+date.getMonthValue();
                        
                    }
                    request.setAttribute("month", month);
                    ArrayList<Order> orderList = orderDAO.getOrdersByMonth(month);
                    double total= 0;
                    for (Order o : orderList){
                        if(o.getOrderStatus().equalsIgnoreCase("unconfirmed")){
                            continue;
                        } else {
                            total += Math.round(o.getOrderPrice());
                        }
                    }
                    String revenue = withLargeIntegers(total);
                    request.setAttribute("revenue", revenue);
                    request.setAttribute("listO", orderList);
                    target = "View/AdminView/ManagerHomepage.jsp";
                }
                case "productManage" -> {
                    ProductDAO productDAO = new ProductDAO();
                    List<Product> list = productDAO.getAllProduct();
                    ArrayList<Category> listC = productDAO.getAllCategory();
                    int active =2;
                    int nav=1;
                    request.setAttribute("nav", nav);
                    request.setAttribute("active", active);
                    request.setAttribute("listP", list);
                    request.setAttribute("listC", listC);
                    target = "View/AdminView/ManagerProduct.jsp";
                }
                case "disableProduct" -> {
                    ProductDAO productDAO = new ProductDAO();
                    List<Product> list = productDAO.getDisabledProducts();
                    ArrayList<Category> listC = productDAO.getAllCategory();
                    int active =2;
                    int nav=2;
                    request.setAttribute("nav", nav);
                    request.setAttribute("active", active);
                    request.setAttribute("listP", list);
                    request.setAttribute("listC", listC);
                    target = "View/AdminView/ManagerProduct.jsp";
                }
                case "newCat" ->                {
                    String newCatName = request.getParameter("cat_name");
                    ProductDAO productDAO = new ProductDAO();
                    productDAO.addNewCat(newCatName);
                    target = "AdminServlet?mode=productManage";
                }
                case "deleteCat" ->                {
                    String cat_id = request.getParameter("catID");
                    ProductDAO productDAO = new ProductDAO();
                    productDAO.deleteCat(cat_id);
                    target = "AdminServlet?mode=productManage";
                }
            }
        } else {
            target="AdminStartServlet";
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(target);
        requestDispatcher.forward(request, response);
    }
    public static String withLargeIntegers(double value) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(value);
    }
//    public static void main(String[] args) {
//        LocalDate date = java.time.LocalDate.now();
//        String months = date.getYear()+"-"+date.getMonthValue();
//        System.out.println(months);
//    }
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
