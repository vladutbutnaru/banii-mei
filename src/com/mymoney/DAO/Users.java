package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.User;

public class Users {
	User user = new User();
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;

	public User getUserByEmail(String email) {
		try {
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + email +"';");
		    while(rs.next()) {

		       user.setFirstName(rs.getString("FirstName"));
		       user.setLastName(rs.getString("LastName"));

		        // etc.
		    }
		    System.out.println("SELECT * FROM users WHERE email = '" + user.getEmail() +"';");
System.out.println(user.getFirstName());
		  
		}
		catch (SQLException ex){
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		return user;
	}
}
