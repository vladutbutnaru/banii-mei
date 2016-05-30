package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Logger;

import com.mymoney.entities.DBConnection;
import com.mymoney.entities.Category;

public class Categories {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	Category category;
	Logger l = Logger.getLogger(Categories.class.getName());
	public ArrayList<Category> getAllCategoriesAlphabetically(){
		ArrayList<Category> categories = new ArrayList<Category>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM categories ORDER BY CategoryName ASC;");
			while (rs.next()) {
				category = new Category();
				category.setID(rs.getInt("ID"));
				category.setCategoryName(rs.getString("CategoryName"));
				category.setCategoryDescription(rs.getString("CategoryDescription"));
				
				// etc.
				categories.add(category);
			}
			l.info("Found " + categories.size() + " categories");
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			l.severe("Error while getting categories " + ex.getMessage());
		}
		
		return categories;
		
		
	}
	public void insertCategory(Category category){
		
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO categories(CategoryName,CategoryDescription)"			
					+ " VALUES ( ";
			
			query+="'"+category.getCategoryName()+"',";
			
			query+="'"+category.getCategoryDescription()+"'";
	
			query+=");";
		
			stmt.executeUpdate(query);
			l.info("Category with name " + category.getCategoryName());

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			l.severe("Error while inserting categories " + ex.getMessage());
		}
		
	}
}
