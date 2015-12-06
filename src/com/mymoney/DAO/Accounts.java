package com.mymoney.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mymoney.entities.Account;
import com.mymoney.entities.DBConnection;
import com.mymoney.entities.Transaction;
import com.mymoney.entities.User;

public class Accounts {
	Account account = new Account();
	User user = new User();
	Users userDAO = new Users();
	DBConnection connectionFactory = new DBConnection();
	Connection conn = (Connection) connectionFactory.getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	ArrayList<Account> listOfAccounts = new ArrayList<Account>();

	public ArrayList<Account> getAccountsForUser(User user) {
		listOfAccounts = new ArrayList<Account>();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM accounts WHERE IDUser = " + user.getId() + ";");
			while (rs.next()) {
				account = new Account();
				account.setId(rs.getInt("ID"));
				account.setAccountName(rs.getString("AccountName"));
				account.setCurrency(rs.getString("Currency"));
				account.setAmount(rs.getDouble("Amount"));
				account.setAccountType(rs.getInt("AccountType"));
				account.setAccountDescription(rs.getString("AccountDescription"));
				account.setDeleted(rs.getInt("Deleted"));
				account.setUserID(rs.getInt("IDUser"));
				// etc.
				listOfAccounts.add(account);
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}

		return listOfAccounts;
	}

	public Account getMostPopularAccount(User user) {
		listOfAccounts = new ArrayList<Account>();

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM accounts WHERE IDUser = " + user.getId() + ";");
			while (rs.next()) {
				account = new Account();
				account.setId(rs.getInt("ID"));
				account.setAccountName(rs.getString("AccountName"));
				account.setCurrency(rs.getString("Currency"));
				account.setAmount(rs.getDouble("Amount"));
				account.setAccountType(rs.getInt("AccountType"));
				account.setAccountDescription(rs.getString("AccountDescription"));
				account.setDeleted(rs.getInt("Deleted"));
				account.setUserID(rs.getInt("IDUser"));
				// etc.
				listOfAccounts.add(account);
			}

		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		int max = 0;
		Account mostPopularAccount = new Account();
		for (Account a : listOfAccounts) {
			ArrayList<Transaction> listOfTransactionsForAccount = new ArrayList<Transaction>();
			Transactions transactionDAO = new Transactions();
			listOfTransactionsForAccount = transactionDAO.getTransactionsForAccount(a);
			if (listOfTransactionsForAccount.size() > max) {
				max = listOfTransactionsForAccount.size();
				mostPopularAccount = a;
			}

		}

		return mostPopularAccount;

	}

}
