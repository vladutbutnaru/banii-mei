package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mymoney.entities.Category;
import com.mymoney.entities.DBConnection;
import com.mymoney.entities.Product;

public class Products {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;

	public ArrayList<Product> getAllProducts() {
		ArrayList<Product> products = new ArrayList<Product>();
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("SELECT * FROM products");
			while (rs.next()) {
				Product product = new Product();
				product.setID(rs.getInt("ID"));
				product.setProductName(rs.getString("ProductName"));
				product.setProductDescription(rs.getString("ProductDescription"));
				product.setCategoryID(rs.getInt("ProductCategoryID"));

				// etc.
				products.add(product);
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}

		return products;

	}
	
public void insertProduct(Product product){
		
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO products(ProductName,ProductDescription,ProductCategoryID)"			
					+ " VALUES ( ";
			
			query+="'"+product.getProductName()+"',";
			
			query+="'"+product.getProductDescription()+"',";
			query+=""+product.getCategoryID()+"";
			query+=");";
		
			stmt.executeUpdate(query);
			

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
	}
public ArrayList<Product> getProductsForProductIDs(String produse){
	ArrayList<Product> products = new ArrayList<Product>();
	String produseDinLista[] = produse.split(",");
	for(int i = 1 ; i<produseDinLista.length; i++){
		Product product = new Product();
		product = getProductById(Integer.parseInt(produseDinLista[i]));
		products.add(product);
		
		
	}
	
	return products;
	
	
}
public Product getProductById(int id){
	Product product = new Product();
	try {
		stmt = conn.createStatement();

		rs = stmt.executeQuery("SELECT * FROM products WHERE id = " + id);
		while (rs.next()) {
		 product = new Product();
			product.setID(rs.getInt("ID"));
			product.setProductName(rs.getString("ProductName"));
			product.setProductDescription(rs.getString("ProductDescription"));
			product.setCategoryID(rs.getInt("ProductCategoryID"));

			// etc.
			
		}

	} catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	}

	return product;
	
	
}
}

