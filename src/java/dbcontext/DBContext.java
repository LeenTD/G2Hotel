/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

import dao.ManagerDao;
import dao.UserDao;
import model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author admin
 */
public class DBContext {
    public static Connection getConnection() {
        Connection connection = null;
        /**
         * @param connectionString can sometime be called as URL
         */
        try {
            Class.forName(DBConfig.driverName);
            connection = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
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

    
//    public static void main(String[] args) {
//        DBContext db = new DBContext();
//        try {
//            System.out.println(DBContext.getConnection());
//        } catch (Exception e) {
//        }
//        UserDao ud = new UserDao();
//                List<CheckRoomValid> l = ud.checkRoomValid("2023-06-14", "2023-06-20");
//                System.out.println("sfs" + l.toString());

//        ManagerDao m = new ManagerDao();
//        List<User> l = new ArrayList<>();
//        l = m.getAccounts();
//        for (User user : l) {
//             l.toString();
//        }
//    }
    
    
//    public static void main(String[] args){
//        System.out.println(DBContext.getConnection());
//        
//    }

}