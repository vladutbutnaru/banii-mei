package com.mymoney.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnection {
	Connection conn = null;
	
	public Connection getConnection(){
		  try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			try {
			    System.out.println("SALUT");
		    conn =
		        DriverManager.getConnection("jdbc:mysql://localhost:3306/BaniiMei?" +
		                                   "user=root&password=admin");
		
		 
		} catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
		return conn;		
	}
}
