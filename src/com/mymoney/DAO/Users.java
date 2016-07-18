package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		       user.setCity(rs.getInt("City"));
		       user.setId(rs.getInt("ID"));
		       user.setEmail(email);
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
	public User checkNewUsers(){
	
	try {
		 user = new User();
			Date d =new Date();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT * FROM users;");
		    while(rs.next()) {
		    	
		       user.setFirstName(rs.getString("FirstName"));
		       user.setLastName(rs.getString("LastName"));
		       user.setCity(rs.getInt("City"));
		       user.setDateRegistered(rs.getDate("DateRegistered"));
		   	Date date = new Date();
		
			long seconds = (date.getTime()-user.getDateRegistered().getTime())/1000;
			System.out.println(seconds);
			if(seconds<10){
				return user;
				
			}
		    }
		    l.info("Found user with name " + user.getFirstName() + " " + user.getLastName());
		  
		}
		catch (SQLException ex){
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		    l.severe(ex.getMessage());
		}
		
		return new User();
		
		
		
	}
}
