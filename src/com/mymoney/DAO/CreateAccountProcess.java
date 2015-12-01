package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.mymoney.entities.Account;
import com.mymoney.entities.DBConnection;

public class CreateAccountProcess {
	
public void createSavingsAccount(Account account){
	
	account.setDeleted(0);
	account.setAccountType(2);
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;

	try {
		stmt = conn.createStatement();
		String query = "INSERT INTO accounts(AccountName,IDUser,Currency,Amount,AccountType,AccountDescription,Deleted)"			
				+ " VALUES ( ";
		
		query+="'"+account.getAccountName()+"',";
		query+=""+account.getUserID()+",";
		query+="'"+account.getCurrency()+"',";
		query+=""+account.getAmount()+",";
		query+=""+account.getAccountType()+",";
		query+="'"+account.getAccountDescription()+"',";
		query+=""+account.getDeleted()+"";			
		query+=");";
	
		stmt.executeUpdate(query);
		

	} catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	}
	
	
	
}

public void createCashAccount(Account account){
	
	account.setDeleted(0);
	account.setAccountType(1);
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;

	try {
		stmt = conn.createStatement();
		String query = "INSERT INTO accounts(AccountName,IDUser,Currency,Amount,AccountType,AccountDescription,Deleted)"			
				+ " VALUES ( ";
		
		query+="'"+account.getAccountName()+"',";
		query+=""+account.getUserID()+",";
		query+="'"+account.getCurrency()+"',";
		query+=""+account.getAmount()+",";
		query+=""+account.getAccountType()+",";
		query+="'"+account.getAccountDescription()+"',";
		query+=""+account.getDeleted()+"";			
		query+=");";
	
		stmt.executeUpdate(query);
		

	} catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	}
	
	
	
}
public void createRegularAccount(Account account){
	
	account.setDeleted(0);
	account.setAccountType(3);
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;

	try {
		stmt = conn.createStatement();
		String query = "INSERT INTO accounts(AccountName,IDUser,Currency,Amount,AccountType,AccountDescription,Deleted)"			
				+ " VALUES ( ";
		
		query+="'"+account.getAccountName()+"',";
		query+=""+account.getUserID()+",";
		query+="'"+account.getCurrency()+"',";
		query+=""+account.getAmount()+",";
		query+=""+account.getAccountType()+",";
		query+="'"+account.getAccountDescription()+"',";
		query+=""+account.getDeleted()+"";			
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
