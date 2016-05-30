package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.mymoney.entities.DBConnection;

public class Subscriptions {
	Logger l = Logger.getLogger(Categories.class.getName());
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	public void addSubscription(String email){
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO prelaunch_contact(Email)"			
					+ " VALUES ( ";
			
		
			query+="'"+email+"'";
			query+=");";
		
			stmt.executeUpdate(query);
			

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		
		
	}
}
