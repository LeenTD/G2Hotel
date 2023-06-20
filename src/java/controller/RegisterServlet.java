/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author admin
 */
public class RegisterServlet extends HttpServlet {

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
        String fName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String passCon = request.getParameter("confirm_password");
        String idrole = request.getParameter("idrole");
        UserDao dao = new UserDao();
        User acc = dao.checkAccountExist(user);
        if (acc != null) {
            request.setAttribute("mess", "Username is exist!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            if (!pass.equals(passCon)) {
                request.setAttribute("mess", "Password not match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                dao.addAccount(user, pass, fName, gender, city, email, phone,idrole);
                request.setAttribute("loginFail", "Register success!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

//        if (!pass.equals(passCon)) {
//            request.setAttribute("mess", "Password not match!");
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//        } else {
//            if (acc == null) {
//                dao.addUser(user, pass, fName, gender, city, email, phone);
//                request.setAttribute("loginFail", "Register success!");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            } else {
//
//            }
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
