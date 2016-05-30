package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Logger;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.ProductPrice;

public class ProductPrices {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	ArrayList<ProductPrice> productPrices = new ArrayList<ProductPrice>();
	Logger l = Logger.getLogger(ProductPrices.class.getName());
	public void insertProductPrices(ArrayList<ProductPrice> prices){
		for(ProductPrice productPrice : prices){
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO prices(ProductID,LocationID,TransactionID,Price)"			
					+ " VALUES ( ";
			
			query+=""+productPrice.getProductID()+",";
			
			query+=""+productPrice.getLocationID()+",";
			query+=""+productPrice.getTransactionID()+",";
			query+=""+productPrice.getPrice()+"";
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
}
