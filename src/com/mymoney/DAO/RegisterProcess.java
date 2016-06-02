package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.User;
import com.mymoney.DAO.*;
public class RegisterProcess {
	Logger l = Logger.getLogger(RegisterProcess.class.getName());
	public boolean registerUser(User user) {
		
		DBConnection connectionFactory = new DBConnection();
		Connection conn = (Connection) connectionFactory.getConnection();
		Statement stmt = null;
	
		try {
			stmt = conn.createStatement();
			
			String query = "INSERT INTO users(FirstName,LastName,Password,DateOfBirth,Email,PhoneNumber,City,Country,"
					+ "Smoker,HasDriversLicence,HasCar,Married,IsAdmin,UserType,AgreedWithProcessingTerms,"
					+ "IsPremium,NumberOfLogins) VALUES ( ";
			
			query+="'"+user.getFirstName()+"',";
			query+="'"+user.getLastName()+"',";
			query+="'"+user.getPassword()+"',";
			query+="'"+user.getDateOfBirth()+"',";
			query+="'"+user.getEmail()+"',";
			query+="'"+user.getPhoneNumber()+"',";
			query+="'"+user.getCity()+"',";
			query+="'"+user.getCountry()+"',";
			query+=user.getSmoker() + ",";
			query+=user.getHasDriversLicence() + ",";
			query+=user.getHasCar() + ",";
			query+=user.getMarried() + ",";
			query+=user.getAdmin() + ",";
			query+=user.getUserType() + ",";
			query+=user.getAgreedWithProcessingTerms()+ ",";
			query+=user.getPremium()+ ",";
			query+=user.getNumberOfLogins()+ "";			
			query+=");";
			
			stmt.executeUpdate(query);
			l.info(query);

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			l.severe(ex.getMessage());
		}
		return true;

	}
}
