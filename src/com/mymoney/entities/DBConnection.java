package com.mymoney.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.*;


public class DBConnection {
	Connection conn = null;
	Logger l = Logger.getLogger(DBConnection.class.getName());
	public Connection getConnection(){
		  try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			try {
		
			l.info("New Database Connection Created");
			  if(conn==null){
		    conn =
		        DriverManager.getConnection("jdbc:mysql://localhost:3306/BaniiMei?" +
		                                   "user=root&password=baniimeidev");
			  }
		 
		} catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		    l.severe("Error while creating Database Connection");
		  
		}
		return conn;		
	}
}
