package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.User;

public class Users {
	User user = new User();
	Logger l = Logger.getLogger(Users.class.getName());
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
		       user.setCity(rs.getString("City"));
		       user.setId(rs.getInt("ID"));
		       user.setProfileImagePath(rs.getString("ProfileImagePath"));

		        // etc.
		    }
		    l.info("FOund user with name " + user.getFirstName() + " " + user.getLastName());
		  
		}
		catch (SQLException ex){
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		    l.severe(ex.getMessage());
		}
		
		return user;
	}
	public boolean checkIfUserExists(String email){
try {
			
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + email +"';");
		    if(rs.next()) {
return true;

		        // etc.
		    }
		    l.info("FOund user with name " + user.getFirstName() + " " + user.getLastName());
		  
		}
		catch (SQLException ex){
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		    l.severe(ex.getMessage());
		}
return false;
		
		
		
	}
}
