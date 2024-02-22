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
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AccountServlet", urlPatterns = {"/AccountServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AccountServlet extends HttpServlet {

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
        String target = "StartServlet";
        String mode = request.getParameter("mode");
        
        AccountDAO accountDAO = new AccountDAO();
        
        switch (mode) {
            case "signup" ->                {
                String email = request.getParameter("email");
                String password = request.getParameter("pass");
                String password_repeat = request.getParameter("passRepeat");
                if (!password.equals(password_repeat)){
                    request.setAttribute("mess", "Passwords do not match! Please try again");
                    target = "View/UserView/SignUp.jsp";
                } else {
                    
                    if (accountDAO.checkAccountExist(email, 0,0)){
                        request.setAttribute("mess", "Email has been registered");
                        target="View/UserView/SignUp.jsp";
                    } else {
                        accountDAO.signUpAccount(email, password);
                        request.setAttribute("mess1", "Sign up successfully! Let's login to your new account!");
                        target ="View/UserView/Login.jsp";
                    }
                }
            }
            
            case "login" ->                 {   
                    String email = request.getParameter("email");
                    String password = request.getParameter("pass");
                    Account a = accountDAO.login(email, password);
                    if (a==null){
                        request.setAttribute("mess", "Wrong Email or Password");
                        target = "View/UserView/Login.jsp";
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("account", a);
                        target ="StartServlet";
                    }
                }
            case "logout" ->                 {
                    HttpSession session = request.getSession();
                    session.removeAttribute("account");
                    target = "StartServlet";
                }
            case "editCusProfile" ->                 {
                    String id = request.getParameter("customer_id");
                    String name = request.getParameter("customer_name");
                    String gender = request.getParameter("flexRadioDefault");
                    String phone = request.getParameter("customer_phone");
                    String address = request.getParameter("customer_address");
                    String email = request.getParameter("customer_email");
                    HttpSession session = request.getSession();
                    accountDAO.editAccount(id, name, gender, phone, address, email);
                    Person account = (Person) session.getAttribute("account");
                    if ( account == null || account.getIsAdmin()!=1) {
                        Person customer = accountDAO.getAccountById(id);
                        session.setAttribute("account", customer);
                        target = "View/UserView/Profile.jsp";
                    } else {
                       target = "AdminServlet?mode=profile&id="+id;
                    }
                    
                }
            
            case "editStaffProfile" ->                 {
                    String id = request.getParameter("customer_id");
                    String name = request.getParameter("customer_name");
                    String gender = request.getParameter("flexRadioDefault");
                    String phone = request.getParameter("customer_phone");
                    String address = request.getParameter("customer_address");
                    String email = request.getParameter("customer_email");
                    String from = request.getParameter("from");
                    accountDAO.editAccount(id, name, gender, phone, address, email);
                    if (from.equalsIgnoreCase("profile")){
                        HttpSession session = request.getSession();
                        Person staff = accountDAO.getStaffById(id);
                        session.setAttribute("account", staff);
                        target = "AdminServlet?mode=personalProfile";
                    } else {
                        target = "AdminServlet?mode=profile&id="+id;
                    }
                }
            
            case "editAvatar" ->                 {
                    String id = request.getParameter("customer_id");
                    Part imgFilePart = request.getPart("customer_img");
                    String image = id.replaceAll(" ", "");
                    imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\CustomerAvatar\\" + image + ".jpg");
                    accountDAO.editAvatar(id, image);
                    Person account = accountDAO.getAccountById(id);
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);
                    target = "NavigateServlet?mode=profile";
                }
            case "staffImage" ->                 {
                    String id = request.getParameter("id");
                    Part imgFilePart = request.getPart("image");
                    String image = id.replaceAll(" ", "");
                    imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\images\\StaffAvatar\\" + image + ".jpg");
                    accountDAO.editAvatar(id, image);
                    Person account = accountDAO.getStaffById(id);
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);
                    target = "AdminServlet?mode=personalProfile";
                }
            case "staffLogin" ->
                {
                    target = "View/AdminView/StaffLogin.jsp";
                }
            case "staffLoginCheck" ->
                {
                    String email = request.getParameter("email");
                    String password = request.getParameter("pass");
                    Person a = accountDAO.staffLogin(email, password);
                    if (a==null){
                        request.setAttribute("mess", "Wrong Email or Password");
                        target = "View/AdminView/StaffLogin.jsp";
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("account", a);
                        target = "AdminStartServlet";
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
