/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author KiroHikaru
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Hello world!
 *
 */
public class App {
    static String query1 = ""
            + "SELECT * FROM laptop_store.cpu\n" 
            + "LEFT JOIN laptop_store.cpumodel ON laptop_store.cpu.cpu_model = laptop_store.cpumodel.cpu_model\n" 
            + "UNION\n" 
            + "SELECT * FROM laptop_store.cpu\n" 
            + "RIGHT JOIN laptop_store.cpumodel ON laptop_store.cpu.cpu_model = laptop_store.cpumodel.cpu_model";

    public static void main(String[] args) {
        System.out.println("Hello World");
	try{      
	    Class.forName("com.mysql.cj.jdbc.Driver");  
	    Connection con = DriverManager.getConnection(  
		    "jdbc:mysql://localhost:3306/laptop_store","root","tomnisa123");  	    

	    Statement statement = con.createStatement();  

	    System.out.println("Executing SQL...");

	    ResultSet rs = statement.executeQuery(query1);  

	    System.out.println("Result");

	    while(rs.next()) {
		System.out.println(rs.getString(1) + "  "
				+ rs.getString(2) + "  " 
				+ rs.getString(4) + "  " 
                                + rs.getString(5) + "  " 
                                + rs.getString(6) + "  "
                                + rs.getString(7) + "  "
                                + rs.getString(8) + "  "
                                + rs.getString(9) + "  "
                                + rs.getString(10) + "  " );  	
	    }
	    System.out.println();
	    con.close();  
	} catch(Exception e){ 
	    System.out.println(e);
	}  
    }  
}



