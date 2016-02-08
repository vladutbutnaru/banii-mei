package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mymoney.entities.DBConnection;

public class ViewDocumentations {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	public void addView(){
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO docummentationviews(view)"			
					+ " VALUES ('View'); ";
			
		
		
			stmt.executeUpdate(query);
			

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		
		
	}
}
