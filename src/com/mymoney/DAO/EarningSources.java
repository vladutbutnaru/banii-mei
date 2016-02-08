package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mymoney.entities.*;
public class EarningSources {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	EarningSource earningSource;
	public ArrayList<EarningSource> getUserEarningSources(User user){
		ArrayList<EarningSource> earningSources = new ArrayList<EarningSource>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM earning_sources WHERE EarningUser = "+user.getId()+ " ORDER BY EarningName ASC;");
			while (rs.next()) {
				earningSource = new EarningSource();
				earningSource.setId(rs.getInt("ID"));
				earningSource.setEarningName(rs.getString("EarningName"));
				earningSource.setEarningDescription(rs.getString("EarningDescription"));
				earningSource.setUserID(user.getId());
				// etc.
				earningSources.add(earningSource);
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		
		
		return earningSources;
		
		
	}
	public EarningSource getEarningSourceForTransaction(Transaction transaction){
		EarningSource earningSource = new EarningSource();
		String produse[] = transaction.getProductID().split(",");
		String productID = "";
		for(int i = 0;i<produse.length;i++){
			productID= produse[i];
			
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM earning_sources WHERE id = "+productID+ " ORDER BY EarningName ASC;");
			while (rs.next()) {
				earningSource = new EarningSource();
				earningSource.setId(rs.getInt("ID"));
				earningSource.setEarningName(rs.getString("EarningName"));
				earningSource.setEarningDescription(rs.getString("EarningDescription"));
				// etc.
				
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		
		
		return earningSource;
		
		
		
	}
	
	public void insertEarningSource(EarningSource earningSource){
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO earning_sources(EarningName,EarningDescription,EarningUser)"			
					+ " VALUES ( ";
			
			query+="'"+earningSource.getEarningName()+"',";
			
			query+="'"+earningSource.getEarningDescription()+"',";
			query+=earningSource.getUserID() + " " ;
	
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
