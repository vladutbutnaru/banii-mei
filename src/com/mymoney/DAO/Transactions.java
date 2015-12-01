package com.mymoney.DAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mymoney.entities.*;
public class Transactions {
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
public ArrayList<Transaction> getTransactionsForAccount(Account account){
	ArrayList<Transaction> transactions = new ArrayList<Transaction>();
	try {
	    stmt = conn.createStatement();
	    System.out.println(("SELECT * FROM transactions WHERE IDAccount = " + account.getId() +";"));
	    rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + account.getId() +";");
	    while(rs.next()) {
	    	Transaction transaction = new Transaction();
	       transaction.setID(rs.getInt("ID"));
	       transaction.setTransactionName(rs.getString("TransactionName"));
	       transaction.setTransactionDescription(rs.getString("TransactionDescription"));
	       transaction.setCurrency(rs.getString("Currency"));
	       transaction.setAmount(rs.getDouble("Amount"));	    
	       transaction.setDeleted(rs.getInt("Deleted"));
	       transaction.setTransactionType(rs.getInt("TransactionType"));
	       transaction.setAccountID(account.getId());
	       transaction.setProductID(rs.getInt("IDProduct"));
	       transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
	        // etc.
	       transactions.add(transaction);
	    }
	
	  
	}
	catch (SQLException ex){
	    // handle any errors
	    System.out.println("SQLException: " + ex.getMessage());
	    System.out.println("SQLState: " + ex.getSQLState());
	    System.out.println("VendorError: " + ex.getErrorCode());
	}
	
	
	
	return transactions;	
}


}
