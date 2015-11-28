package com.mymoney.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnection {
	Connection conn = null;
	
	public Connection getConnection(){
			try {
		    conn =
		        DriverManager.getConnection("jdbc:mysql://localhost/mymoney?" +
		                                   "user=root&password=");
		 
		} catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
		return conn;		
	}
}
