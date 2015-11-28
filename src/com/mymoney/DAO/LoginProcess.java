package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.User;

public class LoginProcess {
	
public boolean doLogin(User user){
	boolean loginOk = false;
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	try {
	    stmt = conn.createStatement();
	    rs = stmt.executeQuery("SELECT * FROM users WHERE email = '" + user.getEmail() + "' AND password = '"+user.getPassword()+"';");
	    if(rs.first()){
	    	loginOk=true;	    	
	    }

	  
	}
	catch (SQLException ex){
	    // handle any errors
	    System.out.println("SQLException: " + ex.getMessage());
	    System.out.println("SQLState: " + ex.getSQLState());
	    System.out.println("VendorError: " + ex.getErrorCode());
	}
	return loginOk;
	
	
	
}
}
