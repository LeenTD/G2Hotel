/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class BookingRoomServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        //TIM CACH KHAC
        response.setContentType("text/html");
        //bookingtime
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedTime = currentTime.format(formatter);

        String IDAccount = request.getParameter("IDAccount");
        String IDRoomType = request.getParameter("IDRoomType");

        String adult = request.getParameter("Adult");
        String child = request.getParameter("Child");

        // get total day
        String checkInDateStr = request.getParameter("checkInDate");
        String checkOutDateStr = request.getParameter("checkOutDate");
        LocalDate checkInDate = LocalDate.parse(checkInDateStr);
        LocalDate checkOutDate = LocalDate.parse(checkOutDateStr);
        int numOfDays = (int) ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        
        String price = request.getParameter("Price");
        int p = Integer.parseInt(price);
        
        String nRooms = request.getParameter("numRooms");
        int numRooms = Integer.parseInt(nRooms);
        
        int tprice = numOfDays * numRooms * p;
        String TotalPrice = String.valueOf(tprice);

        String IDDiscount = "";
        String Note = "";

        UserDao udao = new UserDao();

        udao.addBooking(IDAccount, IDDiscount, IDRoomType, adult, child, checkInDateStr, checkOutDateStr, nRooms, TotalPrice, formattedTime, Note);

        request.setAttribute("booksuccess", "Booking Success");
//                request.getRequestDispatcher("showBooking").forward(request, response);

        request.getRequestDispatcher("customer_room.jsp").forward(request, response);

        // CAI NAY OK ROI
//        response.setContentType("text/html");
//        //bookingtime
//        LocalDateTime currentTime = LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//        String formattedTime = currentTime.format(formatter);
//
//        String IDAccount = request.getParameter("IDAccount");
//        
//        String IDRoomType = request.getParameter("IDRoomType");
//
//        String adult = request.getParameter("Adult");
//
//        String child = request.getParameter("Child");
//
//        // get total day
//        String CheckIn = request.getParameter("checkInDate");
//        String CheckOut = request.getParameter("checkOutDate");
//
//        String numberOfRoom = request.getParameter("numRooms");
//
//        //price
//        String TotalPrice = request.getParameter("totalPrice");
//
//        String IDDiscount = "";
//        String Note = "";
//
//        UserDao udao = new UserDao();
//
//        udao.addBooking(IDAccount, IDDiscount, IDRoomType, adult, child, CheckIn, CheckOut, numberOfRoom, TotalPrice, formattedTime, Note);
//
//        request.setAttribute("booksuccess", "Booking Success");
//        request.getRequestDispatcher("customer_room.jsp").forward(request, response);
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
