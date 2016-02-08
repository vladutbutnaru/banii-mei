package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.Location;
import com.mymoney.entities.Transaction;
import com.mymoney.entities.User;

public class Locations {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	Location location = new Location();
	public ArrayList<Location> getLocations(User user){
		ArrayList<Location> locations = new ArrayList<Location>();
		try {
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery("SELECT * FROM locations WHERE LocationCity = '"+ user.getCity() + "'" + " ORDER BY LocationName ASC;");
			while (rs.next()) {
				location = new Location();
				location.setID(rs.getInt("id"));
				location.setLocationCity(rs.getString("LocationCity"));
				location.setLocationDescription(rs.getString("LocationDescription"));
				location.setLocationName(rs.getString("LocationName"));
				
				
				// etc.
				locations.add(location);
				
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM locations WHERE LocationCity <> '"+user.getCity() + "'" + " ORDER BY LocationName ASC;");
			while (rs.next()) {
				location = new Location();
				location.setID(rs.getInt("id"));
				location.setLocationCity(rs.getString("LocationCity"));
				location.setLocationDescription(rs.getString("LocationDescription"));
				location.setLocationName(rs.getString("LocationName"));
				
				// etc.
				locations.add(location);
				
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		return locations;
	}
	
	public void insertLocation(Location location){
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO locations(LocationName,LocationDescription,LocationCity)"			
					+ " VALUES ( ";
			
			query+="'"+location.getLocationName()+"',";
			
			query+="'"+location.getLocationDescription()+"',";
			query+="'"+location.getLocationCity()+"'";
			query+=");";
		
			stmt.executeUpdate(query);
			

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		
		
		
	}
	public Location getLocationForTransaction(Transaction transaction){
		Location location = new Location();
		try {
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery("SELECT * FROM locations WHERE id = '"+ transaction.getLocationID() + "'" + " ORDER BY LocationName ASC;");
			while (rs.next()) {
				location = new Location();
				location.setID(rs.getInt("id"));
				location.setLocationCity(rs.getString("LocationCity"));
				location.setLocationDescription(rs.getString("LocationDescription"));
				location.setLocationName(rs.getString("LocationName"));
				
				
				// etc.
				
				
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			
		}
		return location;
	}
}
