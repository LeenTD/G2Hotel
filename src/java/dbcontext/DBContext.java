/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

//import dao.ManagerDao;
//import dao.UserDao;
//import model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import model.CheckRoomValid;
/**
 *
 * @author admin
 */
public class DBContext extends DBConfig {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(DBContext.driverName);
            connection = DriverManager.getConnection(DBContext.url, DBContext.user, DBContext.password);
            System.out.println("Connected success.");
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("ERROR");
        }
        return connection;
    }
    public static void disconnect(Connection con) throws SQLException {
        con.close();
    }


    public static void main(String[] args) {
        System.out.println(DBContext.getConnection());
    }
}
