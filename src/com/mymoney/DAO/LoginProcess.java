package com.mymoney.DAO;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.User;

@SuppressWarnings("true")
public class LoginProcess {

	Logger l = Logger.getLogger(LoginProcess.class.getName());
	
public boolean doLogin(User user){

	   
	boolean loginOk = false;
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	
	 try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	try {
	    stmt = conn.createStatement();
	    rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + user.getEmail() + "' AND password = '"+user.getPassword()+"';");
	    if(rs.first()){
	    	loginOk=true;	 
	    	l.info("Login good for user with email " + user.getEmail());
	    	int newlogins = rs.getInt("NumberOfLogins") + 1;
	    	String query = "UPDATE users SET NumberOfLogins = " + newlogins+ " WHERE ID = "+ rs.getInt("ID");
	    	stmt.executeUpdate(query);
	    }

	  
	}
	catch (SQLException ex){
	    // handle any errors
	    System.out.println("SQLException: " + ex.getMessage());
	    System.out.println("SQLState: " + ex.getSQLState());
	    System.out.println("VendorError: " + ex.getErrorCode());
	    l.severe(ex.getMessage());
	}
	return loginOk;
	
	
	
}
}
