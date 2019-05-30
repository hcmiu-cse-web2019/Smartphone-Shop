/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ASUS
 */
public class DBConnection {

    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/user"; //MySQL URL followed by the database name
        String username = "root"; //MySQL username
        String password = "15253511"; //MySQL password

        try {
            try {
                Class.forName("com.mysql.jdbc.Driver"); //loading MySQL drivers. This differs for database servers 
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
            System.out.println("Printing connection object " + con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
