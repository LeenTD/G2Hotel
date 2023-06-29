/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

/**
 *
 * @author ACER
 */
public class DBConfig {

    protected static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    protected static String serverName = "HAIDANGDB";
    protected static String databaseName = "G2HotelV2";
    protected static String port = "1433";
    protected static String user = "sa";
    protected static String password = "hdangtran";
    protected static String url = "jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName + ";encrypt=true;trustServerCertificate=true;";
}
