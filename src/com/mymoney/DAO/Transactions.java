package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.logging.Logger;

import com.mymoney.entities.Account;
import com.mymoney.entities.DBConnection;
import com.mymoney.entities.Transaction;
import com.mymoney.entities.User;

public class Transactions {
	Logger l = Logger.getLogger(Transactions.class.getName());
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
				transaction.setCurrency(rs.getInt("Currency"));
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
			l.info("Found " + transactions.size() + " transactions");
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			l.severe(ex.getMessage());
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
l.info(query);
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			l.severe(ex.getMessage());
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
		l.info("Found " + transactions.size() + " transactions");
		
		return transactions;
	}
	public double getNewPayments(User user){
		double amount =0 ;
		
		Accounts accountDAO = new Accounts();
		
		ArrayList<Account> accounts = accountDAO.getAccountsForUser(user);
		for(Account a : accounts){
			if(a.getDeleted()==0){
		ArrayList<Transaction> transactions = new ArrayList<Transaction>();
		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + a.getId() + " ORDER BY TransactionTime DESC;");
			while (rs.next()) {
				Transaction transaction = new Transaction();
				transaction.setID(rs.getInt("ID"));
				transaction.setTransactionName(rs.getString("TransactionName"));
				transaction.setTransactionDescription(rs.getString("TransactionDescription"));
				transaction.setCurrency(rs.getInt("Currency"));
				transaction.setAmount(rs.getDouble("Amount"));
				transaction.setDeleted(rs.getInt("Deleted"));
				transaction.setTransactionType(rs.getInt("TransactionType"));
			
				transaction.setProductID(rs.getString("IDProduct"));
				transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
				transaction.setLocationID(rs.getInt("IDLocation"));
				transaction.setTransactionTime(rs.getDate("TransactionTime"));
				// etc.
				Date date = new Date();
				SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
				date = dateFormatter.parse(dateFormatter.format(new Date() ));
				if(transaction.getTransactionType() == 1 && transaction.getTransactionTime().getMonth()>(date.getMonth()-1) && transaction.getTransactionTime().getYear() == date.getYear())
					amount+=transaction.getAmount();
					
				
				}
		
			
			}

	 catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			l.severe(ex.getMessage());
		} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		l.severe(e.getMessage());
	}
			}
		}

		
		
		
		
		
		
		
		return amount;
	}
	

public double getAmountSpentToday(User user){
	double sum =0 ;
	Accounts accountDAO = new Accounts();
	
	ArrayList<Account> accounts = accountDAO.getAccountsForUser(user);
	for(Account a : accounts){
		if(a.getDeleted()==0){
	ArrayList<Transaction> transactions = new ArrayList<Transaction>();
	try {
		stmt = conn.createStatement();

		rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + a.getId() + " ORDER BY TransactionTime DESC;");
		while (rs.next()) {
			Transaction transaction = new Transaction();
			transaction.setID(rs.getInt("ID"));
			transaction.setTransactionName(rs.getString("TransactionName"));
			transaction.setTransactionDescription(rs.getString("TransactionDescription"));
			transaction.setCurrency(rs.getInt("Currency"));
			transaction.setAmount(rs.getDouble("Amount"));
			transaction.setDeleted(rs.getInt("Deleted"));
			transaction.setTransactionType(rs.getInt("TransactionType"));
		
			transaction.setProductID(rs.getString("IDProduct"));
			transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
			transaction.setLocationID(rs.getInt("IDLocation"));
			transaction.setTransactionTime(rs.getDate("TransactionTime"));
			// etc.
			Date date = new Date();
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
			date = dateFormatter.parse(dateFormatter.format(new Date() ));
			if(transaction.getTransactionType() == 1 && transaction.getTransactionTime().compareTo(date) == 0)
				sum+=transaction.getAmount();
		}
	
		
		}

 catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		}
	}

	return sum;
}


public double getAmountEarnedToday(User user){
	double sum =0 ;
	Accounts accountDAO = new Accounts();
	
	ArrayList<Account> accounts = accountDAO.getAccountsForUser(user);
	for(Account a : accounts){
		if(a.getDeleted()==0){
	ArrayList<Transaction> transactions = new ArrayList<Transaction>();
	try {
		stmt = conn.createStatement();

		rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + a.getId() + " ORDER BY TransactionTime DESC;");
		while (rs.next()) {
			Transaction transaction = new Transaction();
			transaction.setID(rs.getInt("ID"));
			transaction.setTransactionName(rs.getString("TransactionName"));
			transaction.setTransactionDescription(rs.getString("TransactionDescription"));
			transaction.setCurrency(rs.getInt("Currency"));
			transaction.setAmount(rs.getDouble("Amount"));
			transaction.setDeleted(rs.getInt("Deleted"));
			transaction.setTransactionType(rs.getInt("TransactionType"));
		
			transaction.setProductID(rs.getString("IDProduct"));
			transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
			transaction.setLocationID(rs.getInt("IDLocation"));
			transaction.setTransactionTime(rs.getDate("TransactionTime"));
			// etc.
			Date date = new Date();
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
			date = dateFormatter.parse(dateFormatter.format(new Date() ));
			if(transaction.getTransactionType() == 2 && transaction.getTransactionTime().compareTo(date) == 0)
				sum+=transaction.getAmount();
		}
	
		
		}

 catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		}
	}

	return sum;
}



public int getNumberOfTransactionsForAccount(Account account){
	int numberOfTransactions = 0;
	ArrayList<Transaction> listOfTransactions = getTransactionsForAccount(account);
	numberOfTransactions = listOfTransactions.size();
	return numberOfTransactions;
	 
	
}



public String getLastTransactionDate(Account a){
	ArrayList<Transaction> transactions = new ArrayList<Transaction>();
	try {
		stmt = conn.createStatement();

		rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + a.getId() + " ORDER BY TransactionTime DESC;");
		while (rs.next()) {
			Transaction transaction = new Transaction();
			transaction.setID(rs.getInt("ID"));
			transaction.setTransactionName(rs.getString("TransactionName"));
			transaction.setTransactionDescription(rs.getString("TransactionDescription"));
			transaction.setCurrency(rs.getInt("Currency"));
			transaction.setAmount(rs.getDouble("Amount"));
			transaction.setDeleted(rs.getInt("Deleted"));
			transaction.setTransactionType(rs.getInt("TransactionType"));
			transaction.setAccountID(a.getId());
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

	return transactions.get(0).getTransactionTime().toString();
	
	
	
}

public double getAmountSpentOnDate(Date date,User user){
	double sum =0 ;
	Accounts accountDAO = new Accounts();
	Users userDAO = new Users();
	
	ArrayList<Account> accounts = accountDAO.getAccountsForUser(user);
	for(Account a : accounts){
		if(a.getDeleted()==0){
			
	try {
		stmt = conn.createStatement();
	
		rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + a.getId() + " ORDER BY TransactionTime DESC;");
		while (rs.next()) {
			Transaction transaction = new Transaction();
			transaction.setID(rs.getInt("ID"));
			transaction.setTransactionName(rs.getString("TransactionName"));
		
			transaction.setTransactionDescription(rs.getString("TransactionDescription"));
			transaction.setCurrency(rs.getInt("Currency"));
			transaction.setAmount(rs.getDouble("Amount"));
			transaction.setDeleted(rs.getInt("Deleted"));
			transaction.setTransactionType(rs.getInt("TransactionType"));
		
			transaction.setProductID(rs.getString("IDProduct"));
			transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
			transaction.setLocationID(rs.getInt("IDLocation"));
			transaction.setTransactionTime(rs.getDate("TransactionTime"));
			// etc.
			
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
			date = dateFormatter.parse(dateFormatter.format(date ));
			if(transaction.getTransactionType() == 1 && transaction.getTransactionTime().compareTo(date) == 0)
				sum+=transaction.getAmount();
		}
	
		
		}

 catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		}
	}

	return sum;
	
	
}

public double getAmountEarnedOnDate(Date date,User user){
	double sum =0 ;
	Accounts accountDAO = new Accounts();
	Users userDAO = new Users();
	
	ArrayList<Account> accounts = accountDAO.getAccountsForUser(user);
	for(Account a : accounts){
		if(a.getDeleted()==0){
			
	try {
		stmt = conn.createStatement();
	
		rs = stmt.executeQuery("SELECT * FROM transactions WHERE IDAccount = " + a.getId() + " ORDER BY TransactionTime DESC;");
		while (rs.next()) {
			Transaction transaction = new Transaction();
			transaction.setID(rs.getInt("ID"));
			transaction.setTransactionName(rs.getString("TransactionName"));
			
			transaction.setTransactionDescription(rs.getString("TransactionDescription"));
			transaction.setCurrency(rs.getInt("Currency"));
			transaction.setAmount(rs.getDouble("Amount"));
			transaction.setDeleted(rs.getInt("Deleted"));
			transaction.setTransactionType(rs.getInt("TransactionType"));
		
			transaction.setProductID(rs.getString("IDProduct"));
			transaction.setIsRecurrent(rs.getInt("ISRecurrent"));
			transaction.setLocationID(rs.getInt("IDLocation"));
			transaction.setTransactionTime(rs.getDate("TransactionTime"));
			// etc.
			
			SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
			date = dateFormatter.parse(dateFormatter.format(date ));
			if(transaction.getTransactionType() == 2 && transaction.getTransactionTime().compareTo(date) == 0)
				sum+=transaction.getAmount();
		}
	
		
		}

 catch (SQLException ex) {
		// handle any errors
		System.out.println("SQLException: " + ex.getMessage());
		System.out.println("SQLState: " + ex.getSQLState());
		System.out.println("VendorError: " + ex.getErrorCode());
	} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
		}
	}

	return sum;
	
	
}

public ArrayList<String> getAmountSpentLast5Days(User user){
	ArrayList<String> sums = new ArrayList<String>();
	
	double todaySum = getAmountSpentOnDate(new Date(), user);
	sums.add(todaySum + "");
	Date yesterday = new Date();
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountSpentOnDate(yesterday, user);
	sums.add(todaySum + "");
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountSpentOnDate(yesterday, user);
	sums.add(todaySum + "");
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountSpentOnDate(yesterday, user);
	sums.add(todaySum + "");
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountSpentOnDate(yesterday, user);
	sums.add(todaySum + "");
	Collections.reverse(sums);
	return sums;
	
}

public ArrayList<String> getAmountEarnedLast5Days(User user){
	ArrayList<String> sums = new ArrayList<String>();
	
	double todaySum = getAmountEarnedOnDate(new Date(), user);
	sums.add(todaySum + "");
	Date yesterday = new Date();
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountEarnedOnDate(yesterday, user);
	sums.add(todaySum + "");
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountEarnedOnDate(yesterday, user);
	sums.add(todaySum + "");
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountEarnedOnDate(yesterday, user);
	sums.add(todaySum + "");
	yesterday.setDate(yesterday.getDate()-1);
	todaySum = getAmountEarnedOnDate(yesterday, user);
	sums.add(todaySum + "");
	Collections.reverse(sums);
	return sums;
	
	
	
	
}
	
	
	

}
