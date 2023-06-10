/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.DBContext;
//import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Booking;
import model.User;

/**
 *
 * @author admin
 */
public class UserDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // login
    public User checkAccountValid(String user, String pass) {
        String query = "select *from Account where UserName = ? and Pass =?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public User checkAccountExist(String user) {
        String query = "select * from Account where UserName = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // them account moi (register)
    public User addAccount(String UserName, String Pass, String FullName, String Gender, String City, String Email, String Phone) {
        String query = "insert into Account(UserName,Pass,FullName,Gender,City,Email,Phone,IDRole) values(?,?,?,?,?,?,?,'1')";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, UserName);
            ps.setString(2, Pass);
            ps.setString(3, FullName);
            ps.setString(4, Gender);
            ps.setString(5, City);
            ps.setString(6, Email);
            ps.setString(7, Phone);

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }

    // chinh sua thong tin account (Update)
    public void updateAccount(String IDAccount, String UserName, String Pass, String FullName, String Gender, String City, String Email, String Phone) {
        String query = "update Account set UserName=?, Pass=?, FullName=?, Gender=?, City=? , Email=?, Phone=?  where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, UserName);
            ps.setString(2, Pass);
            ps.setString(3, FullName);
            ps.setString(4, Gender);
            ps.setString(5, City);
            ps.setString(6, Email);
            ps.setString(7, Phone);
            ps.setString(8, IDAccount);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // them booking moi (booking)
    public Booking addBooking(String IDAccount, String IDDiscount, String IDRoomType, String Adult, String Child, String CheckIn, String CheckOut, String NumberOfRoom, String TotalPrice, String BookingTime, String Note) {
        String query = "insert into Booking(IDAccount,IDDiscount,IDRoomType,Adult,Child,Checkin,Checkout,NumberOfRooms,TotalPrice,BookingTime,Note) values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            ps.setString(2, IDDiscount);
            ps.setString(3, IDRoomType);
            ps.setString(4, Adult);
            ps.setString(5, Child);
            ps.setString(6, CheckIn);
            ps.setString(7, CheckOut);
            ps.setString(8, NumberOfRoom);
            ps.setString(9, TotalPrice);
            ps.setString(10, BookingTime);
            ps.setString(11, Note);

            ps.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }
    
// chinh sua thong tin account (Update)
    public void updateBooking(String IDBooking, String Adult, String Child, String CheckIn, String CheckOut, String NumberOfRoom, String Note) {
        String query = "update Booking set Adult=?, Child=?, CheckIn=?, CheckOut=?, NumberOfRoom=? , Note=? where IDBooking = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, Adult);
            ps.setString(2, Child);
            ps.setString(3, CheckIn);
            ps.setString(4, CheckOut);
            ps.setString(5, NumberOfRoom);
            ps.setString(6, Note);
            ps.setString(7, IDBooking);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public boolean isRoomAvailable(int IDRoomType, Date CheckIn, Date CheckOut) {
        try (Connection conn = DBContext.getConnection()) {
            // Get the total number of rooms available for the specified room type
            String sql = "SELECT TotalRoom FROM NameRoomType WHERE IDRoomType = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, IDRoomType);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int totalRooms = rs.getInt("TotalRoom");

                        // Check if there are any overlapping reservations for the specified room type and date range
                        sql = "SELECT COUNT(*) FROM reservations WHERE IDRoomType = ? " +
                                "AND CheckIn < ? AND CheckOut > ?";
                        try (PreparedStatement stmt2 = conn.prepareStatement(sql)) {
                            stmt2.setInt(1, IDRoomType);
                            stmt2.setDate(2, new java.sql.Date(CheckOut.getTime()));
                            stmt2.setDate(3, new java.sql.Date(CheckIn.getTime()));
                            try (ResultSet rs2 = stmt2.executeQuery()) {
                                if (rs2.next()) {
                                    int reservedRooms = rs2.getInt(1);
                                    int availableRooms = totalRooms - reservedRooms;
                                    return availableRooms > 0; // Room is available if there are available rooms left
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return false in case of any error or exception
    }
}
