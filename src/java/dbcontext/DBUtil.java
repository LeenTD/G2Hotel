/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBUtil{
    private static DBUtil instance;

    public DBUtil() {
    }
    
    public static Connection getConnection() throws Exception{
        Class.forName(DBConfig.driverName);
        Connection con = (Connection) DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
        return con;
    }
    
    public static DBUtil getInstance(){
        if(instance == null){
            instance = new DBUtil();
        }
        return instance;
    }
    
    public static void closeConnection(Connection connection) throws  SQLException{
        if(connection!=null){
            connection.close ();
        }
        
    }
}