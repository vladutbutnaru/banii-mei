package com.mymoney.entities;

import java.util.Date;

public class Transaction {
private int ID;
private String transactionName;
private String transactionDescription;
private double amount;
private int transactionType;
private int accountID;
private String productID;
private int isRecurrent;
private int currency;
private Date transactionTime;
private int deleted;
private int locationID;
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getTransactionName() {
	return transactionName;
}
public void setTransactionName(String transactionName) {
	this.transactionName = transactionName;
}
public String getTransactionDescription() {
	return transactionDescription;
}
public void setTransactionDescription(String transactionDescription) {
	this.transactionDescription = transactionDescription;
}
public double getAmount() {
	return amount;
}
public void setAmount(double amount) {
	this.amount = amount;
}
public int getTransactionType() {
	return transactionType;
}
public void setTransactionType(int transactionType) {
	this.transactionType = transactionType;
}
public int getAccountID() {
	return accountID;
}
public void setAccountID(int accountID) {
	this.accountID = accountID;
}
public String getProductID() {
	return productID;
}
public void setProductID(String productID) {
	this.productID = productID;
}
public int getIsRecurrent() {
	return isRecurrent;
}
public void setIsRecurrent(int isRecurrent) {
	this.isRecurrent = isRecurrent;
}
public int getCurrency() {
	return currency;
}
public void setCurrency(int currency) {
	this.currency = currency;
}
public Date getTransactionTime() {
	return transactionTime;
}
public void setTransactionTime(Date transactionTime) {
	this.transactionTime = transactionTime;
}
public int getDeleted() {
	return deleted;
}
public void setDeleted(int deleted) {
	this.deleted = deleted;
}
public int getLocationID() {
	return locationID;
}
public void setLocationID(int locationID) {
	this.locationID = locationID;
}

}
