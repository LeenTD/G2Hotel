/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.DBContext;
//import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.Discount;
import model.RoomType;
import model.User;

/**
 *
 * @author admin
 */
public class ManagerDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //ACCOUNT
    // day thong tin all account ra bang quan ly account (View)
    public List<User> getAccounts() {
        List<User> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                         rs.getString(2),
                         rs.getString(3),
                         rs.getString(4),
                         rs.getString(5),
                         rs.getString(6),
                         rs.getString(7),
                         rs.getString(8),
                         rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    // xoa account theo ID (Delete)
    public void deleteAccount(String IDAccount) {
        String query = "delete from Account where IDAccount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDAccount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


    //MANAGER BOOKING
    // day thong tin all Booking ra bang quan ly booking (View)
    public List<Booking> getBooking() {
        List<Booking> list = new ArrayList<>();
        String query = "select * from Booking";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Booking(rs.getInt(1),
                         rs.getInt(2),
                         rs.getInt(3),
                         rs.getInt(4),
                         rs.getInt(5),
                         rs.getInt(6),
                         rs.getString(7),
                         rs.getString(8),
                         rs.getInt(9),
                         rs.getDouble(10),
                         rs.getString(11),
                         rs.getString(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    // xoa account theo ID (Delete)
    public void deleteBooking(String IDBooking) {
        String query = "delete from Booking where IDBooking = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDBooking);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }


    //MANAGER ROOMTYPE
    public List<RoomType> getRoomType() {
        List<RoomType> list = new ArrayList<>();
        String query = "select * from RoomType";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new RoomType(rs.getInt(1),
                         rs.getString(2),
                         rs.getInt(3),
                         rs.getInt(4),
                         rs.getInt(5),
                         rs.getInt(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addRoomType( String NameRoomType, String MaxPerson, String NumberOfBed, String NumberOfBath,String Price, String TotalRoom, String RoomStatus, String Content) {
        String query = "insert into RoomType(NameRoomType,MaxPerson,NumberOfBed,NumberOfBath,Price, TotalRoom,RoomStatus,Content) values (?,?,?,?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, NameRoomType);
            ps.setString(2, MaxPerson);
            ps.setString(3, NumberOfBed);
            ps.setString(4, NumberOfBath);
            ps.setString(5, Price);
            ps.setString(6, TotalRoom);
            ps.setString(7, RoomStatus);
            ps.setString(8, Content);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public RoomType getRoomTypeById(String IDRoomType) {
        String query = "select * from RoomType where IDRoomType=?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDRoomType);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new RoomType(rs.getInt(1),
                         rs.getString(2),
                         rs.getInt(3),
                         rs.getInt(4),
                         rs.getInt(5),
                         rs.getInt(6),
                         rs.getInt(7),
                         rs.getString(8),
                         rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // xoa RoomType theo ID (Delete)
    public void deleteRoomType(String IDRoomType) {
        String query = "delete from RoomType where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDRoomType);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

// chinh sua thong tin RoomType (Update)
    public void updateRoomType(String IDRoomType, String NameRoomType, String MaxPerson, String NumberOfBed, String NumberOfBath,String Price, String totalRoom, String RoomStatus, String Content) {
        String query = "update RoomType set NameRoomType=?, MaxPerson=?, NumberOfBed=?, NumberOfBath=?,Price=?, TotalRoom=? ,RoomStatus=?, Content=? where IDRoomType = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, NameRoomType);
            ps.setString(2, MaxPerson);
            ps.setString(3, NumberOfBed);
            ps.setString(4, NumberOfBath);
            ps.setString(5, Price);
            ps.setString(6, totalRoom);
            ps.setString(7, RoomStatus);
            ps.setString(8, Content);
            ps.setString(9, IDRoomType);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    
    //MANAGER DISCOUNT
    public List<Discount> getDiscount() {
        List<Discount> list = new ArrayList<>();
        String query = "select * from Discount";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Discount(rs.getInt(1),
                         rs.getString(2),
                         rs.getDouble(3),
                         rs.getString(4),
                         rs.getString(5),
                         rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void addDiscount(String DiscountName, String DiscountValue, String StartDay, String EndDay, String Note) {
        String query = "insert into Discount(DiscountName,DiscountValue,StartDay,EndDay,Note) values (?,?,?,?,?)";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, DiscountName);
            ps.setString(2, DiscountValue);
            ps.setString(3, StartDay);
            ps.setString(4, EndDay);
            ps.setString(5, Note);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // xoa Discount theo ID (Delete)
    public void deleteDiscount(String IDDiscount) {
        String query = "delete from Discount where IDDiscount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, IDDiscount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

// chinh sua thong tin Discount (Update)
    public void updateDiscount(String IDDiscount, String DiscountName, String DiscountValue, String StartDay, String EndDay, String Note) {
        String query = "update Discount set DiscountName=?, DiscountValue=?, StartDay=?, EndDay=?, Note=? where IDDiscount = ?";
        try {
            conn = DBContext.getConnection();//mo ket noi
            ps = conn.prepareStatement(query);
            ps.setString(1, DiscountName);
            ps.setString(2, DiscountValue);
            ps.setString(3, StartDay);
            ps.setString(4, EndDay);
            ps.setString(5, Note);
            ps.setString(6, IDDiscount);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
