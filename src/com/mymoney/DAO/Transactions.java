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

	public ArrayList<Transaction> getTransactionsForAccount(Account account) {
		ArrayList<Transaction> transactions = new ArrayList<Transaction>();
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + account.getId() + ";");
			while (rs.next()) {
				Transaction transaction = new Transaction();
				transaction.setID(rs.getInt("ID"));
				transaction.setTransactionName(rs.getString("TransactionName"));
				transaction.setTransactionDescription(rs.getString("TransactionDescription"));
				transaction.setCurrency(rs.getString("Currency"));
				transaction.setAmount(rs.getDouble("Amount"));
				transaction.setDeleted(rs.getInt("Deleted"));
				transaction.setTransactionType(rs.getInt("TransactionType"));
				transaction.setAccountID(account.getId());
				transaction.setProductID(rs.getString("IDProduct"));
				transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
				transaction.setLocationID(rs.getInt("IDLocation"));
				transaction.setTransactionTime(rs.getDate("TransactionTime"));
				// etc.
				transactions.add(transaction);
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}

		return transactions;
	}

	public int insertTransaction(Transaction transaction) {
		DBConnection connectionFactory = new DBConnection();
		Connection conn = (Connection) connectionFactory.getConnection();
		Statement stmt = null;
		int newID=0;
		try {
			stmt = conn.createStatement();
			String query = "INSERT INTO transactions(TransactionName,TransactionDescription,Amount,TransactionType,IDAccount,IDProduct,ISRecurrent,Currency,Deleted,IDLocation)"
					+ " VALUES ( ";

			query += "'" + transaction.getTransactionName() + "',";
			query += "'" + transaction.getTransactionDescription()+ "',";
			query += "" + transaction.getAmount() + ",";
			query += "" + transaction.getTransactionType() + ",";
			query += "" + transaction.getAccountID() + ",";
			query += "'" + transaction.getProductID() + "',";
			query += "" + transaction.getIsRecurrent() + ",";
			query += "'" + transaction.getCurrency() + "',";
			query += "" + transaction.getDeleted() + ",";
			query += "" + transaction.getLocationID() + "";
			query += ");";

			 newID = stmt.executeUpdate(query);
			 if(transaction.getTransactionType() == 1)
query = "UPDATE accounts SET Amount = Amount - " + transaction.getAmount() + " WHERE ID = " + transaction.getAccountID();
			 else
				 query = "UPDATE accounts SET Amount = Amount + " + transaction.getAmount() + " WHERE ID = " + transaction.getAccountID(); 
stmt.executeUpdate(query);

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
return newID;
	}
	public ArrayList<Transaction> getTransactionsForUser(User user) {
		ArrayList<Transaction> transactions = new ArrayList<Transaction>();
		ArrayList<Account> accounts = new ArrayList<Account>();
		Accounts accountDAO = new Accounts();
		accounts = accountDAO.getAccountsForUser(user);
		for(Account a : accounts){
			ArrayList<Transaction> transactionsForAccount = new ArrayList<Transaction>();
			transactionsForAccount = getTransactionsForAccount(a);
			for(Transaction b: transactionsForAccount){
				transactions.add(b);
				
			}
			
			
			
		}
		
		
		return transactions;
	}

}
