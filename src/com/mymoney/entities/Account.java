package com.mymoney.entities;

public class Account {
private int id;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getAccountName() {
	return accountName;
}
public void setAccountName(String accountName) {
	this.accountName = accountName;
}
public String getCurrency() {
	return currency;
}
public void setCurrency(String currency) {
	this.currency = currency;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public int getAccountType() {
	return accountType;
}
public void setAccountType(int accountType) {
	this.accountType = accountType;
}
public String getAccountDescription() {
	return accountDescription;
}
public void setAccountDescription(String accountDescription) {
	this.accountDescription = accountDescription;
}
public int getDeleted() {
	return deleted;
}
public void setDeleted(int deleted) {
	this.deleted = deleted;
}
public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
private String accountName;
private String currency;
private double amount;
private int accountType;
private String accountDescription;
private int deleted;
private int userID;

}
